-- Generated file, do not edit!
package config is

	-- (assumed) core clock frequency
	constant CLOCK_FREQ : integer := 66666667;

	-- PLL configuration
	constant PLL_INFREQ : real := 50.000;
	constant PLL_MUL : integer := 4;
	constant PLL_DIV : integer := 3;
    
	-- number of clusters
	constant CLUSTERS : integer := 4;

	-- floating-point support
	constant ENABLE_SINGLE : boolean := true;
	constant ENABLE_DOUBLE : boolean := true;
	
	-- branch target buffer size
	constant ENABLE_BTB : boolean := true;
	constant BTB_SIZE : integer := 8;

	-- width of pc, determines size of method cache
	constant PC_WIDTH : integer := 15;
	-- method cache properties
	constant ICACHE_BLOCK_BITS : integer := 5;
	constant ICACHE_BLOCKS     : integer := 2**5;

	-- data cache properties
	constant DM_ADDR_WIDTH	  : integer := 10;
	constant FA_ADDR_WIDTH	  : integer := 8;
	constant FA_LINE_BITS	  : integer := 3;
	constant FA_FAST_LINES	  : integer := 2;
	constant STACK_ADDR_WIDTH : integer := 10;

end config;
