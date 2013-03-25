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

%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <stdarg.h>
	#include <string.h>
	#include <errno.h>
	#include <getopt.h>

	#include "files.h"
	#include "code.h"
	#include "exprs.h"
	#include "symtab.h"
	#include "optab.h"
	#include "vhdstrings.h"

	extern FILE* yyin;
	int yylex(void);
	void yyerror(const char *);	

	int line_number = 1;
	long pos = 0;
	long code_size = 0;
	struct bundle *code;

	char **infiles;
	FILE *datafile;
	FILE *symfile;
	char *vhdname;

	static void emit_bundle(struct bundle);
	static void emit_string(const char *);
	static void fix_offset(struct asmop*);

/* 	yydebug = 1; */
%}

%union {
	int           opcode;
	long long     intval;
	char *        strval;
	struct expr   exprval;
	struct cond   cond;
	struct asmop  asmop;
	struct op     op;
	struct bundle bundle;
}

%token IF DEST BSEP ALIGN TYPE SIZE QUAD LONG SHORT BYTE ASCII COMM

%token <intval>  CLUST FLAG REG EXT FREG DREG
%token <strval>  STR
%token <exprval> NUM EXPR SYM
%token <opcode>  NOP THREEOP ONEOP NULLOP LDIOP WBOP
                 CMPOP CMPSUBOP BTESTOP CCOP
                 BRANCHOP BRANCHZOP JOP JSUBOP
                 GLOBOP LDGAOP STOREOP LOADOP LDXOP STXOP
                 MULOP BBHOP BBHSUBOP
                 FOP FTHREEOP FCMPOP FTWOOP FONEOP F2DOP
                 DTHREEOP DCMPOP DTWOOP DONEOP D2FOP

%type <intval>   NotOptFlag
%type <intval>   DelayOpt
%type <exprval>  Constant
%type <cond>     Condition
%type <asmop>    AsmOp
%type <op>       Operation
%type <bundle>   Bundle Directive

%start Input

%%

Input : Input Bundle
	  {
		  emit_bundle($2);
	  }
      | Input Label
	  | Input Directive
	  {
		  emit_bundle($2);
	  }
      | LFOpt
;

LFOpt : NewLine BSep | NewLine | /* empty */
;

BSep : BSEP NewLine
     | BSep BSEP NewLine
;

Label: SYM ':' LFOpt
      {
		  push_sym($1.strval, pos);
      }
;

Directive : ALIGN NUM NewLine
          {
			  int align = $2.intval;
			  $$.type = TYPE_ALIGN;
			  $$.size = pos % align == 0 ? 0 : align - pos % align;
			  $$.raw = NULL_EXPR;
			  pos = ((pos+align-1) / align) * align;
		  }
          | TYPE NewLine
		  {
			  $$.type = TYPE_ALIGN;
			  $$.size = pos % 4 == 0 ? 0 : 4 - pos % 4;
			  $$.raw = NULL_EXPR;
			  pos = ((pos+4-1) / 4) * 4;
		  }
          | SIZE Constant NewLine
		  {
			  $$.type = TYPE_SIZE;
			  $$.size = 4;
			  $$.raw = $2;
			  pos += 4;
		  }
          | QUAD Constant NewLine
		  {
			  $$.type = TYPE_RAW;
			  $$.size = 8;
			  $$.raw = $2;
			  pos += 8;
		  }
          | LONG Constant NewLine
		  {
			  $$.type = TYPE_RAW;
			  $$.size = 4;
			  $$.raw = $2;
			  pos += 4;
		  }
          | SHORT Constant NewLine
		  {
			  $$.type = TYPE_RAW;
			  $$.size = 2;
			  $$.raw = $2;
			  pos += 2;
		  }
          | BYTE Constant NewLine
		  {
			  $$.type = TYPE_RAW;
			  $$.size = 1;
			  $$.raw = $2;
			  pos += 1;
		  }
          | ASCII STR NewLine
		  {
			  emit_string($2);
			  $$.type = TYPE_RAW;
			  $$.size = 0;
			  $$.raw = NULL_EXPR;
		  }
          | COMM SYM ',' NUM ',' NUM NewLine
          {
			  int align = $6.intval;
			  $$.type = TYPE_RAW;
			  $$.size = pos % align == 0 ? 0 : align - pos % align;
			  $$.raw = NULL_EXPR;
			  pos = ((pos+align-1) / align) * align;			  

			  push_sym($2.strval, pos);
			  $$.size += $4.intval;
			  pos += $4.intval;
		  }
;

