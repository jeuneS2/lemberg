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

#ifndef _SYMTAB_H_
#define _SYMTAB_H_

#include <stdio.h>

#define SYMTAB_SIZE 4096

unsigned int hash_string (const char *);

struct sym_info
{
  const char *symbol;
  long addr;
  struct sym_info *next;
};

void init_symtab(void);

void push_sym(const char *, long);
struct sym_info *get_sym(const char *);

void print_symtab(FILE *, int);

#endif /* _SYMTAB_H_ */
