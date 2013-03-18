#! /bin/bash

BASE=`pwd`/`dirname $0`

cp $1 $BASE/hw/sim/mem_main.dat
cd $BASE/hw/sim
./sim.sh -nox |
if [ x"$2" = x"RAW" ]; then
    # raw output
	cat
else
    # filtered output with timeout
	$BASE/timeout3 -t 300 awk '
         /^# LINE .*/ { print substr($0, index($0, $3)) }
         /^# EXIT -?[0-9]+$/ { exit strtonum($3) }'
fi
