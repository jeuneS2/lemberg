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
#include "elflemberg.h"
#include "errors.h"
#include "exprs.h"
#include "optab.h"
#include "symtab.h"

static int fits_bits(int val, unsigned int bits) {
	return val < 0 ? (val >> (bits-1)) == -1 : (val >> bits) == 0;
}

static void check_bits(int val, unsigned int bits) {
	if (!fits_bits(val, bits)) {
		eprintf("Value does not fit field size %0x / %d", val, bits);
		exit(EXIT_FAILURE);
	}
}

static unsigned int force_eval(struct expr e) {
  struct reloc_info reloc = expr_evaluate(e);
  if (reloc.symbol != NULL)
	{
	  eprintf("Relocation invalid for format");
	  exit(EXIT_FAILURE);
	}
  return reloc.intval;
}

static int is_format_B(unsigned int opcode)
{
	switch (opcode) {
	case OP_ADD: case OP_SUB: case OP_S1ADD: case OP_S2ADD:
	case OP_AND: case OP_OR: case OP_XOR:
	case OP_SL: case OP_SR: case OP_SRA: case OP_RL:
	case OP_MUL: case OP_BBH:
	case OP_CARR: case OP_BORR:
	case OP_BTEST:
	case OP_JOP:
	case OP_LDX: case OP_STX:
		return 1;
	default: return 0;
	}
}

static int is_format_C(unsigned int opcode)
{
	switch (opcode) {
	case OP_CMP: case OP_CMPU:
		return 1;
	default: return 0;
	}
}	  

