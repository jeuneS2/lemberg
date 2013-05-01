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
#include <string.h>
#include <libelf.h>

#include "buffer.h"
#include "elflemberg.h"
#include "errors.h"
#include "pile.h"
#include "section.h"
#include "symtab.h"

static struct sym_info *symtab[SYMTAB_SIZE];

static unsigned int hash_string (const char *str)
{
  const char *ptr;
  unsigned int hash = 0;
  for (ptr = str; ptr != NULL && *ptr != '\0'; ptr++)
    {
      hash = 31 * hash + *ptr;
    }
  return hash;
}

void symtab_init(void)
{
  int i;
  for (i = 0; i < SYMTAB_SIZE; i++)
    {
      symtab[i] = NULL;
    }
}

struct sym_info *sym_push(struct sym_info **list, const char *name,
						  const char *section, unsigned long addr,
						  struct expr size, const char *type, int bind)
{
  struct sym_info *sym = malloc(sizeof(struct sym_info));
  sym->symbol = name;
  sym->section = section;
  sym->addr = addr;
  sym->size = size;
  sym->type = type;
  sym->bind = bind;
  sym->relocs = NULL;
  sym->next = *list;
  *list = sym;
  return sym;
}

static struct sym_info *get_or_create_sym(const char *symbol)
{
  unsigned int pos;
  struct sym_info *sym = sym_get(symbol);
  if (sym == NULL)
	{
	  pos = hash_string(symbol) % SYMTAB_SIZE;
	  sym = sym_push(&symtab[pos], symbol, NULL, 0, NULL_EXPR, "", SYM_BIND_DEFAULT);
	  sym->defined = 0;
	}
  return sym;
}

void sym_undefined(const char *symbol)
{
  get_or_create_sym(symbol);
}

void sym_define(const char *symbol, const char *section, unsigned long addr)
{
  struct sym_info *sym = get_or_create_sym(symbol);
  sym->defined = 1;
  sym->section = section;
  sym->addr = addr;
}

void sym_setsize(const char *symbol, struct expr size)
{
  struct sym_info *sym = get_or_create_sym(symbol);
  sym->size = size;
}

void sym_settype(const char *symbol, const char *type)
{
  struct sym_info *sym = get_or_create_sym(symbol);
  sym->type = type;
}

void sym_setbind(const char *symbol, int bind)
{
  struct sym_info *sym = get_or_create_sym(symbol);
  sym->bind = bind;
}

void sym_addreloc(const char *symbol, const char *sect,
				  unsigned long addr, int type, long addend)
{
  struct sym_info *sym = get_or_create_sym(symbol);
  struct sym_reloc_info *old = sym->relocs;
  sym->relocs = malloc(sizeof(struct sym_reloc_info));
  sym->relocs->sect = sect;
  sym->relocs->addr = addr;
  sym->relocs->addend = addend;
  sym->relocs->type = type;
  sym->relocs->next = old;
}

struct sym_info *sym_get(const char *symbol)
{
  unsigned int pos;
  struct sym_info *sym;

  pos = hash_string(symbol) % SYMTAB_SIZE;
  sym = symtab[pos];

  while ((sym != NULL) && (strcmp(sym->symbol, symbol) != 0))
    {
      sym = sym->next;
    }

  return sym;
}

static Elf_Scn *section_find(Elf *e, const char *name, struct buffer *shstrtab_buf)
{
  if (name != NULL)
	{
	  Elf_Scn *scn = NULL;
	  while ((scn = elf_nextscn(e, scn)) != NULL)
		{
		  Elf32_Shdr *shdr = xelf32_getshdr(scn);
		  if (strcmp((const char *)shstrtab_buf->data+shdr->sh_name, name) == 0)
			{
			  return scn;
			}
		}
	}
  return NULL;
}

Elf_Scn *symtab_write_elf(Elf *e, struct sect * sects,
						  struct buffer *strtab_buf, struct buffer *shstrtab_buf)
{
  unsigned i, k;
  struct sym_info *sym;
  Elf32_Sym esym;

  Elf_Scn *scn, *relscn, *tmpscn;
  Elf_Data *data, *reldata;
  Elf32_Shdr *shdr, *relshdr;

  struct buffer buf;
  struct buffer *relbuf;

  struct sect *s;

  buffer_init(&buf);

  esym.st_name = 0;
  esym.st_value = 0;
  esym.st_size = 0;
  esym.st_info = 0;
  esym.st_other = 0;
  esym.st_shndx = 0;
  buffer_writemem(&buf, &esym, sizeof(esym));

