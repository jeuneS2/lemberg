#! /bin/bash

cat $2 > $1 &

if [ "$3" = "RAW" ]; then
    # raw output
	cat $1
else
    # filtered output with timeout
	`dirname $0`/timeout3 -t 60 awk 'BEGIN { boot = 0 }
         /^BOOT$/ { boot = 1; next }
         /^EXIT [0-9a-fA-F]+$/ { exit strtonum("0x"$2) }
         { if (boot) print }' < $1
fi
