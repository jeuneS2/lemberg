PREFIX=/usr/local/lemberg

include ${PREFIX}/etc/Makefile.rules

# The build flags
CFLAGS=-O3 -mllvm -regalloc=greedy -mllvm -pre-RA-sched=list-hybrid -mllvm -tail-dup-size=24

# All the configurations we want to build
WAYS=1way 2way 3way 4way
FPUS=none single double

# All the files we have to compile
FILES = divsi3 modsi3 udivsi3 umodsi3 \
	divmodsi4 udivmodsi4 \
	muldi3 divdi3 moddi3 udivdi3 umoddi3 \
	divmoddi4 udivmoddi4 \
	ashldi3 ashrdi3 lshrdi3 \
	addsf3 subsf3 negsf2 mulsf3 divsf3 comparesf2 \
	adddf3 subdf3 negdf2 muldf3 divdf3 comparedf2 \
	truncdfsf2 extendsfdf2 \
	floatsisf floatsidf floatdisf floatdidf \
	floatunsisf floatunsidf floatundisf floatundidf \
	fixsfsi fixsfdi fixdfsi fixdfdi \
	fixunssfsi fixunssfdi fixunsdfsi fixunsdfdi

# All the function symbols we want to provide
FUNS = divsi3 modsi3 udivsi3 umodsi3 \
	divmodsi4 udivmodsi4 \
	muldi3 divdi3 moddi3 udivdi3 umoddi3 \
	divmoddi4 udivmoddi4 \
	ashldi3 ashrdi3 lshrdi3 \
	addsf3 subsf3 negsf2 mulsf3 divsf3 \
	gesf2 gtsf2 lesf2 ltsf2 eqsf2 nesf2 unordsf2 \
	adddf3 subdf3 negdf2 muldf3 divdf3 \
	gedf2 gtdf2 ledf2 ltdf2 eqdf2 nedf2 unorddf2 \
	truncdfsf2 extendsfdf2 \
	floatsisf floatsidf floatdisf floatdidf \
	floatunsisf floatunsidf floatundisf floatundidf \
	fixsfsi fixsfdi fixdfsi fixdfdi \
	fixunssfsi fixunssfdi fixunsdfsi fixunsdfdi

# File names for symbols
BCS  = $(foreach f, ${FILES}, ${f}.bc)
OBCS = $(foreach f, ${FUNS}, ${f}.opt.bc)
OBJS = $(foreach f, ${FUNS}, ${ARCHDIR}/${f}.o)

# Variables for building a specific configuration
WAY=
FPU=
ARCH=-march=lemberg-${WAY} -mfpu=${FPU}
ARCHDIR=${WAY}-${FPU}

all:
	$(foreach w, ${WAYS}, \
		$(foreach f, ${FPUS}, \
			${MAKE} WAY=${w} FPU=${f} lib;))

# Kill a few default rules
%.s : %.c
%.o : %.c
%.o : %.s

# Build a bitcode-library
libll.bc: ${BCS}
	llvm-link -o $@ $^

.SECONDARY: ${OBCS}
# Optimize bitcode-library and extract relevant symbol
%.opt.bc : libll.bc
	opt -O3 -internalize -internalize-public-api-list=__$(basename $(basename $@)) -globaldce -o $@ $<

# Compile
${ARCHDIR}/%.s : %.opt.bc
	mkdir -p ${ARCHDIR}
	${CC} ${ARCH} ${CFLAGS} -S -o $@ $<
${ARCHDIR}/%.o : %.opt.bc
	mkdir -p ${ARCHDIR}
	${CC} ${ARCH} ${CFLAGS} -c -o $@ $<

# Create library
lib: ${ARCHDIR}/libll.a
${ARCHDIR}/libll.a: ${OBJS}
	ar r $@ $^

# Install
install:
	$(foreach w, ${WAYS}, \
		$(foreach f, ${FPUS}, \
			${MAKE} WAY=${w} FPU=${f} subinstall;))
	ln -sf ${PREFIX}/4way-double/lib ${PREFIX}/lib

subinstall: ${ARCHDIR}/libll.a
	install -d ${PREFIX}/${ARCHDIR}/lib/
	install -m 0644 ${ARCHDIR}/libll.a ${PREFIX}/${ARCHDIR}/lib/

# Clean
clean:
	rm -f -- libll.a *.o *.s *.bc *.ll *~
	$(foreach w, ${WAYS}, \
		$(foreach f, ${FPUS}, \
			${MAKE} WAY=${w} FPU=${f} subclean;))

subclean:
	rm -rf ${ARCHDIR}
