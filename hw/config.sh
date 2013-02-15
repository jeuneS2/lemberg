#! /bin/sh

CONF_FILE="hw.conf"
OUT_FILE="src/config.vhd"

echo "-- Generated file, do not edit!" > $OUT_FILE
cat $OUT_FILE.in >> $OUT_FILE
cat $CONF_FILE | while read k v; do sed -i s/@$k@/$v/g $OUT_FILE; done

