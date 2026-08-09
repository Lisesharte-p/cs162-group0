#include "devices/vga.h"
#include <round.h>
#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include "devices/speaker.h"
#include "threads/io.h"
#include "threads/interrupt.h"
#include "threads/vaddr.h"
#include "threads/palloc.h"
#include "threads/pte.h"
#include "threads/init.h"
/* VGA text screen support.  See [FREEVGA] for more information. */

/* Number of columns and rows on the text display. */
#define COL_CNT 80
#define ROW_CNT 25

/* Current cursor position.  (0,0) is in the upper left corner of
   the display. */
static size_t cx, cy;

/* Attribute value for gray text on a black background. */
#define GRAY_ON_BLACK 0x07

/*vga registers defination*/
#define VBE_INDEX_PORT 0x01ce
#define VBE_DATA_PORT 0x01cf

#define VBE_INDEX_ID 0
#define VBE_XRES 1
#define VBE_YRES 2
#define VBE_BPP 3
#define VBE_ENABLE_INDEX 4
#define VBE_BANK 5
#define VBE_VIRT_WIDTH 6
#define VBE_VIRT_HIGHT 7
#define VBE_X_OFFSET 8
#define VBE_Y_OFFSET 9

#define VBE_ENABLED 1
#define VBE_DISABLED 0
#define VBE_ID5 0xb0c0
#define VBE_LFB_ENABLE 0x40

/* LFB 的物理地址不能硬编码:QEMU 11 的 stdvga(PCI 变体)把帧缓冲
   BAR 分配在 0xfd000000,旧版本镜像在 0xe0000000。从 PCI 配置空间
   读 VGA 设备 (00:02.0) 的 BAR0 得到真实地址。 */
static uintptr_t lfb_phys;

/* Framebuffer.  See [FREEVGA] under "VGA Text Mode Operation".
   The character at (x,y) is fb[y][x][0].
   The attribute at (x,y) is fb[y][x][1]. */
static uint8_t (*fb)[COL_CNT][2];

static void clear_row(size_t y);
static void cls(void);
static void newline(void);
static void move_cursor(void);
static void find_cursor(size_t* x, size_t* y);

static void vbe_out(uint16_t idx, uint16_t data) {
  outw(VBE_INDEX_PORT, idx);
  outw(VBE_DATA_PORT, data);
}

/* 读 PCI 配置空间的一个 32 位寄存器(端口 0xCF8/0xCFC)。 */
static uint32_t pci_config_read(uint8_t bus, uint8_t dev, uint8_t func, uint8_t reg) {
  outl(0xCF8, 0x80000000u | (uint32_t)bus << 16 | (uint32_t)dev << 11
              | (uint32_t)func << 8 | (reg & 0xFC));
  return inl(0xCFC);
}
static void map_lfb(uintptr_t lfb, uint32_t bytes) {
  size_t off;
  for (off = 0; off < bytes; off += PGSIZE) {
    uintptr_t va = lfb + off;   /* identity 映射:VA == PA */
    size_t pde_idx = pd_no((char*)va);
    size_t pte_idx = pt_no((char*)va);
    uint32_t* pt;
    if (init_page_dir[pde_idx] == 0) {
      pt = palloc_get_page(PAL_ASSERT | PAL_ZERO);
      init_page_dir[pde_idx] = pde_create(pt);
    } else {
      pt = pde_get_pt(init_page_dir[pde_idx]);
    }
    /* 不能在这里用 pte_create_kernel: 它内部做 vtop(va) = va - PHYS_BASE,
       会把 0xe0000000 变成 0x20000000。LFB 的物理地址在 PHYS_BASE 之上,
       ptov/vtop 的约定表达不了它,所以手工构造 PTE。 */
    pt[pte_idx] = (lfb + off) | PTE_P | PTE_W;
  }
}
void init_graphic_mode() {
  static bool inited;
  if (!inited) {
    lfb_phys = pci_config_read(0, 2, 0, 0x10) & 0xFFFFFFF0;
    if (lfb_phys == 0)
      return; /* 没有 VGA 设备(-v 模式),保持文本显示 */
    map_lfb(lfb_phys, VGA_LFB_XRES * VGA_LFB_YRES * 4);
    vbe_out(VBE_ENABLE_INDEX, VBE_DISABLED);
    vbe_out(VBE_INDEX_ID, VBE_ID5);
    vbe_out(VBE_XRES, VGA_LFB_XRES);
    vbe_out(VBE_YRES, VGA_LFB_YRES);
    vbe_out(VBE_BPP, 32);
    vbe_out(VBE_ENABLE_INDEX, VBE_LFB_ENABLE | VBE_ENABLED);
  }
}
void put_pixel(int x, int y, uint32_t rgb) {
  uint32_t* fb = (uint32_t*)lfb_phys; /* identity 映射:VA == PA */
  fb[y * VGA_LFB_XRES + x] = rgb; /* 32bpp:值 0x00RRGGBB,内存字节序正好是 B,G,R,0 */
}