static int is_format_I(unsigned int opcode)
{
	switch (opcode) {
	case OP_ADDI:
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

static int is_format_Z(unsigned int opcode)
{
	switch (opcode) {
	case OP_BRZ:
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
	case OP_LDMR_F:
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

static int is_format_X(unsigned int opcode)
{
	switch (opcode) {
	case OP_COMB:
		return 1;
	default: return 0;
	}
}

static unsigned long conv_format_B(struct asmop op, const char *sect, unsigned long pos)
{
	unsigned int src2;
	if (op.fmt.B.imm)
	  src2 = force_eval(op.fmt.B.src2.imm);
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

static unsigned long conv_format_C(struct asmop op, const char *sect, unsigned long pos)
{
	unsigned int src2;
	if (op.fmt.C.imm)
	  src2 = force_eval(op.fmt.C.src2.imm);
	else
	  src2 = op.fmt.C.src2.reg;

	check_bits(op.op, 6);
	check_bits(op.fmt.C.src1, 5);
	check_bits(src2, 5);
	check_bits(op.fmt.C.dest, 2);
	check_bits(op.fmt.C.op, 3);
	check_bits(op.fmt.C.imm, 1);
	check_bits(op.fmt.C.cond.cond, 1);
	check_bits(op.fmt.C.cond.flag, 2);

	return
		(op.op << 19)
		| (op.fmt.C.src1 << 14)
		| ((src2 & 0x1f) << 9)
		| (op.fmt.C.dest << 7)
		| (op.fmt.C.op << 4)
		| (op.fmt.C.imm << 3)
		| (op.fmt.C.cond.cond << 2)
		| (op.fmt.C.cond.flag << 0);
}

static unsigned long conv_format_I(struct asmop op, const char *sect, unsigned long pos)
{
    unsigned int val;

	struct reloc_info reloc = expr_evaluate(op.fmt.I.val);
	sym_addreloc(reloc.symbol, sect, pos, merge_relocs(reloc.type, R_LEMBERG_XX11));
	val = reloc.intval;

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

static unsigned long conv_format_L(struct asmop op, const char *sect, unsigned long pos)
{
    unsigned int offset;

	struct reloc_info reloc = expr_evaluate(op.fmt.L.offset);
	sym_addreloc(reloc.symbol, sect, pos, merge_relocs(reloc.type, R_LEMBERG_XX11));
	offset = reloc.intval;

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

static unsigned long conv_format_S(struct asmop op, const char *sect, unsigned long pos)
{
	unsigned int val;
	if (op.fmt.S.imm)
	  val = force_eval(op.fmt.S.val.imm);
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

static unsigned long conv_format_J(struct asmop op, const char *sect, unsigned long pos)
{
    unsigned int target = force_eval(op.fmt.J.target);

	/* special handling to ease identification */
	if (!(fits_bits(target, 15) && fits_bits(-target, 15))) {
		eprintf("Branch offset too large: %08x / %s",
				target, op.fmt.J.target.strval);
		exit(EXIT_FAILURE);
	}

	check_bits(op.op, 6);
	check_bits(op.fmt.J.delayed, 1);
	check_bits(op.fmt.J.cond.cond, 1);
	check_bits(op.fmt.J.cond.flag, 2);

	return
		(op.op << 19)
		| ((target & 0x7fff) << 4)
		| (op.fmt.J.delayed << 3)
		| (op.fmt.J.cond.cond << 2)
		| (op.fmt.J.cond.flag << 0);
}

static unsigned long conv_format_Z(struct asmop op, const char *sect, unsigned long pos)
{
    unsigned int target = force_eval(op.fmt.Z.target);

	/* special handling to ease identification */
	if (!(fits_bits(target, 10) && fits_bits(-target, 10))) {
		eprintf("Branch offset too large: %08x / %s",
				target, op.fmt.Z.target.strval);
		exit(EXIT_FAILURE);
	}

	check_bits(op.op, 6);
	check_bits(op.fmt.Z.reg, 5);
	check_bits(op.fmt.Z.delayed, 1);
	check_bits(op.fmt.Z.op, 3);

	return
		(op.op << 19)
		| (op.fmt.Z.reg << 14)
		| ((target & 0x3ff) << 4)
		| (op.fmt.Z.delayed << 3)
		| (op.fmt.Z.op);
}

static unsigned long conv_format_G(struct asmop op, const char *sect, unsigned long pos)
{
    unsigned int address;
	struct reloc_info reloc = expr_evaluate(op.fmt.G.address);
	sym_addreloc(reloc.symbol, sect, pos, merge_relocs(reloc.type, R_LEMBERG_19S2));
	address = reloc.intval;

	check_bits(op.op, 6);
	check_bits(address >> 2, 19);

	return
		(op.op << 19)
		| ((address >> 2) & 0x7ffff);
}

static unsigned long conv_format_H(struct asmop op, const char *sect, unsigned long pos)
{
	unsigned int dest = (((op.fmt.H.dest & (1 << 4)) >> 2)
						| (op.fmt.H.dest & 0x03));

    unsigned int address;
	struct reloc_info reloc = expr_evaluate(op.fmt.H.address);
	sym_addreloc(reloc.symbol, sect, pos, merge_relocs(reloc.type, R_LEMBERG_19S2));
	address = reloc.intval;

	check_bits(op.op, 6);
	check_bits(address >> 2, 19);

	return
		(op.op << 19) | (dest << 19)
		| ((address >> 2) & 0x7ffff);
}

static unsigned long conv_format_F(struct asmop op, const char *sect, unsigned long pos)
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

static unsigned long conv_format_X(struct asmop op, const char *sect, unsigned long pos)
{
	check_bits(op.op, 6);
	check_bits(op.fmt.X.dest, 2);
	check_bits(op.fmt.X.src1, 2);
	check_bits(op.fmt.X.src2, 2);
	check_bits(op.fmt.X.not1, 1);
	check_bits(op.fmt.X.not2, 1);
	check_bits(op.fmt.X.op, 2);
	check_bits(op.fmt.X.cond.cond, 1);
	check_bits(op.fmt.X.cond.flag, 2);

	return
		(op.op << 19)
		| (op.fmt.X.dest << 15)
		| (op.fmt.X.src1 << 11)
		| (op.fmt.X.src2 << 7)
		| (op.fmt.X.not1 << 6)
		| (op.fmt.X.not2 << 5)
		| (op.fmt.X.op   << 3)
		| (op.fmt.X.cond.cond << 2)
		| (op.fmt.X.cond.flag << 0);
}

unsigned long conv_asmop(struct asmop op, const char *sect, unsigned long pos)
{
	if (is_format_B(op.op)) {
	  return conv_format_B(op, sect, pos);
	} else if (is_format_C(op.op)) {
	  return conv_format_C(op, sect, pos);
	} else if (is_format_I(op.op)) {
	  return conv_format_I(op, sect, pos);
	} else if (is_format_L(op.op)) {
	  return conv_format_L(op, sect, pos);
	} else if (is_format_S(op.op)) {
	  return conv_format_S(op, sect, pos);
	} else if (is_format_J(op.op)) {
	  return conv_format_J(op, sect, pos);
	} else if (is_format_Z(op.op)) {
	  return conv_format_Z(op, sect, pos);
	} else if (is_format_G(op.op)) {
	  return conv_format_G(op, sect, pos);
	} else if (is_format_H(op.op)) {
	  return conv_format_H(op, sect, pos);
	} else if (is_format_F(op.op)) {
	  return conv_format_F(op, sect, pos);
	} else if (is_format_X(op.op)) {
	  return conv_format_X(op, sect, pos);
	} else {
	    eprintf("Wrong instruction format.");
		exit(EXIT_FAILURE);
	}
	return 0;
}
