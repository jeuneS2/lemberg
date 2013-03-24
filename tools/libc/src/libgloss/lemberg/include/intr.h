/*
 * Interrupt-related definitions
 */

#ifndef _INTR_H
#define _INTR_H

/* Interrupt service routine function pointer type */
typedef void (*isr_t) (void);

/* Minimal ISR */
extern void intr_min(void);

/* ISR that calls intr_userfun[n] for interrupt n */
extern void intr(void);
extern volatile isr_t intr_userfun[16];

#define INTRNO_TIMER_CYCLES 0
#define INTRNO_TIMER_USECS  1

#endif
