library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_misc.all;
use ieee.math_real.all;

Library xpm;
use xpm.vcomponents.all;

entity TimestampGenerator is
    Generic (   nbits : integer := 32);
    Port ( 
           T0 : in STD_LOGIC;
           ClkCounter : in STD_LOGIC;
           Clk_Read : in STD_LOGIC;
           timestamp : out STD_LOGIC_VECTOR (nbits-1 downto 0));
end TimestampGenerator;

architecture Behavioral of TimestampGenerator is
	signal InternalCounter : std_logic_Vector (nbits-1 downto 0) := (others => '0');
	signal InternalReset : std_logic;
begin

	CounterProcess : process (ClkCounter)
	begin
		if InternalReset = '1' then
			InternalCounter <= (others => '0');
		elsif rising_edge(ClkCounter) then
			InternalCounter <= InternalCounter +1;
		end if;
	end process;

	
	small_counter : if nbits<33 generate
		xpm_cdc_gray_inst_1: xpm_cdc_gray
		generic map (
		-- Common module generics
			DEST_SYNC_FF => 4, -- integer; range: 2-10
			SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
			SIM_LOSSLESS_GRAY_CHK => 0, -- integer; 0=disable lossless check, 1=enable lossless check
			WIDTH => nbits -- integer; range: 2-32
		)
		port map (
			src_clk => ClkCounter,
			src_in_bin => InternalCounter,
			dest_clk => Clk_Read,
			dest_out_bin => timestamp
		);
	end generate small_counter;
	
	big_counter : if nbits>32 generate
		xpm_cdc_gray_inst_1: xpm_cdc_gray
		generic map (
		-- Common module generics
			DEST_SYNC_FF => 4, -- integer; range: 2-10
			SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
			SIM_LOSSLESS_GRAY_CHK => 0, -- integer; 0=disable lossless check, 1=enable lossless check
			WIDTH => 32 -- integer; range: 2-32
		)
		port map (
			src_clk => ClkCounter,
			src_in_bin => InternalCounter(31 downto 0),
			dest_clk => Clk_Read,
			dest_out_bin => timestamp(31 downto 0)
		);
		
		xpm_cdc_gray_inst_2: xpm_cdc_gray
		generic map (
		-- Common module generics
			DEST_SYNC_FF => 4, -- integer; range: 2-10
			SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
			SIM_LOSSLESS_GRAY_CHK => 0, -- integer; 0=disable lossless check, 1=enable lossless check
			WIDTH => nbits-32 -- integer; range: 2-32
		)
		port map (
			src_clk => ClkCounter,
			src_in_bin => InternalCounter(nbits-1 downto 32),
			dest_clk => Clk_Read,
			dest_out_bin => timestamp(nbits-1 downto 32)
		);		
	end generate big_counter;	
	
	-- End of


	xpm_cdc_async_rst_inst: xpm_cdc_async_rst
	generic map (
	-- Common module parameters
	DEST_SYNC_FF => 2, -- integer; range: 2-10
	RST_ACTIVE_HIGH => 1 -- integer; 0=active low reset, 1=active high reset
	)
	port map (
		src_arst => T0,
		dest_clk => ClkCounter,
		dest_arst => InternalReset
	);


end Behavioral;