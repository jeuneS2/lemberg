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
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
#include <getopt.h>
#include <libelf.h>

#include "code.h"
#include "elflemberg.h"
#include "errors.h"
#include "exprs.h"
#include "files.h"
#include "pile.h"
#include "symtab.h"

const char *argv0;

char **infiles;
int outfd;

struct elf_list *elfs;

struct string_list
{
  const char *str;
  struct string_list *next;
};

struct string_list *paths;
struct string_list *archives;

struct string_list *undef_syms;

static struct elf_list *add_elf(Elf *e)
{
  struct elf_list *i = elfs;
  if (i == NULL)
	{
	  i = malloc(sizeof(struct elf_list));
	  elfs = i;
	}
  else
	{
	  while (i->next != NULL)
		{
		  i = i->next;
		}
	  i->next = malloc(sizeof(struct elf_list));
	  i = i->next;
	}
  i->elf = e;
  i->globals = NULL;
  i->locals = NULL;
  i->next = NULL;
  return i;
}

static void push_string(struct string_list **list, const char *str)
{
  struct string_list *s = malloc(sizeof(struct string_list));
  s->str = str;
  s->next = *list;
  *list = s;
}

static void add_string(struct string_list **list, const char *str)
{
  struct string_list *s = *list;
  if (s == NULL)
	{
	  s = malloc(sizeof(struct string_list));
	  *list = s;
	}
  else
	{   
	  while (s->next != NULL)
		{
		  s = s->next;
		}	  
	  s->next = malloc(sizeof(struct string_list));
	  s = s->next;
	}
  s->str = str;
  s->next = NULL;
}

static void load_elf(Elf *e)
{
  Elf_Scn *scn;
  Elf32_Ehdr *ehdr;
  struct elf_list *elf = add_elf(e);
  ehdr = xelf32_getehdr(e);

  scn = NULL;
  while ((scn = elf_nextscn(e, scn)) != NULL)
	{	  
	  Elf32_Shdr *shdr = xelf32_getshdr(scn);
	  if (shdr->sh_type == SHT_SYMTAB)
		{		
		  unsigned k;
		  Elf_Data *symdata;
	  
		  symdata = xelf_getdata(scn);
	  
		  for (k = 1; k < symdata->d_size/sizeof(Elf32_Sym); k++)
			{
			  Elf32_Sym *sym = &((Elf32_Sym *)symdata->d_buf)[k];
			  const char *name = elf_strptr(e, shdr->sh_link, sym->st_name);
		  
			  if (sym->st_shndx < SHN_LORESERVE
				  && (ELF32_ST_TYPE(sym->st_info) == STT_NOTYPE
					  || ELF32_ST_TYPE(sym->st_info) == STT_OBJECT
					  || ELF32_ST_TYPE(sym->st_info) == STT_FUNC))
				{
				  if (sym->st_shndx != SHN_UNDEF)
					{
					  Elf_Scn *symscn = xelf_getscn(e, sym->st_shndx);
					  Elf32_Shdr *symshdr = xelf32_getshdr(symscn);
					  const char *sect = elf_strptr(e, ehdr->e_shstrndx, symshdr->sh_name);

					  struct expr size;
					  const char *type = "";

					  size.intval = sym->st_size;
					  size.strval = NULL;

					  if (ELF32_ST_TYPE(sym->st_info) == STT_FUNC)
						type = "@function";
					  if (ELF32_ST_TYPE(sym->st_info) == STT_OBJECT)
						type = "@object";
				  
					  if (ELF32_ST_BIND(sym->st_info) == STB_LOCAL)
						{
						  sym_push(&elf->locals, name, sect, sym->st_value, size, type);
						}
					  else
						{
						  if (sym_get(name) != NULL && sym_get(name)->defined)
							{
							  wprintf("Redefining symbol: %s", name);
							}
						  else
							{				  				  
							  sym_push(&elf->globals, name, sect, sym->st_value, size, type);
							  sym_define(name, sect, sym->st_value);
							  sym_setsize(name, size);
							  sym_settype(name, type);
							}
						}
					}
				  else
					{
					  if (sym_get(name) == NULL)
						{
						  push_string(&undef_syms, name);
						  sym_undefined(name);
						}
					}
				}
			}
		}
	  else if (shdr->sh_type == SHT_PROGBITS || shdr->sh_type == SHT_NOBITS)
		{
		  const char *name = elf_strptr(e, ehdr->e_shstrndx, shdr->sh_name);
		  pile_add_scn(scn, elf, pile_match(name));
		}
	}
}

