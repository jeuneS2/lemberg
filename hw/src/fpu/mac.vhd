-----------------------------------------------------------------------
-- This file is in the public domain. It is free of copyright
-- restrictions, and may be used for whatever purpose is needed.
-- Written by Wolfgang Puffitsch
-- Based on code by David W. Bishop
-----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.float_pkg.all;

use work.core_pack.all;

entity mac is

	generic (
		fraction_width : integer := float_fraction_width;
		exponent_width : integer := float_exponent_width;
		stages : integer := 7);
	
	port (
		clk	    : in  std_logic;
		reset   : in  std_logic;
		ena     : in  std_logic;
		rddataA : in  float(exponent_width downto -fraction_width);
		rddataB : in  float(exponent_width downto -fraction_width);
		rddataC : in  float(exponent_width downto -fraction_width);
		result  : out float(exponent_width downto -fraction_width));

end mac;

architecture behavior of mac is

--	attribute multstyle : string;
--	attribute multstyle of behavior : architecture is "logic";
	
	-- computation registers
	signal r, l, c : float(exponent_width downto -fraction_width);

	constant round_style : round_type := float_round_style;  -- rounding option
	constant guard       : NATURAL    := float_guard_bits;  -- number of guard bits
	constant check_error : BOOLEAN    := float_check_error;  -- check for errors
	constant denormalize : BOOLEAN    := float_denormalize;  -- Use IEEE extended FP

	-- pipelining registers
	signal result_mux_reg : std_logic_vector(stages-1 downto 0);
	type result_pipe_type is array (stages-1 downto 0)
		of float(exponent_width downto -fraction_width);
	signal mac_result_reg : result_pipe_type;

	signal fractl_reg, fractr_reg  : UNSIGNED (fraction_width downto 0);
	signal fractx_reg, fractx_reg1 : UNSIGNED (fraction_width+guard downto 0);
	signal fractc_reg, fracts_reg  : UNSIGNED (fraction_width+1+guard downto 0);
	signal exponl_reg, exponr_reg  : SIGNED (exponent_width-1 downto 0);
	signal exponc_reg, exponc_reg1 : SIGNED (exponent_width-1 downto 0);

	signal rexpon_reg : SIGNED (exponent_width+1 downto 0);
	signal rexpon2_reg, rexpon2_reg1, rexpon2_reg2 : SIGNED (exponent_width+1 downto 0);
	signal rfract_reg : UNSIGNED ((2*(fraction_width))+1 downto 0);
	signal shiftx_reg : SIGNED (exponent_width+1 downto 0);
	signal shifty_reg : INTEGER; 

	signal ufract_reg, ufract_reg1 : UNSIGNED (fraction_width+1+guard downto 0);

	signal fp_sign_reg,
		fp_sign_reg1, fp_sign_reg2,
		fp_sign_reg3, fp_sign_reg4 : STD_ULOGIC;
	signal c_sign_reg, c_sign_reg1, c_sign_reg2 : STD_ULOGIC;
	signal leftright_reg : boolean;

	signal sticky_reg, sticky_reg1, sticky_reg2 : STD_ULOGIC;

