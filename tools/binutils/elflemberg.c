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

#include <stdlib.h>
#include <stdio.h>
#include <libelf.h>

#include "elflemberg.h"

void xelf_init(void)
{
  if (elf_version(EV_CURRENT) == EV_NONE)
	{
	  fprintf(stderr, "error: ELF library initialization failed: %s\n", elf_errmsg(-1));
	  exit(EXIT_FAILURE);
	}
}

Elf *xelf_begin(int fd, Elf_Cmd cmd, Elf *ref)
{
  Elf *e = elf_begin(fd, cmd, ref);
  if (e == NULL)
	{
	  fprintf(stderr, "error: elf_begin() failed: %s\n", elf_errmsg(-1));
	  exit(EXIT_FAILURE);
	}
  return e;
}

Elf32_Ehdr *xelf32_newehdr(Elf *e)
{
  Elf32_Ehdr *ehdr = elf32_newehdr(e);
  if (ehdr == NULL)
	{
	  fprintf(stderr, "error: elf_newehdr() failed: %s\n", elf_errmsg(-1));
	  exit(EXIT_FAILURE);
	}
  return ehdr;
}

Elf32_Ehdr *xelf32_getehdr(Elf *e)
{
  Elf32_Ehdr *ehdr = elf32_getehdr(e);
  if (ehdr == NULL)
	{
	  fprintf(stderr, "error: elf_getehdr() failed: %s\n", elf_errmsg(-1));
	  exit(EXIT_FAILURE);
	}
  return ehdr;
}

Elf32_Phdr *xelf32_newphdr(Elf *e, size_t cnt)
{
  Elf32_Phdr *phdr = elf32_newphdr(e, cnt);
  if (phdr == NULL)
	{
	  fprintf(stderr, "error: elf_newphdr() failed: %s\n", elf_errmsg(-1));
	  exit(EXIT_FAILURE);
	}
  return phdr;
}

Elf32_Phdr *xelf32_getphdr(Elf *e)
{
  Elf32_Phdr *phdr = elf32_getphdr(e);
  if (phdr == NULL)
	{
	  fprintf(stderr, "error: elf_getphdr() failed: %s\n", elf_errmsg(-1));
	  exit(EXIT_FAILURE);
	}
  return phdr;
}

size_t xelf_getphdrnum(Elf *e)
{
  size_t size;
  if (elf_getphdrnum(e, &size) < 0)
	{
	  fprintf(stderr, "error: elf_getphdrnum() failed: %s\n", elf_errmsg(-1));
	  exit(EXIT_FAILURE);
	}
  return size;
}

Elf_Scn *xelf_newscn(Elf *e)
{
  Elf_Scn *scn = elf_newscn(e);
  if (scn == NULL)
	{
	  fprintf(stderr, "error: elf_newscn() failed: %s\n", elf_errmsg(-1));
	  exit(EXIT_FAILURE);
	}
  return scn;
}

Elf_Scn *xelf_getscn(Elf *e, size_t idx)
{
  Elf_Scn *scn = elf_getscn(e, idx);
  if (scn == NULL)
	{
	  fprintf(stderr, "error: elf_getscn() failed: %s\n", elf_errmsg(-1));
	  exit(EXIT_FAILURE);
	}
  return scn;
}

Elf32_Shdr *xelf32_getshdr(Elf_Scn *scn)
{
  Elf32_Shdr *shdr = elf32_getshdr(scn);
  if (shdr == NULL)
	{
	  fprintf(stderr, "error: elf_newshdr() failed: %s\n", elf_errmsg(-1));
	  exit(EXIT_FAILURE);
	}
  return shdr;
}

Elf_Data *xelf_newdata(Elf_Scn *scn)
{
  Elf_Data *data = elf_newdata(scn);
  if (data == NULL)
	{
	  fprintf(stderr, "error: elf_newdata() failed: %s\n", elf_errmsg(-1));
	  exit(EXIT_FAILURE);
	}
  return data;
}

Elf_Data *xelf_getdata(Elf_Scn *scn)
{
  Elf_Data *data = elf_getdata(scn, NULL);
  if (data == NULL)
	{
	  fprintf(stderr, "error: elf_getdata() failed: %s\n", elf_errmsg(-1));
	  exit(EXIT_FAILURE);
	}
  return data;
}