static void load_hull()
{
  unsigned i;
  struct string_list *s;
  
  xelf_init();

  for (i = 0; infiles[i] != NULL; i++)
	{
	  int fd = xopen(infiles[i], O_RDONLY, 0);
	  Elf *e = xelf_begin(fd, ELF_C_READ, NULL);
	  load_elf(e);
	}

  while (undef_syms != NULL)
	{
	  for (s = undef_syms, undef_syms = NULL; s != NULL; s = s->next)
		{
		  struct string_list *a;
		  if (sym_get(s->str) == NULL)
			{
			  eprintf("Undefined symbol missing in symbol table");
			  exit(EXIT_FAILURE);
			}
		  for (a = archives; a != NULL && !sym_get(s->str)->defined; a = a->next)
			{
			  int fd = xopen(a->str, O_RDONLY, 0);
			  Elf *ar = xelf_begin(fd, ELF_C_READ, NULL);
			  size_t arsyms_size;
			  Elf_Arsym *arsyms = elf_getarsym(ar, &arsyms_size);
			  for (i = 0; i < arsyms_size; i++)
				{
				  if (arsyms[i].as_name != NULL
					  && strcmp(arsyms[i].as_name, s->str) == 0)
					{
					  Elf *e;
					  /* TODO: add check */
					  elf_rand(ar, arsyms[i].as_off);
					  e = xelf_begin(fd, ELF_C_READ, ar);
					  load_elf(e);
					  break;
					}
				}
			  xelf_end(ar);
			}
		  if (!sym_get(s->str)->defined)
			{
			  /* symbol still not defined */
			  eprintf("Undefined symbol: %s", s->str);
			  exit(EXIT_FAILURE);
			}
		}
	}
}

