#include "types.h"
#include "user.h"

int
main(void ) {
  printf(1, "Creating child process with fork!");
  // creating var that the child process will then modify
  int x = 1;
  // modify 
  if(fork() == 0) {
    
  }
  exit();
}


