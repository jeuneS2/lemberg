/*
 * Simplistic version of read.
 */

#include <_ansi.h>
#include <_syslist.h>
#include <errno.h>
#undef errno
extern int errno;

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
            while ((*((volatile char *)-8) & 0x02) == 0)
              {
                /* wait for UART to be ready */
              }
            ptr[i] = *((volatile char *)-4);
        }
      return len;
    }
  else
    {
      errno = ENOSYS;
      return -1;
    }
}
