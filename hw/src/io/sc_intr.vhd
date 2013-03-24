----------------------------------------------------------------------------
-- This file is part of Lemberg.
-- Copyright (C) 2013 Wolfgang Puffitsch
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

use work.config.all;
use work.core_pack.all;
use work.io_pack.all;
use work.mem_pack.all;

entity sc_intr is
	
	generic (
		addr_width : integer;
        intr_count_bits : integer;
        intr_count : integer);

	port (
		clk, reset : in  std_logic;
		address    : in  std_logic_vector(addr_width-1 downto 0);
		wr_data    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		wr         : in  std_logic;
		rd         : in  std_logic;
		rd_data    : out std_logic_vector(DATA_WIDTH-1 downto 0);
		rdy_cnt    : out unsigned(1 downto 0);
        intr       : out std_logic;
        intraddr   : out std_logic_vector(work.core_pack.ADDR_WIDTH-1 downto 0);
        intrcall   : in  std_logic;
        intrret    : in  std_logic;
        intrsrc    : in  std_logic_vector(intr_count-1 downto 0));	

end sc_intr;

architecture rtl of sc_intr is
    
    signal rd_data_buf : std_logic_vector(DATA_WIDTH-1 downto 0);
    
    type intr_vec_type is array (0 to intr_count-1)
        of std_logic_vector(work.core_pack.ADDR_WIDTH-1 downto 0);
	signal intr_vecs : intr_vec_type;

    signal vec_rdena  : std_logic;
    signal vec_rdaddr : std_logic_vector(intr_count_bits-1 downto 0);
    signal vec_rddata : std_logic_vector(work.core_pack.ADDR_WIDTH-1 downto 0);

    signal iena : std_logic;
    signal imask : std_logic_vector(intr_count-1 downto 0);
    signal ipend : std_logic_vector(intr_count-1 downto 0);
    signal isrc : std_logic_vector(intr_count_bits-1 downto 0);
    
begin  -- rtl

	assert addr_width = intr_count_bits+1 report "Wrong address width" severity failure;
    assert intr_count <= 2**intr_count_bits report "Not enough bits for interrupts" severity failure;

	sync: process (clk, reset)
	begin  -- process sync
		if reset = '0' then

            intr <= '0';
            intraddr <= (others => '0');
            
            iena <= '0';
            imask <= (others => '0');
            ipend <= (others => '0');
            isrc <= (others => '0');
            
            rdy_cnt <= "00";
            rd_data_buf <= (others => '0');

            intr_vecs <= (others => (others => '0'));

            vec_rdena <= '0';
            vec_rdaddr <= (others => '0');

		elsif clk'event and clk = '1' then  -- rising clock edge

            -- interrupt creation logic
            intr <= '0';
            if iena = '1' then
                for i in 0 to intr_count-1 loop
                    if (ipend(i) and imask(i)) = '1' then
                        intr <= '1';
                        intraddr <= intr_vecs(i);
                        isrc <= std_logic_vector(to_unsigned(i, intr_count_bits));
                    end if;
                end loop;  -- i
            end if;

            -- handling of pending flags, issuing and returning
            ipend <= ipend or intrsrc;
            if intrcall = '1' then
                intr <= '0';
                iena <= '0';
                ipend(to_integer(unsigned(isrc))) <= intrsrc(to_integer(unsigned(isrc)));
            end if;
            if intrret = '1' then
                iena <= '1';
            end if;
            
            -- read/write logic            
            rdy_cnt <= '0' & rd;
            
            rd_data <= rd_data_buf;
            if vec_rdena = '1' then
                rd_data_buf <= (others => '0');
                rd_data_buf(work.core_pack.ADDR_WIDTH+1 downto 2) <= vec_rddata;
                rd_data <= (others => '0');
                rd_data(work.core_pack.ADDR_WIDTH+1 downto 2) <= vec_rddata;
            end if;            
            vec_rdena <= '0';

			if rd = '1' then
                if address(intr_count_bits) = '0' then
                    case address(3 downto 0) is
                        when "0000" =>
                            rd_data_buf <= (others => '0');
                            rd_data_buf(0) <= iena;
                        when "0001" =>
                            rd_data_buf <= (others => '0');
                            rd_data_buf(intr_count-1 downto 0) <= imask;
                        when "0010" =>
                            rd_data_buf <= (others => '0');
                            rd_data_buf(intr_count-1 downto 0) <= ipend;
                        when "0011" =>
                            rd_data_buf <= (others => '0');
                            rd_data_buf(intr_count_bits-1 downto 0) <= isrc;
                        when others => null;
                    end case;
                else
                    vec_rdena <= '1';
                    vec_rdaddr <= address(intr_count_bits-1 downto 0);
                end if;
			end if;
			if wr = '1' then
                if address(intr_count_bits) = '0' then
                    case address(3 downto 0) is
                        when "0000" =>
                            iena <= wr_data(0);
                        when "0001" =>
                            imask <= wr_data(intr_count-1 downto 0);
                        when "0010" =>
                            for i in 0 to intr_count-1 loop
                                if wr_data(i) = '1' then
                                    ipend(i) <= '0' or intrsrc(i);
                                end if;
                            end loop;  -- i
                        when others => null;
                    end case;
                else
                    intr_vecs(to_integer(unsigned(address(intr_count_bits-1 downto 0))))
                        <= wr_data(work.core_pack.ADDR_WIDTH+1 downto 2);
                end if;
			end if;
		end if;
	end process sync;
	
    rdvec: process (intr_vecs, vec_rdaddr)
    begin  -- process rdvec
        vec_rddata <= intr_vecs(to_integer(unsigned(vec_rdaddr)));
    end process rdvec;
    
end rtl;
