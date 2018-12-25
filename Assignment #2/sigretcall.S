#include "syscall.h"
#include "traps.h"

  .globl callsigret; \
  callsigret: \
    movl $SYS_sigret, %eax; \
    int $T_SYSCALL; \
    ret
