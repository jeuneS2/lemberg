/*
 * Stub version of close.
 */

#include <_ansi.h>
#include <_syslist.h>
#include <errno.h>
#undef errno
extern int errno;

int
_DEFUN (_close, (fildes),
        int fildes)
{
  if ((fildes == 0) || (fildes == 1) || (fildes == 2))
    {
      return 0;
    }
  else
    {
      errno = ENOSYS;
      return -1;
    }
}
