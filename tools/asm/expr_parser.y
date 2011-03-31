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

#include "exprs.h"

int exprlex(void);
void exprerror(long long *, const char *);

%}

%union {
	long long intval;
}

%parse-param {
	long long *retval
}

%token <intval> NUM IDENT

%token LO11 MI10 HI11
%token CEQU CSHR CLE CNEQ CMIN CLAND
%token CGE CLOR CSHL CMAX CSLR

%type <intval> PrimaryExpr UnaryExpr MultExpr AddExpr ShiftExpr
%type <intval> RelatExpr EqualExpr AndExpr XorExpr OrExpr
%type <intval> LAndExpr LOrExpr CondExpr MinMaxExpr Expr

%start Expr

%%

PrimaryExpr : NUM 
            { $$ = $1;
			}
            | IDENT 
            { $$ = $1;
			}
            | '(' Expr ')' 
            { $$ = $2;
            }
            | LO11 Expr '}'
			{ $$ = $2 & 0x7ff;
			}
            | MI10 Expr '}'
			{ $$ = ($2 >> 11) & 0x3ff;
			}
            | HI11 Expr '}'
			{ $$ = ($2 >> 21) & 0x7ff;
			}
;

UnaryExpr : PrimaryExpr
          | '+' UnaryExpr
          { $$ = $2;
		  }
          | '-' UnaryExpr
          { $$ = -$2;
		  }
          | '~' UnaryExpr
          { $$ = ~$2;
		  }
          | '!' UnaryExpr
          { $$ = !$2;
		  }
;

MultExpr : UnaryExpr
         | MultExpr '*' UnaryExpr
         { $$ = $1 * $3;
		 }
         | MultExpr '/' UnaryExpr
         {
			 if ($3 == 0)
				 {
					 fprintf(stderr, "error: Division by zero");
					 exit(EXIT_FAILURE);
					 $$ = 0;
				 }
			 else
				 {
					 $$ = $1 / $3;
				 }
		 }
         | MultExpr '%' UnaryExpr
         {
			 if ($3 == 0)
				 {
					 fprintf(stderr, "error: Modulo zero");
					 exit(EXIT_FAILURE);
					 $$ = 0;
				 }
			 else
				 {
					 $$ = $1 % $3;
				 }
		 }
;

AddExpr : MultExpr
        | AddExpr '+' MultExpr
        { $$ = $1 + $3;
		}
        | AddExpr '-' MultExpr
        { $$ = $1 - $3;
        }
;

ShiftExpr : AddExpr
          | ShiftExpr CSHR AddExpr
          { $$ = $1 >> $3;
		  }
          | ShiftExpr CSHL AddExpr
          { $$ = $1 << $3;
		  }
          | ShiftExpr CSLR AddExpr
          { $$ = (unsigned long long)$1 >> $3;
		  }
;

RelatExpr : ShiftExpr
          | RelatExpr '<' ShiftExpr
          { $$ = $1 < $3;
		  }
          | RelatExpr '>' ShiftExpr
          { $$ = $1 > $3;
		  }
          | RelatExpr CLE ShiftExpr
          { $$ = $1 <= $3;
		  }
          | RelatExpr CGE ShiftExpr
          { $$ = $1 >= $3;
		  }
;

EqualExpr : RelatExpr
          | EqualExpr CEQU RelatExpr
          { $$ = $1 == $3;
		  }
          | EqualExpr CNEQ RelatExpr
          { $$ = $1 != $3;
		  }
;

AndExpr : EqualExpr
        | AndExpr '&' EqualExpr
        { $$ = $1 & $3;
        }
;

XorExpr : AndExpr
        | XorExpr '^' AndExpr
        { $$ = $1 ^ $3;
        }
;

OrExpr : XorExpr
       | OrExpr '|' XorExpr
       { $$ = $1 | $3;
       }
;

LAndExpr : OrExpr
         | LAndExpr CLAND OrExpr
         { $$ = $1 && $3;
		 }
;

LOrExpr : LAndExpr
        | LOrExpr CLOR LAndExpr
        { $$ = $1 || $3;
        }
;

CondExpr : LOrExpr
         | LOrExpr '?' Expr ':' CondExpr
         { $$ = $1 ? $3 : $5;
		 }
;

MinMaxExpr : CondExpr
           | MinMaxExpr CMIN CondExpr
           { $$ = $1 < $3 ? $1 : $3;
           }
           | MinMaxExpr CMAX CondExpr
           { $$ = $1 > $3 ? $1 : $3;
           }
;

Expr: MinMaxExpr
    { *retval = $1;
    }
;

%%

void exprerror(long long *r, const char *msg)
{
	fprintf(stderr, "error: Error in expression: %s\n", msg);
	exit(EXIT_FAILURE);
}