  relbuf = malloc(0);
  for (s = sects, k = 0; s != NULL; s = s->next, k++)
	{
	  relbuf = realloc(relbuf, (k+1)*sizeof(struct buffer));
	  buffer_init(&relbuf[k]);
	}

  for (i = 0; i < SYMTAB_SIZE; i++)
    {
      for (sym = symtab[i]; sym != NULL; sym = sym->next)
        {
          if (sym->symbol[0] != '.' || sym->relocs != NULL)
            {
			  struct reloc_info size;
			  int type = STT_NOTYPE;
			  int bind = STB_LOCAL;
			  if (!sym->defined || sym->bind == SYM_BIND_GLOBAL)
				{
				  bind = STB_GLOBAL;
				}

			  esym.st_name = strtab_buf->pos;
			  buffer_writestr(strtab_buf, sym->symbol);

			  esym.st_value = sym->addr;
			  
			  size = expr_evaluate(sym->size);
			  if (size.symbol != NULL) {
				eprintf("Cannot relocate symbol size");
				exit(EXIT_FAILURE);
			  }
			  esym.st_size = size.intval;

			  if (strcmp(sym->type, "@function") == 0)
				type = STT_FUNC;
			  if (strcmp(sym->type, "@object") == 0)
				type = STT_OBJECT;
			  esym.st_info = ELF32_ST_INFO(bind, type);

			  esym.st_other = ELF32_ST_VISIBILITY(STV_DEFAULT);

			  tmpscn = section_find(e, sym->section, shstrtab_buf);
			  if (tmpscn == NULL && sym->section != NULL)
				tmpscn = section_find(e, pile_name(pile_match(sym->section)), shstrtab_buf);
			  esym.st_shndx = tmpscn != NULL ? elf_ndxscn(tmpscn) : 0;

			  if (sym->relocs != NULL) {
				struct sym_reloc_info *r;
				for (r = sym->relocs; r != NULL; r = r->next) {
				  Elf32_Rela rel;
				  rel.r_offset = r->addr;
				  rel.r_info = ELF32_R_INFO(buf.pos/sizeof(esym), r->type);
				  rel.r_addend = r->addend;
				  for (s = sects, k = 0; s != NULL; s = s->next, k++)
					{
					  if (strcmp(s->name, r->sect) == 0)
						{
						  buffer_writemem(&relbuf[k], &rel, sizeof(rel));
						}
					}
				}
			  }

			  buffer_writemem(&buf, &esym, sizeof(esym));
			}
        }
    }

  scn = xelf_newscn(e);

  shdr = xelf32_getshdr(scn);
  shdr->sh_name = shstrtab_buf->pos;
  buffer_writestr(shstrtab_buf, ".symtab");
  shdr->sh_type = SHT_SYMTAB;
  shdr->sh_flags = 0;

  data = xelf_newdata(scn);
  data->d_align = 4;
  data->d_off = 0;
  data->d_type = ELF_T_SYM;
  data->d_version = EV_CURRENT;
  data->d_buf = buf.data;
  data->d_size = buf.pos;

  for (s = sects, k = 0; s != NULL; s = s->next, k++)
	{
	  if (relbuf[k].pos > 0)
		{
		  char *relname;

		  relscn = xelf_newscn(e);
	  
		  relshdr = xelf32_getshdr(relscn);
		  relshdr->sh_name = shstrtab_buf->pos;
		  relname = malloc(strlen(s->name)+6);
		  strcpy(relname, ".rela");
		  strcat(relname, s->name);
		  buffer_writestr(shstrtab_buf, relname);

		  relshdr->sh_type = SHT_RELA;
		  shdr->sh_flags = 0;

		  reldata = xelf_newdata(relscn);
		  reldata->d_align = 4;
		  reldata->d_off = 0;
		  reldata->d_type = ELF_T_RELA;
		  reldata->d_version = EV_CURRENT;
		  reldata->d_buf = relbuf[k].data;
		  reldata->d_size = relbuf[k].pos;

		  relshdr->sh_link = elf_ndxscn(scn);
		  
		  tmpscn = section_find(e, s->name, shstrtab_buf);
		  relshdr->sh_info = tmpscn != NULL ? elf_ndxscn(tmpscn) : 0;
		}
	}

  return scn;
}

void symtab_print(FILE *f, int local)
{
  int i;
  struct sym_info *sym;
  for (i = 0; i < SYMTAB_SIZE; i++)
    {
      sym = symtab[i];
      while (sym != NULL)
        {
          if (local || (sym->symbol[0] != '.'))
            {
              fprintf(f, "%08lx: %s\t%s\n", sym->addr, sym->symbol, sym->section);
            }
          sym = sym->next;
        }
    }
}