Bundle : NOP NewLine BSep
       {
		   pos += 1;

		   $$.type = 0;
		   $$.size = 1;
		   $$.raw = NULL_EXPR;
       }
       | Operation BSep
       {
		   pos += 4;
		   fix_offset(&($1.op));

		   $$.type = (1 << $1.clust);
		   $$.size = 4;
		   $$.op[$1.clust] = $1;
       }
       | Operation Operation BSep
       {
		   if ($1.clust == $2.clust) {
			   yyerror("Cluster specified more than once in a bundle\n");
		   }

		   pos += 7;
		   fix_offset(&($1.op));
		   fix_offset(&($2.op));

		   $$.type = (1 << $1.clust) | (1 << $2.clust);
		   $$.size = 7;
		   $$.op[$1.clust] = $1;
		   $$.op[$2.clust] = $2;
       }
       | Operation Operation Operation BSep
       {
		   if ($1.clust == $2.clust
			   || $1.clust == $3.clust
			   || $2.clust == $3.clust) {
			   yyerror("Cluster specified more than once in a bundle\n");
		   }

		   pos += 10;
		   fix_offset(&($1.op));
		   fix_offset(&($2.op));
		   fix_offset(&($3.op));

		   $$.type = (1 << $1.clust) | (1 << $2.clust) | (1 << $3.clust);
		   $$.size = 10;
		   $$.op[$1.clust] = $1;
		   $$.op[$2.clust] = $2;
		   $$.op[$3.clust] = $3;
       }
       | Operation Operation Operation Operation BSep
       {
		   if ($1.clust == $2.clust
			   || $1.clust == $3.clust
			   || $1.clust == $4.clust
			   || $2.clust == $3.clust
			   || $2.clust == $4.clust
			   || $3.clust == $4.clust) {
			   yyerror("Cluster specified more than once in a bundle\n");
		   }

		   pos += 13;
		   fix_offset(&($1.op));
		   fix_offset(&($2.op));
		   fix_offset(&($3.op));
		   fix_offset(&($4.op));

		   $$.type = (1 << $1.clust) | (1 << $2.clust) | (1 << $3.clust) | (1 << $4.clust);
		   $$.size = 13;
		   $$.op[$1.clust] = $1;
		   $$.op[$2.clust] = $2;
		   $$.op[$3.clust] = $3;
		   $$.op[$4.clust] = $4;
       }
;

Operation : CLUST AsmOp NewLine
		  {
			  $$.clust = $1;
			  $$.op = $2;
		  }
;

Condition : IF FLAG
		  {
			  $$.cond = COND_TRUE;
			  $$.flag = $2;
		  }
          | IF '!' FLAG
		  {
			  $$.cond = COND_FALSE;
			  $$.flag = $3;
		  }
		  | /* empty */
		  {
			  $$.cond = COND_TRUE; /* "if c0" is implicit */
			  $$.flag = 0;
		  }
;

