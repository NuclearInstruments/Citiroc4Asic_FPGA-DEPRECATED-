----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2016 12:17:27
-- Design Name: 
-- Module Name: adc_sync - Behavioral
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

entity adc_sync is
    Port ( 
        clk : in std_logic;
        start_delay : in std_logic;
        start_bitsleep : in std_logic;
        bitsleep : out std_logic_vector(16 downto 0);
        probe_data : in  std_logic_vector (13 downto 0);
        adc_frame : in std_logic_vector (13 downto 0);
        serdes_delay : out std_logic_vector(7 downto 0);
        serdes_dprog : out std_logic;
        obit_locked : out std_logic;
        initialized : out std_logic
    );
end adc_sync;

architecture Behavioral of adc_sync is
        signal sm_df : std_logic_vector(3 downto 0) := x"0";
        signal sm_dfd : std_logic_vector(3 downto 0) := x"0";
        signal sm_dfa : std_logic_vector(3 downto 0) := x"0";
        signal block_delay : std_logic_vector(7 downto 0) := x"00";
        signal df_delay : std_logic_vector(15 downto 0) := x"0000";       
        signal word_probe : integer := 0;
        
        signal left_locked :std_logic := '0';
        signal right_locked :std_logic := '0';
        signal left_lock :  std_logic_vector(7 downto 0) := x"00";
        signal right_lock :  std_logic_vector(7 downto 0) := x"00";
        signal program_delay : std_logic := '0';
        signal error_counter : integer := 0;
        signal bit_locked : std_logic := '0';
        signal bitsleep1 : std_logic_vector(16 downto 0);
        
        signal delay_bitsleep : std_logic_vector(15 downto 0) := x"0000";
        signal bl_cnt : std_logic_vector (3 downto 0) := x"0";
        signal bllok : std_logic_vector (3 downto 0) := x"0";
        signal start_bitsleep2 : std_logic := '0';
        
        signal istart_delay : std_logic := '0';
        signal iistart_delay : std_logic := '0';
        
        signal iinitialized : std_logic := '0';
        
        signal BLSlock_counter : integer := 0;
        
        signal sstart_bitsleep : std_logic;
        signal ssstart_bitsleep : std_logic;
                
        attribute keep : string;
        
        attribute keep of sm_df: signal is "true";
        attribute keep of sm_dfd: signal is "true";
        attribute keep of sm_dfa: signal is "true";
        
        attribute keep of block_delay: signal is "true";
        attribute keep of left_locked: signal is "true";
        attribute keep of right_locked: signal is "true";
        attribute keep of left_lock: signal is "true";

        attribute keep of right_lock: signal is "true";
