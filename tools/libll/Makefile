all: libll.a

PREFIX=/usr/local/lemberg

include ${PREFIX}/etc/Makefile.rules

CFLAGS=-O3 -mllvm -regalloc=greedy -mllvm -pre-RA-sched=list-hybrid -mllvm -tail-dup-size=24

FUNS = divsi3 modsi3 udivsi3 umodsi3 \
	clzsi2 \
	muldi3 divdi3 moddi3 udivdi3 umoddi3 udivmoddi4 \
	ashldi3 ashrdi3 lshrdi3 \
	addsf3 mulsf3 divsf3 comparesf2 \
	adddf3 muldf3 divdf3 comparedf2 \
	truncdfsf2 extendsfdf2 \
	floatsisf floatsidf floatunsidf \
	fixsfsi fixdfsi fixunsdfsi

BCS  = $(foreach f, ${FUNS}, ${f}.bc)
OBJS = $(foreach f, ${FUNS}, ${f}.o)

all: libll.a

libll.bc: ${BCS}
	llvm-link -o $@ $^

%.opt.bc : libll.bc %.bc
	opt -O3 -internalize -internalize-public-api-list=__$(basename $(basename $@)) -globaldce -o $@ $<

%.o : %.c
%.o : %.s

%.o : %.opt.bc
	${CC} ${CFLAGS} -c -o $@ $<

libll.a: ${OBJS}
	ar r libll.a ${OBJS}

install: libll.a
	install -d ${PREFIX}/lib/
	install -m 0644 libll.a ${PREFIX}/lib/

clean:
	rm -f -- libll.a *.o *.s *.bc *.ll *~