AsmOp : Condition THREEOP REG ',' Constant DEST REG
      {
		  $$.op = $2;
		  $$.fmt.B.src1 = $3;
		  $$.fmt.B.src2.imm = $5;
		  $$.fmt.B.dest = $7;
		  $$.fmt.B.imm = 1;
		  $$.fmt.B.cond = $1;
      }
      | Condition THREEOP REG ',' REG DEST REG
      {
		  $$.op = $2;
		  $$.fmt.B.src1 = $3;
		  $$.fmt.B.src2.reg = $5;
		  $$.fmt.B.dest = $7;
		  $$.fmt.B.imm = 0;
		  $$.fmt.B.cond = $1;
      }
      | Condition ONEOP Constant
      {
		  $$.op = $2;
		  $$.fmt.B.src1 = 0;
		  $$.fmt.B.src2.imm = $3;
		  $$.fmt.B.dest = 0;
		  $$.fmt.B.imm = 1;
		  $$.fmt.B.cond = $1;
      }
      | Condition ONEOP REG
      {
		  $$.op = $2;
		  $$.fmt.B.src1 = $3;
		  $$.fmt.B.src2.reg = $3;
		  $$.fmt.B.dest = 0;
		  $$.fmt.B.imm = 0;
		  $$.fmt.B.cond = $1;
      }
      | Condition NULLOP
      {
		  $$.op = $2;
		  $$.fmt.B.src1 = 0;
		  $$.fmt.B.src2.reg = 0;
		  $$.fmt.B.dest = 0;
		  $$.fmt.B.imm = 0;
		  $$.fmt.B.cond = $1;
      }
      | Condition CMPOP CMPSUBOP REG ',' Constant DEST FLAG
      {
		  $$.op = $2;
		  $$.fmt.C.src1 = $4;
		  $$.fmt.C.src2.imm = $6;
		  $$.fmt.C.dest = $8;
		  $$.fmt.C.op = $3;
		  $$.fmt.C.imm = 1;
		  $$.fmt.C.cond = $1;
      }
      | Condition CMPOP CMPSUBOP REG ',' REG DEST FLAG
      {
		  $$.op = $2;
		  $$.fmt.C.src1 = $4;
		  $$.fmt.C.src2.reg = $6;
		  $$.fmt.C.dest = $8;
		  $$.fmt.C.op = $3;
		  $$.fmt.C.imm = 0;
		  $$.fmt.C.cond = $1;
      }
      | Condition BTESTOP REG ',' Constant DEST NotOptFlag
      {
		  $$.op = $2;
		  $$.fmt.B.src1 = $3;
		  $$.fmt.B.src2.imm = $5;
		  if ($7 < 0) {
			$$.fmt.B.dest = (1 << 2) | ~$7;
		  } else {
			$$.fmt.B.dest = $7;
		  }
		  $$.fmt.B.imm = 1;
		  $$.fmt.B.cond = $1;
      }
      | Condition BTESTOP REG ',' REG DEST NotOptFlag
      {
		  $$.op = $2;
		  $$.fmt.B.src1 = $3;
		  $$.fmt.B.src2.reg = $5;
		  if ($7 < 0) {
			$$.fmt.B.dest = (1 << 2) | ~$7;
		  } else {
			$$.fmt.B.dest = $7;
		  }
		  $$.fmt.B.imm = 0;
		  $$.fmt.B.cond = $1;
      }
      | Condition LDIOP Constant DEST REG
      {
		  $$.op = $2;
		  $$.fmt.I.dest = $5;
		  $$.fmt.I.val = $3;
		  $$.fmt.I.cond = $1;
      }
      | Condition WBOP REG ',' Constant
      {
		  $$.op = $2;
		  $$.fmt.I.dest = $3;
		  $$.fmt.I.val = $5;
		  $$.fmt.I.cond = $1;
      }
      | Condition LOADOP REG ',' Constant
      {
		  $$.op = $2;
		  $$.fmt.L.addr = $3;
		  $$.fmt.L.offset = $5;
		  $$.fmt.L.cond = $1;
      }
      | Condition STOREOP Constant ',' REG ',' Constant
      {
		  $$.op = $2;
		  $$.fmt.S.val.imm = $3;
		  $$.fmt.S.addr = $5;
		  $$.fmt.S.offset = $7.intval;
		  $$.fmt.S.imm = 1;
		  $$.fmt.S.cond = $1;
      }
      | Condition STOREOP REG ',' REG ',' Constant
      {
		  $$.op = $2;
		  $$.fmt.S.val.reg = $3;
		  $$.fmt.S.addr = $5;
		  $$.fmt.S.offset = $7.intval;
		  $$.fmt.S.imm = 0;
		  $$.fmt.S.cond = $1;
      }
      | Condition BRANCHOP DelayOpt Constant
      {		  
		  $$.op = $2;
		  $$.fmt.J.target = $4;
		  $$.fmt.J.cond = $1;
		  $$.fmt.J.delayed = $3;
      }
      | BRANCHZOP CMPSUBOP DelayOpt REG ',' Constant
      {
		  $$.op = $1;
		  $$.fmt.Z.reg = $4;
		  $$.fmt.Z.target = $6;
		  $$.fmt.Z.op = $2;
		  $$.fmt.Z.delayed = $3;
      }
      | Condition JOP JSUBOP REG {
		  $$.op = $2;
		  $$.fmt.B.src1 = $4;
		  switch ($3) {
		  case OP_BRIND:
		  case OP_CALL:
			$$.fmt.B.src2.reg = $3; break;
		  default:
			  yyerror("Invalid jump operation.");
		  }
		  $$.fmt.B.dest = 0;
		  $$.fmt.B.imm = 0;
		  $$.fmt.B.cond = $1;
	  }
      | Condition JOP JSUBOP {
		  $$.op = $2;
		  $$.fmt.B.src1 = 0;
		  switch ($3) {
		  case OP_RET:
		  case OP_IRET:
			$$.fmt.B.src2.reg = $3; break;
		  default:
			  yyerror("Invalid jump operation.");
		  }
		  $$.fmt.B.dest = 0;
		  $$.fmt.B.imm = 0;
		  $$.fmt.B.cond = $1;
	  }
      | Condition LDXOP EXT DEST REG
      {
		  $$.op = $2;
		  $$.fmt.B.src1 = $3;
		  $$.fmt.B.src2.imm = NULL_EXPR;
		  $$.fmt.B.dest = $5;
		  $$.fmt.B.imm = 1;
		  $$.fmt.B.cond = $1;
	  }
      | Condition LDXOP EXT ',' Constant  DEST REG
      {
		  $$.op = $2;
		  $$.fmt.B.src1 = $3;
		  $$.fmt.B.src2.imm = $5;
		  $$.fmt.B.dest = $7;
		  $$.fmt.B.imm = 1;
		  $$.fmt.B.cond = $1;
	  }
      | Condition LDXOP EXT ',' REG DEST REG
      {
		  $$.op = $2;
		  $$.fmt.B.src1 = $3;
		  $$.fmt.B.src2.reg = $5;
		  $$.fmt.B.dest = $7;
		  $$.fmt.B.imm = 0;
		  $$.fmt.B.cond = $1;
	  }
      | Condition STXOP REG DEST EXT
      {
		  $$.op = $2;
		  $$.fmt.B.src1 = $3;
		  $$.fmt.B.src2.reg = 0;
		  $$.fmt.B.dest = $5;
		  $$.fmt.B.imm = 0;
		  $$.fmt.B.cond = $1;
	  }
      | Condition MULOP REG ',' Constant DEST EXT
      {
		  $$.op = $2;
		  $$.fmt.B.src1 = $3;
		  $$.fmt.B.src2.imm = $5;
		  $$.fmt.B.dest = $7;
		  $$.fmt.B.imm = 1;
		  $$.fmt.B.cond = $1;
      }
      | Condition MULOP REG ',' REG DEST EXT
      {
		  $$.op = $2;
		  $$.fmt.B.src1 = $3;
		  $$.fmt.B.src2.reg = $5;
		  $$.fmt.B.dest = $7;
		  $$.fmt.B.imm = 0;
		  $$.fmt.B.cond = $1;
      }
      | GLOBOP Constant
      {
		  $$.op = $1;
		  $$.fmt.G.address = $2;
      }
      | LDGAOP Constant DEST REG
      {
		  $$.op = $1;
		  $$.fmt.H.dest = $4;
		  $$.fmt.H.address = $2;
      }
      | Condition BBHOP BBHSUBOP Constant DEST REG
	  {
		  $$.op = $2;
		  $$.fmt.B.src1 = $3;
		  $$.fmt.B.src2.imm = $4;
		  $$.fmt.B.dest = $6;
		  $$.fmt.B.imm = 1;
		  $$.fmt.B.cond = $1;
	  }
      | Condition BBHOP BBHSUBOP REG DEST REG
	  {
		  $$.op = $2;
		  $$.fmt.B.src1 = $3;
		  $$.fmt.B.src2.reg = $4;
		  $$.fmt.B.dest = $6;
		  $$.fmt.B.imm = 0;
		  $$.fmt.B.cond = $1;
	  }
      | Condition CCOP THREEOP NotOptFlag ',' NotOptFlag DEST FLAG
	  {
		  $$.op = $2;
		  $$.fmt.X.dest = $8;

		  switch ($3) {
		  case OP_AND: $$.fmt.X.op = 0; break;
		  case OP_OR:  $$.fmt.X.op = 1; break;
		  case OP_XOR: $$.fmt.X.op = 2; break;
		  default:
			  yyerror("Invalid combination operation.");
		  }

		  if ($4 < 0) {
			  $$.fmt.X.not1 = 1;
			  $$.fmt.X.src1 = ~$4;
		  } else {
			  $$.fmt.X.not1 = 0;
			  $$.fmt.X.src1 = $4;
		  }
		  if ($6 < 0) {
			  $$.fmt.X.not2 = 1;
			  $$.fmt.X.src2 = ~$6;
		  } else {
			  $$.fmt.X.not2 = 0;
			  $$.fmt.X.src2 = $6;
		  }

		  $$.fmt.X.cond = $1;
	  }
      | Condition FOP FTHREEOP FREG ',' FREG DEST FREG
	  {
		  $$.op = $2;
		  $$.fmt.F.dest = $8;
		  $$.fmt.F.src1 = $4;
		  $$.fmt.F.src2 = $6;
		  $$.fmt.F.op   = $3;
		  $$.fmt.F.cond = $1;
	  }
      | Condition FOP FCMPOP FREG ',' FREG DEST FREG
	  {
		  $$.op = $2;
		  $$.fmt.F.dest = $8;
		  $$.fmt.F.src1 = $4;
		  $$.fmt.F.src2 = $6;
		  $$.fmt.F.op   = $3;
		  $$.fmt.F.cond = $1;
	  }
      | Condition FOP FTWOOP FREG DEST FREG
	  {
		  $$.op = $2;
		  $$.fmt.F.dest = $6;
		  $$.fmt.F.src1 = $4;
		  $$.fmt.F.src2 = $3;
		  $$.fmt.F.op   = OP_FSUBOP;
		  $$.fmt.F.cond = $1;
	  }
      | Condition FOP FONEOP DEST FREG
	  {
		  $$.op = $2;
		  $$.fmt.F.dest = $5;
		  $$.fmt.F.src1 = $3 >> 4;
		  $$.fmt.F.src2 = $3 & 0x0f;
		  $$.fmt.F.op   = OP_FSUBOP;
		  $$.fmt.F.cond = $1;
	  }
      | Condition FOP F2DOP FREG DEST DREG
	  {
		  $$.op = $2;
		  $$.fmt.F.dest = $6;
		  $$.fmt.F.src1 = $4;
		  $$.fmt.F.src2 = $3;
		  $$.fmt.F.op   = OP_FSUBOP;
		  $$.fmt.F.cond = $1;
	  }
      | Condition FOP DTHREEOP DREG ',' DREG DEST DREG
	  {
		  $$.op = $2;
		  $$.fmt.F.dest = $8;
		  $$.fmt.F.src1 = $4;
		  $$.fmt.F.src2 = $6;
		  $$.fmt.F.op   = $3;
		  $$.fmt.F.cond = $1;
	  }
      | Condition FOP DCMPOP DREG ',' DREG DEST FREG
	  {
		  $$.op = $2;
		  $$.fmt.F.dest = $8;
		  $$.fmt.F.src1 = $4;
		  $$.fmt.F.src2 = $6;
		  $$.fmt.F.op   = $3;
		  $$.fmt.F.cond = $1;
	  }
      | Condition FOP DTWOOP DREG DEST DREG
	  {
		  $$.op = $2;
		  $$.fmt.F.dest = $6;
		  $$.fmt.F.src1 = $4;
		  $$.fmt.F.src2 = $3;
		  $$.fmt.F.op   = OP_FSUBOP;
		  $$.fmt.F.cond = $1;
	  }
      | Condition FOP DONEOP DEST DREG
	  {
		  $$.op = $2;
		  $$.fmt.F.dest = $5;
		  $$.fmt.F.src1 = $3 >> 4;
		  $$.fmt.F.src2 = $3 & 0x0f;
		  $$.fmt.F.op   = OP_FSUBOP;
		  $$.fmt.F.cond = $1;
	  }
      | Condition FOP D2FOP DREG DEST FREG
	  {
		  $$.op = $2;
		  $$.fmt.F.dest = $6;
		  $$.fmt.F.src1 = $4;
		  $$.fmt.F.src2 = $3;
		  $$.fmt.F.op   = OP_FSUBOP;
		  $$.fmt.F.cond = $1;
	  }
