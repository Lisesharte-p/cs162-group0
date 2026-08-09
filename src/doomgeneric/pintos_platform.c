/* Pintos 用户态缺失的 libc 支撑:堆、文件、杂项。
   doom 引擎用到的 fopen/fread 等全部走文件 syscall。 */

#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <syscall.h>

/* ---------- malloc/free:简单 first-fit 分配器 ----------
   5MB 静态区:zone 3MB(-mb 3)+ 屏幕缓冲 1MB + 零碎分配。 */
#define ARENA_SIZE (12 * 1024 * 1024)
static uint8_t arena[ARENA_SIZE];

struct blk {
  size_t size;       /* 有效负载大小 */
  bool free;
  struct blk* next;
};

static struct blk* arena_head;

static void arena_init(void) {
  if (arena_head == NULL) {
    arena_head = (struct blk*)arena;
    arena_head->size = ARENA_SIZE - sizeof(struct blk);
    arena_head->free = true;
    arena_head->next = NULL;
  }
}

void* malloc(size_t size) {
  struct blk* b;
  size_t need = (size + 7) & ~(size_t)7;

  arena_init();

  for (b = arena_head; b != NULL; b = b->next)
    if (b->free && b->size >= need) {
      if (b->size >= need + sizeof(struct blk) + 8) {
        /* 拆分剩余空间 */
        struct blk* rest = (struct blk*)((uint8_t*)b + sizeof(struct blk) + need);
        rest->size = b->size - need - sizeof(struct blk);
        rest->free = true;
        rest->next = b->next;
        b->next = rest;
        b->size = need;
      }
      b->free = false;
      return (uint8_t*)b + sizeof(struct blk);
    }
  /* 堆耗尽:打印一次,便于定位 */
  {
    static bool warned;
    if (!warned) {
      warned = true;
      printf("malloc: arena exhausted (need %u bytes)\n", (unsigned)size);
    }
  }
  return NULL;
}

void free(void* p) {
  struct blk* b;
  struct blk* c;

  if (p == NULL)
    return;

  b = (struct blk*)((uint8_t*)p - sizeof(struct blk));
  b->free = true;

  /* 与下一个块合并 */
  if (b->next != NULL && b->next->free) {
    b->size += sizeof(struct blk) + b->next->size;
    b->next = b->next->next;
  }
  /* 与上一个块合并 */
  for (c = arena_head; c != NULL && c->next != b; c = c->next)
    ;
  if (c != NULL && c->free) {
    c->size += sizeof(struct blk) + b->size;
    c->next = b->next;
  }
}

/* ---------- 文件:stdio shim 接到文件 syscall ---------- */

struct _FILE {
  int fd;
  int pos;
  int size;
};

#define SEEK_SET 0
#define SEEK_CUR 1
#define SEEK_END 2

FILE* fopen(const char* path, const char* mode) {
  FILE* f;

  (void)mode;
  f = malloc(sizeof(FILE));
  if (f == NULL)
    return NULL;
  f->fd = open(path);
  if (f->fd < 0) {
    free(f);
    return NULL;
  }
  f->pos = 0;
  f->size = filesize(f->fd);
  return f;
}

int fclose(FILE* f) {
  if (f != NULL) {
    close(f->fd);
    free(f);
  }
  return 0;
}

size_t fread(void* ptr, size_t size, size_t nmemb, FILE* f) {
  int n = read(f->fd, ptr, size * nmemb);
  if (n < 0)
    return 0;
  f->pos += n;
  return n / size;
}

int fseek(FILE* f, long off, int whence) {
  int base = whence == SEEK_SET ? 0 : whence == SEEK_CUR ? f->pos : f->size;
  seek(f->fd, base + off);
  f->pos = base + off;
  return 0;
}

int feof(FILE* f) { return f->pos >= f->size; }

long ftell(FILE* f) { return f->pos; }

/* ---------- 杂项 ---------- */

int fprintf(FILE* f, const char* format, ...) {
  va_list args;
  int r;

  (void)f;
  va_start(args, format);
  r = vhprintf(STDOUT_FILENO, format, args);
  va_end(args);
  return r;
}

