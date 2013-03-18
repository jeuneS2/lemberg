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

%option nounput

%{
#include <string.h>

#include "files.h"
#include "optab.h"
#include "code.h"

#include "y.tab.h"

int fileno(FILE *stream);

extern int line_number;

#define ACCEPT(X, TYPE) \
do { \
	yylval.opcode = OP_ ## X; \
	return TYPE; \
} while(0)

%}

STRING "\""([[:print:]]|\\b|\\f|\\n|\\r|\\t|\\\\|\\[0-7]{3})*"\""
SYM [\._a-zA-Z0-9]+

%%

".file"\t\".*\"\n { line_number++; /* ignore .file directive */ }

".text"\n { line_number++; /* ignore .text directive */ }
".data"\n { line_number++; /* ignore .data directive */ }
".bss"\n { line_number++; /* ignore .bss directive */ }
".section".*\n { line_number++; /* ignore .section directive */ }

".globl".*\n { line_number++; /* ignore .globl directive */ }
".local".*\n { line_number++; /* ignore .local directive */ }
".weak".*\n { line_number++; /* ignore .weak directive */ }

".stabs".*\n { line_number++; /* ignore .stabs directive */ }

".size".*\n { line_number++; /* ignore .size directive */ }
".type".* return TYPE;

".align" return ALIGN;
".funsz" return SIZE;
".quad" return QUAD;
".long" return LONG;
".short" return SHORT;
".byte" return BYTE;
".ascii" return ASCII;
".comm" return COMM;

"nop" return NOP;

"add"      ACCEPT(ADD,   THREEOP);
"sub"      ACCEPT(SUB,   THREEOP);
"addi"     ACCEPT(ADDI,  LDIOP);
"s1add"    ACCEPT(S1ADD, THREEOP);
"s2add"    ACCEPT(S2ADD, THREEOP);
"and"      ACCEPT(AND,   THREEOP);
"or"       ACCEPT(OR,    THREEOP);
"xor"      ACCEPT(XOR,   THREEOP);
"sl"       ACCEPT(SL,    THREEOP);
"sr"       ACCEPT(SR,    THREEOP);
"sra"      ACCEPT(SRA,   THREEOP);
"rl"       ACCEPT(RL,    THREEOP);
"mul"      ACCEPT(MUL,   MULOP);
"carr"     ACCEPT(CARR,  THREEOP);
"borr"     ACCEPT(BORR,  THREEOP);
"bbh"      ACCEPT(BBH,   BBHOP);

"cmp"      ACCEPT(CMP,   CMPOP);
"cmpu"     ACCEPT(CMPU,  CMPOP);
"btest"    ACCEPT(BTEST, BTESTOP);
"comb"     ACCEPT(COMB,  CCOP);

"ldi"      ACCEPT(LDI,  LDIOP);
"ldiu"     ACCEPT(LDIU, LDIOP);
"ldim"     ACCEPT(LDIM, LDIOP);
"ldih"     ACCEPT(LDIH, LDIOP);

"br"       ACCEPT(BR,    BRANCHOP);
"brz"      ACCEPT(BRZ,   BRANCHZOP);
"jop"      ACCEPT(JOP,   JOP);
"callg"    ACCEPT(CALLG, GLOBOP);

"brind"    ACCEPT(BRIND, JSUBOP);
"call"     ACCEPT(CALL,  JSUBOP);
"ret"      ACCEPT(RET,   JSUBOP);

"stm.a"    ACCEPT(STM_A,  STOREOP);
"stmh.a"   ACCEPT(STMH_A, STOREOP);
"stmb.a"   ACCEPT(STMB_A, STOREOP);
"stm.s"    ACCEPT(STM_S,  STOREOP);
"stmh.s"   ACCEPT(STMH_S, STOREOP);
"stmb.s"   ACCEPT(STMB_S, STOREOP);

"wb.s"     ACCEPT(WB_S, WBOP);