;

NotOptFlag: '!' FLAG
          {
			  $$ = ~$2;
		  }
          | FLAG
          {
			  $$ = $1;
		  }
;

DelayOpt: '@'
        {
			$$ = 0;
		}
        |
        {
			$$ = 1;
		}
;

Constant: NUM
        | SYM
        | EXPR
;

NewLine: NewLine '\n'
       | '\n'
;

%%

void yyerror(const char *msg)
{
	fprintf(stderr, "error: in line %d: %s\n", line_number, msg);
	exit(EXIT_FAILURE);
}

static void emit_bundle(struct bundle bundle)
{
	code_size++;
	code = realloc(code, sizeof(struct bundle)*code_size);
	code[code_size-1] = bundle;
}

static void emit_string(const char *str)
{
	const char *p;
	char c;
	struct bundle bundle;
	for (p = str; *p != '\0'; ++p)
		{
			if (*p == '\\')
				{
					p++;
					switch (p[0])
						{
						case 'b': c = '\b'; break;
						case 'f': c = '\f'; break;
						case 'n': c = '\n'; break;
						case 'r': c = '\r'; break;
						case 't': c = '\t'; break;
						case '\\': c = '\\'; break;
						case '"': c = '"';  break;
						case '0': case '1': case '2': case '3':
						case '4': case '5': case '6': case '7':
							if (p[1] >= '0' && p[1] <= '7' &&
								p[2] >= '0' && p[2] <= '7')
								{
									c = ((p[0]-'0') << 6) | ((p[1]-'0') << 3) | (p[2]-'0');
									p += 2;
									break;
								}
							/* fall through for invalid format */
						default:
							fprintf(stderr, "error: Invalid escaped character: `%c'", *p);
							exit(EXIT_FAILURE);
						}
				} 
			else
				{
					c = *p;
				}

			bundle.type = TYPE_RAW;
			bundle.size = 1;
			bundle.raw = NULL_EXPR;
			bundle.raw.intval = c;

			pos += 1;

			emit_bundle(bundle);
		}
}

