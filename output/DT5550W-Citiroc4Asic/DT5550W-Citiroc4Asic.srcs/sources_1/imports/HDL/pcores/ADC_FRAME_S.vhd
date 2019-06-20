----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.07.2018 16:22:20
-- Design Name: 
-- Module Name: ADC_FRAME_S - Behavioral
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


Library UNISIM;
use UNISIM.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADC_FRAME_S is
    Port ( clk : in STD_LOGIC;
           adc_frame : in STD_LOGIC_VECTOR (13 downto 0);
           bitsleep : out STD_LOGIC;
           start_bitsleep : in STD_LOGIC;
           locked : out STD_LOGIC);
end ADC_FRAME_S;

architecture Behavioral of ADC_FRAME_S is
       signal delay_bitsleep : std_logic_vector(15 downto 0) := x"0000";
       signal bl_cnt : std_logic_vector (3 downto 0) := x"0";
       signal bllok : std_logic_vector (3 downto 0) := x"0";
        
       signal BLSlock_counter : integer := 0;
       
       signal sstart_bitsleep : std_logic;
       signal ssstart_bitsleep : std_logic;
       
begin
blsync : process (clk)
        begin
            if rising_edge (clk) then
                --start_bitsleep2 <= start_bitsleep;
                sstart_bitsleep <= start_bitsleep;
                ssstart_bitsleep <= sstart_bitsleep; 
                bitsleep <= '0';
                case bllok is
                    when x"0" =>
                       if ssstart_bitsleep = '1' and sstart_bitsleep= '0' then
                            locked <= '0';
                            bllok <= x"1";
                            delay_bitsleep <= x"FF00";
                            BLSlock_counter <= 1000; 
                        end if;                  
                    
                    when x"1" =>
                        if delay_bitsleep = x"FFFF" then
                            bllok <= x"2";
                        else
                            delay_bitsleep <= delay_bitsleep +1;
                        end if;

                    when x"2" =>
                        --if adc_frame = "00000001111111" then
                        if adc_frame = "11111110000000" then
                            if BLSlock_counter= 0 then
                                bllok <= x"F";
                            else
                                BLSlock_counter <= BLSlock_counter -1;
                            end if;
                            
                        else
                            bitsleep <= '1';
                            BLSlock_counter <= 1000;
                            bllok <= x"3";
                            bl_cnt <= x"0";
                        end if;    
                    
                    when x"3" =>
                        if bl_cnt = x"F" then
                            bllok <= x"2";
                        else
                            bl_cnt <= bl_cnt +1;
                        end if;
                        
                    
                    when x"F" =>
                      locked <= '1';
                      bllok <= x"0";
                    when others =>
                    
                end case;  
                
            end if;
        end process;


end Behavioral;
