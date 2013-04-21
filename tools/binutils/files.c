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
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>

#include "errors.h"
#include "files.h"

FILE *xfopen(const char *path, const char *mode)
{
  FILE *file = fopen(path, mode);
  if (file == NULL) 
	{
	  eprintf("%s: %s", path, strerror(errno));
	  exit(EXIT_FAILURE);
	}
  return file;
}

void xfclose(FILE *file)
{
  if (fclose(file) != 0)
	{
	  eprintf("%s", strerror(errno));
	  exit(EXIT_FAILURE);
	}
}
  
int xopen(const char *path, int flags, mode_t mode)
{
  int fd = open(path, flags, mode);
  if (fd < 0)
	{
	  eprintf("%s: %s", path, strerror(errno));
	  exit(EXIT_FAILURE);
	}
  return fd;
}

void xclose(int fd)
{
  if (close(fd) != 0)
	{
	  eprintf("%s", strerror(errno));
	  exit(EXIT_FAILURE);
	}
}
