include /usr/local/lemberg/etc/Makefile.rules

CFLAGS=-O3
LLCFLAGS=-O3 -code-model=small -combiner-alias-analysis -combiner-global-alias-analysis

all: md5.bin md5.dat

md5.linked.bc: md5.bc md5main.bc
	${LLVM_LD}

clean:
	rm -f *.bc *.dat *.bin *.s *~
