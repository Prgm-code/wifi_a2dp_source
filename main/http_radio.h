
#ifndef HTTP_RADIO_H
#define HTTP_RADIO_H

#include <stdbool.h>

void radio_init(void);
void radio_start_streaming(void);
void radio_stop_streaming(void);
void radio_toggle_playback(void);
bool radio_is_streaming(void);
int32_t radio_get_audio_data(uint8_t *data, int32_t len);

#endif // HTTP_RADIO_H
