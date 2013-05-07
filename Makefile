PROJECT_DIR=examples/helloworld
PROJECT_NAME=helloworld

SERDEV=/dev/ttyUSB0
FPGACABLE="UsbBlaster"

# RAW=RAW

all: doc tools libs

# Configuration
configure: configure-tools

configure-tools: configure-llvm

configure-llvm:
	cd tools/llvm; ./configure --enable-assertions

# Build tools
tools: binutils llvm etc

binutils:
	${MAKE} -C tools/binutils all

llvm:
	${MAKE} -C tools/llvm all

etc:
	${MAKE} -C tools/etc all

# Build libraries
libs: libll libc

libll:
	${MAKE} -C tools/libll all

libc:
	cd tools/libc/src; ./build.sh build

# Installation
install: install-tools install-libs

install-tools: install-binutils install-llvm install-etc

install-binutils:
	${MAKE} -C tools/binutils install

install-llvm:
	${MAKE} -C tools/llvm install

install-etc:
	${MAKE} -C tools/etc install

install-libs: install-libll install-libc

install-libll:
	${MAKE} -C tools/libll install

install-libc:
	cd tools/libc/src; ./build.sh install

# Hardware
hwconfig:
	cd hw; ./config.sh
xhwconfig:
	cd hw; ./xconfig.tk
syn: hwconfig
	@echo "You're not slacking off. Your code's compiling."
	${MAKE} -C hw/quartus syn

# Build program
proj:
	${MAKE} -C ${PROJECT_DIR} ${PROJECT_NAME}.dat ${PROJECT_NAME}.bin

# Simulation
sim: proj
	cp ${PROJECT_DIR}/${PROJECT_NAME}.dat hw/sim/mem_main.dat
	${MAKE} -C hw/sim sim

sim-nox: proj
	cp ${PROJECT_DIR}/${PROJECT_NAME}.dat hw/sim/mem_main.dat
	${MAKE} -C hw/sim sim-nox

# Run program in FPGA
fpga: tty proj
	./fpga_config.sh ${FPGACABLE} hw/quartus/lemberg.svf && \
	./fpga_exec.sh ${SERDEV} ${PROJECT_DIR}/${PROJECT_NAME}.bin ${RAW}

tty:
	stty -F ${SERDEV} 115200 cstopb raw -echo

# Documentation
doc:
	${MAKE} -C doc all
