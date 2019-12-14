----------------------------------------------------------------------------------
-- Company:     Nuclear Instruments
-- Engineer:    Andrea Abba
-- 
-- Create Date: 28.01.2019 09:17:08
-- Design Name: SciCompiler
-- Module Name: PulseGenerator 
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Generate periodic pulse
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

entity PULSE_GENERATOR is
    Port ( 
        RESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CLK : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        PULSE_WIDTH : IN STD_LOGIC_VECTOR (31 downto 0);
        PULSE_PERIOD : IN STD_LOGIC_VECTOR (31 downto 0);
        PULSE_OUT : OUT STD_LOGIC_VECTOR (0 DOWNTO 0)
    );
end PULSE_GENERATOR;

architecture Behavioral of PULSE_GENERATOR is
    signal TimeCounter : STD_LOGIC_VECTOR (31 downto 0);
begin
    
    TCP : process (CLK(0))
    begin
        if RESET = "1" then
			TimeCounter <= (others => '0');
			PULSE_OUT <= "0";
        elsif rising_edge(CLK(0)) and CE="1" then
            
            TimeCounter <= TimeCounter +1;
            if TimeCounter >= PULSE_PERIOD then
                TimeCounter <= (others => '0');
				PULSE_OUT <= "0";
            else
                if or_reduce(TimeCounter) = '0' then
                    PULSE_OUT <= "1";
                else
                    if TimeCounter >= PULSE_WIDTH then
                        PULSE_OUT <= "0";
                    end if;
                end if; 
            end if;
        
        end if;
    
    end process;

end Behavioral;
