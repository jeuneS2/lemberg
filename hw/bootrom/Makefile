include /usr/local/lemberg/etc/Makefile.rules

CFLAGS=-Os -ansi -pedantic -Wall
OPTFLAGS=-O2 -unroll-threshold=0
LLCFLAGS=-mcpu=lemberg-minimal -O2 -disable-machine-licm -code-model=small

all: bootrom.vhd sim_bootrom.vhd

bootrom.linked.bc: bootrom.bc
	llvm-ld -b $@ $<

bootrom.vhd: bootrom.s
	/usr/local/lemberg/bin/as -v -e bootrom -o $@ $<

sim_bootrom.vhd: sim_bootrom.s
	/usr/local/lemberg/bin/as -v -e bootrom -o $@ $<

clean:
	rm -f a.out *.bc *.vhd *.vhd.sym bootrom.s *~
