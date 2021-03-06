/*
 * Simplistic version of write.
 */

#include <_ansi.h>
#include <_syslist.h>
#include <errno.h>
#undef errno
extern int errno;

#include "ioconsts.h"

int
_DEFUN (_write, (file, ptr, len),
        int   file  _AND
        char *ptr   _AND
        int   len)
{
  if ((file == 1) || (file == 2)) 
    {
      int i;
	  for (i = 0; i < len; i++)
        {
            while ((UART_STATUS & UART_RTS_MASK) == 0)
              {
                /* wait for UART to be ready */
              }
			UART_DATA = ptr[i];
        }
      return len;
    }
  else
    {
      errno = ENOSYS;
      return -1;
    }
}
