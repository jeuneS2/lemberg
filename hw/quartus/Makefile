SOURCES=$(find ../src -name "*.vhd" -print)

all: syn analyze

syn: bootrom lemberg.svf lemberg.sof

lemberg.sof lemberg.svf: ${SOURCES} ../bootrom/bootrom.vhd
	quartus_map lemberg
	quartus_fit lemberg
	quartus_asm lemberg

bootrom:
	${MAKE} -C ../bootrom bootrom.vhd

analyze: syn
	quartus_sta lemberg
