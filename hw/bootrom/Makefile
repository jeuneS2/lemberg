include /usr/local/lemberg/etc/Makefile.rules

CFLAGS=-march=lemberg-1way -mcmodel=small -mfpu=none -Oz -ansi -pedantic -Wall

all: bootrom.vhd sim_bootrom.vhd

bootrom.vhd: bootrom.o
	${LD} -o bootrom.elf $^
	${OBJCOPY} -v -e bootrom -o $@ bootrom.elf

sim_bootrom.vhd: sim_bootrom.o
	${LD} -o sim_bootrom.elf $^
	${OBJCOPY} -v -e bootrom -o $@ sim_bootrom.elf

clean:
	rm -f *.bc *.ll *.o *.elf *.bin *.dat *.vhd bootrom.s *~
