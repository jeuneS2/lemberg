/*
 * Stub version of gettimeofday.
 */

#include <_ansi.h>
#include <_syslist.h>
#include <sys/time.h>
#include <sys/times.h>
#include <errno.h>
#undef errno
extern int errno;

#include "ioconsts.h"

int
_DEFUN (_gettimeofday, (ptimeval, ptimezone),
        struct timeval  *ptimeval  _AND
        void *ptimezone)
{
	ptimeval->tv_usec = TIMER_USECS;
	ptimeval->tv_sec = TIMER_SECS;

	return 0;
}
