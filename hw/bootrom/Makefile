include /usr/local/lemberg/etc/Makefile.rules

CFLAGS=-Os -ansi -pedantic -Wall
OPTFLAGS=-O2 -unroll-threshold=0
LLCFLAGS=-mcpu=lemberg-minimal -O2 -disable-machine-licm -code-model=small

all: bootrom.vhd sim_bootrom.vhd

bootrom.linked.bc: bootrom.bc
	llvm-ld -b bootrom.linked.bc bootrom.bc

bootrom.vhd: bootrom.s
	/usr/local/lemberg/bin/as -v -o bootrom.vhd bootrom.s

sim_bootrom.vhd: sim_bootrom.s
	/usr/local/lemberg/bin/as -v -o sim_bootrom.vhd sim_bootrom.s

clean:
	rm -f a.out *.bc *.vhd *.vhd.sym bootrom.s *~
