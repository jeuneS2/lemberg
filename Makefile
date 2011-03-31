all: doc tools

# Configuration
configure: configure-tools

configure-tools: configure-libc configure-llvm

configure-libc:
	cd tools/libc/src; ./configure_lemberg

configure-llvm:
	cd tools/llvm; ./configure --target=lemberg

# Building
tools: asm lllib libc llvm

asm:
	${MAKE} -C tools/asm all

lllib:
	${MAKE} -C tools/lllib all

libc:
	${MAKE} -C tools/libc/src all

llvm:
	${MAKE} -C tools/llvm all

# Installation
install: install-tools

install-tools: install-asm install-lllib install-libc install-llvm

install-asm:
	${MAKE} -C tools/asm install

install-lllib:
	${MAKE} -C tools/lllib install

install-libc:
	${MAKE} -C tools/libc/src install

install-llvm:
	${MAKE} -C tools/llvm install

# Hardware
syn:
	echo "You're not slacking off. Your code's compiling."
	${MAKE} -C hw/quartus syn

# Simulation
sim:
	${MAKE} -C hw/sim sim

# Documentation
doc:
	${MAKE} -C doc all