static void reloc(void)
{  
  struct elf_list *e;

  unsigned i;
  unsigned long pos = 0;

  for (i = 0; i < PILE_COUNT; i++)
	{
	  pos = pile_position(i, pos);
	}

  for (e = elfs; e != NULL; e = e->next)
	{
	  struct Elf_Scn *relscn = NULL;
	  while ((relscn = elf_nextscn(e->elf, relscn)) != NULL)
		{
		  Elf32_Shdr *relshdr = xelf32_getshdr(relscn);
		  if (relshdr->sh_type == SHT_REL)
			{
			  unsigned i;
			  Elf_Scn *symscn;
			  Elf32_Shdr *symshdr;
			  Elf_Data *symdata, *reldata;
			  Elf32_Rel *relocs;
			  
			  symscn = xelf_getscn(e->elf, relshdr->sh_link);
			  symshdr = xelf32_getshdr(symscn);
			  symdata = xelf_getdata(symscn);

			  reldata = xelf_getdata(relscn);
			  relocs = (Elf32_Rel *)reldata->d_buf;

			  for (i = 0; i < reldata->d_size/sizeof(Elf32_Rel); i++)
				{
				  unsigned symidx = ELF32_R_SYM(relocs[i].r_info);
				  Elf32_Sym *sym = ((Elf32_Sym *)symdata->d_buf)+symidx;
				  const char *name = elf_strptr(e->elf, symshdr->sh_link, sym->st_name);

				  Elf_Scn *scn = xelf_getscn(e->elf, relshdr->sh_info);
				  Elf_Data *scndata = xelf_getdata(scn);				  

				  int type = ELF32_R_TYPE(relocs[i].r_info);
				  unsigned *data = (unsigned *)((char *)scndata->d_buf + relocs[i].r_offset);

				  unsigned addr = 0;
				  struct sym_info *s = sym_get(name);
				  if (s != NULL)
					{
					  addr = s->addr;
					}
				  for (s = e->locals; s != NULL; s = s->next)
					{
					  if (strcmp(s->symbol, name) == 0)
						{
						  addr = s->addr;
						}
					}

				  if (type == R_LEMBERG_FULL)
					{
					  *data += addr;
					}
				  else if (type == R_LEMBERG_19S2)
					{
					  unsigned d = *data & 0x0007ffff;
					  if ((addr & 0x3) != 0)
						{
						  eprintf("Cannot relocate symbol %s to unaligned address", name);
						  exit(EXIT_FAILURE);
						}
					  d += addr >> 2;
					  if ((d & 0xfff80000) != 0)
						{
						  eprintf("Overflow for relocation of symbol %s", name);
						  exit(EXIT_FAILURE);
						}
					  *data = (*data & 0xfff80000) | d;
					}
				  else if (type == R_LEMBERG_LO11
						   || type == R_LEMBERG_MI10
						   || type == R_LEMBERG_HI11)
					{
					  unsigned d = *data & 0x00003ff8;

					  if (type == R_LEMBERG_LO11)
						d += (addr & 0x7ff) << 3;
					  else if (type == R_LEMBERG_MI10)
						d += ((addr >> 11) & 0x3ff) << 3;
					  else if (type == R_LEMBERG_HI11)
						d += ((addr >> 21) & 0x7ff) << 3;

					  if ((d & 0xffffc007) != 0)
						{
						  eprintf("Overflow for relocation of symbol %s", name);
						  exit(EXIT_FAILURE);
						}
					  *data = (*data & 0xffffc007) | d;
					}
				  else
					{
					  eprintf("Unknown relocation type %d", type);
					  exit(EXIT_FAILURE);
					}
				}
			}
		}
	  
	}
}

static int cmp_sym(const void *a, const void *b)
{
  Elf32_Sym *syma = (Elf32_Sym *)a;
  Elf32_Sym *symb = (Elf32_Sym *)b;
  return (int)syma->st_value - (int)symb->st_value;
}