static void fix_offset(struct asmop *op)
{
	if (op->op == OP_BR)
		{
			if (op->fmt.J.target.strval == NULL)
				{
					op->fmt.J.target.intval -= pos;
				}
			else
				{
					char *strval = op->fmt.J.target.strval;
					char *relexpr = malloc(strlen(strval)+16);
					sprintf(relexpr, "%s-0x%lx", strval, pos);
					op->fmt.J.target.strval = relexpr;
				}
			/* fprintf(stderr, "BR: %lld/%s\n", */
			/* 		op->fmt.J.target.offset.intval, */
			/* 		op->fmt.J.target.offset.strval); */
		}

	if (op->op == OP_BRZ)
		{
			if (op->fmt.Z.target.strval == NULL)
				{
					op->fmt.Z.target.intval -= pos;
				}
			else
				{
					char *strval = op->fmt.Z.target.strval;
					char *relexpr = malloc(strlen(strval)+16);
					sprintf(relexpr, "%s-0x%lx", strval, pos);
					op->fmt.Z.target.strval = relexpr;
				}
			/* fprintf(stderr, "BRZ: %lld/%s\n", */
			/* 		op->fmt.Z.target.intval, */
			/* 		op->fmt.Z.target.strval); */
		}
}

#define FMT_DAT 0
#define FMT_BIN 1
#define FMT_VHD 2

