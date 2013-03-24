include /usr/local/lemberg/etc/Makefile.rules

CFLAGS=-O3
LLVM_LDFLAGS=
OPTFLAGS=-O3
LLCFLAGS=-O3 -code-model=small -regalloc=greedy

all: md5.bin md5.dat

md5.linked.bc: md5.bc md5main.bc
	${LLVM_LD}

clean:
	rm -f *.bc *.ll *.dat *.bin *.sym *.s *~