"ldm.b"    ACCEPT(LDM_B, LOADOP);
"ldm.d"    ACCEPT(LDM_D, LOADOP);
"ldm.f"    ACCEPT(LDM_F, LOADOP);
"ldm.s"    ACCEPT(LDM_S, LOADOP);
"ldmg.d"   ACCEPT(LDMG_D, GLOBOP);
"ldmr.f"   ACCEPT(LDMR_F, STOREOP);

"ldx"      ACCEPT(LDX,  LDXOP);
"stx"      ACCEPT(STX,  STXOP);
"fop"      ACCEPT(FOP,  FOP);

"ldga"     ACCEPT(LDGA, LDGAOP);

"sext8"    ACCEPT(SEXT8,  BBHSUBOP);
"sext16"   ACCEPT(SEXT16, BBHSUBOP);
"zext8"    ACCEPT(ZEXT8,  BBHSUBOP);
"zext16"   ACCEPT(ZEXT16, BBHSUBOP);
"clz"      ACCEPT(CLZ,    BBHSUBOP);
"ctz"      ACCEPT(CTZ,    BBHSUBOP);
"pop"      ACCEPT(POP,    BBHSUBOP);
"par"      ACCEPT(PAR,    BBHSUBOP);
"msext8"   ACCEPT(MSEXT8,  BBHSUBOP);
"msext16"  ACCEPT(MSEXT16, BBHSUBOP);
"mzext8"   ACCEPT(MZEXT8,  BBHSUBOP);
"mzext16"  ACCEPT(MZEXT16, BBHSUBOP);

"eq"       ACCEPT(EQ,    CMPSUBOP);
"ne"       ACCEPT(NE,    CMPSUBOP);
"lt"       ACCEPT(LT,    CMPSUBOP);
"ge"       ACCEPT(GE,    CMPSUBOP);
"gt"       ACCEPT(GT,    CMPSUBOP);
"le"       ACCEPT(LE,    CMPSUBOP);

"fadd"     ACCEPT(FADD,  FTHREEOP);
"fsub"     ACCEPT(FSUB,  FTHREEOP);
"fmul"     ACCEPT(FMUL,  FTHREEOP);
"fmac"     ACCEPT(FMAC,  FTHREEOP);

"dadd"     ACCEPT(DADD,  DTHREEOP);
"dsub"     ACCEPT(DSUB,  DTHREEOP);
"dmul"     ACCEPT(DMUL,  DTHREEOP);
"dmac"     ACCEPT(DMAC,  DTHREEOP);

"fcmp"     ACCEPT(FCMP,  FCMPOP);
"dcmp"     ACCEPT(DCMP,  DCMPOP);

"fmov"     ACCEPT(FMOV,  FTWOOP);
"fneg"     ACCEPT(FNEG,  FTWOOP);
"fabs"     ACCEPT(FABS,  FTWOOP);
"fzero"    ACCEPT(FZERO, FONEOP);
"fhalf"    ACCEPT(FHALF, FONEOP);
"fone"     ACCEPT(FONE,  FONEOP);
"ftwo "    ACCEPT(FTWO,  FONEOP);
"fnan "    ACCEPT(FNAN,  FONEOP);

"dmov"     ACCEPT(DMOV,  DTWOOP);
"dneg"     ACCEPT(DNEG,  DTWOOP);
"dabs"     ACCEPT(DABS,  DTWOOP);
"dzero"    ACCEPT(DZERO, DONEOP);
"dhalf"    ACCEPT(DHALF, DONEOP);
"done"     ACCEPT(DONE,  DONEOP);
"dtwo "    ACCEPT(DTWO,  DONEOP);
"dnan "    ACCEPT(DNAN,  DONEOP);

"rnd"      ACCEPT(RND,   D2FOP);
"ext"      ACCEPT(EXT,   F2DOP);
"si2sf"    ACCEPT(SI2SF, FTWOOP);
"si2df"    ACCEPT(SI2DF, F2DOP);
"sf2si"    ACCEPT(SF2SI, FTWOOP);
"df2si"    ACCEPT(DF2SI, D2FOP);

"if"  return IF;
":"   return ':';
","   return ',';
"->"  return DEST;
"!"   return '!';
";;"  return BSEP;
"\n"  { line_number++; return '\n'; }
"@"   return '@';

