#ifndef SHIM_SYS_STAT_H
#define SHIM_SYS_STAT_H
#include <syscall.h>
/* 引擎按 POSIX 两参调用 mkdir,用户库只有单参 syscall 版本。 */
#define mkdir(path, mode) mkdir(path)
#endif
