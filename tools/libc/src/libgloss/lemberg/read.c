/*
 * Simplistic version of read.
 */

#include <_ansi.h>
#include <_syslist.h>
#include <errno.h>
#undef errno
extern int errno;

#include "ioconsts.h"

int
_DEFUN (_read, (file, ptr, len),
        int   file  _AND
        char *ptr   _AND
        int   len)
{
  if (file == 0)
    {
      int i;
	  for (i = 0; i < len; i++)
        {
            while ((UART_STATUS & UART_RTR_MASK) == 0)
              {
                /* wait for UART to be ready */
              }
            ptr[i] = UART_DATA;
        }
      return len;
    }
  else
    {
      errno = ENOSYS;
      return -1;
    }
}
