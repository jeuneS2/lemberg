all: libll.a

PREFIX=/usr/local/lemberg

CC = llvm-gcc -emit-llvm -O3

OBJS = divsi3.o modsi3.o udivsi3.o umodsi3.o \
	clzsi2.o \
	muldi3.o divdi3.o moddi3.o udivdi3.o umoddi3.o udivmoddi4.o \
	ashldi3.o ashrdi3.o lshrdi3.o \
	addsf3.o mulsf3.o divsf3.o comparesf2.o \
	adddf3.o muldf3.o divdf3.o comparedf2.o \
	truncdfsf2.o extendsfdf2.o \
	floatsisf.o floatsidf.o \
	fixsfsi.o fixdfsi.o

libll.a: ${OBJS}
	llvm-ar r libll.a ${OBJS}

install: libll.a ${OBJS}
	install -d ${PREFIX}/lib/
	install -m 0644 libll.a ${PREFIX}/lib/
	install -d ${PREFIX}/lib/libll/
	install -m 0644 ${OBJS} ${PREFIX}/lib/libll/

clean:
	rm -f -- libll.a *.o *~