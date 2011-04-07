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

#ifndef _VHDSTRINGS_H_
#define _VHDSTRINGS_H_

const char *vhd_header =
"-- DO NOT EDIT\n"
"library ieee;\n"
"use ieee.std_logic_1164.all;\n"
"use ieee.numeric_std.all;\n"
"entity bootrom is\n"
"generic (addr_width : integer);\n"
"port (clk     : in std_logic;\n"
	"\taddress : in std_logic_vector(addr_width-1 downto 0);\n"
	"\trd      : in std_logic;\n"
	"\trd_data : out std_logic_vector(31 downto 0);\n"
	"\trdy_cnt : out unsigned(1 downto 0));\n"
"end bootrom;\n"
"architecture rtl of bootrom is\n"
	"\tsignal a : std_logic_vector(7 downto 0);\n"
	"\tsignal d : std_logic_vector(31 downto 0);\n"
"begin\n"
"process(a) begin\n"
	"\tcase a is\n";

const char *vhd_format =
		"\t\twhen X\"%02x\" => d <= X\"%02x%02x%02x%02x\";\n";

const char *vhd_footer =
		"\t\twhen others => d <= (others => '0');\n"
	"\tend case;\n"
"end process;\n"
"process(clk) begin\n"
	"\tif rising_edge(clk) then\n"
	    "\t\tif rd = '1' then\n"
		"\t\t\ta <= address;\n"
		"\t\tend if;\n"
		"\t\trd_data <= d;\n"
		"\t\trdy_cnt <= '0' & rd;\n"
	"\tend if;\n"
"end process;\n"
"end rtl;\n";

#endif
