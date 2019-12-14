----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2019 14:56:09
-- Design Name: 
-- Module Name: TOF_Spectrum - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.math_real.all;

Library xpm;
use xpm.vcomponents.all;


entity MCRateMeter is
Generic (CHANNEL_COUNT : integer := 128;
            CLK_FREQ : integer := 160000000
          );
    Port (  clk : in STD_LOGIC;
           trigger : in STD_LOGIC_VECTOR (CHANNEL_COUNT-1 downto 0);
           VETO: IN STD_LOGIC_VECTOR (0 downto 0);
		   READ_ADDRESS: IN STD_LOGIC_VECTOR (15 downto 0);
           READ_DATA: OUT STD_LOGIC_VECTOR (31 downto 0);
           READ_DATAVALID: OUT STD_LOGIC_VECTOR (0 downto 0);
		   CLK_READ: IN STD_LOGIC_VECTOR (0 downto 0)
           );
end MCRateMeter;

architecture Behavioral of MCRateMeter is
    type t_COUNTERS is array (0 to CHANNEL_COUNT-1) of std_logic_vector(31 downto 0);    
    signal RUNTIME_COUNTERS : t_COUNTERS ;
    signal STATIC_COUNTERS : t_COUNTERS ;
	signal STATIC_COUNTERS_READ : t_COUNTERS ;
    signal sec_pulse : std_logic := '0';
    signal sec_counter : integer := 0;
    signal o_TRIGGER : std_logic_vector (CHANNEL_COUNT-1 downto 0);
    signal i_TRIGGER : std_logic_vector (CHANNEL_COUNT-1 downto 0);
    
begin

	READ_DATAVALID <= "1";
    READ_DATA <= STATIC_COUNTERS_READ(conv_integer(READ_ADDRESS));
    
    sec_pulse_gen : process( clk )
    begin
        if rising_edge(clk) then
            if sec_counter = CLK_FREQ then
               sec_pulse <= '1';
               sec_counter <= 0;
            else
               sec_counter <= sec_counter +1;
               sec_pulse <= '0'; 
            end if;
        end if;
    end process;

CPS_GENERATE:
   for I in 0 to CHANNEL_COUNT-1 generate
      begin
      
	  SYNC_WORD_CPS: xpm_cdc_array_single
	  generic map (

		-- Common module generics
		DEST_SYNC_FF   => 4, -- integer; range: 2-10
		INIT_SYNC_FF   => 0, -- integer; 0=disable simulation init values, 1=enable simulation init values
		SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
		SRC_INPUT_REG  => 1, -- integer; 0=do not register input, 1=register input
		WIDTH          => 32  -- integer; range: 1-1024

	  )
	  port map (

		src_clk  => clk,  -- optional; required when SRC_INPUT_REG = 1
		src_in   => STATIC_COUNTERS(I),
		dest_clk => CLK_READ(0),
		dest_out => STATIC_COUNTERS_READ(I)
	  );


        cps_counters : process( clk )
          begin
              if rising_edge(clk) then
                i_TRIGGER(I) <= trigger(I);
                o_TRIGGER(I) <= i_TRIGGER(I);
                if sec_pulse = '1' then
                    STATIC_COUNTERS(I) <= RUNTIME_COUNTERS(I);
                    RUNTIME_COUNTERS(I) <= (others => '0');
                else
					if VETO(0) ='0' then
						if o_TRIGGER(I) = '0' and  i_TRIGGER(I) = '1' then
							RUNTIME_COUNTERS(I) <= RUNTIME_COUNTERS(I) +1;
						end if;
					end if;
                end if;
              end if;
          end process;
    
   end generate;
    
end Behavioral;
