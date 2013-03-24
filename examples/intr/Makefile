include /usr/local/lemberg/etc/Makefile.rules

CFLAGS=-O3
OPTFLAGS=-O3
LLCFLAGS=-O3 -code-model=small -regalloc=greedy

all: intr.bin intr.dat

intr.linked.bc: intr.bc
	${LLVM_LD}

clean:
	rm -f *.bc *.ll *.dat *.bin *.sym *.s *~
