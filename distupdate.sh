#! /bin/sh

export CC=gcc-4.6
export CXX=g++-4.6

# Build documentation, tools, and libraries
make -sj8 doc && \
make -sj8 configure && \
make -sj8 tools && \
sudo make -sj4 install-tools && \
make -sj8 libs && \
sudo make -sj4 install-libs

# Update examples and boot ROM
make -C examples/helloworld clean helloworld.s helloworld.bin helloworld.dat
make -C examples/md5 clean md5.s md5.bin md5.dat
make -C hw/bootrom clean bootrom.s bootrom.vhd sim_bootrom.vhd

# Synthesize hardware
make syn
