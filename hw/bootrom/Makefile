include /usr/local/lemberg/etc/Makefile.rules

CFLAGS=-Os
LLVM_LDFLAGS=
LIBLLSYMS=
LLCFLAGS=-O2

all: bootrom.vhd sim_bootrom.vhd

bootrom.linked.bc: bootrom.bc
	${LLVM_LD}

bootrom.vhd: bootrom.s
	/usr/local/lemberg/bin/as -v -o bootrom.vhd bootrom.s

sim_bootrom.vhd: sim_bootrom.s
	/usr/local/lemberg/bin/as -v -o sim_bootrom.vhd sim_bootrom.s

clean:
	rm -f a.out *.bc *.vhd *.vhd.sym bootrom.s *~
