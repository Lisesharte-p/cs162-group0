#include <stdio.h>
#include <syscall.h>
#include "tests/lib.h"

void fork_tree(int curr_depth, int max_depth, int fanout) {
  if (curr_depth == max_depth)
    return;

  pid_t child_pids[fanout];

  for (int i = 0; i < fanout; i++) {
    pid_t pid;
    if (i == 0)
      pid = exec("fork-help");
    else
      pid = fork();

    if (pid < 0) {
      fail("fork failed unexpectedly");
    }

    if (pid == 0) {
      fork_tree(curr_depth + 1, max_depth, fanout);
      exit(161);
    } else {
      child_pids[i] = pid;
    }
  }

  for (int i = 0; i < fanout; i++) {
    int ret;
    if ((ret = wait(child_pids[i])) != 161) {
      fail("Child failed unexpectedly with code %d", ret);
    }
  }
  return;
}

int main(int argc, char* argv[]) {
  fork_tree(0, 1, 5);
  fork_tree(0, 3, 3);
  fork_tree(0, 3, 4);
  printf("Success!\n");
  return 81;
}
