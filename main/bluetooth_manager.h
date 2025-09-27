
#ifndef BLUETOOTH_MANAGER_H
#define BLUETOOTH_MANAGER_H

#include "esp_a2dp_api.h"

// A2DP global states
enum {
    APP_AV_STATE_IDLE,
    APP_AV_STATE_DISCOVERING,
    APP_AV_STATE_DISCOVERED,
    APP_AV_STATE_UNCONNECTED,
    APP_AV_STATE_CONNECTING,
    APP_AV_STATE_CONNECTED,
    APP_AV_STATE_DISCONNECTING,
};

// sub states of APP_AV_STATE_CONNECTED
enum {
    APP_AV_MEDIA_STATE_IDLE,
    APP_AV_MEDIA_STATE_STARTING,
    APP_AV_MEDIA_STATE_STARTED,
    APP_AV_MEDIA_STATE_STOPPING,
};

void bluetooth_start(void);
int32_t bluetooth_audio_data_cb(uint8_t *data, int32_t len);

#endif // BLUETOOTH_MANAGER_H
