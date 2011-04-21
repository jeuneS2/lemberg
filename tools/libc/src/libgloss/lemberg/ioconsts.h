/*
 * Address mapping for basic I/O
 */

#ifndef _IOCONSTS_H
#define _IOCONSTS_H

#define SYSINFO_REVISION         (*((const unsigned char *)-64))
#define SYSINFO_FREQUENCY        (*((const unsigned char *)-60))
#define SYSINFO_FEATURES         (*((const unsigned char *)-56))
#define SYSINFO_ADDR_WIDTH       (*((const unsigned char *)-52))

#define SYSINFO_SRAM_ADDR_WIDTH  (*((const unsigned char *)-48))
#define SYSINFO_DRAM_ADDR_WIDTH  (*((const unsigned char *)-44))
#define SYSINFO_FLASH_ADDR_WIDTH (*((const unsigned char *)-40))
#define SYSINFO_IO_ADDR_WIDTH    (*((const unsigned char *)-36))

#define SYSINFO_PC_WIDTH         (*((const unsigned char *)-32))
#define SYSINFO_DM_ADDR_WIDTH    (*((const unsigned char *)-28))
#define SYSINFO_FA_ADDR_WIDTH    (*((const unsigned char *)-24))
#define SYSINFO_STACK_WIDTH      (*((const unsigned char *)-20))

#define TIMER_CYCLES             (*((volatile unsigned long long *)-96))
#define TIMER_NANOS              (*((volatile unsigned long long *)-88))
#define TIMER_USECS              (*((volatile unsigned int *)-80))
#define TIMER_SECS               (*((volatile unsigned int *)-76))

#define UART_STATUS              (*((volatile unsigned char *)-120))
#define UART_DATA                (*((volatile unsigned char *)-116))
#define UART_RTS_MASK            0x01
#define UART_RTR_MASK            0x02

#define BOOTROM                  ((const unsigned char *)0xffe00000)

#endif
