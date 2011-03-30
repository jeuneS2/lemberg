/*
 * Stub version of getrusage.
 */

#include <_ansi.h>
#include <_syslist.h>
#include <errno.h>
#undef errno
extern int errno;
#include <sys/time.h>
#include <sys/resource.h>

int
_DEFUN (getrusage, (who, usage),
        int who _AND
		struct rusage *usage)
{
	// We could read the timer here
	usage->ru_utime.tv_sec = 0;
	usage->ru_utime.tv_usec = 0;
	usage->ru_stime.tv_sec = 0;
	usage->ru_stime.tv_usec = 0;

	return 0;
}
