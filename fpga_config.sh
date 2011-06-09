#! /bin/bash

jtag <<EOF
bsdl path /usr/share/urjtag/bsdl/
cable $1
detect 
svf $2
EOF