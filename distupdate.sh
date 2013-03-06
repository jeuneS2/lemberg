#! /bin/sh

# Build tools, documentation and libraries
make -sj8 configure && make -sj8 doc tools && sudo make -sj4 install

# Update examples and boot ROM
make -C examples/helloworld clean helloworld.s helloworld.bin helloworld.dat
make -C examples/md5 clean md5.s md5.bin md5.dat
make -C hw/bootrom clean bootrom.vhd sim_bootrom.vhd

# Synthesize hardware
make syn
