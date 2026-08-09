#ifndef SHIM_STRING_H
#define SHIM_STRING_H
#include "../lib/string.h" /* 真实的 pintos string.h */
#include <stddef.h>

/* pintos 只提供 strlcpy;引擎用 strncpy/strncmp,补上。 */
#undef strncpy
char* strncpy(char*, const char*, size_t);
int strncmp(const char*, const char*, size_t);
#endif