int abs(int x) { return x < 0 ? -x : x; }

char* getenv(const char* name) {
  (void)name;
  return NULL; /* 不支持环境变量 */
}

char* strdup(const char* s) {
  size_t len = strlen(s) + 1;
  char* p = malloc(len);
  if (p != NULL)
    memcpy(p, s, len);
  return p;
}

int strncasecmp(const char* a, const char* b, size_t n) {
  while (n-- > 0) {
    unsigned char ca = (unsigned char)*a++;
    unsigned char cb = (unsigned char)*b++;
    if (ca >= 'A' && ca <= 'Z')
      ca += 'a' - 'A';
    if (cb >= 'A' && cb <= 'Z')
      cb += 'a' - 'A';
    if (ca != cb)
      return (int)ca - (int)cb;
    if (ca == '\0')
      return 0;
  }
  return 0;
}

#define ATEXIT_MAX 16
static void (*atexit_funcs[ATEXIT_MAX])(void);
static int atexit_cnt;

int atexit(void (*func)(void)) {
  if (atexit_cnt < ATEXIT_MAX)
    atexit_funcs[atexit_cnt++] = func;
  return 0;
}

/* 游戏结束前由引擎调用,把注册的退出函数跑一遍。 */
void pintos_run_atexit(void) {
  while (atexit_cnt > 0)
    atexit_funcs[--atexit_cnt]();
}

/* ---------- 数学:用户态有 FPU,直接用 x87 ---------- */

int errno;

double floor(double x) {
  long long t = (long long)x; /* 向零截断 */
  if (x < 0 && (double)t != x)
    t--; /* 非整数负数:floor = trunc - 1 */
  return (double)t;
}

double ceil(double x) {
  long long t = (long long)x;
  if (x > 0 && (double)t != x)
    t++;
  return (double)t;
}

double fabs(double x) { return x < 0 ? -x : x; }

double atan(double x) {
  double r;
  asm volatile("fld1; fldl %1; fpatan; fstpl %0" : "=m"(r) : "m"(x));
  return r;
}

double pow(double x, double y) {
  double r;
  /* 2^(y*log2(x)):fyl2x 得 z,再 f2xm1+fscale 还原 2^z */
  asm volatile("fldl %1; fldl %2; fyl2x; fld %%st; frndint; fsubr %%st, %%st(1);"
               "f2xm1; fld1; faddp %%st, %%st(1); fscale; fstp %%st(1); fstpl %0"
               : "=m"(r)
               : "m"(x), "m"(y));
  return r;
}

/* ---------- 最小 sscanf:支持 %d %i %x %s,字面量匹配 ---------- */

static long scan_int(const char** s, int base) {
  while (**s == ' ' || **s == '\t')
    (*s)++;
  return strtol(*s, (char**)s, base);
}

long strtol(const char* s, char** end, int base) {
  long v = 0;
  int neg = 0, seen = 0;

  while (*s == ' ' || *s == '\t')
    s++;
  if (*s == '-') {
    neg = 1;
    s++;
  } else if (*s == '+')
    s++;
  if (base == 0) {
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) {
      base = 16;
      s += 2;
    } else if (s[0] == '0') {
      base = 8;
    } else
      base = 10;
  }
  while (1) {
    int d;
    if (*s >= '0' && *s <= '9')
      d = *s - '0';
    else if (*s >= 'a' && *s <= 'f')
      d = *s - 'a' + 10;
    else if (*s >= 'A' && *s <= 'F')
      d = *s - 'A' + 10;
    else
      break;
    if (d >= base)
      break;
    v = v * base + d;
    seen = 1;
    s++;
  }
  if (end != NULL)
    *end = (char*)s;
  return seen ? (neg ? -v : v) : 0;
}

