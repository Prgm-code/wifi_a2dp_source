idf_component_register(SRCS "main.c" "bt_app_core.c"
                    PRIV_REQUIRES esp_wifi nvs_flash bt
                    INCLUDE_DIRS ".")
