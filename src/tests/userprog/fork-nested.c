#include <syscall.h>
#include "tests/lib.h"
#include "tests/main.h"

int testvar = 1;

void test_main(void) {
  pid_t pid1 = fork(); // First fork
  msg("Testvar should be 1 but is %d", testvar);

  if (pid1 < 0) {
    fail("fork returned %d", pid1);
  }

  if (pid1 == 0) {
    pid_t pid2 = fork(); // Second fork (nested)
    testvar++;

    msg("Testvar should be 2 but is %d", testvar);

    if (pid2 < 0) {
      fail("fork returned %d", pid2);
    }

    if (pid2 == 0) {
      testvar += 3;
      msg("Testvar should be 5 but is %d", testvar);
    } else {
      wait(pid2);
      msg("Testvar should be 2 but is %d", testvar);
    }
  } else {
    wait(pid1); // Parent waits for the first child
    msg("Testvar should be 1 but is %d", testvar);
  }
}
