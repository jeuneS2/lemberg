/*
 * Stub version of isatty.
 */

#include <_ansi.h>
#include <_syslist.h>
#include <errno.h>
#undef errno
extern int errno;

int
_DEFUN (_isatty, (file),
        int file)
{
  if ((file == 0) || (file == 1) || (file == 2))
    {
      return 1;
    }
  else
    {
      errno = ENOSYS;
      return 0;
    }
}