static int data_format = FMT_DAT;

static int dump_pos = 0;
static int buf_pos = 0;
static char buffer [4];

/* big-endian variant for emitting code */
static void dump_words(unsigned long long val, int bytes)
{
	int i;
	for (i = 0; i < bytes; i++)
		{
			buffer[buf_pos++] = (val >> 8*(bytes-i-1)) & 0xFF;
			if (buf_pos == 4)
				{
					if (data_format == FMT_DAT)
						{
							fprintf(datafile, "%d, // %02x%02x%02x%02x\n",
									((buffer[0] << 24) & 0xff000000)
									| ((buffer[1] << 16) & 0x00ff0000)
									| ((buffer[2] << 8) & 0x0000ff00)
									| ((buffer[3] << 0) & 0x000000ff),
									buffer[0] & 0xff, buffer[1] & 0xff,
									buffer[2] & 0xff, buffer[3] & 0xff);
						}
					else if (data_format == FMT_BIN)
						{
							fprintf(datafile, "%c%c%c%c",
									buffer[3], buffer[2], buffer[1], buffer[0]);
						}
					else if (data_format == FMT_VHD)
						{
							fprintf(datafile, vhd_format, dump_pos,
									buffer[0] & 0xff, buffer[1] & 0xff,
									buffer[2] & 0xff, buffer[3] & 0xff);
						}
					else
						{
							fprintf(stderr, "error: Unsupported output format\n");
							exit(EXIT_FAILURE);
						}
					dump_pos++;
					buf_pos = 0;
				}
		}
}

/* little-endian variant for emitting data */
static void dump_dwords(unsigned long long val, int bytes)
{
	int i;
	for (i = 0; i < bytes; i++)
		{
			buffer[buf_pos++] = (val >> 8*i) & 0xFF;
			if (buf_pos == 4)
				{
					if (data_format == FMT_DAT)
						{
							fprintf(datafile, "%d,\n",
									((buffer[3] << 24) & 0xff000000)
									| ((buffer[2] << 16) & 0x00ff0000)
									| ((buffer[1] << 8) & 0x0000ff00)
									| ((buffer[0] << 0) & 0x000000ff));
						}
					else if (data_format == FMT_BIN)
						{
							fprintf(datafile, "%c%c%c%c",
									buffer[0], buffer[1], buffer[2], buffer[3]);
						}
					else if (data_format == FMT_VHD)
						{
							fprintf(datafile, vhd_format, dump_pos,
									buffer[3] & 0xff, buffer[2] & 0xff,
									buffer[1] & 0xff, buffer[0] & 0xff);
						}
					else
						{
							fprintf(stderr, "error: Unsupported output format\n");
							exit(EXIT_FAILURE);
						}
					dump_pos++;
					buf_pos = 0;
				}
		}
}

static void dump_padding(int type)
{
	while (buf_pos != 0)
		{
			if ((type == TYPE_RAW) || (type == TYPE_SIZE))
				dump_dwords(0, 1);
			else
				dump_words(0, 1);
		}
}

