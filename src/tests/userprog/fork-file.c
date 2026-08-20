#include <syscall.h>
#include "tests/lib.h"
#include "tests/main.h"
#include <stdlib.h>
#include <string.h>

char buf[24];

void test_main(void) {
  quiet = true;

  CHECK(create("new.txt", 36), "create failed");
  int fd;

  CHECK((fd = open("new.txt")) >= 2, "open() returned %d", fd);

  pid_t pid = fork();
  if (pid < 0)
    fail("fork returned %d", pid);

  memset(buf, 'b', 24);
  if (pid == 0) {
    memset(buf, 'a', 24);
    unsigned total_written = 0;
    while (total_written < 24) {
      int written = write(fd, buf + total_written, 24 - total_written);
      if (written == -1)
        fail("failed to write");
      total_written += written;
    }
    close(fd);
    exit(0);
  }

  memset(buf, 'b', 24);
  wait(pid);
  unsigned total_read = 0;
  unsigned bytes_read;
  seek(fd, 0);
  while (total_read < 24) {
    bytes_read = read(fd, buf + total_read, 24 - total_read);
    if (read == -1)
      fail("failed to write");
    total_read += bytes_read;
  }

  for (int i = 0; i < 24; i++) {
    if (buf[i] != 'a')
      fail("Expected 'a' but got '%c'", buf[i]);
  }
  close(fd);

  quiet = false;
}