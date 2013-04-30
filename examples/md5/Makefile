include /usr/local/lemberg/etc/Makefile.rules

ARCH=-march=lemberg-4way -mfpu=double -mcmodel=small
CFLAGS=-O3 -mllvm -regalloc=greedy

all: md5.bin md5.dat

md5.elf: md5.o md5main.o

clean:
	rm -f *.bc *.ll *.s *.o *.elf *.dat *.bin *~
