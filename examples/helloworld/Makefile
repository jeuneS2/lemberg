include /usr/local/lemberg/etc/Makefile.rules

CFLAGS=-O3
LIBLLSYMS=
LLCFLAGS=-O3 -code-model=small -combiner-alias-analysis -combiner-global-alias-analysis

all: helloworld.bin helloworld.dat

helloworld.linked.bc: helloworld.bc
	${LLVM_LD}

clean:
	rm -f *.bc *.dat *.bin *.s *~
