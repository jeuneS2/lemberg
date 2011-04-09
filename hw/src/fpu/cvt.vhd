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

-- FPU_RND
library ieee;
use ieee.std_logic_1164.all;
library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.float_pkg.all;

entity rnd is
	port (clk, ena : in std_logic; i : in float64; o : out float32);
end rnd;

architecture behavior of rnd is
	signal i_reg, i_reg2 : float64;
	signal o_reg : float32;
begin  -- behavior
	process (clk)
	begin  -- process
		if clk'event and clk = '1' then  -- rising clock edge
			if ena = '1' then
				i_reg <= i;
				i_reg2 <= i_reg;
				o_reg <= to_float32(i_reg2, round_nearest);
				o <= o_reg;
			end if;
		end if;		
	end process;
end behavior;

-- FPU_EXT
library ieee;
use ieee.std_logic_1164.all;
library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.float_pkg.all;

entity ext is
	port (clk, ena : in std_logic; i : in float32; o : out float64);
end ext;

architecture behavior of ext is
	signal i_reg : float32;
	signal o_reg : float64;
begin  -- behavior
	process (clk)
	begin  -- process
		if clk'event and clk = '1' then  -- rising clock edge
			if ena = '1' then
				i_reg <= i;
				o_reg <= to_float64(i_reg, round_nearest);
				o <= o_reg;
			end if;
		end if;
	end process;
end behavior;

-- FPU_SI2SF
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.float_pkg.all;
use work.fpu_pack.all;

entity si2sf is
	port (clk, ena : in std_logic; i : in float32; o : out float32);
end si2sf;

architecture behavior of si2sf is
	signal i_reg : float32;
begin  -- behavior
	process (clk)
	begin  -- process
		if clk'event and clk = '1' then  -- rising clock edge
			if ena = '1' then
				i_reg <= i;
				o <= to_float(signed(to_slv(i_reg)),
							  SINGLE_EXPONENT_WIDTH, SINGLE_FRACTION_WIDTH, round_nearest);
			end if;
		end if;
	end process;
end behavior;

-- FPU_SI2DF
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.float_pkg.all;
use work.fpu_pack.all;

entity si2df is
	port (clk, ena : in std_logic; i : in float32; o : out float64);
end si2df;

architecture behavior of si2df is
	signal i_reg : float32;
begin  -- behavior
	process (clk)
	begin  -- process
		if clk'event and clk = '1' then  -- rising clock edge
			if ena = '1' then
				i_reg <= i;
				o <= to_float(signed(to_slv(i_reg)),
							  DOUBLE_EXPONENT_WIDTH, DOUBLE_FRACTION_WIDTH, round_nearest);
			end if;
		end if;
	end process;
end behavior;

-- FPU_SF2SI
library ieee;
use ieee.std_logic_1164.all;
library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.float_pkg.all;

entity sf2si is
	port (clk, ena : in std_logic; i : in float32; o : out float32);
end sf2si;

architecture behavior of sf2si is
	signal i_reg : float32;
begin  -- behavior
	process (clk)
	begin  -- process
		if clk'event and clk = '1' then  -- rising clock edge
			if ena = '1' then
				i_reg <= i;
				o <= float32(to_signed(i_reg, 32, round_zero));
			end if;
		end if;
	end process;
end behavior;

-- FPU_SF2SI
library ieee;
use ieee.std_logic_1164.all;
library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.float_pkg.all;

entity df2si is
	port (clk, ena : in std_logic; i : in float64; o : out float32);
end df2si;

architecture behavior of df2si is
	signal i_reg : float64;
begin  -- behavior
	process (clk)
	begin  -- process
		if clk'event and clk = '1' then  -- rising clock edge
			if ena = '1' then
				i_reg <= i;
				o <= float32(to_signed(i_reg, 32, round_zero));				
			end if;
		end if;
	end process;
end behavior;
