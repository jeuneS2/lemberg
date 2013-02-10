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
use ieee.numeric_std.all;
use work.core_pack.all;
use work.reg_pack.all;

entity g_regfile is
	
	port (
		clk	   : in	 std_logic;
		reset  : in	 std_logic;
		ena    : in  std_logic;
        
		rdaddr : in	 g_reg_rdaddr_type;
		rddata : out g_reg_rddata_type;
		
		wren   : in	 g_reg_wren_type;
		wraddr : in	 g_reg_wraddr_type;
		wrdata : in	 g_reg_wrdata_type);

end g_regfile;

architecture behavior of g_regfile is

	signal src : g_reg_src_type;
	signal regfile : g_reg_regfile_type := (others => (others => (others => '0')));
	
	signal rdaddr_reg : g_reg_rdaddr_type;

	signal wren_reg	  : g_reg_wren_type;
	signal wraddr_reg : g_reg_wraddr_type;
	signal wrdata_reg : g_reg_wrdata_type;
	
begin  -- behavior

	sync: process (clk, reset)
	begin  -- process sync
		if clk'event and clk = '1' then	 -- rising clock edge
			-- latch read addresses
			for i in 0 to REG_RDPORTS-1 loop
				if ena = '1' then
					rdaddr_reg(i) <= rdaddr(i);
				end if;
			end loop;  -- i
			-- latch writes
			wren_reg <= wren;
			wraddr_reg <= wraddr;
			wrdata_reg <= wrdata;
			for i in 0 to REG_WRPORTS-1 loop
				if wren_reg(i) = '1' then
					regfile(i)(to_integer(unsigned(wraddr_reg(i)))) <= wrdata_reg(i);
					src(to_integer(unsigned(wraddr_reg(i)))) <= i;
				end if;
			end loop;  -- i			
		end if;
	end process sync;

	async: process (regfile, rdaddr_reg, src,
					wren_reg, wraddr_reg, wrdata_reg)
	begin  -- process async
		for i in 0 to REG_RDPORTS-1 loop
			rddata(i) <= regfile(src(to_integer(unsigned(rdaddr_reg(i)))))
						 (to_integer(unsigned(rdaddr_reg(i))));
			for k in 0 to REG_WRPORTS-1 loop
				if wren_reg(k) = '1' and wraddr_reg(k) = rdaddr_reg(i) then
					rddata(i) <= wrdata_reg(k);
				end if;
			end loop;  -- k
		end loop;  -- i		
	end process async;
	
end behavior;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.core_pack.all;
use work.reg_pack.all;

entity l_regfile is

		port (
		clk	    : in  std_logic;
		reset   : in  std_logic;
		ena     : in  std_logic;

		rdaddr0 : in  std_logic_vector(L_REG_BITS-1 downto 0);
		rddata0 : out std_logic_vector(DATA_WIDTH-1 downto 0);

		rdaddr1 : in  std_logic_vector(L_REG_BITS-1 downto 0);
		rddata1 : out std_logic_vector(DATA_WIDTH-1 downto 0);

		wren    : in  std_logic;
		wraddr  : in  std_logic_vector(L_REG_BITS-1 downto 0);
		wrdata  : in  std_logic_vector(DATA_WIDTH-1 downto 0));

end l_regfile;

architecture behavior of l_regfile is

	signal regfile : l_reg_regfile_type := (others => (others => '0'));
	signal rdaddr0_reg : std_logic_vector(L_REG_BITS-1 downto 0);
	signal rdaddr1_reg : std_logic_vector(L_REG_BITS-1 downto 0);

	signal wren_reg   : std_logic;
	signal wraddr_reg : std_logic_vector(L_REG_BITS-1 downto 0);
	signal wrdata_reg : std_logic_vector(DATA_WIDTH-1 downto 0);
	
begin  -- behavior

	sync: process (clk, reset)
	begin  -- process sync
		if clk'event and clk = '1' then  -- rising clock edge
			-- latch read addresses
			if ena = '1' then
				rdaddr0_reg <= rdaddr0;
				rdaddr1_reg <= rdaddr1;
			end if;
			-- latch writes
			wren_reg <= wren and ena;
			wraddr_reg <= wraddr;
			wrdata_reg <= wrdata;
			if wren_reg = '1' then
				regfile(to_integer(unsigned(wraddr_reg))) <= wrdata_reg;
			end if;  -- i
		end if;
	end process sync;
	
	async: process (regfile, rdaddr0_reg, rdaddr1_reg,
					wren_reg, wraddr_reg, wrdata_reg)
	begin  -- process async
		rddata0 <= regfile(to_integer(unsigned(rdaddr0_reg)));
		if wren_reg = '1' and wraddr_reg = rdaddr0_reg then
			rddata0 <= wrdata_reg;
		end if;
		rddata1 <= regfile(to_integer(unsigned(rdaddr1_reg)));
		if wren_reg = '1' and wraddr_reg = rdaddr1_reg then
			rddata1 <= wrdata_reg;
		end if;
	end process async;

