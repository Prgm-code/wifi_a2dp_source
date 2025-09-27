idf_component_register(SRCS "main.c" 
                           "bt_app_core.c"
                           "wifi_manager.c"
                           "http_radio.c"
                           "input_handler.c"
                           "bluetooth_manager.c"
                    PRIV_REQUIRES esp_wifi nvs_flash bt esp_http_client driver
                    INCLUDE_DIRS ".")
