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

#include "files.h"
#include "elflemberg.h"
#include "vhdstrings.h"

char **infiles;
FILE *outfile;

#define FMT_DAT 0
#define FMT_BIN 1
#define FMT_VHD 2

static int data_format = FMT_DAT;

char *vhdname;

static void format(size_t pos, unsigned char *buf)
{
  unsigned long val = ((buf[3] << 24) | (buf[2] << 16) 
					   | (buf[1] << 8) | (buf[0] << 0));
  switch (data_format)
	{
	case FMT_DAT:
	  fprintf(outfile, "%ld, // %08lx\n", val, val & 0xffffffff);
	  break;
	case FMT_BIN:
	  fprintf(outfile, "%c%c%c%c", buf[0], buf[1], buf[2], buf[3]);
	  break;
	case FMT_VHD:
	  fprintf(outfile, vhd_format, pos, buf[3], buf[2], buf[1], buf[0]);
	  break;
	default:
	  fprintf(stderr, "error: Unsupported output format\n");
	  exit(EXIT_FAILURE);
	}
}

static void format_head(size_t size)
{
  switch (data_format)
	{
	case FMT_DAT:
	  break;
	case FMT_BIN:
	  fprintf(outfile, "%c%c%c%c",
			  (char)(size >> 24), (char)(size >> 16), 
			  (char)(size >> 8), (char)(size >> 0));
	  fprintf(outfile, "%c%c%c%c", 0, 0, 0, 0);
	  break;
	case FMT_VHD:
	  fprintf(outfile, vhd_header, vhdname, vhdname, vhdname);
	  break;
	default:
	  fprintf(stderr, "error: Unsupported output format\n");
	  exit(EXIT_FAILURE);
	}
}

static void format_foot(void)
{
  switch (data_format)
	{
	case FMT_DAT:
	  break;
	case FMT_BIN:
	  break;
	case FMT_VHD:
	  fprintf(outfile, "%s", vhd_footer);
	  break;
	default:
	  fprintf(stderr, "error: Unsupported output format\n");
	  exit(EXIT_FAILURE);
	}
}

static void format_elf(void)
{
  size_t i, size, outpos;
  int fd;
  Elf *e;
  Elf32_Phdr *phdr;
  size_t phdrnum;

  xelf_init();

  fd = xopen(infiles[0], O_RDONLY, 0);
  e = xelf_begin(fd, ELF_C_READ, NULL);
  phdr = xelf32_getphdr(e);
  phdrnum = xelf_getphdrnum(e);

  size = 0;
  for (i = 0; i < phdrnum; i++)
	{
	  if (phdr[i].p_type == PT_LOAD)
		{
		  size_t segsize = phdr[i].p_vaddr + phdr[i].p_memsz;
		  size = segsize > size ? segsize : size;
		}
	}

  format_head(size);

  outpos = 0;
  for (i = 0; i < phdrnum; i++)
	{
	  if (phdr[i].p_type == PT_LOAD)
		{
		  size_t inpos = 0;

		  if ((phdr[i].p_vaddr & 0x03) != 0
			  || (phdr[i].p_filesz & 0x03) != 0
			  || (phdr[i].p_memsz & 0x03) != 0)
			{
			  fprintf(stderr, "error: Cannot load unaligned segments\n");
			  exit(EXIT_FAILURE);
			}

		  /* Forward output file to virtual address */
		  if (outpos*4 > phdr[i].p_vaddr)
			{
			  fprintf(stderr, "error: Cannot load overlapping segments\n");
			  exit(EXIT_FAILURE);
			}
		  for (; outpos*4 < phdr[i].p_vaddr; outpos++)
			{
			  unsigned char buf[4] = { 0, 0, 0, 0 };
			  format(outpos, buf);
			}

		  /* Copy file contents */
		  lseek(fd, phdr[i].p_offset, SEEK_SET);
		  for (inpos = 0; inpos*4 < phdr[i].p_filesz; inpos++, outpos++)
			{
			  unsigned char buf[4];
			  if (read(fd, buf, 4) != 4)
				{
				  fprintf(stderr, "error: %s\n", strerror(errno));
				  exit(EXIT_FAILURE);
				}
			  format(outpos, buf);
			}

		  /* Fill segment to memory size */
		  for (; inpos*4 < phdr[i].p_memsz; inpos++, outpos++)
			{
			  unsigned char buf[4] = { 0, 0, 0, 0 };
			  format(outpos, buf);
			}
		}
	}

  format_foot();
}

static void usage(char *name) 
{
	fprintf(stderr, "Usage: %s [-h] [-b|-d|-v] [-e entity] [-o outfile] infile\n", name);
	exit(EXIT_FAILURE);
}

int main(int argc, char **argv)
{
	int opt;
	int found_outfile = 0;
	int found_vhdname = 0;
	int seen_format = 0;

	while ((opt = getopt(argc, argv, "hbdve:o:")) != -1)
	  {
		switch (opt)
		  {
		  case 'h':
			usage(argv[0]);
			break;
		  case 'b':
		  case 'd':
		  case 'v':
			if (!seen_format)
			  {
				switch (opt)
				  {
				  case 'b': data_format = FMT_BIN; break;
				  case 'd': data_format = FMT_DAT; break;
				  case 'v': data_format = FMT_VHD; break;
				  }
				seen_format = 1;
			  }
			else
			  {
				usage(argv[0]);
			  }
			break;
		  case 'e':
			if (!found_vhdname)
			  {
				vhdname = malloc(strlen(optarg));
				strcpy(vhdname, optarg);
			  }
			else
			  {
				usage(argv[0]);
			  }
			break;			
		  case 'o':
			if (!found_outfile)
			  {
				outfile = xfopen(optarg, "w");
				found_outfile = 1;
			  }
			else
			  {
				usage(argv[0]);
			  }
			break;
		  default: /* '?' */
			usage(argv[0]);
		  }
	  }
	
	if (optind+1 != argc)
	  {
		usage(argv[0]);
	  }
	
	infiles = &argv[optind];

	if (!found_outfile)
	  {
		switch (data_format)
		  {
		  case FMT_DAT:
			outfile = xfopen("a.dat", "w");
			break;
		  case FMT_BIN:
			outfile = xfopen("a.bin", "w");
			break;
		  case FMT_VHD:
			outfile = xfopen("a.vhd", "w");
			break;
		  default:
			fprintf(stderr, "error: Unsupported output format\n");
			exit(EXIT_FAILURE);
		  }
	  }

	format_elf();

	xfclose(outfile);

	return 0;
}
