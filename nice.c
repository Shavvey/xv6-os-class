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
    printf(1,"Setting new priority: %d for process ID: %d",priority,pid);
    set_priority(pid, priority);
  }
  exit();
}
