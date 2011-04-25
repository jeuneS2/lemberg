SOURCES=../src/*.vhd \
	../src/cache/*.vhd \
	../src/io/*.vhd \
	../src/fpu/*.vhd ../src/fpu/float_pkg/*.vhdl

SETTINGS=lemberg.qpf lemberg.qsf lemberg.sdc

all: syn analyze

syn: bootrom lemberg.svf lemberg.sof

lemberg.svf: lemberg.sof

lemberg.sof: ${SETTINGS} ${SOURCES} ../bootrom/bootrom.vhd
	quartus_map lemberg
	quartus_fit lemberg
	quartus_asm lemberg

bootrom:
	${MAKE} -C ../bootrom bootrom.vhd

analyze: syn
	quartus_sta lemberg