begin  -- behavior

	assert stages = 7 or stages = 6
		report "Only 6 or 7-stage pipeline supported" severity failure;

	-- Multiply accumulate  result = l*r + c
	sync: process (clk, reset)

		variable lfptype, rfptype, cfptype : valid_fpstate;

		variable fractl, fractr            : UNSIGNED (fraction_width downto 0);  -- fractions
		variable fractx                    : UNSIGNED (fraction_width+guard downto 0);
		variable fractc, fracts            : UNSIGNED (fraction_width+1+guard downto 0);
		variable rfract                    : UNSIGNED ((2*(fraction_width))+1 downto 0);  -- result fraction
		variable sfract, ufract            : UNSIGNED (fraction_width+1+guard downto 0);  -- result fraction
		variable exponl, exponr, exponc    : SIGNED (exponent_width-1 downto 0);  -- exponents
		variable rexpon, rexpon2           : SIGNED (exponent_width+1 downto 0);  -- result exponent
		variable shifty                    : INTEGER;      -- denormal shift
		variable shiftx                    : SIGNED (rexpon'range);  -- shift fractions
		variable fp_sign                   : STD_ULOGIC;  -- sign of result
		variable signl, signr, signc       : STD_ULOGIC;
		variable lresize, rresize          : UNRESOLVED_float (exponent_width downto -fraction_width);
		variable cresize                   : UNRESOLVED_float (exponent_width downto -fraction_width - guard);
		variable leftright                 : BOOLEAN;     -- left or right used
		variable sticky                    : STD_ULOGIC;  -- Holds precision for rounding

	begin  -- process compute
		if clk'event and clk = '1' then  -- rising clock edge
			if ena = '1' then

				-- latch input pins
				r <= rddataA;
				l <= rddataB;
				c <= rddataC;

				----------------------------------------------------------------
				-- PIPE 1
				----------------------------------------------------------------				
				if (fraction_width = 0 or l'length < 7 or r'length < 7 or c'length < 7) then
					lfptype := isx;
				else
					lfptype := classfp (l, check_error);
					rfptype := classfp (r, check_error);
					cfptype := classfp (c, check_error);
				end if;

				-- remember which result to use at the end of the pipeline
				result_mux_reg(stages-1 downto 1) <= result_mux_reg(stages-2 downto 0);
				result_mux_reg(0) <= '1';
				
				----------------------------------------------------------------
				-- special cases, where we know the result immediately
				----------------------------------------------------------------
				if (lfptype = isx or rfptype = isx or cfptype = isx) then
					mac_result_reg(0) <= (others => 'X');
				elsif (lfptype = nan or lfptype = quiet_nan or
					   rfptype = nan or rfptype = quiet_nan or
					   cfptype = nan or cfptype = quiet_nan) then
					-- Return quiet NAN, IEEE754-1985-7.1,1
					mac_result_reg(0) <= qnanfp (fraction_width => fraction_width,
												 exponent_width => exponent_width);
				elsif (((lfptype = pos_inf or lfptype = neg_inf) and
						(rfptype = pos_zero or rfptype = neg_zero)) or
					   ((rfptype = pos_inf or rfptype = neg_inf) and
						(lfptype = pos_zero or lfptype = neg_zero))) then  -- 0 * inf
					-- Return quiet NAN, IEEE754-1985-7.1,3
					mac_result_reg(0) <= qnanfp (fraction_width => fraction_width,
												 exponent_width => exponent_width);
				elsif (lfptype = pos_inf or rfptype = pos_inf
					   or lfptype = neg_inf or rfptype = neg_inf  -- x * inf = inf
					   or cfptype = neg_inf or cfptype = pos_inf) then  -- x + inf = inf
					mac_result_reg(0) <= pos_inffp (fraction_width => fraction_width,
													exponent_width => exponent_width);
					-- figure out the sign
					mac_result_reg(0)(exponent_width) <= l(l'high) xor r(r'high);
				else
					result_mux_reg(0) <= '0';
				end if;

				-- pass early result through pipeline
				mac_result_reg(stages-1 downto 1) <= mac_result_reg(stages-2 downto 0);

				----------------------------------------------------------------
				-- here comes the real stuff
				----------------------------------------------------------------
				
				lresize := resize (arg            => to_x01(l),
								   exponent_width => exponent_width,
								   fraction_width => fraction_width,
								   denormalize_in => denormalize,
								   denormalize    => denormalize);
				lfptype := classfp (lresize, false);        -- errors already checked
				rresize := resize (arg            => to_x01(r),
								   exponent_width => exponent_width,
								   fraction_width => fraction_width,
								   denormalize_in => denormalize,
								   denormalize    => denormalize);
				rfptype := classfp (rresize, false);        -- errors already checked
				cresize := resize (arg            => to_x01(c),
								   exponent_width => exponent_width,
								   fraction_width => -cresize'low,
								   denormalize_in => denormalize,
								   denormalize    => denormalize);
				cfptype := classfp (cresize, false);        -- errors already checked
				break_number (
					arg         => lresize,
					denormalize => denormalize,
					fract       => fractl,
					expon       => exponl,
					sign        => signl);
				break_number (
					arg         => rresize,
					denormalize => denormalize,
					fract       => fractr,
					expon       => exponr,
					sign        => signr);
				break_number (
					arg         => cresize,
					denormalize => denormalize,
					fract       => fractx,
					expon       => exponc,
					sign        => signc);

				fp_sign := signl xor signr;  -- figure out the sign
				
				if (rfptype = pos_denormal or rfptype = neg_denormal) then
					shifty := fraction_width - find_leftmost(fractr, '1');
					fractr := shift_left (fractr, shifty);
				elsif (lfptype = pos_denormal or lfptype = neg_denormal) then
					shifty := fraction_width - find_leftmost(fractl, '1');
					fractl := shift_left (fractl, shifty);
				else
					shifty := 0;
					-- Note that a denormal number * a denormal number is always zero.
				end if;

				----------------------------------------------------------------
				-- PIPE 2
				----------------------------------------------------------------
				exponc_reg <= exponc;
				exponl_reg <= exponl;
				exponr_reg <= exponr;
				fractl_reg <= fractl;
				fractr_reg <= fractr;
				fractx_reg <= fractx;
				shifty_reg <= shifty;
				fp_sign_reg <= fp_sign;
				c_sign_reg <= signc;
				
				-- multiply
				rfract := fractl_reg * fractr_reg; -- Multiply the fraction
				-- add the exponents
				rexpon := resize (exponl_reg, rexpon'length) + exponr_reg - shifty_reg + 1;
				shiftx := rexpon - exponc_reg;

				----------------------------------------------------------------
				-- PIPE 3
				----------------------------------------------------------------
				shiftx_reg <= shiftx;
				rexpon_reg <= rexpon;
				rfract_reg <= rfract;

				exponc_reg1 <= exponc_reg;
				fractx_reg1 <= fractx_reg;
				fp_sign_reg1 <= fp_sign_reg;
				c_sign_reg1 <= c_sign_reg;
				
				if shiftx_reg < -fractl'high then
					rexpon2 := resize (exponc_reg1, rexpon2'length);
					fractc  := "0" & fractx_reg1;
					fracts  := (others => '0');
					leftright := false;
					sticky  := or_reduce (rfract_reg);
				elsif shiftx_reg < 0 then
					rexpon2   := resize (exponc_reg1, rexpon2'length);
					fracts := shift_right (rfract_reg (rfract_reg'high downto rfract_reg'high
													   - fracts'length+1),
										   to_integer(-shiftx_reg));
					fractc    := "0" & fractx_reg1;
					leftright := false;

					--sticky := or_reduce (rfract_reg (to_integer(shiftx_reg)+rfract_reg'high
					--                             - fracts'length downto 0));
					sticky := '0';
					for i in rfract_reg'high downto 0 loop
						if i <= to_integer(-shiftx_reg)+rfract_reg'high-fracts'length then
							sticky := sticky or rfract_reg(i);				
						end if;
					end loop;  -- i
				elsif shiftx_reg = 0 then
					rexpon2 := resize (exponc_reg1, rexpon2'length);
					if rfract_reg (rfract_reg'high downto
								   rfract_reg'high - fractc'length+1) < fractx_reg1
					then
						fractc := "0" & fractx_reg1;
						fracts := rfract_reg (rfract_reg'high downto rfract_reg'high
											  - fracts'length+1);
						leftright := false;
					else
						fractc := rfract_reg (rfract_reg'high downto rfract_reg'high
											  - fractc'length+1);
						fracts    := "0" & fractx_reg1;
						leftright := true;
					end if;
					sticky  := or_reduce (rfract_reg (rfract_reg'high - fractc'length downto 0));
				elsif shiftx_reg > fractx_reg1'high then
					rexpon2   := rexpon_reg;
					fracts    := (others => '0');
					fractc    := rfract_reg (rfract_reg'high downto
											 rfract_reg'high - fractc'length+1);
					leftright := true;
					sticky := or_reduce (fractx_reg1 & rfract_reg (rfract_reg'high - fractc'length
																   downto 0));
				else                              -- fractx_reg1'high > shiftx_reg > 0
					rexpon2   := rexpon_reg;
					fracts    := "0" & shift_right (fractx_reg1, to_integer (shiftx_reg));
					fractc    := rfract_reg (rfract_reg'high downto
											 rfract_reg'high - fractc'length+1);
					leftright := true;
					--sticky := or_reduce (fractx_reg1 (to_integer (shiftx_reg) downto 0)
					--                     & rfract_reg (rfract_reg'high - fractc'length downto 0));
					sticky := '0';
					for i in fractx_reg1'high downto 0 loop
						if i <= to_integer(shiftx_reg) then
							sticky := sticky or fractx_reg1(i);				
						end if;
					end loop;  -- i
					sticky := sticky
							  or or_reduce(rfract_reg(rfract_reg'high - fractc'length downto 0));
				end if;

				fracts (0) := fracts (0) or sticky;  -- Or the sticky bit into the LSB

				----------------------------------------------------------------
				-- PIPE 4
				----------------------------------------------------------------
				rexpon2_reg <= rexpon2;
				fracts_reg <= fracts;
				fractc_reg <= fractc;			
				c_sign_reg2 <= c_sign_reg1;
				fp_sign_reg2 <= fp_sign_reg1;
				leftright_reg <= leftright;
				sticky_reg <= sticky;				
				
				if fp_sign_reg2 = c_sign_reg2 then
					ufract  := fractc_reg + fracts_reg;
					fp_sign := fp_sign_reg2;
				else                                    -- signs are different
					ufract := fractc_reg - fracts_reg;  -- always positive result
					if leftright_reg then               -- Figure out which sign to use
						fp_sign := fp_sign_reg2;
					else
						fp_sign := c_sign_reg2;
					end if;
				end if;

				----------------------------------------------------------------
				-- PIPE 5
				----------------------------------------------------------------
				if stages = 7 then

					ufract_reg <= ufract;
					rexpon2_reg1 <= rexpon2_reg;
					fp_sign_reg3 <= fp_sign;
					sticky_reg1 <= sticky_reg;
					
					----------------------------------------------------------------
					-- PIPE 6, necessary only for doubles
					----------------------------------------------------------------
					ufract_reg1 <= ufract_reg;
					rexpon2_reg2 <= rexpon2_reg1;
					fp_sign_reg4 <= fp_sign_reg3;
					sticky_reg2 <= sticky_reg1;

				else
					
					ufract_reg1 <= ufract;
					rexpon2_reg2 <= rexpon2_reg;
					fp_sign_reg4 <= fp_sign;
					sticky_reg2 <= sticky_reg;

				end if;

				----------------------------------------------------------------
				-- PIPE 6/7
				----------------------------------------------------------------
				-- normalize
				result <= normalize (fract          => ufract_reg1,
									 expon          => rexpon2_reg2,
									 sign           => fp_sign_reg4,
									 sticky         => sticky_reg2,
									 fraction_width => fraction_width,
									 exponent_width => exponent_width,
									 round_style    => round_style,
									 denormalize    => denormalize,
									 nguard         => guard);

				-- choose correct result
				if result_mux_reg(stages-1) = '1' then
					result <= mac_result_reg(stages-1);
				end if;
				
			end if;
		end if;
	end process sync;

end behavior;
