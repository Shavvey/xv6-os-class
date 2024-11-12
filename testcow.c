#include "types.h"
#include "user.h"

int
main(void) {
  // controls the number of children, change this to fork even more
  int children = 3;
  int pid;
  int x = 14;
  const uint initial_page_count = getNumFreePages();
  int c = 0;
  for(; c < children; c++) {
    // create child process
    pid = fork(); 
    if (pid == 0) {
      sleep(100 * c);
      uint child_page_count_i = getNumFreePages();
      // modify x var, which will launch trap, which we allocate a new page to child proc
      x++;
      int j = 1;
      j++;
      // poll to see if page count has decreased (it should have)
      uint child_page_count_f = getNumFreePages();
      printf(1,"Change in page count after modify: %d\n", child_page_count_f - child_page_count_i);
      // child exit
      exit();
    } else {
      wait(); 
    }
  }
  printf(1,"Change in page count after of all child processes: %d\n", getNumFreePages() - initial_page_count);
  // parent exit
  exit();
}

