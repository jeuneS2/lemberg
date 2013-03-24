#include <stdio.h>

#include <ioconsts.h>
#include <intr.h>

void userfun(void) {
  /* Trigger ourselves again */
  TIMER_USECS = TIMER_USECS+7;
}

int main(void) {
  /* Register "intr" as first-level handler for usec interrupt */
  INTR_VEC[INTRNO_TIMER_USECS] = &intr;
  /* Register "userfun" as second-level handler for usec interrupt */
  intr_userfun[INTRNO_TIMER_USECS] = &userfun;
  
  /* Trigger first interrupt in 1 us */
  TIMER_USECS = TIMER_USECS+1;

  /* Clear any pending usec interrupts */
  INTR_PEND = 1 << INTRNO_TIMER_USECS;
  /* Unmask usec interrupt and enable interrupts */
  INTR_MASK |= 1 << INTRNO_TIMER_USECS;
  INTR_ENA = 1;

  for (;;) {
	puts("Hello, World!");
  }
}
