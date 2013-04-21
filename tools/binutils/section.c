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

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <libelf.h>

#include "code.h"
#include "elflemberg.h"
#include "errors.h"
#include "section.h"
#include "symtab.h"

struct sect *sections_init(struct sect **sects)
{
  *sects = NULL;

  section_create(sects, ".text", SECT_XLATE);
  section_create(sects, ".rodata", SECT_RAW);
  section_create(sects, ".data", SECT_RAW);
  section_create(sects, ".bss", SECT_ZERO);
  section_create(sects, ".end", SECT_RAW);

  return section_get(*sects, ".text");
}

struct sect *section_get(struct sect *sects, const char *name)
{
  struct sect *s;
  for (s = sects; s != NULL; s = s->next)
	{
	  if (strcmp(s->name, name) == 0)
		{
		  return s;
		}	
	}
  return NULL;
}

struct sect *section_create(struct sect **sects, const char *name, int type)
{
  struct sect *s = *sects;
  if (s == NULL)
	{
	  s = malloc(sizeof(struct sect));
	  *sects = s;
	}
  else
	{
	  while (s->next != NULL)
		{
		  s = s->next;
		}
	  s->next = malloc(sizeof(struct sect));
	  s = s->next;
	}
  s->name = name;
  s->type = type;
  s->pos = 0;
  s->size = 0;
  s->data = malloc(sizeof(struct bundle));
  s->next = NULL;
  return s;
}

