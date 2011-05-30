/*
 * Stub version of getrusage.
 */

#include <_ansi.h>
#include <_syslist.h>
#include <errno.h>
#include <sys/times.h>
#undef errno
extern int errno;

#include "ioconsts.h"

clock_t
_DEFUN (_times, (buf),
        struct tms *buf)
{
	clock_t time = TIMER_USECS;
	time += TIMER_SECS*1000000;

	// Everything is accounted to the user time
	buf->tms_utime = time;
	buf->tms_stime = 0;
	buf->tms_cutime = 0;
	buf->tms_cstime = 0;

	return time;
}
