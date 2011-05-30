/***************************************************************************
 * This file is part of the Lemberg assembler.
 * Copyright (C) 2011 Wolfgang Puffitsch
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ***************************************************************************/

#include <stdlib.h>
#include <stdio.h>
#include "code.h"
#include "optab.h"
#include "exprs.h"

static int fits_bits(int val, unsigned int bits) {
	return val < 0 ? (val >> (bits-1)) == -1 : (val >> bits) == 0;
}

static void check_bits(int val, unsigned int bits) {
	if (!fits_bits(val, bits)) {
		fprintf(stderr, "error: Value does not fit field size %0x / %d\n", val, bits);
		exit(EXIT_FAILURE);
	}
}

static int is_format_B(unsigned int opcode)
{
	switch (opcode) {
	case OP_ADD: case OP_SUB: case OP_S2ADD: case OP_AND:
	case OP_OR: case OP_XOR: case OP_SL: case OP_SR:
	case OP_SRA: case OP_RL: case OP_MUL: case OP_MASK:
	case OP_CARR: case OP_BORR:
	case OP_CMPEQ: case OP_CMPNE: case OP_CMPLT: case OP_CMPLE:
	case OP_CMPULT: case OP_CMPULE:	case OP_BTEST:
	case OP_CALL: case OP_RET:
	case OP_LDX: case OP_STX:
		return 1;
	default: return 0;
	}
}

static int is_format_I(unsigned int opcode)
{
	switch (opcode) {
	case OP_LDI: case OP_LDIU: case OP_LDIM: case OP_LDIH:
		return 1;
	default: return 0;
	}
}

static int is_format_J(unsigned int opcode)
{
	switch (opcode) {
	case OP_BR:
		return 1;
	default: return 0;
	}
}

static int is_format_L(unsigned int opcode)
{
	switch (opcode) {
	case OP_LDM_B: case OP_LDM_D: case OP_LDM_F:
	case OP_LDM_S: case OP_WB_S:
		return 1;
	default: return 0;
	}
}

static int is_format_S(unsigned int opcode)
{
	switch (opcode) {
	case OP_STM_A: case OP_STMH_A: case OP_STMB_A:
	case OP_STM_S: case OP_STMH_S: case OP_STMB_S:
		return 1;
	default: return 0;
	}
}

static int is_format_G(unsigned int opcode)
{
	switch (opcode) {
	case OP_CALLG: case OP_LDMG_D:
		return 1;
	default: return 0;
	}
}

static int is_format_H(unsigned int opcode)
{
	switch (opcode) {
	case OP_LDGA:
		return 1;
	default: return 0;
	}
}

static int is_format_F(unsigned int opcode)
{
	switch (opcode) {
	case OP_FOP:
		return 1;
	default: return 0;
	}
}

static int is_format_C(unsigned int opcode)
{
	switch (opcode) {
	case OP_COMB:
		return 1;
	default: return 0;
	}
}

static unsigned long conv_format_B(struct asmop op)
{
	unsigned int src2;
	if (op.fmt.B.imm)
		src2 = expr_evaluate(op.fmt.B.src2.imm);
	else
		src2 = op.fmt.B.src2.reg;

	check_bits(op.op, 6);
	check_bits(op.fmt.B.src1, 5);
	check_bits(src2, 5);
	check_bits(op.fmt.B.dest, 5);
	check_bits(op.fmt.B.imm, 1);
	check_bits(op.fmt.B.cond.cond, 1);
	check_bits(op.fmt.B.cond.flag, 2);

	return
		(op.op << 19)
		| (op.fmt.B.src1 << 14)
		| ((src2 & 0x1f) << 9)
		| (op.fmt.B.dest << 4)
		| (op.fmt.B.imm << 3)
		| (op.fmt.B.cond.cond << 2)
		| (op.fmt.B.cond.flag << 0);
}

static unsigned long conv_format_I(struct asmop op)
{
	unsigned int val = expr_evaluate(op.fmt.I.val);

	check_bits(op.op, 6);
	check_bits(op.fmt.I.dest, 5);
	check_bits(val, 11);
	check_bits(op.fmt.I.cond.cond, 1);
	check_bits(op.fmt.I.cond.flag, 2);

	return
		(op.op << 19)
		| (op.fmt.I.dest << 14)
		| ((val & 0x7ff) << 3)
		| (op.fmt.I.cond.cond << 2)
		| (op.fmt.I.cond.flag << 0);
}

static unsigned long conv_format_L(struct asmop op)
{
	unsigned int offset = expr_evaluate(op.fmt.L.offset);

	check_bits(op.op, 6);
	check_bits(op.fmt.L.addr, 5);
	check_bits(offset, 11);
	check_bits(op.fmt.L.cond.cond, 1);
	check_bits(op.fmt.L.cond.flag, 2);

	return
		(op.op << 19)
		| (op.fmt.L.addr << 14)
		| ((offset & 0x7ff) << 3)
		| (op.fmt.L.cond.cond << 2)
		| (op.fmt.L.cond.flag << 0);
}

