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

#include <stdio.h>
#include <stdarg.h>

#include "errors.h"

void eprintf(const char *msg, ...)
{
  va_list ap;
  fprintf(stderr, "%s: error: ", argv0);
  va_start(ap, msg);
  vfprintf(stderr, msg, ap);
  va_end(ap);
  fprintf(stderr, "\n");
}

void wprintf(const char *msg, ...)
{
  va_list ap;
  fprintf(stderr, "%s: warning: ", argv0);
  va_start(ap, msg);
  vfprintf(stderr, msg, ap);
  va_end(ap);
  fprintf(stderr, "\n");
}
