#include <syscall.h>
#include "tests/lib.h"
#include "tests/main.h"
#include <stdlib.h>

char buf[24];

void test_main(void) {
  quiet = true;
  CHECK(create("new.txt", 36), "create failed");
  int fd;

  CHECK((fd = open("new.txt")) >= 2, "open() returned %d", fd);

  pid_t pid = fork();
  if (pid < 0)
    fail("fork returned %d", pid);

  if (pid == 0) {
    int new_fd;
    CHECK((new_fd = open("new.txt")) != fd, "file descriptors should be distinct");

    close(new_fd);

    close(fd);

    CHECK(read(new_fd, buf, 10) == -1, "You should not be able to read from a closed FD");
    CHECK(read(fd, buf, 10) == -1, "You should not be able to read from a closed FD");
    exit(0);
  }

  int new_new_fd;
  CHECK((new_new_fd = open("new.txt")) != fd, "file descriptors should be distinct");
  close(fd);
  close(new_new_fd);

  CHECK(read(new_new_fd, buf, 10) == -1, "You should not be able to read from a closed FD");
  CHECK(read(fd, buf, 10) == -1, "You should not be able to read from a closed FD");

  wait(pid);

  quiet = false;
}
