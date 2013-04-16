/***************************************************************************
 * This file is part of the Lemberg assembler.
 * Copyright (C) 2013 Wolfgang Puffitsch
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
    #include <fcntl.h>
    #include <unistd.h>
	#include <errno.h>
	#include <getopt.h>
    #include <libelf.h>

	#include "code.h"
	#include "exprs.h"
	#include "files.h"
	#include "optab.h"
	#include "section.h"
	#include "symtab.h"
    #include "elflemberg.h"
    #include "buffer.h"

	extern FILE* yyin;
	int yylex(void);
	void yyerror(const char *);	

	int line_number = 1;

	struct sect *sections;
	struct sect *curr_sect;

	char **infiles;
	int outfd;

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

%token IF DEST BSEP ALIGN TYPE SIZE FUNSIZE QUAD LONG SHORT BYTE ASCII COMM

%token <intval>  CLUST FLAG REG EXT FREG DREG
%token <strval>  STR SECT SYMTYPE
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
      | Input Section
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
		sym_define($1.strval, curr_sect->name, curr_sect->pos);
      }
;

Section : SECT NewLine
        {
		  curr_sect = section_get(sections, $1);
		  if (curr_sect == NULL) {
            curr_sect = section_create(&sections, $1, SECT_RAW);
		  }
        }
        | COMM SYM ',' NUM ',' NUM NewLine
		{
		  struct bundle comm;
		  struct sect *old_sect;
		  int align = $6.intval;		  

		  /* .comm implicitly switches to .bss */
		  old_sect = curr_sect;
		  curr_sect = section_get(sections, ".bss");

		  comm.type = TYPE_ZERO;
		  comm.size = curr_sect->pos % align == 0 ? 0 : align - curr_sect->pos % align;
		  comm.raw = NULL_EXPR;
		  curr_sect->pos = ((curr_sect->pos+align-1) / align) * align;			  

		  sym_define($2.strval, curr_sect->name, curr_sect->pos);
		  sym_setsize($2.strval, $4);
		  sym_settype($2.strval, "@object");
		  
		  comm.size += $4.intval;
		  curr_sect->pos += $4.intval;

		  emit_bundle(comm);

		  /* switch back to original section */
		  curr_sect = old_sect;
		}

Directive : ALIGN NUM NewLine
          {
			  int align = $2.intval;
			  $$.type = TYPE_ALIGN;
			  $$.size = curr_sect->pos % align == 0 ? 0 : align - curr_sect->pos % align;
			  $$.raw = NULL_EXPR;
			  curr_sect->pos = ((curr_sect->pos+align-1) / align) * align;
		  }
          | TYPE SYM ',' SYMTYPE NewLine
		  {
			sym_settype($2.strval, $4);
			$$.type = TYPE_ALIGN;
			$$.size = curr_sect->pos % 4 == 0 ? 0 : 4 - curr_sect->pos % 4;;
			$$.raw = NULL_EXPR;
			curr_sect->pos = ((curr_sect->pos+4-1) / 4) * 4;
		  }
          | SIZE SYM ',' Constant NewLine
		  {
			sym_setsize($2.strval, $4);
			$$.type = TYPE_ALIGN;
			$$.size = 0;
			$$.raw = NULL_EXPR;
		  }
          | FUNSIZE Constant NewLine
		  {
			struct bundle b;
			b.type = TYPE_ALIGN;
			b.size = curr_sect->pos % 4 == 0 ? 0 : 4 - curr_sect->pos % 4;
			b.raw = NULL_EXPR;
			curr_sect->pos = ((curr_sect->pos+4-1) / 4) * 4;
			emit_bundle(b);

			$$.type = TYPE_SIZE;
			$$.size = 4;
			$$.raw = $2;
			curr_sect->pos += 4;
		  }
          | QUAD Constant NewLine
		  {
			  $$.type = TYPE_RAW;
			  $$.size = 8;
			  $$.raw = $2;
			  curr_sect->pos += 8;
		  }
          | LONG Constant NewLine
		  {
			  $$.type = TYPE_RAW;
			  $$.size = 4;
			  $$.raw = $2;
			  curr_sect->pos += 4;
		  }
          | SHORT Constant NewLine
		  {
			  $$.type = TYPE_RAW;
			  $$.size = 2;
			  $$.raw = $2;
			  curr_sect->pos += 2;
		  }
          | BYTE Constant NewLine
		  {
			  $$.type = TYPE_RAW;
			  $$.size = 1;
			  $$.raw = $2;
			  curr_sect->pos += 1;
		  }
          | ASCII STR NewLine
		  {
			  emit_string($2);
			  $$.type = TYPE_RAW;
			  $$.size = 0;
			  $$.raw = NULL_EXPR;
		  }
