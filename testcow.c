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
  // for each child, call fork and start modifying a var to trigger page fault, which will give us new pages
  // after each completion of the child write, we should expect less free pages, print them to confirm this
  for(; c < children; c++) {
    // create child process
    pid = fork(); 
    if (pid == 0) {
      // modify x var, which will launch trap, which we allocate a new page to child proc
      printf(1," Child %d is modifying memory..\n",c);
      x++;
      // poll to see if page count has decreased (it should have)
      uint child_page_count_f = getNumFreePages();
      printf(1,"Change in free page count after modify: %d\n", child_page_count_f - initial_page_count);
      // child exit
      exit();
    } else {
      // wait for child exit
      wait();
    }
  }
  printf(1,"Change in free page count after of all child processes have exited: %d\n", getNumFreePages() - initial_page_count);
  // parent exit
  exit();
}

