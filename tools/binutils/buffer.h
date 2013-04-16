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

#ifndef _BUFFER_H_
#define _BUFFER_H_

#include <stdlib.h>

struct buffer
{
  size_t pos;
  size_t size;
  void *data;
};

void buffer_init(struct buffer *f);
void buffer_write(struct buffer *f, unsigned long long data, size_t size);
void buffer_writemem(struct buffer *f, const void *mem, size_t len);
void buffer_writestr(struct buffer *f, const char *str);

#endif
