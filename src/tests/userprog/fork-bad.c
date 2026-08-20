#include <syscall.h>
#include "tests/lib.h"
#include "tests/main.h"

void test_main(void) {
  pid_t pid = fork();
  int res = 123;

  if (pid < 0) {
    fail("fork returned %d", pid);
  }

  if (pid > 0) {
    res = wait(pid);
  } else {
    *((int*)NULL) = 0;
    msg("Successfully dereferenced null");
    exit(res);
  }

  for (int i = 0; i < 10; i++)
    wait(i);

  msg("Child process exited with %d", res);
}

