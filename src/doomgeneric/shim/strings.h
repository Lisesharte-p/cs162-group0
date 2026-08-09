#ifndef SHIM_STRINGS_H
#define SHIM_STRINGS_H
#include <stddef.h>
int strncasecmp(const char*, const char*, size_t);
int strcasecmp(const char*, const char*);
char* strdup(const char*);
#endif
