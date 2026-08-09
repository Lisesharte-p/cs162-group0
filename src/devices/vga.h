#ifndef DEVICES_VGA_H
#define DEVICES_VGA_H

#include <stdint.h>

void vga_putc(int);
void init_graphic_mode();
void put_pixel(int x, int y, unsigned rgb);
uint32_t* vga_get_fb(void);
#endif /* devices/vga.h */
