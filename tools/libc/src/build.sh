#! /bin/bash

PREFIX=/usr/local

MAKEFLAGS="-sj8"
CFLAGS="-O3 -mllvm -regalloc=greedy -mllvm -pre-RA-sched=list-hybrid -mllvm -tail-dup-size=24"

WAYS="1way 2way 3way 4way"
FPUS="none single double"

function build() {
	for w in $WAYS; do
		for f in $FPUS; do
			export CFLAGS_FOR_TARGET="$CFLAGS -march=lemberg-$w -mfpu=$f"
			./configure --target=lemberg --prefix=$PREFIX || exit 1
			make $MAKEFLAGS TARGET_SUBDIR=$w-$f \
				tooldir="$PREFIX/lemberg/$w-$f" all || exit 1
		done
	done
}

function install() {
	for w in $WAYS; do
		for f in $FPUS; do
			make $MAKEFLAGS TARGET_SUBDIR=$w-$f \
				tooldir="$PREFIX/lemberg/$w-$f" install || exit 1
		done
	done
	ln -sf $PREFIX/lemberg/4way-double/lib $PREFIX/lemberg/lib || exit 1
	ln -sf $PREFIX/lemberg/4way-double/include $PREFIX/lemberg/include || exit 1
}

export AR_FOR_TARGET="ar"
export RANLIB_FOR_TARGET="ranlib"
export AS_FOR_TARGET="lemberg-as"
export CC_FOR_TARGET="clang -target lemberg"
export LD_FOR_TARGET="lemberg-ld"

case $1 in
	build) build ;;
	install) install ;;
	*) echo "Usage: $0 (build|install)"
esac
