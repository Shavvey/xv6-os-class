#include "types.h"
#include "user.h"

int
main(void) {
  int id;
  int n = 2;
  printf(1, "Creating child process with fork\n");
  // creating var that the child process will then modify
  int x = 1;
  int y = 2;
  printf(1,"Forking %d times...\n", n);
  // preform the fork n times
  int i = 0;
  for (; i < n; i++) {
    id = fork();
    if(id < 0) {
      printf(1,"%d failed in fork!\n", getpid());
    }
   // child code
    if (id == 0) {
      uint n = getNumFreePages();
      printf(1,"Number of free pages before write: %d\n", n);
      x = x + 1;
      y *= 2;
      printf(1,"Number of free pages after write: %d\n");
      exit();
    }
  }

  // exit of out of program
  exit();
}

