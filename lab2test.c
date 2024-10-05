#include "types.h"
#include "stat.h"
#include "user.h"
#include "syscall.h"

void test() {
  printf(1,"Testing set_priority and get_priority syscalls!\n");
  int new_priority = -2;
  printf(1,"Attempting to set priority %d (which will get clamped inside the range [0,39])\n", new_priority);
  // get current process id 
  int pid = getpid();
  int res = set_priority(pid, new_priority);
  if (res == 0) {
    int priority = get_priority(pid);
      printf(1,"Process PID: %d now has newly set priority: %d\n",pid,priority);
  } else {
    printf(0,"Failed to set new priority for process PID: %d\n",pid);
  }
  exit();
}

void test_args(int new_priority) {
  int pid = getpid();
  int res = set_priority(pid, new_priority);
  if(res == 0) {
    int priority = get_priority(pid);
      printf(1,"New priority %d for process PID: %d\n",priority,pid);
  } else {
    printf(0, "Failed to get priority for process PID: %d\n", pid);
  }
  exit();
}

int main(int argc, char *argv[]) {
  // if no passed args just call test() with no args
  if(argc <= 1) {
    test();
    exit();
  } else {
    char const *prior = argv[1];
    printf(1,"Passed priority: %s\n", prior);
    // dumb hacky nonsense to get negative numbers to parse correctly
    if(*prior == '-') {
      prior = prior + 1; 
      int p = atoi(prior);
      // invert parsed int, it's stupid I know 
      p *= -1;
      printf(1,"Setting new priority: %d\n", p);
      test_args(p);
     } else {
      int p = atoi(prior);
      printf(1,"Setting new priority: %d\n", p);
      test_args(p);
    }
  }
  exit();
}
