#ifndef SHIM_STDIO_H
#define SHIM_STDIO_H
#include "../lib/stdio.h" /* 真实的 pintos stdio.h */
#include <stddef.h>

/* pintos 没有 FILE 类型,这里补上(实现见 pintos_platform.c)。 */
typedef struct _FILE FILE;
extern FILE* stderr;
extern FILE* stdout;

#define SEEK_SET 0
#define SEEK_CUR 1
#define SEEK_END 2

FILE* fopen(const char*, const char*);
int fclose(FILE*);
size_t fread(void*, size_t, size_t, FILE*);
size_t fwrite(const void*, size_t, size_t, FILE*);
int fseek(FILE*, long, int);
int feof(FILE*);
long ftell(FILE*);
int fprintf(FILE*, const char*, ...);
int vfprintf(FILE*, const char*, va_list);
int fflush(FILE*);
int sscanf(const char*, const char*, ...);
#endif