void section_write_elf(Elf *e, struct sect *sect, struct buffer *shstrtab_buf)
{
  unsigned i;

  struct buffer buf;

  Elf_Scn *scn;
  Elf_Data *data;
  Elf32_Shdr *shdr;

  buffer_init(&buf);
  
  for (i = 0; i < sect->size; i++)
	{
	  if (sect->type == SECT_XLATE)
		{			  
		  buffer_write(&buf, sect->data[i].type, 1);
		  switch (sect->data[i].type)
			{
			case TYPE_ALIGN:
			  buffer_write(&buf, sect->data[i].size, 1);
			  break;
			case TYPE_SIZE:
			  {
				struct reloc_info size = expr_evaluate(sect->data[i].raw);
				if (size.symbol != NULL) {
				  eprintf("Cannot relocate function size");;
				  exit(EXIT_FAILURE);
				}
				if ((size.intval > (1 << 15)) || (size.intval < 0)) {
				  eprintf("Invalid size %016llx", size.intval);
				  exit(EXIT_FAILURE);
				}
				buffer_write(&buf, size.intval, 4);
			  }
			  break;
			case 0x0:
			  /* nothing to dump for a nop */
			  break;
			case 0x1:
			  buffer_write(&buf, conv_asmop(sect->data[i].op[0].op, sect->name, buf.pos), 4);
			  break;
			case 0x2:
			  buffer_write(&buf, conv_asmop(sect->data[i].op[1].op, sect->name, buf.pos), 4);
			  break;
			case 0x4:
			  buffer_write(&buf, conv_asmop(sect->data[i].op[2].op, sect->name, buf.pos), 4);
			  break;
			case 0x8:
			  buffer_write(&buf, conv_asmop(sect->data[i].op[3].op, sect->name, buf.pos), 4);
			  break;
			case 0x3:
			  buffer_write(&buf, conv_asmop(sect->data[i].op[0].op, sect->name, buf.pos), 4);
			  buffer_write(&buf, conv_asmop(sect->data[i].op[1].op, sect->name, buf.pos), 4);
			  break;
			case 0x5:
			  buffer_write(&buf, conv_asmop(sect->data[i].op[0].op, sect->name, buf.pos), 4);
			  buffer_write(&buf, conv_asmop(sect->data[i].op[2].op, sect->name, buf.pos), 4);
			  break;
			case 0x9:
			  buffer_write(&buf, conv_asmop(sect->data[i].op[0].op, sect->name, buf.pos), 4);
			  buffer_write(&buf, conv_asmop(sect->data[i].op[3].op, sect->name, buf.pos), 4);
			  break;
			case 0x6:
			  buffer_write(&buf, conv_asmop(sect->data[i].op[1].op, sect->name, buf.pos), 4);
			  buffer_write(&buf, conv_asmop(sect->data[i].op[2].op, sect->name, buf.pos), 4);
			  break;
			case 0xA:
			  buffer_write(&buf, conv_asmop(sect->data[i].op[1].op, sect->name, buf.pos), 4);
			  buffer_write(&buf, conv_asmop(sect->data[i].op[3].op, sect->name, buf.pos), 4);
			  break;
			case 0xC:
			  buffer_write(&buf, conv_asmop(sect->data[i].op[2].op, sect->name, buf.pos), 4);
			  buffer_write(&buf, conv_asmop(sect->data[i].op[3].op, sect->name, buf.pos), 4);
			  break;
			case 0x7:
			  buffer_write(&buf, conv_asmop(sect->data[i].op[0].op, sect->name, buf.pos), 4);
			  buffer_write(&buf, conv_asmop(sect->data[i].op[1].op, sect->name, buf.pos), 4);
			  buffer_write(&buf, conv_asmop(sect->data[i].op[2].op, sect->name, buf.pos), 4);
			  break;
			case 0xB:
			  buffer_write(&buf, conv_asmop(sect->data[i].op[0].op, sect->name, buf.pos), 4);
			  buffer_write(&buf, conv_asmop(sect->data[i].op[1].op, sect->name, buf.pos), 4);
			  buffer_write(&buf, conv_asmop(sect->data[i].op[3].op, sect->name, buf.pos), 4);
			  break;
			case 0xD:
			  buffer_write(&buf, conv_asmop(sect->data[i].op[0].op, sect->name, buf.pos), 4);
			  buffer_write(&buf, conv_asmop(sect->data[i].op[2].op, sect->name, buf.pos), 4);
			  buffer_write(&buf, conv_asmop(sect->data[i].op[3].op, sect->name, buf.pos), 4);
			  break;
			case 0xE:
			  buffer_write(&buf, conv_asmop(sect->data[i].op[1].op, sect->name, buf.pos), 4);
			  buffer_write(&buf, conv_asmop(sect->data[i].op[2].op, sect->name, buf.pos), 4);
			  buffer_write(&buf, conv_asmop(sect->data[i].op[3].op, sect->name, buf.pos), 4);
			  break;
			case 0xF:
			  buffer_write(&buf, conv_asmop(sect->data[i].op[0].op, sect->name, buf.pos), 4);
			  buffer_write(&buf, conv_asmop(sect->data[i].op[1].op, sect->name, buf.pos), 4);
			  buffer_write(&buf, conv_asmop(sect->data[i].op[2].op, sect->name, buf.pos), 4);
			  buffer_write(&buf, conv_asmop(sect->data[i].op[3].op, sect->name, buf.pos), 4);
			  break;
			default:
			  eprintf("Invalid type for translated section");
			  exit(EXIT_FAILURE);
			}
		}
	  else if (sect->type == SECT_ZERO)
		{
		  unsigned j;
		  switch (sect->data[i].type)
			{
			case TYPE_ALIGN:
			case TYPE_ZERO:
			  for (j = 0; j < sect->data[i].size; j++)
				{
				  buffer_write(&buf, 0, 1);
				}
			  break;
			case TYPE_RAW:
			  {
				struct reloc_info raw = expr_evaluate(sect->data[i].raw);
				if (raw.symbol != NULL)
				  {
					eprintf("Cannot relocate in zero section");
					exit(EXIT_FAILURE);
				  }
				if (raw.intval != 0)
				  {
					eprintf("Cannot put non-zero data in zero section");
					exit(EXIT_FAILURE);
				  }
				buffer_write(&buf, raw.intval, sect->data[i].size);
			  }
			  break;
			default:
			  eprintf("Invalid type for zero section");
			  exit(EXIT_FAILURE);
			}
		}
	  else
		{
		  unsigned j;
		  switch (sect->data[i].type)
			{
			case TYPE_ALIGN:
			case TYPE_ZERO:
			  for (j = 0; j < sect->data[i].size; j++)
				{
				  buffer_write(&buf, 0, 1);
				}
			  break;
			case TYPE_RAW:
			  {
				struct reloc_info raw = expr_evaluate(sect->data[i].raw);
				sym_addreloc(raw.symbol, sect->name, buf.pos, R_LEMBERG_FULL);
				buffer_write(&buf, raw.intval, sect->data[i].size);
			  }
			  break;
			default:
			  eprintf("Invalid type for raw section");
			  exit(EXIT_FAILURE);
			}
		}
	}

  if (sect->type != SECT_XLATE)
	{
	  while ((buf.pos & 0x03) != 0)
		{
		  buffer_write(&buf, 0, 1);
		}
	}

  scn = xelf_newscn(e);

  shdr = xelf32_getshdr(scn);
  shdr->sh_name = shstrtab_buf->pos;
  buffer_writestr(shstrtab_buf, sect->name);
  switch (sect->type)
	{
	case SECT_XLATE: 
	  shdr->sh_type = SHT_PROGBITS;
	  shdr->sh_flags = SHF_ALLOC | SHF_EXECINSTR | SHF_OS_NONCONFORMING;
	  shdr->sh_info = sect->pos;
	  break;
	case SECT_ZERO:
	  shdr->sh_type = SHT_NOBITS;
	  shdr->sh_flags = SHF_WRITE | SHF_ALLOC;
	  break;
	case SECT_RAW:
	  shdr->sh_type = SHT_PROGBITS;
	  shdr->sh_flags = SHF_WRITE | SHF_ALLOC;
	  break;
	default:
	  eprintf("Unknown section type");
	  exit(EXIT_FAILURE);
	}
  
  data = xelf_newdata(scn);
  data->d_align = 4;
  data->d_off = 0;
  data->d_type = ELF_T_BYTE;
  data->d_version = EV_CURRENT;
  data->d_buf = buf.data;
  data->d_size = buf.pos;
}
