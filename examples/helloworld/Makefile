include /usr/local/lemberg/etc/Makefile.rules

CFLAGS=-O3
LIBLLSYMS=
LLVM_LDFLAGS=-disable-inlining
LLCFLAGS=-O3 -code-model=small -combiner-alias-analysis -combiner-global-alias-analysis

all: helloworld.dat

helloworld.linked.bc: helloworld.bc
	${LLVM_LD}

clean:
	rm -f *.bc *.dat *.s *~
