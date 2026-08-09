#ifndef DEVICES_VGA_H
#define DEVICES_VGA_H

#include <stdint.h>

/* 线性帧缓冲的尺寸(与 VBE 设置一致)。 */
#define VGA_LFB_XRES 640
#define VGA_LFB_YRES 400

void vga_putc(int);
void init_graphic_mode();
void put_pixel(int x, int y, unsigned rgb);
uint32_t* vga_get_fb(void);
uintptr_t vga_get_lfb_phys(void);
#endif /* devices/vga.h */