static unsigned long conv_format_S(struct asmop op)
{
	unsigned int val;
	if (op.fmt.S.imm)
		val = expr_evaluate(op.fmt.S.val.imm);
	else
		val = op.fmt.S.val.reg;

	check_bits(op.op, 6);
	check_bits(op.fmt.S.addr, 5);
	check_bits(val, 5);
	check_bits(op.fmt.S.offset, 5);
	check_bits(op.fmt.S.imm, 1);
	check_bits(op.fmt.S.cond.cond, 1);
	check_bits(op.fmt.S.cond.flag, 2);

	return
		(op.op << 19)
		| (op.fmt.S.addr << 14)
		| ((val & 0x1f) << 9)
		| (op.fmt.S.offset << 4)
		| (op.fmt.S.imm << 3)
		| (op.fmt.S.cond.cond << 2)
		| (op.fmt.S.cond.flag << 0);
}

static unsigned long conv_format_J(struct asmop op)
{
	unsigned int target;
	if (op.fmt.J.imm) {
		target = expr_evaluate(op.fmt.J.target.offset);

		/* special handling to ease identification */
		if (!(fits_bits(target, 15) && fits_bits(-target, 15))) {
			fprintf(stderr, "error: Jump offset too large: ");
			fprintf(stderr, "%08x / %s\n",
					target, op.fmt.J.target.offset.strval);
			exit(EXIT_FAILURE);
		}
	} else {
		check_bits(op.fmt.J.target.reg, 5);
		target = op.fmt.J.target.reg << 10;
	}

	check_bits(op.op, 6);
	check_bits(op.fmt.J.imm, 1);
	check_bits(op.fmt.J.cond.cond, 1);
	check_bits(op.fmt.J.cond.flag, 2);

	return
		(op.op << 19)
		| ((target & 0x7fff) << 4)
		| (op.fmt.J.imm << 3)
		| (op.fmt.J.cond.cond << 2)
		| (op.fmt.J.cond.flag << 0);
}

static unsigned long conv_format_G(struct asmop op)
{
	unsigned int address = expr_evaluate(op.fmt.G.address);

	check_bits(op.op, 6);
	check_bits(address >> 2, 19);

	return
		(op.op << 19)
		| ((address >> 2) & 0x7ffff);
}

static unsigned long conv_format_H(struct asmop op)
{
	unsigned int address = expr_evaluate(op.fmt.H.address);	
	unsigned int dest = (((op.fmt.H.dest & (1 << 4)) >> 2)
						| (op.fmt.H.dest & 0x03));

	check_bits(op.op, 6);
	check_bits(address >> 2, 19);

	return
		(op.op << 19) | (dest << 19)
		| ((address >> 2) & 0x7ffff);
}

static unsigned long conv_format_F(struct asmop op)
{
	check_bits(op.op, 6);
	check_bits(op.fmt.F.dest, 4);
	check_bits(op.fmt.F.src1, 4);
	check_bits(op.fmt.F.src2, 4);
	check_bits(op.fmt.F.op, 4);
	check_bits(op.fmt.F.cond.cond, 1);
	check_bits(op.fmt.F.cond.flag, 2);

	return
		(op.op << 19)
		| (op.fmt.F.dest << 15)
		| (op.fmt.F.src1 << 11)
		| (op.fmt.F.src2 << 7)
		| (op.fmt.F.op   << 3)
		| (op.fmt.F.cond.cond << 2)
		| (op.fmt.F.cond.flag << 0);
}

static unsigned long conv_format_C(struct asmop op)
{
	check_bits(op.op, 6);
	check_bits(op.fmt.C.dest, 2);
	check_bits(op.fmt.C.src1, 2);
	check_bits(op.fmt.C.src2, 2);
	check_bits(op.fmt.C.not1, 1);
	check_bits(op.fmt.C.not2, 1);
	check_bits(op.fmt.C.op, 2);
	check_bits(op.fmt.C.cond.cond, 1);
	check_bits(op.fmt.C.cond.flag, 2);

	return
		(op.op << 19)
		| (op.fmt.C.dest << 15)
		| (op.fmt.C.src1 << 11)
		| (op.fmt.C.src2 << 7)
		| (op.fmt.C.not1 << 6)
		| (op.fmt.C.not2 << 5)
		| (op.fmt.C.op   << 3)
		| (op.fmt.C.cond.cond << 2)
		| (op.fmt.C.cond.flag << 0);
}

unsigned long conv_asmop(struct asmop op)
{
	if (is_format_B(op.op)) {
		return conv_format_B(op);
	} else if (is_format_I(op.op)) {
		return conv_format_I(op);
	} else if (is_format_L(op.op)) {
		return conv_format_L(op);
	} else if (is_format_S(op.op)) {
		return conv_format_S(op);
	} else if (is_format_J(op.op)) {
		return conv_format_J(op);
	} else if (is_format_G(op.op)) {
		return conv_format_G(op);
	} else if (is_format_H(op.op)) {
		return conv_format_H(op);
	} else if (is_format_F(op.op)) {
		return conv_format_F(op);
	} else if (is_format_C(op.op)) {
		return conv_format_C(op);
	} else {
		fprintf(stderr, "error: Wrong instruction format.\n");
		exit(EXIT_FAILURE);
	}
	return 0;
}
