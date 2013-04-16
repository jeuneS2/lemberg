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
#include <libelf.h>

#include "code.h"
#include "elflemberg.h"
#include "buffer.h"
#include "pile.h"
#include "symtab.h"

static struct scn_list *pile[PILE_COUNT];

const char *pile_name(unsigned p)
{
  switch(p)
	{
	case PILE_TEXT:   return ".text";
	case PILE_RODATA: return ".rodata";
	case PILE_DATA:   return ".data";
	case PILE_BSS:    return ".bss";
	case PILE_END:    return ".end";
	default:
	  fprintf(stderr, "error: Unknown pile type %d\n", p);
	  exit(EXIT_FAILURE);
	  break;
	}
  return NULL;
}

unsigned pile_match(const char *name)
{
  if (name != NULL)
	{
	  if (strncmp(name, ".text", 5) == 0)
		{
		  return PILE_TEXT;
		}
	  else if (strncmp(name, ".rodata", 7) == 0)
		{
		  return PILE_RODATA;
		}
	  else if (strncmp(name, ".data", 5) == 0)
		{
		  return PILE_DATA;
		}
	  else if (strncmp(name, ".bss", 4) == 0)
		{
		  return PILE_BSS;
		}
	  else if (strncmp(name, ".end", 4) == 0)
		{
		  return PILE_END;
		}
	}

  fprintf(stderr, "error: Cannot match section name: %s\n", name);
  exit(EXIT_FAILURE);
  return -1;
}

struct scn_list *pile_add_scn(Elf_Scn *scn, struct elf_list *elf, unsigned p)
{
  struct scn_list *i;
  
  if (p >= PILE_COUNT)
	{
	  fprintf(stderr, "error: Unknown pile type %d\n", p);
	  exit(EXIT_FAILURE);
	}
    
  i = pile[p];
  if (i == NULL)
	{
	  i = malloc(sizeof(struct scn_list));
	  pile[p] = i;
	}
  else
	{
	  while (i->next != NULL)
		{
		  i = i->next;
		}
	  i->next = malloc(sizeof(struct scn_list));
	  i = i->next;
	}
  i->scn = scn;  
  i->elf = elf;
  i->next = NULL;

  return i;
}

unsigned long pile_position(unsigned p, unsigned long pos)
{
  struct scn_list *sect;
  for (sect = pile[p]; sect != NULL; sect = sect->next)
	{
	  struct sym_info *s;
	  
	  Elf32_Ehdr *ehdr = xelf32_getehdr(sect->elf->elf);
	  Elf32_Shdr *shdr = xelf32_getshdr(sect->scn);
	  const char *scnname = elf_strptr(sect->elf->elf, ehdr->e_shstrndx, shdr->sh_name);
	  
	  shdr->sh_addr += pos;
	  
	  for (s = sect->elf->globals; s != NULL; s = s->next)
		{
		  if (strcmp(s->section, scnname) == 0)
			{
			  struct sym_info *g = sym_get(s->symbol);
			  s->addr += pos;
			  g->addr += pos;
			}
		}		  
	  for (s = sect->elf->locals; s != NULL; s = s->next)
		{
		  if (strcmp(s->section, scnname) == 0)
			{
			  s->addr += pos;
			}
		}		  
	  
	  pos += shdr->sh_flags & SHF_OS_NONCONFORMING ? shdr->sh_info : shdr->sh_size;
	  pos = ((pos+4-1) / 4) * 4;
	}
  return pos;
}

static unsigned buf_pos = 0;
static char buffer [4];

/* emit code as big-endian words */
static void dump_words(struct buffer *buf, unsigned long long val, unsigned bytes)
{
  unsigned i;
  for (i = 0; i < bytes; i++)
	{
	  buffer[buf_pos++] = (val >> 8*(bytes-i-1)) & 0xff;
	  if (buf_pos == 4)
		{
		  buffer_write(buf, buffer[3], 1);
		  buffer_write(buf, buffer[2], 1);
		  buffer_write(buf, buffer[1], 1);
		  buffer_write(buf, buffer[0], 1);
		  buf_pos = 0;
		}
	}
}

