/* doomgeneric 的 Pintos 用户态平台层。
   内核在进程加载时把 VGA 线性帧缓冲映射到 0x30000000
   (userprog/process.h 的 USER_LFB_VA),图形模式由内核在启动时
   设置好。本文件只负责:帧拷贝、时钟、键盘、游戏主循环。 */

#include "doomgeneric.h"
#include "doomkeys.h"

#include <string.h>
#include <syscall.h>

/* 内核映射 LFB 的用户虚拟地址(与 USER_LFB_VA 一致)。 */
#define LFB ((uint32_t*)0x30000000)
#define LFB_XRES 640
#define LFB_YRES 400

/* i_video.c 的全局量:fb_scaling=2 让引擎把 320x200 放大到 640x400,
   正好铺满 LFB。 */
extern int fb_scaling;

/* PS/2 scancode(set 1,0xE0 前缀的扩展键取低字节)→ doom 键码。
   注意 key release 位(0x80)必须在调用前剥掉。 */
static unsigned char convert_to_doom_key(uint8_t scan) {
  switch (scan) {
    case 0x01: return KEY_ESCAPE;
    case 0x1c: return KEY_ENTER;
    case 0x39: return KEY_USE;               /* 空格:开门/用 */
    case 0x1d: return KEY_FIRE;              /* Ctrl:开火 */
    case 0x2a: case 0x36: return KEY_RSHIFT; /* Shift:跑 */
    case 0x48: return KEY_UPARROW;           /* QEMU 里方向键是 E0 前缀 */
    case 0x50: return KEY_DOWNARROW;
    case 0x4b: return KEY_LEFTARROW;
    case 0x4d: return KEY_RIGHTARROW;
    /* 字母(菜单、作弊码;doom 期望大写) */
    case 0x1e: return 'A'; case 0x30: return 'B'; case 0x2e: return 'C';
    case 0x20: return 'D'; case 0x12: return 'E'; case 0x21: return 'F';
    case 0x22: return 'G'; case 0x23: return 'H'; case 0x17: return 'I';
    case 0x24: return 'J'; case 0x25: return 'K'; case 0x26: return 'L';
    case 0x32: return 'M'; case 0x31: return 'N'; case 0x18: return 'O';
    case 0x19: return 'P'; case 0x10: return 'Q'; case 0x13: return 'R';
    case 0x1f: return 'S'; case 0x14: return 'T'; case 0x16: return 'U';
    case 0x2f: return 'V'; case 0x11: return 'W'; case 0x2d: return 'X';
    case 0x15: return 'Y'; case 0x2c: return 'Z';
    /* 数字 */
    case 0x02: return '1'; case 0x03: return '2'; case 0x04: return '3';
    case 0x05: return '4'; case 0x06: return '5'; case 0x07: return '6';
    case 0x08: return '7'; case 0x09: return '8'; case 0x0a: return '9';
    case 0x0b: return '0';
    default: return 0; /* 引擎会忽略 data1==0 的键 */
  }
}

void DG_Init() {
  fb_scaling = 2; /* 320x200 → 640x400,与 LFB 分辨率一致 */
}

void DG_DrawFrame() {
  /* DG_ScreenBuffer 已是 640x400 的 0x00RRGGBB,与 LFB 字节序一致。 */
  memcpy(LFB, DG_ScreenBuffer, LFB_XRES * LFB_YRES * 4);
}

void DG_SleepMs(uint32_t ms) {
  /* 没有 sleep syscall,busy-spin 在 time_ms 上。 */
  unsigned start = time_ms();
  while (time_ms() - start < ms)
    ;
}

uint32_t DG_GetTicksMs() {
  return time_ms();
}

int DG_GetKey(int* pressed, unsigned char* doomKey) {
  int code = key_poll();
  if (code < 0)
    return 0; /* 没有事件 */

  *pressed = !(code & 0x80); /* 0x80 位:0=按下,1=松开 */
  *doomKey = convert_to_doom_key((uint8_t)code & 0x7F);
  return 1;
}

void DG_SetWindowTitle(const char* title) {
  /* 没有窗口标题可言,忽略。 */
}

/* 游戏主循环:doomgeneric_Create 跑完 D_DoomMain 的初始化后,
   每 tick 推进一帧(TryRunTics 内部按真实时间自节拍)。
   -mb 3:zone 只申请 3MB(默认 16MB,pintos 内存装不下)。 */
int main(int argc, char* argv[]) {
  char* doom_argv[] = {"doom", "-mb", "4", "-iwad", "doom1.wad"};

  (void)argc;
  (void)argv;

  doomgeneric_Create(5, doom_argv);
  for (;;)
    doomgeneric_Tick();

  return 0;
}
