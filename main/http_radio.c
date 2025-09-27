#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "sdkconfig.h"
#include "esp_log.h"
#include "esp_http_client.h"
#include <string.h>

#include "http_radio.h"

#define RADIO_TAG             "RADIO_STREAM"
#define AUDIO_BUFFER_SIZE     4096

enum {
    RADIO_STATE_STOPPED,
    RADIO_STATE_CONNECTING,
    RADIO_STATE_STREAMING,
    RADIO_STATE_ERROR,
};

static esp_http_client_handle_t radio_client = NULL;
static int radio_state = RADIO_STATE_STOPPED;
static uint8_t audio_buffer[AUDIO_BUFFER_SIZE];
static size_t audio_buffer_len = 0;
static size_t audio_buffer_pos = 0;

static esp_err_t radio_http_event_handler(esp_http_client_event_t *evt)
{
    switch(evt->event_id) {
        case HTTP_EVENT_ERROR:
            ESP_LOGE(RADIO_TAG, "HTTP_EVENT_ERROR");
            radio_state = RADIO_STATE_ERROR;
            break;
        case HTTP_EVENT_ON_CONNECTED:
            ESP_LOGI(RADIO_TAG, "HTTP_EVENT_ON_CONNECTED");
            radio_state = RADIO_STATE_STREAMING;
            break;
        case HTTP_EVENT_ON_DATA:
            if (!esp_http_client_is_chunked_response(evt->client)) {
                if (audio_buffer_len == 0 && evt->data_len > 0) {
                    size_t copy_len = (evt->data_len < AUDIO_BUFFER_SIZE) ? evt->data_len : AUDIO_BUFFER_SIZE;
                    memcpy(audio_buffer, evt->data, copy_len);
                    audio_buffer_len = copy_len;
                    audio_buffer_pos = 0;
                }
            }
            break;
        case HTTP_EVENT_ON_FINISH:
            ESP_LOGI(RADIO_TAG, "HTTP_EVENT_ON_FINISH");
            break;
        case HTTP_EVENT_DISCONNECTED:
            ESP_LOGI(RADIO_TAG, "HTTP_EVENT_DISCONNECTED");
            radio_state = RADIO_STATE_STOPPED;
            break;
        default:
            break;
    }
    return ESP_OK;
}

static void radio_stream_task(void *pvParameters)
{
    while (radio_state == RADIO_STATE_CONNECTING || radio_state == RADIO_STATE_STREAMING) {
        int data_read = esp_http_client_read_response(radio_client, (char*)audio_buffer, AUDIO_BUFFER_SIZE);
        if (data_read > 0) {
            audio_buffer_len = data_read;
            audio_buffer_pos = 0;
            radio_state = RADIO_STATE_STREAMING;
        } else if (data_read == 0) {
            // No data received, wait a bit
            vTaskDelay(pdMS_TO_TICKS(100));
        } else {
            ESP_LOGE(RADIO_TAG, "Error reading HTTP response");
            radio_state = RADIO_STATE_ERROR;
            break;
        }
    }
    // Cleanup and delete task
    radio_stop_streaming();
    vTaskDelete(NULL);
}

void radio_start_streaming(void)
{
    if (radio_client) {
        ESP_LOGW(RADIO_TAG, "Already streaming, not starting again.");
        return;
    }

    ESP_LOGI(RADIO_TAG, "Starting stream: %s", CONFIG_EXAMPLE_RADIO_URL);

    esp_http_client_config_t config = {
        .url = CONFIG_EXAMPLE_RADIO_URL,
        .event_handler = radio_http_event_handler,
        .buffer_size = AUDIO_BUFFER_SIZE,
        .timeout_ms = 10000,
        .user_agent = "ESP32-Radio/1.0",
    };

    radio_client = esp_http_client_init(&config);
    if (radio_client == NULL) {
        ESP_LOGE(RADIO_TAG, "Failed to initialize HTTP client");
        radio_state = RADIO_STATE_ERROR;
        return;
    }

    radio_state = RADIO_STATE_CONNECTING;
    esp_err_t err = esp_http_client_open(radio_client, 0);
    if (err != ESP_OK) {
        ESP_LOGE(RADIO_TAG, "Failed to open HTTP connection: %s", esp_err_to_name(err));
        esp_http_client_cleanup(radio_client);
        radio_client = NULL;
        radio_state = RADIO_STATE_ERROR;
        return;
    }

    xTaskCreate(radio_stream_task, "radio_stream_task", 4096, NULL, 5, NULL);
}

void radio_stop_streaming(void)
{
    if (radio_client) {
        // The stream task will see the state change and stop itself.
        radio_state = RADIO_STATE_STOPPED;
        // We don't cleanup here, the task will do it to avoid race conditions
        ESP_LOGI(RADIO_TAG, "Radio streaming stopping...");
    }
}

bool radio_is_streaming(void)
{
    return (radio_state == RADIO_STATE_STREAMING || radio_state == RADIO_STATE_CONNECTING);
}

void radio_toggle_playback(void)
{
    if (radio_is_streaming()) {
        radio_stop_streaming();
    } else {
        radio_start_streaming();
    }
}

void radio_init(void)
{
    ESP_LOGI(RADIO_TAG, "Radio component initialized.");
}

int32_t radio_get_audio_data(uint8_t *data, int32_t len)
{
    if (data == NULL || len < 0) {
        return 0;
    }

    if (!radio_is_streaming() || audio_buffer_len == 0) {
        memset(data, 0, len);
        return len;
    }

    int32_t bytes_to_copy = 0;
    int32_t remaining_len = len;
    uint8_t *dest = data;

    while (remaining_len > 0 && audio_buffer_len > 0) {
        int32_t available = audio_buffer_len - audio_buffer_pos;
        int32_t to_copy = (remaining_len < available) ? remaining_len : available;
        
        memcpy(dest, &audio_buffer[audio_buffer_pos], to_copy);
        
        dest += to_copy;
        remaining_len -= to_copy;
        bytes_to_copy += to_copy;
        audio_buffer_pos += to_copy;
        
        if (audio_buffer_pos >= audio_buffer_len) {
            audio_buffer_pos = 0;
            audio_buffer_len = 0;
            break;
        }
    }

    if (remaining_len > 0) {
        memset(dest, 0, remaining_len);
        bytes_to_copy += remaining_len;
    }

    return bytes_to_copy;
}