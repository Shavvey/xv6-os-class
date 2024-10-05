#include "types.h"
#include "stat.h"
#include "user.h"
#include "syscall.h"
#define NUM_ARGS 2
#define PID 1
#define PRIOR 2

int main(int argc, char **argv) {
  if(argc < NUM_ARGS) {
    printf(2,"USAGE: nice [pid] [priority]");
    exit();
  } else {
    int priority;
    char const *prior = argv[PRIOR];
    char const *id = argv[PID];
    // make sure negative is decoded correctly
    if(*prior == '-') {
      prior = prior + 1; 
      priority = atoi(prior);
      // invert parsed int, it's stupid I know 
      priority *= -1;
     } else {
      priority = atoi(prior);
    }
    int pid = atoi(id);
    printf(1,"Setting new priority: %d for process ID: %d\n",priority,pid);
    int ret = set_priority(pid, priority);
    if(ret < 0) {
      printf(2,"set_priority syscall failed!\n");
      exit();
    }
    // get new priority set
    int new_priority = get_priority(pid);
    printf(1,"New priority: %d for PID: %d\n", new_priority,pid);
  }
  exit();
}
