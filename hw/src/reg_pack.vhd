----------------------------------------------------------------------------
-- This file is part of Lemberg.
-- Copyright (C) 2011 Wolfgang Puffitsch
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.core_pack.all;

package reg_pack is
	
	constant REG_RDPORTS : integer := 2*CLUSTERS;
	constant REG_WRPORTS : integer := CLUSTERS;

	type reg_rdaddr_type is
		array (0 to REG_RDPORTS-1) of std_logic_vector(REG_BITS-1 downto 0);
	type reg_rddata_type is
		array (0 to REG_RDPORTS-1) of std_logic_vector(DATA_WIDTH-1 downto 0);

	type reg_wren_type is
		array (0 to REG_WRPORTS-1) of std_logic;
	type reg_wraddr_type is
		array (0 to REG_WRPORTS-1) of std_logic_vector(REG_BITS-1 downto 0);
	type reg_wrdata_type is
		array (0 to REG_WRPORTS-1) of std_logic_vector(DATA_WIDTH-1 downto 0);

	
	constant L_REG_BITS : integer := REG_BITS-1;
	constant L_REG_COUNT : integer := 2**L_REG_BITS;
		
	type l_reg_rdaddr_type is
		array (0 to CLUSTERS-1) of std_logic_vector(L_REG_BITS-1 downto 0);
	type l_reg_rddata_type is
		array (0 to CLUSTERS-1) of std_logic_vector(DATA_WIDTH-1 downto 0);

	type l_reg_wren_type is
		array (0 to CLUSTERS-1) of std_logic;
	type l_reg_wraddr_type is
		array (0 to CLUSTERS-1) of std_logic_vector(L_REG_BITS-1 downto 0);
	type l_reg_wrdata_type is
		array (0 to CLUSTERS-1) of std_logic_vector(DATA_WIDTH-1 downto 0);

	type l_reg_regfile_type is
		array(0 to L_REG_COUNT-1) of std_logic_vector(DATA_WIDTH-1 downto 0);

	
	constant G_REG_BITS : integer := REG_BITS-1;
	constant G_REG_COUNT : integer := 2**G_REG_BITS;
	
	type g_reg_rden_type is
		array (0 to REG_RDPORTS-1) of std_logic;
	type g_reg_rdaddr_type is
		array (0 to REG_RDPORTS-1) of std_logic_vector(G_REG_BITS-1 downto 0);
	type g_reg_rddata_type is
		array (0 to REG_RDPORTS-1) of std_logic_vector(DATA_WIDTH-1 downto 0);

	type g_reg_wren_type is
		array (0 to REG_WRPORTS-1) of std_logic;
	type g_reg_wraddr_type is
		array (0 to REG_WRPORTS-1) of std_logic_vector(G_REG_BITS-1 downto 0);
	type g_reg_wrdata_type is
		array (0 to REG_WRPORTS-1) of std_logic_vector(DATA_WIDTH-1 downto 0);

	type g_reg_src_type is
		array (0 to G_REG_COUNT-1) of integer range 0 to REG_WRPORTS-1;
	type g_reg_regs_type is		   
		array(0 to G_REG_COUNT-1) of std_logic_vector(DATA_WIDTH-1 downto 0);
	type g_reg_regfile_type is
		array (0 to REG_WRPORTS-1) of g_reg_regs_type;
	
end reg_pack;
