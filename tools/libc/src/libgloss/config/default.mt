#
# these are the minimum required stubs to support newlib
#
close.o: ${srcdir}/../close.c
	$(CC) $(CFLAGS_FOR_TARGET) $(INCLUDES) -c $?
fstat.o: ${srcdir}/../fstat.c
	$(CC) $(CFLAGS_FOR_TARGET) $(INCLUDES) -c $?
getpid.o: ${srcdir}/../getpid.c
	$(CC) $(CFLAGS_FOR_TARGET) $(INCLUDES) -c $?
isatty.o: ${srcdir}/../isatty.c
	$(CC) $(CFLAGS_FOR_TARGET) $(INCLUDES) -c $?
kill.o: ${srcdir}/../kill.c
	$(CC) $(CFLAGS_FOR_TARGET) $(INCLUDES) -c $?
lseek.o: ${srcdir}/../lseek.c
	$(CC) $(CFLAGS_FOR_TARGET) $(INCLUDES) -c $?
open.o: ${srcdir}/../open.c
	$(CC) $(CFLAGS_FOR_TARGET) $(INCLUDES) -c $?
print.o: ${srcdir}/../print.c
	$(CC) $(CFLAGS_FOR_TARGET) $(INCLUDES) -c $?
putnum.o: ${srcdir}/../putnum.c
	$(CC) $(CFLAGS_FOR_TARGET) $(INCLUDES) -c $?
read.o: ${srcdir}/../read.c
	$(CC) $(CFLAGS_FOR_TARGET) $(INCLUDES) -c $?
sbrk.o: ${srcdir}/../sbrk.c
	$(CC) $(CFLAGS_FOR_TARGET) $(INCLUDES) -c $?
stat.o: ${srcdir}/../stat.c
	$(CC) $(CFLAGS_FOR_TARGET) $(INCLUDES) -c $?
unlink.o: ${srcdir}/../unlink.c
	$(CC) $(CFLAGS_FOR_TARGET) $(INCLUDES) -c $?
write.o: ${srcdir}/../write.c
	$(CC) $(CFLAGS_FOR_TARGET) $(INCLUDES) -c $?
debug.o: ${srcdir}/../debug.c ${srcdir}/../debug.h
	$(CC) $(CFLAGS_FOR_TARGET) $(INCLUDES) -c ${srcdir}/../debug.c
