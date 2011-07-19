include /usr/local/lemberg/etc/Makefile.rules

CFLAGS=-O3
OPTFLAGS=-O3
LIBLLSYMS=
LLCFLAGS=-O3 -code-model=small

all: helloworld.bin helloworld.dat

helloworld.linked.bc: helloworld.bc
	${LLVM_LD}

clean:
	rm -f *.bc *.dat *.bin *.s *~