;

Bundle : NOP NewLine BSep
       {
		   curr_sect->pos += 1;

		   $$.type = 0;
		   $$.size = 1;
		   $$.raw = NULL_EXPR;
       }
       | Operation BSep
       {
		   curr_sect->pos += 4;
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

		   curr_sect->pos += 7;
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

		   curr_sect->pos += 10;
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

		   curr_sect->pos += 13;
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
	curr_sect->size++;
	curr_sect->data = realloc(curr_sect->data, sizeof(struct bundle)*curr_sect->size);
	curr_sect->data[curr_sect->size-1] = bundle;
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

			curr_sect->pos += 1;

			emit_bundle(bundle);
		}
}

static void fix_offset(struct asmop *op)
{
	if (op->op == OP_BR)
		{
			if (op->fmt.J.target.strval == NULL)
				{
					op->fmt.J.target.intval -= curr_sect->pos;
				}
			else
				{
					char *strval = op->fmt.J.target.strval;
					char *relexpr = malloc(strlen(strval)+16);
					sprintf(relexpr, "%s@0x%lx", strval, curr_sect->pos);
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
					op->fmt.Z.target.intval -= curr_sect->pos;
				}
			else
				{
					char *strval = op->fmt.Z.target.strval;
					char *relexpr = malloc(strlen(strval)+16);
					sprintf(relexpr, "%s@0x%lx", strval, curr_sect->pos);
					op->fmt.Z.target.strval = relexpr;
				}
			/* fprintf(stderr, "BRZ: %lld/%s\n", */
			/* 		op->fmt.Z.target.intval, */
			/* 		op->fmt.Z.target.strval); */
		}
}

static void write_elf()
{
  struct sect *s;

  Elf *e;
  Elf32_Ehdr *ehdr;
  Elf_Scn *symscn, *strscn, *shstrscn;

  struct buffer shstrtab_buf, strtab_buf;

  xelf_init();
  e = xelf_begin(outfd, ELF_C_WRITE, NULL);

  ehdr = xelf32_newehdr(e);
  ehdr->e_ident[EI_DATA] = ELFDATA2LSB;
  ehdr->e_machine = EM_LEMBERG;
  ehdr->e_type = ET_REL;
  ehdr->e_version = EV_CURRENT;

  buffer_init(&shstrtab_buf);
  buffer_write(&shstrtab_buf, 0, 1);

  buffer_init(&strtab_buf);
  buffer_write(&strtab_buf, 0, 1);

  for (s = sections; s != NULL; s = s->next)
	{
	  section_write_elf(e, s, &shstrtab_buf);
	}

  symscn = symtab_write_elf(e, sections, &strtab_buf, &shstrtab_buf);

  strscn = write_elf_strtab(e, ".strtab", &strtab_buf, &shstrtab_buf);
  xelf32_getshdr(symscn)->sh_link = elf_ndxscn(strscn);

  shstrscn = write_elf_strtab(e, ".shstrtab", &shstrtab_buf, &shstrtab_buf);
  ehdr->e_shstrndx = elf_ndxscn(shstrscn);

  xelf_update(e, ELF_C_WRITE);
  xelf_end(e);
}

static void usage(char *name) 
{
	fprintf(stderr, "Usage: %s [-h] [-o outfile] infile ...\n", name);
	exit(EXIT_FAILURE);
}

int main(int argc, char **argv)
{
	int opt;
	int found_outfile = 0;

	curr_sect = sections_init(&sections);
	symtab_init();

	outfd = STDOUT_FILENO;

	while ((opt = getopt(argc, argv, "ho:")) != -1)
	  {
		switch (opt)
		  {
		  case 'h':
			usage(argv[0]);
			break;
		  case 'o':
			if (!found_outfile)
			  {
				if (strcmp(optarg, "-") != 0)
				  {
					outfd = xopen(optarg, O_CREAT | O_WRONLY, 0666);
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
		yyin = xfopen(argv[optind], "r");
	  }
	else
	  {
		yyin = stdin;
	  }
	infiles = &argv[optind];

	yyparse();

	write_elf();

	xclose(outfd);

	return 0;
}
