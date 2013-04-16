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

#include <stdlib.h>
#include <stdio.h>

#include "buffer.h"

void buffer_init(struct buffer *f)
{
  f->pos = 0;
  f->size = 8;
  f->data = malloc(f->size);
}

void buffer_write(struct buffer *f, unsigned long long data, size_t size)
{
  size_t i;
  if (f->pos + size > f->size)
	{
	  f->size *= 2;
	  f->data = realloc(f->data, f->size);
	}
  for (i = 0; i < size; i++)
	{
	  ((char *)f->data)[f->pos+i] = data & 0xff;
	  data >>= 8;
	}
  f->pos += size;
}

void buffer_writemem(struct buffer *f, const void *mem, size_t len)
{
  size_t i;
  for (i = 0; i < len; i++)
	{
	  buffer_write(f, ((const char *)mem)[i], 1);
	}
}

void buffer_writestr(struct buffer *f, const char *str)
{
  while (*str != '\0')
	{
	  buffer_write(f, *str, 1);
	  str++;
	}
  buffer_write(f, 0, 1);
}
