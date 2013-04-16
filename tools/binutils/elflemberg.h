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

#ifndef _ELFLEMBERG_H_
#define _ELFLEMBERG_H_

#include <libelf.h>

#include "buffer.h"
#include "symtab.h"

struct elf_list
{
  Elf *elf;
  struct sym_info *globals;
  struct sym_info *locals;
  struct elf_list *next;
};

void xelf_init(void);
Elf *xelf_begin(int, Elf_Cmd, Elf *);

Elf32_Ehdr *xelf32_newehdr(Elf *);
Elf32_Ehdr *xelf32_getehdr(Elf *);

Elf32_Phdr *xelf32_newphdr(Elf *, size_t);
Elf32_Phdr *xelf32_getphdr(Elf *);
size_t xelf_getphdrnum(Elf *);


Elf_Scn *xelf_newscn(Elf *);
Elf_Scn *xelf_getscn(Elf *, size_t);

Elf32_Shdr *xelf32_getshdr(Elf_Scn *);

Elf_Data *xelf_newdata(Elf_Scn *);
Elf_Data *xelf_getdata(Elf_Scn *);

void xelf_update(Elf *, Elf_Cmd);
void xelf_end(Elf *e);

#define EM_LEMBERG 0x7515

#define R_LEMBERG_FULL 0
#define R_LEMBERG_LO11 1
#define R_LEMBERG_MI10 2
#define R_LEMBERG_HI11 4
#define R_LEMBERG_19S2 8

#define R_LEMBERG_XX11 (R_LEMBERG_LO11 | R_LEMBERG_MI10 | R_LEMBERG_HI11)

struct reloc_info
{
  const char *symbol;
  int type;
  long long intval;
};

int merge_relocs(int, int);

Elf_Scn *write_elf_strtab(Elf *, const char *, struct buffer *, struct buffer *);

#endif
