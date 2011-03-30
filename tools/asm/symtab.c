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

#include "symtab.h"

static struct sym_info *symtab[SYMTAB_SIZE];

unsigned int hash_string (const char *str)
{
  unsigned int hash;
  const char *ptr = str;
  int len = strlen(str);
  for (hash = 0; len; len--, ptr++)
    {
      hash = 31 * hash + *ptr;
    }
  return hash;
}

void init_symtab(void)
{
  int i;
  for (i = 0; i < SYMTAB_SIZE; i++)
    {
      symtab[i] = NULL;
    }
}

void push_sym(const char *symbol, long addr)
{
  unsigned int pos;
  struct sym_info *sym;

  pos = hash_string(symbol) % SYMTAB_SIZE;
  sym = malloc(sizeof(struct sym_info));
  sym->symbol = symbol;
  sym->addr = addr;
  sym->next = symtab[pos];
  symtab[pos] = sym;  
}

struct sym_info *get_sym(const char *symbol)
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

void print_symtab(FILE *f, int local)
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
              fprintf(f, "%08lx: %s\n", sym->addr, sym->symbol);
            }
          sym = sym->next;
        }
    }
}
