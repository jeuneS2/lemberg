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

#ifndef _SECTION_H_
#define _SECTION_H_

#include <libelf.h>

#include "buffer.h"

#define SECT_XLATE 1
#define SECT_ZERO 2
#define SECT_RAW 3

struct sect {
  const char *name;
  int type;
  unsigned long pos;
  unsigned long size;
  struct bundle *data;
  struct sect *next;
};

struct sect *sections_init(struct sect **);
struct sect *section_create(struct sect **, const char *, int);
struct sect *section_get(struct sect *, const char *);

void section_write_elf(Elf *, struct sect *, struct buffer *);

#endif
