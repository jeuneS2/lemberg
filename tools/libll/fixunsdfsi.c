/* ===-- fixunsdfsi.c - Implement __fixunsdfsi -----------------------------===
 *
 *                     The LLVM Compiler Infrastructure
 *
 * This file is dual licensed under the MIT and the University of Illinois Open
 * Source Licenses. See LICENSE.TXT for details.
 *
 * ===----------------------------------------------------------------------===
 *
 * This file implements __fixunsdfsi for the compiler_rt library.
 *
 * ===----------------------------------------------------------------------===
 */

#define DOUBLE_PRECISION
#include "fp_lib.h"

/* Returns: convert a to a unsigned int, rounding toward zero.
 *          Negative values all become zero.
 */

unsigned __fixunsdfsi(double a)
{
    // Break a into sign, exponent, significand
    const rep_t aRep = toRep(a);
    const rep_t aAbs = aRep & absMask;
    const int sign = aRep & signBit ? -1 : 1;
    const int exponent = (aAbs >> significandBits) - exponentBias;
    const rep_t significand = (aAbs & significandMask) | implicitBit;

	// If negative, the result is zero
	if (sign < 0)
		return 0;

    // If 0 < exponent < significandBits, right shift to get the result.
    else if ((unsigned int)exponent < significandBits) {
        return significand >> (significandBits - exponent);
    }

    // If exponent is negative, the result is zero.
    else if (exponent < 0) {
        return 0;
    }

    // If significandBits < exponent, left shift to get the result.  This shift
    // may end up being larger than the type width, which incurs undefined
    // behavior, but the conversion itself is undefined in that case, so
    // whatever the compiler decides to do is fine.
    else {
        return significand << (exponent - significandBits);
    }
}
