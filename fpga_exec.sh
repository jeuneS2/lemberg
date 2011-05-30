#! /bin/sh

cat $2 > $1 &

if [ "$3" = "RAW" ]; then
    # raw output
    cat $1
else
    # filtered output
	awk 'BEGIN { boot = 0 }
         /^BOOT$/ { boot = 1; next }
         /^EXIT [0-9a-fA-F]+$/ { exit strtonum("0x"$2) }
         { if (boot) print }' < $1
	exit $?
fi