static void write_elf(void)
{
  unsigned i;

  Elf_Scn *symscn, *strscn, *shstrscn;
  Elf_Data *symdata;

  struct buffer shstrtab_buf, strtab_buf;

  Elf32_Shdr *outshdr [PILE_COUNT];

  Elf *e;
  Elf32_Ehdr *ehdr;
  Elf32_Phdr *phdr;
  
  e = xelf_begin(outfd, ELF_C_WRITE, NULL);  

  ehdr = xelf32_newehdr(e);
  ehdr->e_ident[EI_DATA] = ELFDATA2LSB;
  ehdr->e_machine = EM_LEMBERG;
  ehdr->e_type = ET_EXEC;
  ehdr->e_version = EV_CURRENT;

  buffer_init(&shstrtab_buf);
  buffer_write(&shstrtab_buf, 0, 1);

  buffer_init(&strtab_buf);
  buffer_write(&strtab_buf, 0, 1);

  for (i = 0; i < PILE_COUNT; i++)
	{
	  outshdr[i] = pile_write_elf(e, i, &shstrtab_buf);
	}
  
  symscn = symtab_write_elf(e, NULL, &strtab_buf, &shstrtab_buf);
  symdata = xelf_getdata(symscn);
  qsort(symdata->d_buf, symdata->d_size/sizeof(Elf32_Sym), sizeof(Elf32_Sym), cmp_sym);

  strscn = write_elf_strtab(e, ".strtab", &strtab_buf, &shstrtab_buf);
  xelf32_getshdr(symscn)->sh_link = elf_ndxscn(strscn);

  shstrscn = write_elf_strtab(e, ".shstrtab", &shstrtab_buf, &shstrtab_buf);
  ehdr->e_shstrndx = elf_ndxscn(shstrscn);

  phdr = xelf32_newphdr(e, PILE_COUNT+1);

  xelf_update(e, ELF_C_WRITE);

  phdr[0].p_type = PT_PHDR;
  phdr[0].p_offset = ehdr->e_phoff;
  phdr[0].p_filesz = elf32_fsize(ELF_T_PHDR, PILE_COUNT+1, EV_CURRENT);

  for (i = 0; i < PILE_COUNT; i++)
	{
	  phdr[i+1].p_vaddr = outshdr[i]->sh_addr;
	  phdr[i+1].p_offset = outshdr[i]->sh_offset;
	  phdr[i+1].p_memsz = outshdr[i]->sh_size;
	  phdr[i+1].p_filesz = outshdr[i]->sh_size;

	  switch (i)
		{
		case PILE_TEXT:
		  phdr[i+1].p_type = PT_LOAD;
		  phdr[i+1].p_flags = PF_R | PF_X;
		  break;
		case PILE_RODATA:
		  phdr[i+1].p_type = PT_LOAD;
		  phdr[i+1].p_flags = PF_R;
		  break;
		case PILE_DATA:
		  phdr[i+1].p_type = PT_LOAD;
		  phdr[i+1].p_flags = PF_R | PF_W;
		  break;
		case PILE_BSS:
		  phdr[i+1].p_type = PT_LOAD;
		  phdr[i+1].p_flags = PF_R | PF_W;
		  phdr[i+1].p_filesz = 0;
		  break;
		case PILE_END:
		  phdr[i+1].p_type = PT_LOAD;
		  phdr[i+1].p_flags = PF_R | PF_W;
		  break;
		default:
		  eprintf("Unknown pile type %d", i);
		  exit(EXIT_FAILURE);
		  break;
		}

	}

  elf_flagphdr(e, ELF_C_SET, ELF_F_DIRTY);

  xelf_update(e, ELF_C_WRITE);
  xelf_end(e);
}


static void usage(char *name) 
{
	fprintf(stderr, "Usage: %s [-h] [-o outfile] [-L path] [-l lib] infile\n", name);
	exit(EXIT_FAILURE);
}

int main(int argc, char **argv)
{
	int opt;
	int found_outfile = 0;

	argv0 = argv[0];

	symtab_init();

	while ((opt = getopt(argc, argv, "hL:l:o:")) != -1)
	  {
		switch (opt)
		  {
		  case 'h':
			usage(argv[0]);
			break;
		  case 'o':
			if (!found_outfile)
			  {
				outfd = xopen(optarg, O_CREAT | O_WRONLY, 0666);							
				found_outfile = 1;
			  }
			else
			  {
				usage(argv[0]);
			  }
			break;
		  case 'L':
			add_string(&paths, optarg);
			break;
		  case 'l':
			{
			  struct string_list *p;
			  char *arname = malloc(strlen(optarg)+6);
			  strcpy(arname, "lib");
			  strcat(arname, optarg);
			  strcat(arname, ".a");
			  for (p = paths; p != NULL; p = p->next)
				{
				  int fd;
				  char *path = malloc(strlen(p->str)+strlen(arname)+2);
				  strcpy(path, p->str);
				  strcat(path, "/");
				  strcat(path, arname);
				  fd = open(path, O_RDONLY, 0);
				  if (fd < 0)
					{
					  free(path);
					}
				  else
					{
					  add_string(&archives, path);
					  xclose(fd);
					  break;
					}
				}
			  free(arname);
			}
			break;
		  default: /* '?' */
			usage(argv[0]);
		  }
	  }
	
	if (optind >= argc)
	  {
		usage(argv[0]);
	  }
	
	infiles = &argv[optind];

	if (!found_outfile)
	  {
		outfd = xopen("a.out", O_CREAT | O_WRONLY, 0666);							
	  }

	load_hull();
	reloc();
	write_elf();

	xclose(outfd);

	return 0;
}
