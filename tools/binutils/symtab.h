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
#include <libelf.h>

#include "exprs.h"
#include "buffer.h"
#include "section.h"

#define SYMTAB_SIZE 4096

struct sym_reloc_info
{
  const char *sect;
  unsigned long addr;
  long addend;
  int type;
  struct sym_reloc_info *next;
};

struct sym_info
{
  int defined;
  const char *symbol;
  const char *section;
  unsigned long addr;
  struct expr size;
  const char *type;
  int bind;
  struct sym_reloc_info *relocs;
  struct sym_info *next;
};

#define SYM_BIND_DEFAULT -1
#define SYM_BIND_LOCAL    0
#define SYM_BIND_GLOBAL   1

void symtab_init(void);

struct sym_info *sym_push(struct sym_info **, const char *,
						  const char *, unsigned long,
						  struct expr, const char *, int);

void sym_undefined(const char *);
void sym_define(const char *, const char *, unsigned long);
void sym_setsize(const char *, struct expr);
void sym_settype(const char *, const char *);
void sym_setbind(const char *, int);
void sym_addreloc(const char *, const char *, unsigned long, int, long);

struct sym_info *sym_get(const char *);

Elf_Scn *symtab_write_elf(Elf *, struct sect*, struct buffer *, struct buffer *);

void symtab_print(FILE *, int);

#endif /* _SYMTAB_H_ */
