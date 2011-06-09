/* Stub version of _exit.  */

#include <_ansi.h>
#include <_syslist.h>

extern void _crt0_exit(int);

_VOID
_DEFUN (_exit, (rc),
	int rc)
{
  _crt0_exit(rc);

  /* Convince GCC that this function never returns.  */
  for (;;)
    ;
}
