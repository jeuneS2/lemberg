-- DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity bootrom is
generic (addr_width : integer);
port (clk     : in std_logic;
	address : in std_logic_vector(addr_width-1 downto 0);
	rd      : in std_logic;
	rd_data : out std_logic_vector(31 downto 0);
	rdy_cnt : out unsigned(1 downto 0));
end bootrom;
architecture rtl of bootrom is
	signal a : std_logic_vector(7 downto 0);
	signal d : std_logic_vector(31 downto 0);
begin
process(a) begin
	case a is
		when X"00" => d <= X"0000000a";
		when X"01" => d <= X"17800000";
		when X"02" => d <= X"03173ffe";
		when X"03" => d <= X"60020000";
		when others => d <= (others => '0');
	end case;
end process;
process(clk) begin
	if rising_edge(clk) then
		if rd = '1' then
			a <= address;
		end if;
		rd_data <= d;
		rdy_cnt <= '0' & rd;
	end if;
end process;
end rtl;
