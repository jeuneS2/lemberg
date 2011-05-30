/*
 * Stub version of getrusage.
 */

#include <_ansi.h>
#include <_syslist.h>
#include <errno.h>
#include <sys/time.h>
#include <sys/resource.h>
#undef errno
extern int errno;

#include "ioconsts.h"

int
_DEFUN (getrusage, (who, usage),
        int who _AND
		struct rusage *usage)
{
	// Everything is accounted to the user time
	usage->ru_utime.tv_usec = TIMER_USECS;
	usage->ru_utime.tv_sec  = TIMER_SECS;
	usage->ru_stime.tv_usec = 0;
	usage->ru_stime.tv_sec = 0;

	return 0;
}
