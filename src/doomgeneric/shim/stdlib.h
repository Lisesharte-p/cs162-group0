#ifndef SHIM_STDLIB_H
#define SHIM_STDLIB_H
#include "../lib/stdlib.h" /* 真实的 pintos stdlib.h */
#include <stdbool.h>
#include <stddef.h>

/* pintos 用户态缺失的 stdlib 声明(实现见 pintos_platform.c
   与 lib/user/syscall.c)。remove 与 lib/user/syscall.h 一致。 */
void* malloc(size_t);
void* calloc(size_t, size_t);
void* realloc(void*, size_t);
void free(void*);
void exit(int);
int abs(int);
bool remove(const char*);
int rename(const char*, const char*);
int system(const char*);
double atof(const char*);
long strtol(const char*, char**, int);
#endif
