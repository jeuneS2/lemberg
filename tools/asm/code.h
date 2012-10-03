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

#ifndef _CODE_H_
#define _CODE_H_

#define CLUSTERS 4
#define OP_BITS 6
#define FLAG_BITS 2
#define REG_BITS 5

#define CMPOP_BITS 3

#define FOP_BITS 4
#define FREG_BITS 4

#define CCOP_BITS 2

#define COND_TRUE  0x1
#define COND_FALSE 0x0

#include "exprs.h"

struct cond {
	unsigned int cond : 1;
	unsigned int flag : FLAG_BITS;
};

struct asmop {
	unsigned int op : OP_BITS;
	union {
		struct {
			unsigned int src1 : REG_BITS;
			union {
				unsigned int reg : REG_BITS;
				struct expr imm;
			} src2;
			unsigned int dest : REG_BITS;
			unsigned int imm : 1;
			struct cond cond;
		} B;
		struct {
			unsigned int src1 : REG_BITS;
			union {
				unsigned int reg : REG_BITS;
				struct expr imm;
			} src2;
			unsigned int dest : FLAG_BITS;
   		    unsigned int op : CMPOP_BITS;
			unsigned int imm : 1;
			struct cond cond;
		} C;
		struct {
			unsigned int dest : REG_BITS;
			struct expr val;
			struct cond cond;
		} I;
		struct {
			unsigned int addr : REG_BITS;
			struct expr offset;
			struct cond cond;
		} L;
		struct {
			unsigned int addr : REG_BITS;
			union {
				unsigned int reg : REG_BITS;
				struct expr imm;
			} val;
			unsigned int offset : REG_BITS;
			unsigned int imm : 1;
			struct cond cond;
		} S;
		struct {
			struct expr target;
			unsigned int delayed : 1;
			struct cond cond;
		} J;
		struct {
			unsigned int reg : REG_BITS;
			struct expr target;
			unsigned int delayed : 1;
			unsigned int op : CMPOP_BITS;
		} Z;
		struct {
			struct expr address;
		} G;
		struct {
			unsigned int dest : REG_BITS;
			struct expr address;
		} H;
		struct {
			unsigned int dest : FREG_BITS;
			unsigned int src1 : FREG_BITS;
			unsigned int src2 : FREG_BITS;
			unsigned int op   : FOP_BITS;
			struct cond cond;
		} F;
		struct {
			unsigned int dest : FLAG_BITS;
			unsigned int src1 : FLAG_BITS;
			unsigned int src2 : FLAG_BITS;
			unsigned int not1 : 1;
			unsigned int not2 : 1;
			unsigned int op   : CCOP_BITS;
			struct cond cond;
		} X;
	} fmt;
};

struct op {
	unsigned int clust;
	struct asmop op;
};

#define TYPE_RAW -1
#define TYPE_SIZE -2
#define TYPE_ALIGN -3

struct bundle {
	int type;
	int size;
	struct op op [CLUSTERS];
	struct expr raw;
};

unsigned long conv_asmop(struct asmop);

#endif