void xelf_update(Elf *e, Elf_Cmd cmd)
{
  if (elf_update(e, cmd) < 0)
	{
	  fprintf(stderr, "error: elf_update() failed: %s\n", elf_errmsg (-1));
	  exit(EXIT_FAILURE);
	}
}

void xelf_end(Elf *e)
{
  elf_end(e);
}


int merge_relocs(int typeA, int typeB)
{
  if (typeA == R_LEMBERG_FULL && typeB == R_LEMBERG_FULL)
	return R_LEMBERG_FULL;
  if (typeA == R_LEMBERG_FULL && typeB == R_LEMBERG_LO11)
	return R_LEMBERG_LO11;
  if (typeA == R_LEMBERG_FULL && typeB == R_LEMBERG_XX11)
	return R_LEMBERG_LO11;
  if (typeA == R_LEMBERG_FULL && typeB == R_LEMBERG_19S2)
	return R_LEMBERG_19S2;

  if (typeA == R_LEMBERG_LO11 && typeB == R_LEMBERG_FULL)
	return R_LEMBERG_LO11;
  if (typeA == R_LEMBERG_LO11 && typeB == R_LEMBERG_LO11)
	return R_LEMBERG_LO11;
  if (typeA == R_LEMBERG_LO11 && typeB == R_LEMBERG_XX11)
	return R_LEMBERG_LO11;

  if (typeA == R_LEMBERG_MI10 && typeB == R_LEMBERG_FULL)
	return R_LEMBERG_MI10;
  if (typeA == R_LEMBERG_MI10 && typeB == R_LEMBERG_MI10)
	return R_LEMBERG_MI10;
  if (typeA == R_LEMBERG_MI10 && typeB == R_LEMBERG_XX11)
	return R_LEMBERG_MI10;

  if (typeA == R_LEMBERG_HI11 && typeB == R_LEMBERG_FULL)
	return R_LEMBERG_HI11;
  if (typeA == R_LEMBERG_HI11 && typeB == R_LEMBERG_HI11)
	return R_LEMBERG_HI11;
  if (typeA == R_LEMBERG_HI11 && typeB == R_LEMBERG_XX11)
	return R_LEMBERG_HI11;

  if (typeA == R_LEMBERG_XX11 && typeB == R_LEMBERG_FULL)
	return R_LEMBERG_LO11;
  if (typeA == R_LEMBERG_XX11 && typeB == R_LEMBERG_LO11)
	return R_LEMBERG_LO11;
  if (typeA == R_LEMBERG_XX11 && typeB == R_LEMBERG_MI10)
	return R_LEMBERG_MI10;
  if (typeA == R_LEMBERG_XX11 && typeB == R_LEMBERG_HI11)
	return R_LEMBERG_HI11;

  if (typeA == R_LEMBERG_19S2 && typeB == R_LEMBERG_FULL)
	return R_LEMBERG_19S2;
  if (typeA == R_LEMBERG_19S2 && typeB == R_LEMBERG_19S2)
	return R_LEMBERG_19S2;

  fprintf(stderr, "error: Cannot merge relocation types %d and %d\n",
		  typeA, typeB);
  exit(EXIT_FAILURE);
}

Elf_Scn *write_elf_strtab(Elf *e, const char *name, struct buffer *buf,
						  struct buffer *shstrtab_buf) {
  Elf_Scn *scn;
  Elf_Data *data;
  Elf32_Shdr *shdr;

  scn = xelf_newscn(e);

  shdr = xelf32_getshdr(scn);
  shdr->sh_name = shstrtab_buf->pos;
  buffer_writestr(shstrtab_buf, name);
  shdr->sh_type = SHT_STRTAB;
  shdr->sh_flags = SHF_STRINGS;

  data = xelf_newdata(scn);
  data->d_align = 1;
  data->d_off = 0;
  data->d_type = ELF_T_BYTE;
  data->d_version = EV_CURRENT;
  data->d_buf = buf->data;
  data->d_size = buf->pos;
  
  return scn;
}