begin

        initialized <= iinitialized;
        obit_locked <= bit_locked;
        serdes_delay <= block_delay;
        serdes_dprog <= program_delay;
        
        bitsleep <=bitsleep1;
        
        find_correct_delay : process(clk)
            variable delay_val : std_logic_vector(7 downto 0) := x"00";
        begin
            if rising_edge(clk) then
                istart_delay <= start_delay;
                iistart_delay <= istart_delay;
                program_delay <= '0';
                case sm_df is
                    when x"0" =>
                    
                        if istart_delay = '1' and iistart_delay = '0' then   --inizia la ricerca verso sinistra (decrementa il delay)
                            block_delay <= x"08";
                            program_delay <= '1';
                            df_delay <= x"000F";
                            sm_dfd <= x"E";
                            sm_df <= x"F";
                            sm_dfa <= x"1";
                            word_probe <= 0;
                            error_counter <= 0;
                            left_locked <= '0';
                            right_locked <= '0';
                        end if;
            
                    when x"1" =>
                        if error_counter = 0 then                 --non ci sono stati errori
                            left_locked <= '1';
                            if block_delay /= x"00" then            --non sono a delay 0
                                block_delay <= block_delay -1;
                                program_delay <= '1';
                                df_delay <= x"000F";
                                sm_dfd <= x"E";
                                sm_df <= x"F";
                                sm_dfa <= x"1";
                                word_probe <= 0;
                                error_counter <= 0;
                            else
                                sm_df <= x"2";
                                left_lock <= x"00";
                            end if;
                        else                                            --ci sono stati errori
                            if left_locked ='1' then                    --mi sono loccato, stop verso  sinistra    
                                sm_df <= x"2";                  
                                left_lock <= block_delay+1;
                            else                                        --non mi sono acora loccato, vai verso sinistra
                                block_delay <= block_delay -1;
                                program_delay <= '1';
                                df_delay <= x"000F";
                                sm_dfd <= x"E";
                                sm_df <= x"F";
                                sm_dfa <= x"1";
                                word_probe <= 0;
                                error_counter <= 0;
                            end if;
                        end if;
                        
                        
            
                    when x"2" =>
                        if left_locked = '1' then                           --cerca l'unlock veros destra
                            block_delay <= left_lock+1;
                            program_delay <= '1';
                            df_delay <= x"000F";
                            sm_dfd <= x"E";
                            sm_df <= x"F";
                            sm_dfa <= x"3";
                            word_probe <= 0;
                            error_counter <= 0;           
                        else                                                --cerca il primo lock verso destra e poi prosegui cercando l'unlock
                            block_delay <= x"0F";
                            program_delay <= '1';
                            df_delay <= x"000F";
                            sm_dfd <= x"E";
                            sm_df <= x"F";
                            sm_dfa <= x"4";
                            word_probe <= 0;
                            error_counter <= 0;
                        end if;
                         
                    when x"3" =>
                        if error_counter = 0 then
                            if block_delay /= x"1F" then
                                block_delay <= block_delay +1;
                                program_delay <= '1';
                                df_delay <= x"000F";
                                sm_dfd <= x"E";
                                sm_df <= x"F";
                                sm_dfa <= x"3";
                                word_probe <= 0;
                                error_counter <= 0;                                
                            else
                                right_lock <= x"1F";
                                sm_df <= x"A";
                                right_locked <= '1';
                            end if;
                        else
                            right_lock <= block_delay -1;
                            sm_df <= x"A";      
                            right_locked <= '1';                     
                        end if;
                    
                    when x"4" =>
                        if error_counter = 0 then
                            if block_delay /= x"1F" then
                                sm_df <= x"A";      
                                right_locked <= '0'; 
                            else
                                 block_delay <= block_delay +1;
                                 left_lock <= block_delay +1;
                                 left_locked <= '1';
                               
                                 program_delay <= '1';
                                 df_delay <= x"000F";
                                 sm_dfd <= x"E";
                                 sm_df <= x"F";
                                 sm_dfa <= x"5";
                                 word_probe <= 0;
                                 error_counter <= 0;                                 
                            end if;                         
                        else
                            if block_delay /= x"1F" then
                                block_delay <= block_delay +1;
                                program_delay <= '1';
                                df_delay <= x"000F";
                                sm_dfd <= x"E";
                                sm_df <= x"F";
                                sm_dfa <= x"4";
                                word_probe <= 0;
                                error_counter <= 0;
                            else
                                sm_df <= x"A";      
                                right_locked <= '0';
                            end if;                          
                        end if;                                            
                    
                    when x"5" =>
                        if error_counter = 0 then
                            if block_delay /= x"1F" then
                                sm_df <= x"A";      
                                right_locked <= '1';
                                right_lock <= x"1F"; 
                            else
                                 block_delay <= block_delay +1;
                                 program_delay <= '1';
                                 df_delay <= x"000F";
                                 sm_dfd <= x"E";
                                 sm_df <= x"F";
                                 sm_dfa <= x"5";
                                 word_probe <= 0;
                                 error_counter <= 0;                                 
                            end if;                             
                        else
                            right_locked <= '1';
                            right_lock <= block_delay -1;
                            sm_df <= x"A";
                        end if;
                    
                    when x"A" =>
                        if right_locked = '1' and left_locked = '1' then
                            delay_val := right_lock + left_lock;
                            block_delay <="0" & delay_val(7 downto 1);
                            program_delay <= '1';
                            df_delay <= x"000F";
                            sm_dfd <= x"E";
                            sm_df <= x"F";
                            sm_dfa <= x"B";
                            word_probe <= 0;
                            error_counter <= 0;   
                        end if;
                
                    when x"B" =>
                        if error_counter = 0 then
                            bit_locked <= '1';
                            start_bitsleep2 <= '1';
                            sm_df <= x"C";
                        else
                            bit_locked <= '0';
                        end if;
                        
                    when x"C" =>
                        start_bitsleep2 <= '0';
                        sm_df <= x"0";
                    when x"E" =>
                        if word_probe = 10000 then
                            sm_df <= sm_dfa;
                        else
                            word_probe <= word_probe +1;
                             if  probe_data = "01010101010101" or probe_data = "10101010101010" then
--                            if  probe_data = "10101011010101" or
--                                probe_data = "11010101101010" or
--                                probe_data = "01101010110101" or
--                                probe_data = "10110101011010" or
--                                probe_data = "01011010101101" or
--                                probe_data = "10101101010110" or
--                                probe_data = "01010110101011" then
                                
                             else
                                error_counter <= error_counter +1;     
                             end if;   
                        end if;                        
            
                    when x"F" =>
                        if df_delay = x"0000" then
                            sm_df <= sm_dfd;
                        else
                            df_delay <= df_delay -1;
                        end if;
                   when others =>   
                    sm_df <= x"0";
                    
                   end case;
            end if;
        
        end process;
        
        
        blsync : process (clk)
        begin
            if rising_edge (clk) then
                --start_bitsleep2 <= start_bitsleep;
                sstart_bitsleep <= start_bitsleep;
                ssstart_bitsleep <= sstart_bitsleep; 
                bitsleep1 <= "00000000000000000";
                case bllok is
                    when x"0" =>
                       if ssstart_bitsleep = '1' then
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
                            bitsleep1 <= "11111111111111111";
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
                      iinitialized <= '1';
                    when others =>
                    
                end case;  
                
            end if;
        end process;


end Behavioral;

