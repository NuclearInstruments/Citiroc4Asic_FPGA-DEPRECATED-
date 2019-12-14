----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:41:57 12/12/2007 
-- Design Name: 
-- Module Name:    spi_timing_module - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity spi_timing_module is
	Generic (clock_speed : integer := 50 )
	;
    Port ( clock_in : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clock_out : out  STD_LOGIC);
end spi_timing_module;

architecture Behavioral of spi_timing_module is
constant 	divisore : integer := (clock_speed * 1000000) / 20000000; -- 10Mhz
signal 	contatore : integer range 0 to 127;

begin

divisore_low_freq_clock : process (clock_in, reset)
begin
	if reset = '1' then
		contatore <= 0;
		
	elsif rising_edge(clock_in) then
		contatore <= contatore +1;
	
		if contatore = (divisore * 2) -1 then
			contatore <= 0;
		end if;
		
	end if;
	
end process;

generatore_low_freq_clock : process (clock_in, reset)
begin
	if reset = '1' then
		clock_out <= '0';
		
	elsif rising_edge(clock_in) then
	
		if contatore = 0 then
			clock_out <= '0';
		elsif contatore = divisore then
			clock_out <= '1';
		end if;
		
	end if;
	
end process;

end Behavioral;

