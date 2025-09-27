
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "esp_log.h"

#include "input_handler.h"
#include "http_radio.h" // Dependency for radio_next_station()

#define BUTTON_GPIO           0
#define BUTTON_ACTIVE_LEVEL   0

static const char *INPUT_TAG = "INPUT";

static bool button_pressed = false;

static void IRAM_ATTR button_isr_handler(void* arg)
{
    button_pressed = true;
}

static void button_task(void *pvParameters)
{
    while (1) {
        if (button_pressed) {
            button_pressed = false;
            ESP_LOGI(INPUT_TAG, "Button pressed - toggling radio playback");
            radio_toggle_playback();
            // Debounce delay
            vTaskDelay(pdMS_TO_TICKS(500));
        }
        vTaskDelay(pdMS_TO_TICKS(50));
    }
}

void button_init(void)
{
    gpio_config_t io_conf = {
        .intr_type = GPIO_INTR_NEGEDGE,
        .mode = GPIO_MODE_INPUT,
        .pin_bit_mask = (1ULL << BUTTON_GPIO),
        .pull_down_en = 0,
        .pull_up_en = 1,
    };
    gpio_config(&io_conf);
    
    gpio_install_isr_service(0);
    gpio_isr_handler_add(BUTTON_GPIO, button_isr_handler, NULL);
    
    xTaskCreate(button_task, "button_task", 2048, NULL, 5, NULL);

    ESP_LOGI(INPUT_TAG, "Button initialized on GPIO %d", BUTTON_GPIO);
}
