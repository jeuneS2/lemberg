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

#ifndef _OPTAB_H_
#define _OPTAB_H_

/* Core operations */

#define OP_ADD       0x00
#define OP_SUB       0x01
#define OP_ADDI      0x02
#define OP_S1ADD     0x03
#define OP_S2ADD     0x04
#define OP_AND       0x05
#define OP_OR        0x06
#define OP_XOR       0x07
#define OP_SL        0x08
#define OP_SR        0x09
#define OP_SRA       0x0A
#define OP_RL        0x0B
#define OP_MUL       0x0C
#define OP_CARR      0x0D
#define OP_BORR      0x0E
#define OP_BBH       0x0F

#define OP_CMP       0x14
#define OP_CMPU      0x15
#define OP_BTEST     0x16
#define OP_COMB      0x17

#define OP_LDI       0x18
#define OP_LDIU      0x19
#define OP_LDIM      0x1A
#define OP_LDIH      0x1B

#define OP_BR        0x1C
#define OP_BRZ       0x1D
#define OP_JOP       0x1E
#define OP_CALLG     0x1F

#define OP_STM_A     0x20
#define OP_STMH_A    0x21
#define OP_STMB_A    0x22
#define OP_STM_S     0x23
#define OP_STMH_S    0x24
#define OP_STMB_S    0x25

#define OP_LDM_B     0x26
#define OP_LDM_D     0x27
#define OP_LDM_F     0x28
#define OP_LDM_S     0x29
#define OP_LDMG_D    0x2A
#define OP_LDMR_F    0x2B

#define OP_LDX       0x2C
#define OP_STX       0x2D
#define OP_FOP       0x2E
#define OP_WB_S      0x2F

#define OP_LDGA      0x30

/* bit/byte/halfword sub-operations */
#define OP_SEXT8     0x00
#define OP_SEXT16    0x01
#define OP_ZEXT8     0x02
#define OP_ZEXT16    0x03

#define OP_CLZ       0x04
#define OP_CTZ       0x05
#define OP_POP       0x06
#define OP_PAR       0x07

#define OP_MSEXT8    0x08
#define OP_MSEXT16   0x09
#define OP_MZEXT8    0x0A
#define OP_MZEXT16   0x0B

/* branch compare zero sub-operations */
#define OP_EQ        0x00
#define OP_NE        0x01
#define OP_LT        0x02
#define OP_GE        0x03
#define OP_LE        0x04
#define OP_GT        0x05

/* jump operations */
#define OP_BRIND     0x00
#define OP_CALL      0x01
#define OP_RET       0x02
#define OP_IRET      0x03

/* Floating-point operations */
#define OP_FADD      0x00
#define OP_FSUB      0x01
#define OP_FMUL      0x02
#define OP_FMAC      0x03

#define OP_DADD      0x04
#define OP_DSUB      0x05
#define OP_DMUL      0x06
#define OP_DMAC      0x07

#define OP_FCMP      0x08
#define OP_DCMP      0x09

#define OP_FSUBOP    0x0F

/* Floating-point sub-operations */
#define OP_FMOV      0x00
#define OP_FNEG      0x01
#define OP_FABS      0x02
#define OP_FZERO     (0x03 | (OP_FPIMM_ZERO << 4))
#define OP_FHALF     (0x03 | (OP_FPIMM_HALF << 4))
#define OP_FONE      (0x03 | (OP_FPIMM_ONE << 4))
#define OP_FTWO      (0x03 | (OP_FPIMM_TWO << 4))
#define OP_FNAN      (0x03 | (OP_FPIMM_NAN << 4))

#define OP_DMOV      0x04
#define OP_DNEG      0x05
#define OP_DABS      0x06
#define OP_DZERO     (0x07 | (OP_FPIMM_ZERO << 4))
#define OP_DHALF     (0x07 | (OP_FPIMM_HALF << 4))
#define OP_DONE      (0x07 | (OP_FPIMM_ONE << 4))
#define OP_DTWO      (0x07 | (OP_FPIMM_TWO << 4))
#define OP_DNAN      (0x07 | (OP_FPIMM_NAN << 4))

#define OP_RND       0x08
#define OP_EXT       0x09
#define OP_SI2SF     0x0A
#define OP_SI2DF     0x0B
#define OP_SF2SI     0x0C
#define OP_DF2SI     0x0D

/* Floating-point immediates encoding */
#define OP_FPIMM_ZERO 0x00
#define OP_FPIMM_HALF 0x01
#define OP_FPIMM_ONE  0x02
#define OP_FPIMM_TWO  0x03
#define OP_FPIMM_NAN  0xff

#endif
