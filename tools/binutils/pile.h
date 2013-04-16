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

#ifndef _PILE_H_
#define _PILE_H_

#include <libelf.h>

#include "elflemberg.h"
#include "buffer.h"

struct scn_list
{
  Elf_Scn *scn;
  struct elf_list *elf;
  struct scn_list *next;
};

#define PILE_TEXT 0
#define PILE_RODATA 1
#define PILE_DATA 2
#define PILE_BSS 3
#define PILE_END 4
#define PILE_COUNT 5

const char *pile_name(unsigned);
unsigned pile_match(const char *);
struct scn_list *pile_add_scn(Elf_Scn *, struct elf_list *, unsigned);

unsigned long pile_position(unsigned, unsigned long);

Elf32_Shdr *pile_write_elf(Elf *, unsigned, struct buffer *);

#endif