static void dump()
{
	int i;
	int type = 0;

	if (data_format == FMT_VHD)
		{
		  fprintf(datafile, vhd_header, vhdname, vhdname, vhdname);
		}
	else if (data_format == FMT_BIN)
		{
			fprintf(datafile, "%c%c%c%c",
					(int)(pos >> 24) & 0xff,
					(int)(pos >> 16) & 0xff,
					(int)(pos >> 8) & 0xff,
					(int)(pos >> 0) & 0xff);
			fprintf(datafile, "%c%c%c%c",
					0, 0, 0, 0);
		}

	for (i = 0; i < code_size; i++)
		{
			switch (code[i].type)
				{
				case TYPE_ALIGN:
					if ((type == TYPE_RAW) || (type == TYPE_SIZE))
						dump_dwords(expr_evaluate(code[i].raw), code[i].size);
					else
						dump_words(expr_evaluate(code[i].raw), code[i].size);
					break;
				case TYPE_SIZE:
					{
						long long size = expr_evaluate(code[i].raw);
						if ((size > (1 << 15)) || (size < 0)) {
							fprintf(stderr, "error: invalid size %016llx\n", size);
							exit(EXIT_FAILURE);
						}
						dump_dwords(size, code[i].size);
					}
					break;
				case TYPE_RAW:
					dump_dwords(expr_evaluate(code[i].raw), code[i].size);
					break;
				case 0x0:
					dump_words(code[i].type | (expr_evaluate(code[i].raw) & 0x0f), 1);
					break;
				case 0x1:
					dump_words(((code[i].type & 0x0F) << 28) 
							   | (conv_asmop(code[i].op[0].op) << 3), 4);
					break;
				case 0x2:
					dump_words(((code[i].type & 0x0F) << 28)
							   | (conv_asmop(code[i].op[1].op) << 3), 4);
					break;
				case 0x4:
					dump_words(((code[i].type & 0x0F) << 28)
							   | (conv_asmop(code[i].op[2].op) << 3), 4);
					break;
				case 0x8:
					dump_words(((code[i].type & 0x0F) << 28)
							   | (conv_asmop(code[i].op[3].op) << 3), 4);
					break;
				case 0x3:
					dump_words(((code[i].type & 0x0F) << 28)
							   | (conv_asmop(code[i].op[0].op) << 3)
							   | (conv_asmop(code[i].op[1].op) >> 22), 4);
					dump_words(((conv_asmop(code[i].op[1].op) & 0x3FFFFF) << 2), 3);
					break;
				case 0x5:
					dump_words(((code[i].type & 0x0F) << 28)
							   | (conv_asmop(code[i].op[0].op) << 3)
							   | (conv_asmop(code[i].op[2].op) >> 22), 4);
					dump_words(((conv_asmop(code[i].op[2].op) & 0x3FFFFF) << 2), 3);
					break;
				case 0x9:
					dump_words(((code[i].type & 0x0F) << 28) 
							   | (conv_asmop(code[i].op[0].op) << 3)
							   | (conv_asmop(code[i].op[3].op) >> 22), 4);
					dump_words(((conv_asmop(code[i].op[3].op) & 0x3FFFFF) << 2), 3);
					break;
				case 0x6:
					dump_words(((code[i].type & 0x0F) << 28)
							   | (conv_asmop(code[i].op[1].op) << 3)
							   | (conv_asmop(code[i].op[2].op) >> 22), 4);
					dump_words(((conv_asmop(code[i].op[2].op) & 0x3FFFFF) << 2), 3);
					break;
				case 0xA:
					dump_words(((code[i].type & 0x0F) << 28)
							   | (conv_asmop(code[i].op[1].op) << 3)
							   | (conv_asmop(code[i].op[3].op) >> 22), 4);
					dump_words(((conv_asmop(code[i].op[3].op) & 0x3FFFFF) << 2), 3);
					break;
				case 0xC:
					dump_words(((code[i].type & 0x0F) << 28)
							   | (conv_asmop(code[i].op[2].op) << 3)
							   | (conv_asmop(code[i].op[3].op) >> 22), 4);
					dump_words(((conv_asmop(code[i].op[3].op) & 0x3FFFFF) << 2), 3);
					break;
				case 0x7:
					dump_words(((code[i].type & 0x0F) << 28) 
							   | (conv_asmop(code[i].op[0].op) << 3)
							   | (conv_asmop(code[i].op[1].op) >> 22), 4);
					dump_words(((conv_asmop(code[i].op[1].op) & 0x3FFFFF) << 10)
							   | (conv_asmop(code[i].op[2].op) >> 15), 4);
					dump_words(((conv_asmop(code[i].op[2].op) & 0x7FFF) << 1), 2);
					break;
				case 0xB:
					dump_words(((code[i].type & 0x0F) << 28) 
							   | (conv_asmop(code[i].op[0].op) << 3) 
							   | (conv_asmop(code[i].op[1].op) >> 22), 4);
					dump_words(((conv_asmop(code[i].op[1].op) & 0x3FFFFF) << 10)
							   | (conv_asmop(code[i].op[3].op) >> 15), 4);
					dump_words(((conv_asmop(code[i].op[3].op) & 0x7FFF) << 1), 2);
					break;
				case 0xD:
					dump_words(((code[i].type & 0x0F) << 28)
							   | (conv_asmop(code[i].op[0].op) << 3)
							   | (conv_asmop(code[i].op[2].op) >> 22), 4);
					dump_words(((conv_asmop(code[i].op[2].op) & 0x3FFFFF) << 10) 
							   | (conv_asmop(code[i].op[3].op) >> 15), 4);
					dump_words(((conv_asmop(code[i].op[3].op) & 0x7FFF) << 1), 2);
					break;
				case 0xE:
					dump_words(((code[i].type & 0x0F) << 28)
							   | (conv_asmop(code[i].op[1].op) << 3)
							   | (conv_asmop(code[i].op[2].op) >> 22), 4);
					dump_words(((conv_asmop(code[i].op[2].op) & 0x3FFFFF) << 10)
							   | (conv_asmop(code[i].op[3].op) >> 15), 4);
					dump_words(((conv_asmop(code[i].op[3].op) & 0x7FFF) << 1), 2);
					break;
				case 0xF:
					dump_words(((code[i].type & 0x0F) << 28) 
							   | (conv_asmop(code[i].op[0].op) << 3)
							   | (conv_asmop(code[i].op[1].op) >> 22), 4);
					dump_words(((conv_asmop(code[i].op[1].op) & 0x3FFFFF) << 10)
							   | (conv_asmop(code[i].op[2].op) >> 15), 4);
					dump_words(((conv_asmop(code[i].op[2].op) & 0x7FFF) << 17)
							   | (conv_asmop(code[i].op[3].op) >> 8), 4);
					dump_words((conv_asmop(code[i].op[3].op) & 0xFF), 1);
					break;
				default:
					fprintf(stderr, "error: unknown bundle type\n");
					exit(EXIT_FAILURE);
				}
			if (code[i].type != TYPE_ALIGN)
				type = code[i].type;
		}
	dump_padding(type);

	if (data_format == FMT_VHD)
		{
			fprintf(datafile, "%s", vhd_footer);
		}
}