int sscanf(const char* str, const char* fmt, ...) {
  va_list ap;
  const char* s = str;
  int n = 0;

  va_start(ap, fmt);
  while (*fmt != '\0') {
    if (*fmt == ' ') {
      fmt++;
      while (*s == ' ')
        s++;
    } else if (*fmt == '%') {
      fmt++;
      if (*fmt == 'x' || *fmt == 'X') {
        *va_arg(ap, int*) = (int)scan_int(&s, 16);
        fmt++;
        n++;
      } else if (*fmt == 'i') {
        *va_arg(ap, int*) = (int)scan_int(&s, 0);
        fmt++;
        n++;
      } else if (*fmt == 'd') {
        *va_arg(ap, int*) = (int)scan_int(&s, 10);
        fmt++;
        n++;
      } else if (*fmt == 's') {
        char* out = va_arg(ap, char*);
        while (*s == ' ' || *s == '\t')
          s++;
        while (*s != '\0' && *s != ' ' && *s != '\t')
          *out++ = *s++;
        *out = '\0';
        fmt++;
        n++;
      } else {
        va_end(ap);
        return n;
      }
    } else {
      /* 字面量字符必须匹配 */
      if (*s == *fmt) {
        s++;
        fmt++;
      } else {
        va_end(ap);
        return n;
      }
    }
  }
  va_end(ap);
  return n;
}

int rename(const char* oldname, const char* newname) {
  (void)oldname;
  (void)newname;
  return -1; /* 文件系统没有 rename syscall,存档改名暂不支持 */
}

FILE* stderr;
FILE* stdout;

int fflush(FILE* f) {
  (void)f;
  return 0; /* 输出本来就无缓冲,每次 write 立即落串口 */
}

int system(const char* cmd) {
  (void)cmd;
  return -1; /* 没有 shell */
}

int vfprintf(FILE* f, const char* format, va_list args) {
  (void)f;
  return vhprintf(STDOUT_FILENO, format, args);
}

double atof(const char* s) {
  double v = 0.0, frac = 0.1;
  int neg = 0, seen = 0;

  while (*s == ' ' || *s == '\t')
    s++;
  if (*s == '-') {
    neg = 1;
    s++;
  } else if (*s == '+')
    s++;
  while (*s >= '0' && *s <= '9') {
    v = v * 10.0 + (*s - '0');
    seen = 1;
    s++;
  }
  if (*s == '.') {
    s++;
    while (*s >= '0' && *s <= '9') {
      v += (*s - '0') * frac;
      frac *= 0.1;
      seen = 1;
      s++;
    }
  }
  if (!seen)
    return 0.0;
  return neg ? -v : v;
}

size_t fwrite(const void* ptr, size_t size, size_t nmemb, FILE* f) {
  int n = write(f->fd, ptr, size * nmemb);
  if (n < 0)
    return 0;
  f->pos += n;
  return n / size;
}


char* strncpy(char* dst, const char* src, size_t n) {
  size_t i;
  for (i = 0; i < n && src[i] != '\0'; i++)
    dst[i] = src[i];
  for (; i < n; i++)
    dst[i] = '\0';
  return dst;
}

int strncmp(const char* a, const char* b, size_t n) {
  while (n-- > 0) {
    if (*a != *b)
      return (unsigned char)*a - (unsigned char)*b;
    if (*a == '\0')
      return 0;
    a++;
    b++;
  }
  return 0;
}

void* realloc(void* p, size_t size) {
  struct blk* b;
  size_t old;
  void* np;

  if (p == NULL)
    return malloc(size);
  b = (struct blk*)((uint8_t*)p - sizeof(struct blk));
  old = b->size;
  if (old >= size)
    return p;
  np = malloc(size);
  if (np != NULL) {
    memcpy(np, p, old);
    free(p);
  }
  return np;
}

void* calloc(size_t nmemb, size_t size) {
  size_t total = nmemb * size;
  void* p = malloc(total);
  if (p != NULL)
    memset(p, 0, total);
  return p;
}

int strcasecmp(const char* a, const char* b) {
  while (1) {
    unsigned char ca = (unsigned char)*a++;
    unsigned char cb = (unsigned char)*b++;
    if (ca >= 'A' && ca <= 'Z')
      ca += 'a' - 'A';
    if (cb >= 'A' && cb <= 'Z')
      cb += 'a' - 'A';
    if (ca != cb)
      return (int)ca - (int)cb;
    if (ca == '\0')
      return 0;
  }
}