#[0-9]: {
	yylval.intval = strtoll(yytext+1, NULL, 10);
	return CLUST;
  }

c[0-9] {
	yylval.intval = strtoll(yytext+1, NULL, 10);
	return FLAG;
  }

r[0-9]+\.[0-9]+ {
	yylval.intval = strtoll(strchr(yytext, '.')+1, NULL, 10);
	return REG;
  }

r[0-9]+ {
	yylval.intval = strtoll(yytext+1, NULL, 10);
	return REG;
  }

f[0-9]+ {
	yylval.intval = strtoll(yytext+1, NULL, 10);
	return FREG;
  }

d[0-9]+ {
	yylval.intval = 2*strtoll(yytext+1, NULL, 10);
	return DREG;
  }

$mul[0-9]\.0 {
	yylval.intval = 4;
	return EXT;
  }

$mul[0-9]\.1 {
	yylval.intval = 5;
	return EXT;
  }

$rb {
	yylval.intval = 6;
	return EXT;
  }

$ro {
	yylval.intval = 7;
	return EXT;
  }

$ba {
	yylval.intval = 8;
	return EXT;
  }

$c[0-9] {
	yylval.intval = yytext[2]-'0';
	return EXT;
  }

$f[0-9]+ {
	yylval.intval = 16+strtoll(yytext+2, NULL, 10);
	return EXT;
  }

(lo11|mi10|hi11)\{\ {SYM}\ \} {
	/* recognize bit extraction from symbols */
	yylval.exprval = NULL_EXPR;
	yylval.exprval.strval = malloc(strlen(yytext)+1);
	strcpy(yylval.exprval.strval, yytext);
	return EXPR;
  }

(lo11|mi10|hi11)\{\ {SYM}-{SYM}\ \} {
	/* recognize bit extraction from symbols */
	yylval.exprval = NULL_EXPR;
	yylval.exprval.strval = malloc(strlen(yytext)+1);
	strcpy(yylval.exprval.strval, yytext);
	return EXPR;
  }

{SYM}@{SYM} {
	/* recognize '@' for the difference of two symbols */
	yylval.exprval = NULL_EXPR;
	yylval.exprval.strval = malloc(strlen(yytext)+1);
	strcpy(yylval.exprval.strval, yytext);
	*strchr(yylval.exprval.strval, '@') = '-';
	return EXPR;
  }

{SYM}\+((-?0[0-7]*)|(-?[1-9][0-9]*)|(-?0x[0-9a-fA-F]+)) {
	/* recognize symbol plus offset */
	yylval.exprval = NULL_EXPR;
	yylval.exprval.strval = malloc(strlen(yytext)+1);
	strcpy(yylval.exprval.strval, yytext);
	return EXPR;
  }

{STRING} {
	yylval.strval = malloc(strlen(yytext));
	strcpy(yylval.strval, yytext+1);
	yylval.strval[strlen(yytext)-2] = '\0';
	return STR;
  }

((-?0[0-7]*)|(-?[1-9][0-9]*)|(-?0x[0-9a-fA-F]+)) {
	yylval.exprval = NULL_EXPR;
	yylval.exprval.intval = strtoll(yytext, NULL, 0);
	return NUM;
  }

{SYM} {
	yylval.exprval = NULL_EXPR;
	yylval.exprval.strval = malloc(strlen(yytext)+1);
	strcpy(yylval.exprval.strval, yytext);
	return SYM;
  }

(" "|"\r"|"\t")+ { /* ignore whitespace */ }

;[^;].* { /* ignore comments */ }

<<EOF>>  { /* allow multiple input files */
    if (*++infiles)
		if (strcmp(*infiles, "-") != 0) {
			yyin = fopen(*infiles, "r");
			if (yyin == NULL) {
				fprintf(stderr, "error: %s\n", strerror(errno));
				exit(EXIT_FAILURE);
			}
		} else {
			yyin = stdin;
		}
	else
		yyterminate();
  }

. { fprintf(stderr, "error: Invalid input: `%c'", yytext[0]); }

%%