static void usage(char *name) 
{
	fprintf(stderr, "Usage: %s [-h] [-b|-d|-v] [-e entity] [-o outfile] infile ...\n", name);
	exit(EXIT_FAILURE);
}

int main(int argc, char **argv)
{
	int opt;
	int found_outfile = 0;
	int found_vhdname = 0;
	int seen_format = 0;

	code = malloc(sizeof(struct bundle));

	init_symtab();

	datafile = stdout;
	symfile = stdout;
	vhdname = "rom";

	while ((opt = getopt(argc, argv, "hbdve:o:")) != -1)
		{
			switch (opt)
				{
				case 'h':
					usage(argv[0]);
					break;
				case 'b':
				case 'd':
				case 'v':
					if (!seen_format)
						{
							switch (opt)
								{
								case 'b': data_format = FMT_BIN; break;
								case 'd': data_format = FMT_DAT; break;
								case 'v': data_format = FMT_VHD; break;
								}
							seen_format = 1;
						}
					else
						{
							usage(argv[0]);
						}
				break;
				case 'e':
					if (!found_vhdname)
						{
							vhdname = malloc(strlen(optarg));
							strcpy(vhdname, optarg);
						}
					else
						{
							usage(argv[0]);
						}
				break;
				case 'o':
					if (!found_outfile)
						{
						char *symname;

						if (strcmp(optarg, "-") != 0)
							{
								datafile = fopen(optarg, "w");
					
								if (datafile == NULL)
									{
										fprintf(stderr, "error: %s\n", strerror(errno));
										exit(EXIT_FAILURE);
									}

								symname = malloc(strlen(optarg)+5);
								strcpy(symname, optarg);
								strcat(symname, ".sym");
								symfile = fopen(symname, "w");
								free(symname);

								if (symfile == NULL)
									{
										fprintf(stderr, "error: %s\n", strerror(errno));
										exit(EXIT_FAILURE);
									}
							}
				
						found_outfile = 1;
					}
					else
						{
							usage(argv[0]);
						}
					break;
				default: /* '?' */
					usage(argv[0]);
				}
		}
	
	if (optind >= argc)
		{
			usage(argv[0]);
		}
	
	if (strcmp(argv[optind], "-") != 0)
		{
			yyin = fopen(argv[optind], "r");
			if (yyin == NULL)
				{
					fprintf(stderr, "error: %s\n", strerror(errno));
					exit(EXIT_FAILURE);
				}
		}
	else
		{
			yyin = stdin;
		}
	infiles = &argv[optind];

	yyparse();

	dump();

	print_symtab(symfile, 0);

	fclose(datafile);
	fclose(symfile);

	return 0;
}
