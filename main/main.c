
#include "nvs_flash.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"

#include "wifi_manager.h"
#include "bluetooth_manager.h"
#include "http_radio.h"
#include "input_handler.h"

#define MAIN_TAG "MAIN"

void app_main(void)
{
    // Initialize NVS
    esp_err_t ret = nvs_flash_init();
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES || ret == ESP_ERR_NVS_NEW_VERSION_FOUND) {
      ESP_ERROR_CHECK(nvs_flash_erase());
      ret = nvs_flash_init();
    }
    ESP_ERROR_CHECK(ret);

    ESP_LOGI(MAIN_TAG, "Starting Wi-Fi initialization...");
    wifi_init_sta();
    ESP_LOGI(MAIN_TAG, "Wi-Fi initialization complete.");

    // Initialize radio streaming service
    radio_init();
    
    // Initialize button handler
    button_init();

    // Initialize and start Bluetooth
    bluetooth_start();
    
    // Start streaming the first radio station after a delay to allow Bluetooth to connect
    ESP_LOGI(MAIN_TAG, "Waiting for Bluetooth to connect before starting radio...");
    vTaskDelay(pdMS_TO_TICKS(10000)); // Wait 10 seconds
    
    ESP_LOGI(MAIN_TAG, "Starting initial radio stream");
    radio_start_streaming();

    // app_main should not return
    while (1) {
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}
