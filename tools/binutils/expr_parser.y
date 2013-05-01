/***************************************************************************
 * This file is part of the Lemberg assembler.
 * Copyright (C) 2007-2011 Wolfgang Puffitsch
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

#include "elflemberg.h"
#include "errors.h"
#include "exprs.h"
#include "symtab.h"

int exprlex(void);
void exprerror(struct reloc_info *, const char *);
void check_sym(const char *);
long long resolve_sym(const char *);

%}

%union {
  long long intval;
  char *strval;
  struct reloc_info reloc;
}

%parse-param {
  struct reloc_info *retval
}

%token <intval> NUM
%token <strval> IDENT

%token LO11 MI10 HI11

%type <reloc> BaseExpr LoHiExpr Expr

%start Expr

%%

BaseExpr : NUM
         { $$.symbol = NULL;
		   $$.type = R_LEMBERG_FULL;
		   $$.intval = $1;
		 }
         | '-' NUM
		 { $$.symbol = NULL;
		   $$.type = R_LEMBERG_FULL;
		   $$.intval = -$2;
		 }
         | IDENT
		 { check_sym($1);		   
		   $$.symbol = $1;
		   $$.type = R_LEMBERG_FULL;
		   $$.intval = 0;
		 }
         | IDENT '+' NUM
		 { check_sym($1);
		   $$.symbol = $1;
		   $$.type = R_LEMBERG_FULL;
		   $$.intval = $3;
		 }
         | IDENT '-' NUM
		 { check_sym($1);
		   $$.symbol = $1;
		   $$.type = R_LEMBERG_FULL;
		   $$.intval = -$3;
		 }
         | IDENT '@' NUM
		 { $$.symbol = NULL;
		   $$.type = R_LEMBERG_FULL;
		   $$.intval = resolve_sym($1) - $3;
		 }
         | IDENT '@' IDENT
		 { $$.symbol = NULL;
		   $$.type = R_LEMBERG_FULL;
		   $$.intval = resolve_sym($1) - resolve_sym($3);
		 }
;

LoHiExpr : LO11 BaseExpr '}'
		 { $$.symbol = $2.symbol;
		   $$.type = R_LEMBERG_LO11;
		   $$.intval = $2.intval;
		 }
         | MI10 BaseExpr '}'
		 { $$.symbol = $2.symbol;
		   $$.type = R_LEMBERG_MI10;
		   $$.intval = $2.intval;
		 }
         | HI11 BaseExpr '}'
		 { $$.symbol = $2.symbol;
		   $$.type = R_LEMBERG_HI11;
		   $$.intval = $2.intval;
		 }
         | BaseExpr
		 { $$ = $1;
		 }
;

Expr : LoHiExpr
     { *retval = $1;
     }
;

%%

void exprerror(struct reloc_info *r, const char *msg)
{
    eprintf("Error in expression: %s", msg);
	exit(EXIT_FAILURE);
}

void check_sym(const char *s)
{
  struct sym_info *sym = sym_get(s);
  if (sym == NULL || !sym->defined)
	{
	  sym_undefined(s);
	}
}

long long resolve_sym(const char *s)
{
  struct sym_info *sym = sym_get(s);
  if (sym == NULL || !sym->defined)
	{
	  eprintf("Symbol %s must be resolvable.", s);
	  exit(EXIT_FAILURE);
	}
  return sym->addr;
}