end behavior;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.core_pack.all;
use work.reg_pack.all;

entity regfile is

		port (
		clk	   : in	 std_logic;
		reset  : in	 std_logic;
		ena    : in  std_logic;

		rdaddr : in	 reg_rdaddr_type;
		rddata : out reg_rddata_type;

		wren   : in  reg_wren_type;
		wraddr : in	 reg_wraddr_type;
		wrdata : in	 reg_wrdata_type);

end regfile;

architecture behavior of regfile is

	signal gl_mux : std_logic_vector(REG_RDPORTS-1 downto 0);
	
	signal g_rdaddr : g_reg_rdaddr_type;
	signal g_rddata : g_reg_rddata_type;
	signal g_wren   : g_reg_wren_type;
	signal g_wraddr : g_reg_wraddr_type;
	signal g_wrdata : g_reg_wrdata_type;

	signal l_rdaddr0 : l_reg_rdaddr_type;
	signal l_rddata0 : l_reg_rddata_type;
	signal l_rdaddr1 : l_reg_rdaddr_type;
	signal l_rddata1 : l_reg_rddata_type;
	signal l_wren    : l_reg_wren_type;
	signal l_wraddr  : l_reg_wraddr_type;
	signal l_wrdata  : l_reg_wrdata_type;
	
begin  -- behavior

	g_regfile: entity work.g_regfile
		port map (
			clk	   => clk,
			reset  => reset,
			ena    => ena,
			rdaddr => g_rdaddr,
			rddata => g_rddata,
			wren   => g_wren,
			wraddr => g_wraddr,
			wrdata => g_wrdata);

	gen_l_regfile: for i in 0 to CLUSTERS-1 generate
		l_regfile: entity work.l_regfile
			port map (
				clk     => clk,
				reset   => reset,
				ena     => ena,
				rdaddr0 => l_rdaddr0(i),
				rddata0 => l_rddata0(i),
				rdaddr1 => l_rdaddr1(i),
				rddata1 => l_rddata1(i),
				wren    => l_wren(i),
				wraddr  => l_wraddr(i),
				wrdata  => l_wrdata(i));			
	end generate;

	-- latching for read mux
	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then  			-- asynchronous reset (active low)
			gl_mux <= (others => '0');
		elsif clk'event and clk = '1' then  -- rising clock edge
			for i in 0 to REG_RDPORTS-1 loop
				if ena = '1' then
					gl_mux(i) <= rdaddr(i)(REG_BITS-1);					
				end if;
			end loop;  -- i
		end if;
	end process sync;

	-- take care of reads
	rd: process (rdaddr, ena, gl_mux, l_rddata0, l_rddata1, g_rddata)
	begin  -- process
		for i in 0 to CLUSTERS-1 loop
			l_rdaddr0(i) <= rdaddr(2*i)(L_REG_BITS-1 downto 0);
			l_rdaddr1(i) <= rdaddr(2*i+1)(L_REG_BITS-1 downto 0);
		end loop;  -- i			
		for i in 0 to REG_RDPORTS-1 loop
			g_rdaddr(i) <= rdaddr(i)(G_REG_BITS-1 downto 0);
		end loop;  -- i
		
		for i in 0 to CLUSTERS-1 loop
			if gl_mux(2*i) = '1' then
				rddata(2*i) <= l_rddata0(i);
			else
				rddata(2*i) <= g_rddata(2*i);
			end if;
			if gl_mux(2*i+1) = '1' then
				rddata(2*i+1) <= l_rddata1(i);
			else
				rddata(2*i+1) <= g_rddata(2*i+1);
			end if;
		end loop;  -- i			
	end process;

	-- take care of writes
	wr: process (wren, wraddr, wrdata, ena)
	begin  -- process wr				
		for i in 0 to CLUSTERS-1 loop
			l_wren(i) <= wren(i) and wraddr(i)(REG_BITS-1);
			l_wraddr(i) <= wraddr(i)(L_REG_BITS-1 downto 0);
			l_wrdata(i) <= wrdata(i);
		end loop;  -- i
		for i in 0 to REG_WRPORTS-1 loop
			g_wren(i) <= wren(i) and not wraddr(i)(REG_BITS-1) and ena;
			g_wraddr(i) <= wraddr(i)(G_REG_BITS-1 downto 0);
			g_wrdata(i) <= wrdata(i);
		end loop;  -- i
	end process wr;
	
end behavior;
