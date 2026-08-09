#ifndef DEVICES_KBD_H
#define DEVICES_KBD_H

#include <stdbool.h>
#include <stdint.h>

void kbd_init(void);
void kbd_print_stats(void);
uint16_t kbd_read(void);
bool kbd_try_read(uint16_t* code);

#endif /* devices/kbd.h */