Elf32_Shdr *pile_write_elf(Elf *e, unsigned p, struct buffer *shstrtab_buf)
{
  struct scn_list *sect;
	  
  Elf_Scn *outscn = xelf_newscn(e);
  Elf32_Shdr *outshdr = xelf32_getshdr(outscn);

  outshdr->sh_name = shstrtab_buf->pos;
  buffer_writestr(shstrtab_buf, pile_name(p));
  
  switch (p)
	{
	case PILE_TEXT:
	  outshdr->sh_type = SHT_PROGBITS;
	  outshdr->sh_flags = SHF_ALLOC | SHF_EXECINSTR;
	  break;
	case PILE_RODATA:
	  outshdr->sh_type = SHT_PROGBITS;
	  outshdr->sh_flags = SHF_ALLOC;
	  break;
	case PILE_DATA:
	  outshdr->sh_type = SHT_PROGBITS;
	  outshdr->sh_flags = SHF_WRITE | SHF_ALLOC;
	  break;
	case PILE_BSS:
	  outshdr->sh_type = SHT_NOBITS;
	  outshdr->sh_flags = SHF_WRITE | SHF_ALLOC;
	  break;
	case PILE_END:
	  outshdr->sh_type = SHT_PROGBITS;
	  outshdr->sh_flags = SHF_WRITE | SHF_ALLOC;
	  break;
	default:
	  fprintf(stderr, "error: Unknown pile type %d\n", p);
	  exit(EXIT_FAILURE);
	  break;
	}	  

  if (pile[p] != NULL)
	{
	  Elf32_Shdr *shdr = xelf32_getshdr(pile[p]->scn);
	  outshdr->sh_addr = shdr->sh_addr;
	}

  for (sect = pile[p]; sect != NULL; sect = sect->next)
	{
	  Elf32_Shdr *shdr = xelf32_getshdr(sect->scn);
	  if (shdr->sh_flags & SHF_OS_NONCONFORMING)
		{
		  unsigned k;

		  unsigned optype, op0, op1, op2, op3;
		  struct buffer buf;

		  Elf_Data *data = xelf_getdata(sect->scn);
		  Elf_Data *outdata = xelf_newdata(outscn);

		  const unsigned char *src = data->d_buf;

		  buffer_init(&buf);
		  for (k = 0; k < data->d_size; k++)
			{
			  optype = ((unsigned)src[k] & 0x0F) << 28;

			  switch((signed char)src[k])
				{
				case TYPE_ALIGN:
				  dump_words(&buf, 0, src[k+1]);
				  k += 1;
				  break;

				case TYPE_SIZE:
				  buffer_writemem(&buf, &src[k+1], 4);
				  k += 4;
				  break;

				case 0x0:
				  dump_words(&buf, 0, 1);
				  k += 0;
				  break;

				case 0x1: case 0x2: case 0x4: case 0x8:
				  op0 = ((unsigned)src[k+1]
						 | ((unsigned)src[k+2] << 8)
						 | ((unsigned)src[k+3] << 16)
						 | ((unsigned)src[k+4] << 24));
				  dump_words(&buf, optype | (op0 << 3), 4);
				  k += 4;
				  break;

				case 0x3: case 0x5: case 0x9: case 0x6: case 0xA: case 0xC:
				  op0 = ((unsigned)src[k+1]
						 | ((unsigned)src[k+2] << 8)
						 | ((unsigned)src[k+3] << 16)
						 | ((unsigned)src[k+4] << 24));
				  op1 = ((unsigned)src[k+5]
						 | ((unsigned)src[k+6] << 8)
						 | ((unsigned)src[k+7] << 16)
						 | ((unsigned)src[k+8] << 24));
				  dump_words(&buf, optype | (op0 << 3) | (op1 >> 22), 4);
				  dump_words(&buf, op1 << 2, 3);
				  k += 8;
				  break;

				case 0x7: case 0xB: case 0xD: case 0xE:
				  op0 = ((unsigned)src[k+1]
						 | ((unsigned)src[k+2] << 8)
						 | ((unsigned)src[k+3] << 16)
						 | ((unsigned)src[k+4] << 24));
				  op1 = ((unsigned)src[k+5]
						 | ((unsigned)src[k+6] << 8)
						 | ((unsigned)src[k+7] << 16)
						 | ((unsigned)src[k+8] << 24));
				  op2 = ((unsigned)src[k+9]
						 | ((unsigned)src[k+10] << 8)
						 | ((unsigned)src[k+11] << 16)
						 | ((unsigned)src[k+12] << 24));
				  dump_words(&buf, optype | (op0 << 3) | (op1 >> 22), 4);
				  dump_words(&buf, (op1 << 10) | (op2 >> 15), 4);
				  dump_words(&buf, op2 << 1, 2);
				  k += 12;
				  break;
				case 0xF:
				  op0 = ((unsigned)src[k+1]
						 | ((unsigned)src[k+2] << 8)
						 | ((unsigned)src[k+3] << 16)
						 | ((unsigned)src[k+4] << 24));
				  op1 = ((unsigned)src[k+5]
						 | ((unsigned)src[k+6] << 8)
						 | ((unsigned)src[k+7] << 16)
						 | ((unsigned)src[k+8] << 24));
				  op2 = ((unsigned)src[k+9]
						 | ((unsigned)src[k+10] << 8)
						 | ((unsigned)src[k+11] << 16)
						 | ((unsigned)src[k+12] << 24));
				  op3 = ((unsigned)src[k+13]
						 | ((unsigned)src[k+14] << 8)
						 | ((unsigned)src[k+15] << 16)
						 | ((unsigned)src[k+16] << 24));
				  dump_words(&buf, optype | (op0 << 3) | (op1 >> 22), 4);
				  dump_words(&buf, (op1 << 10) | (op2 >> 15), 4);
				  dump_words(&buf, (op2 << 17) | (op3 >> 8), 4);
				  dump_words(&buf, op3, 1);
				  k += 16;
				  break;
				default:
				  fprintf(stderr, "error: Invalid type in inflated section: %d\n", src[k]);
				  exit(EXIT_FAILURE);
				}
			}

		  while (buf_pos != 0)
			{
			  dump_words(&buf, 0, 1);
			}

		  if (shdr->sh_info != buf.pos)
			{
			  fprintf(stderr, "error: Code size does not match\n");
			  exit(EXIT_FAILURE);
			}

		  outdata->d_align = data->d_align;
		  outdata->d_type = data->d_type;
		  outdata->d_version = data->d_version;
		  outdata->d_buf = buf.data;
		  outdata->d_size = buf.pos;
		}
	  else
		{
		  Elf_Data *data = xelf_getdata(sect->scn);
		  Elf_Data *outdata = xelf_newdata(outscn);
		  outdata->d_align = data->d_align;
		  outdata->d_type = data->d_type;
		  outdata->d_version = data->d_version;
		  outdata->d_buf = data->d_buf;
		  outdata->d_size = data->d_size;			  
		}
	}

  return outshdr;
}