/* 返回线性帧缓冲的内核虚拟地址(640x400x32bpp),供整屏 blit 用。 */
uint32_t* vga_get_fb(void) { return (uint32_t*)lfb_phys; }

/* 返回线性帧缓冲的物理地址(PCI BAR0),供映射进用户进程页表。 */
uintptr_t vga_get_lfb_phys(void) { return lfb_phys; }
/* Initializes the VGA text display. */
static void init(void) {
  /* Already initialized? */
  static bool inited;
  if (!inited) {
    fb = ptov(0xb8000);
    find_cursor(&cx, &cy);
    inited = true;
  }
}

/* Writes C to the VGA text display, interpreting control
   characters in the conventional ways.  */
void vga_putc(int c) {
  /* Disable interrupts to lock out interrupt handlers
     that might write to the console. */
  enum intr_level old_level = intr_disable();

  init();

  switch (c) {
    case '\n':
      newline();
      break;

    case '\f':
      cls();
      break;

    case '\b':
      if (cx > 0)
        cx--;
      break;

    case '\r':
      cx = 0;
      break;

    case '\t':
      cx = ROUND_UP(cx + 1, 8);
      if (cx >= COL_CNT)
        newline();
      break;

    case '\a':
      intr_set_level(old_level);
      speaker_beep();
      intr_disable();
      break;

    default:
      fb[cy][cx][0] = c;
      fb[cy][cx][1] = GRAY_ON_BLACK;
      if (++cx >= COL_CNT)
        newline();
      break;
  }

  /* Update cursor position. */
  move_cursor();

  intr_set_level(old_level);
}

/* Clears the screen and moves the cursor to the upper left. */
static void cls(void) {
  size_t y;

  for (y = 0; y < ROW_CNT; y++)
    clear_row(y);

  cx = cy = 0;
  move_cursor();
}

/* Clears row Y to spaces. */
static void clear_row(size_t y) {
  size_t x;

  for (x = 0; x < COL_CNT; x++) {
    fb[y][x][0] = ' ';
    fb[y][x][1] = GRAY_ON_BLACK;
  }
}

/* Advances the cursor to the first column in the next line on
   the screen.  If the cursor is already on the last line on the
   screen, scrolls the screen upward one line. */
static void newline(void) {
  cx = 0;
  cy++;
  if (cy >= ROW_CNT) {
    cy = ROW_CNT - 1;
    memmove(&fb[0], &fb[1], sizeof fb[0] * (ROW_CNT - 1));
    clear_row(ROW_CNT - 1);
  }
}

/* Moves the hardware cursor to (cx,cy). */
static void move_cursor(void) {
  /* See [FREEVGA] under "Manipulating the Text-mode Cursor". */
  uint16_t cp = cx + COL_CNT * cy;
  outw(0x3d4, 0x0e | (cp & 0xff00));
  outw(0x3d4, 0x0f | (cp << 8));
}

/* Reads the current hardware cursor position into (*X,*Y). */
static void find_cursor(size_t* x, size_t* y) {
  /* See [FREEVGA] under "Manipulating the Text-mode Cursor". */
  uint16_t cp;

  outb(0x3d4, 0x0e);
  cp = inb(0x3d5) << 8;

  outb(0x3d4, 0x0f);
  cp |= inb(0x3d5);

  *x = cp % COL_CNT;
  *y = cp / COL_CNT;
}
