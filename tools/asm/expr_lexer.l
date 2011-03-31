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

#include <stdio.h>
#include <strings.h>

#include "exprs.h"
#include "expr.tab.h"
#include "symtab.h"

int fileno(FILE *stream);

int exprparse(long long *);

%}

BNUM (0b[0-1]+)
ONUM (0[0-7]*)
DNUM ([1-9][0-9]*)
XNUM (0x[0-9a-fA-F]+)
SYM  (\.?[_\.a-zA-Z0-9@]+)

%%

"("    return '(';
")"    return ')';

"lo11{" return LO11;
"mi10{" return MI10;
"hi11{" return HI11;
"}"    return '}';

"+"    return '+';
"-"    return '-';
"~"    return '~';
"!"    return '!';
"*"    return '*';
"/"    return '/';
"%"    return '%';
">>"   return CSHR;
"<<"   return CSHL;
">>>"  return CSLR;
"<"    return '<';
">"    return '>';
"<="   return CLE;
">="   return CGE;
"=="   return CEQU;
"!="   return CNEQ;
"&"    return '&';
"^"    return '^';
"|"    return '|';
"&&"   return CLAND;
"||"   return CLOR;
"?"    return '?';
":"    return ':';
"<?"   return CMIN;
">?"   return CMAX;

{BNUM} {
          exprlval.intval = strtoll(exprtext+2, NULL, 2);
          return NUM;
       }

{ONUM} {
          exprlval.intval = strtoll(exprtext, NULL, 8);
          return NUM;
       }

{DNUM} {
          exprlval.intval = strtoll(exprtext, NULL, 10);
          return NUM;
       }

{XNUM} {
          exprlval.intval = strtoll(exprtext+2, NULL, 16);
          return NUM;
       }

{SYM}  {
          char *s = exprtext;

		  if (get_sym(s) == NULL)
			  {
				  exprlval.intval = 0;
				  fprintf(stderr, "error: Symbol not found: `%s'\n", s);
				  exit(EXIT_FAILURE);
			  }
		  else
			  {
				  exprlval.intval = get_sym(s)->addr;
			  }

		  return IDENT;
       }

[ \t\r\n]+ { /* ignore whitespace */ }

%%

int exprwrap()
{
  return 1;
}

long long expr_evaluate(struct expr e)
{
	long long value = e.intval;

	/* fprintf(stderr, "%08x/%s ", e.intval, e.strval); */

	if (e.strval != NULL) {
		expr_scan_string(e.strval);
		exprparse(&value);
	}

	/* fprintf(stderr, "->%08x\n", value); */

	return value;
}
