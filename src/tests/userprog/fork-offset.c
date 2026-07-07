#include <syscall.h>
#include "tests/lib.h"
#include "tests/main.h"
#include <stdlib.h>

void test_main(void) {
  quiet = true;

  CHECK(create("first.txt", 100), "create failed");
  CHECK(create("second.txt", 100), "create failed");
  int first_fd;
  int first_fd_check;

  CHECK((first_fd = open("first.txt")) >= 2, "open() returned %d", first_fd);
  int initial_pos = tell(first_fd);

  pid_t pid = fork();
  if (pid < 0)
    fail("fork returned %d", pid);

  if (pid == 0) {
    int second_fd;
    CHECK((second_fd = open("second.txt")) >= 2, "open() returned %d", second_fd);
    seek(second_fd, 62);

    seek(first_fd, initial_pos + 10);
    int new_pos = tell(first_fd);
    CHECK(initial_pos + 10 == new_pos, "position did not change!");

    CHECK(tell(second_fd) == 62, "position changed!");
    exit(0);
  } else if (pid > 0) {
    int second_fd;
    CHECK((second_fd = open("second.txt")) >= 2, "open() returned %d", second_fd);
    seek(second_fd, 31);

    wait(pid);

    int new_pos = tell(first_fd);
    CHECK(initial_pos + 10 == new_pos, "position did not change!");

    CHECK(tell(second_fd) == 31, "position changed!");
  }

  quiet = false;
}
