include /usr/local/lemberg/etc/Makefile.rules

ARCH=-march=lemberg-4way -mfpu=double -mcmodel=small
CFLAGS=-O3 -mllvm -regalloc=greedy

all: helloworld.bin helloworld.dat

helloworld.elf: helloworld.o

clean:
	rm -f *.bc *.ll *.s *.o *.elf *.dat *.bin *~
