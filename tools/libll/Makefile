all: libll.a

PREFIX=/usr/local/lemberg

include ${PREFIX}/etc/Makefile.rules

CFLAGS=-O3 -mllvm -regalloc=greedy -mllvm -pre-RA-sched=list-hybrid -mllvm -tail-dup-size=24

OBJS = divsi3.o modsi3.o udivsi3.o umodsi3.o \
	clzsi2.o \
	muldi3.o divdi3.o moddi3.o udivdi3.o umoddi3.o udivmoddi4.o \
	ashldi3.o ashrdi3.o lshrdi3.o \
	addsf3.o mulsf3.o divsf3.o comparesf2.o \
	adddf3.o muldf3.o divdf3.o comparedf2.o \
	truncdfsf2.o extendsfdf2.o \
	floatsisf.o floatsidf.o floatunsidf.o \
	fixsfsi.o fixdfsi.o fixunsdfsi.o

all: libll.a

libll.a: ${OBJS}
	ar r libll.a ${OBJS}

install: libll.a
	install -d ${PREFIX}/lib/
	install -m 0644 libll.a ${PREFIX}/lib/

clean:
	rm -f -- libll.a *.o *~