----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.03.2018 17:52:01
-- Design Name: 
-- Module Name: CITIROCAnalogMonitor - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Library xpm;
use xpm.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CITIROCAnalogReadout is
    Generic (   CLKDIV : integer := 160;
                TRIGGER_HOLD_DELAY : integer := 10
    );
    Port (  
            clk : in STD_LOGIC;
			reject_data : in std_logic;
			reset : in STD_LOGIC;
            TRIG : in STD_LOGIC;
			ADC_IN_LG : in STD_LOGIC_VECTOR (15 downto 0);
			ADC_IN_HG : in STD_LOGIC_VECTOR (15 downto 0);
			CHARGE_HIT_in : in STD_LOGIC;
            chrage_srin_a : out STD_LOGIC;
            chrage_sr_resetb : out STD_LOGIC;
            chrage_clk_a : out STD_LOGIC;
            raz_chn : out STD_LOGIC;
			val_evnt : out STD_LOGIC;
            hold_hg  : out STD_LOGIC;
            hold_lg  : out STD_LOGIC;
			
			
			
			M_ENERGY_LG : out STD_LOGIC_VECTOR (15 downto 0);
			M_ENERGY_HG : out STD_LOGIC_VECTOR (15 downto 0);
			M_CLK : out STD_LOGIC_VECTOR (0 downto 0);
			M_DIN : out STD_LOGIC_VECTOR (0 downto 0);
			
			S_CHID : out STD_LOGIC_VECTOR (4 downto 0);
			S_ENERGY_LG : out STD_LOGIC_VECTOR (15 downto 0);
			S_ENERGY_HG : out STD_LOGIC_VECTOR (15 downto 0);
			S_HIT : out STD_LOGIC_VECTOR (0 downto 0);
			S_DV : out STD_LOGIC_VECTOR (0 downto 0);

			P_ENERGY_0_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_0_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_0 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_1_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_1_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_1 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_2_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_2_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_2 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_3_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_3_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_3 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_4_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_4_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_4 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_5_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_5_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_5 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_6_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_6_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_6 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_7_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_7_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_7 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_8_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_8_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_8 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_9_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_9_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_9 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_10_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_10_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_10 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_11_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_11_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_11 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_12_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_12_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_12 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_13_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_13_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_13 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_14_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_14_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_14 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_15_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_15_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_15 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_16_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_16_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_16 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_17_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_17_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_17 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_18_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_18_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_18 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_19_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_19_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_19 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_20_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_20_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_20 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_21_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_21_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_21 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_22_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_22_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_22 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_23_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_23_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_23 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_24_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_24_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_24 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_25_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_25_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_25 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_26_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_26_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_26 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_27_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_27_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_27 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_28_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_28_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_28 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_29_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_29_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_29 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_30_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_30_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_30 : out STD_LOGIC_VECTOR (0 downto 0);
			P_ENERGY_31_LG : out STD_LOGIC_VECTOR (15 downto 0);
			P_ENERGY_31_HG : out STD_LOGIC_VECTOR (15 downto 0);
			P_HIT_31 : out STD_LOGIC_VECTOR (0 downto 0);			
			P_DV : out STD_LOGIC_VECTOR (0 downto 0);

			P_FRAME_ACK : in STD_LOGIC_VECTOR (0 downto 0);
			P_FRAME_DV : out STD_LOGIC_VECTOR (0 downto 0);
			P_FRAME_DATA : out STD_LOGIC_VECTOR (1023 downto 0);
			
			CHIP_TEMP : out STD_LOGIC_VECTOR (15 downto 0);
			
			TS_IN : in STD_LOGIC_VECTOR (63 downto 0);
			TS0_IN : in STD_LOGIC_VECTOR (31 downto 0);
			TS_OUT : out STD_LOGIC_VECTOR (63 downto 0);
			TS0_OUT : out STD_LOGIC_VECTOR (31 downto 0);


			BUSY : out STD_LOGIC_VECTOR (0 downto 0)
    );
end CITIROCAnalogReadout;

architecture Behavioral of CITIROCAnalogReadout is
    
    signal iEnable : std_logic;
    signal iAnalogOnly : std_logic;
	signal start_c_raz : std_logic_vector (7 downto 0) := x"FF";
	type BUFFER_AN is array (0 to 35) of std_logic_vector(15 downto 0);
	signal BUFFER_DATA_LG : BUFFER_AN;
	signal BUFFER_DATA_HG : BUFFER_AN;
	signal BUFFER_HIT : std_logic_vector (34 downto 0);
	signal I : integer range 0 to 35 := 0;
	signal  ADC_FILTERED_LG : std_logic_vector(15 downto 0);
	signal  ADC_FILTERED_HG : std_logic_vector(15 downto 0);
	
	signal ichrage_srin_a: STD_LOGIC;
    signal ichrage_clk_a : STD_LOGIC;

begin
    chrage_srin_a <= ichrage_srin_a;
    chrage_clk_a <= ichrage_clk_a;
    M_ENERGY_LG <= ADC_FILTERED_LG;
    M_ENERGY_HG <= ADC_FILTERED_HG;
    
    M_CLK(0) <= ichrage_clk_a;
    M_DIN(0) <= ichrage_srin_a;

 ANALOG_READOUT : block
        signal BLKSM : std_logic_vector (3 downto 0) := x"0";
        signal iA_trigger_logic : std_logic;
        signal oA_trigger_logic : std_logic;
        signal counter : integer;
        signal bitcounter : integer;
        
        signal filterMem_LG : BUFFER_AN;
        signal filterMem_HG : BUFFER_AN;
        
        signal accumulator_LG : std_logic_vector (23 downto 0) := (others => '0');
        signal accumulator_HG : std_logic_vector (23 downto 0) := (others => '0');
        signal skip : std_logic := '0';
    begin
        ANALOG_SM : process(clk)
        begin
			if reset = '1' then
				start_c_raz <= x"06";
				BLKSM <= x"0";
				P_DV <= "0";
				S_DV <= "0";
				BUSY <= "0";	
				ichrage_srin_a <= '0';
                ichrage_clk_a  <= '0';
				raz_chn <= '0';
				val_evnt <= '0';			
				accumulator_LG <= (others => '0');
				accumulator_HG <= (others => '0');	
            elsif rising_edge(clk) then
				P_DV <= "0";
				
                S_DV <= "0";
                val_evnt <= '1';
                
                iA_trigger_logic <= TRIG;
                oA_trigger_logic <= iA_trigger_logic;
                
                filterMem_LG(0) <= ADC_IN_LG;
                for Z in 1 to 32 loop
                    filterMem_LG(Z) <= filterMem_LG(Z-1);
                end loop;
                accumulator_LG <= accumulator_LG + ext(filterMem_LG(0),24) - ext(filterMem_LG(31),24);

                filterMem_HG(0) <= ADC_IN_HG;
                for Z in 1 to 32 loop
                    filterMem_HG(Z) <= filterMem_HG(Z-1);
                end loop;
                accumulator_HG <= accumulator_HG + ext(filterMem_HG(0),24) - ext(filterMem_HG(31),24);

                  
                ADC_FILTERED_LG <=  accumulator_LG(16+5-1 downto 5);
                ADC_FILTERED_HG <=  accumulator_HG(16+5-1 downto 5);
                
                case BLKSM is
                
                    when x"0" =>
                        raz_chn <= '0';
                        BUSY <= "0";
                        ichrage_clk_a  <= '0';
                        hold_hg <= '0';
                        hold_lg <= '0';
                        chrage_sr_resetb <= '1';
                        if iA_trigger_logic = '1' and oA_trigger_logic = '0'  then
                            BUSY <= "1";
                            BLKSM <= x"1";
                            counter <= TRIGGER_HOLD_DELAY;
                            bitcounter <= 32;
                            I <= 0;
							TS0_OUT <= TS0_IN;
							TS_OUT <= TS_IN;
                        else
							if iA_trigger_logic ='1' then
							 raz_chn <= '1';
							end if; 
                        end if;
                    
                    when x"1" =>
                        if counter = 0 then
                            hold_hg <= '1';
                            hold_lg <= '1';
                            BLKSM <= x"2";
                        else
                            counter <= counter -1;
                        end if;           
                        
                   when x"2" =>
                        chrage_sr_resetb <= '0';
                        counter <= 4;
                        BLKSM <= x"3";
                                                                  
                   when x"3" =>
                        if counter = 0 then
                            chrage_sr_resetb <= '1';
                            BLKSM <= x"4";
                        else
                            counter <= counter -1;
                        end if;           
                
                   when x"4" =>
                        BLKSM <= x"5";
                        
                   when x"5" =>
                        BLKSM <= x"6";
                        ichrage_srin_a <= '1';
                        ichrage_clk_a  <= '0';
                        counter <= CLKDIV;
                        
                   when x"6" =>
                        if counter = 0 then
                            ichrage_clk_a  <= '1';
                            counter <= CLKDIV;    
                            BLKSM <= x"7";    
                        else
                            counter <= counter - 1;
                        end if;
                        
                   when x"7" =>
                        if counter = 0 then
                           ichrage_clk_a  <= '0';
                           ichrage_srin_a <= '0';
                           counter <= CLKDIV;    
                           BLKSM <= x"8";    
                       else
                           counter <= counter - 1;
                       end if;
                   
                   when x"8" =>
                        if counter = 0 then
                            ichrage_clk_a  <= '1';
                            counter <= CLKDIV;
                            
                            BUFFER_DATA_LG(I) <= ADC_FILTERED_LG;
                            BUFFER_DATA_HG(I) <= ADC_FILTERED_HG;
                            BUFFER_HIT(I) <= CHARGE_HIT_in;
                            I <= I + 1;
                            if I < 32 then                              --Acquisizione standardard
                                S_ENERGY_LG <= ADC_FILTERED_LG;
                                S_ENERGY_HG <= ADC_FILTERED_HG;
                                S_HIT(0) <= CHARGE_HIT_in;
                                S_CHID <= conv_std_logic_vector(I,5);
                                S_DV <= "1";
                                BLKSM <= x"7";
                            else
                                if I=32 then                            --Temperatura
                                    CHIP_TEMP <= ADC_FILTERED_LG;
                                    BLKSM <= x"7";
                                else
                                    if I= 33 then                       --Ciclo dummy
                                        BLKSM <= x"7";
                                    else
                                        BLKSM <= x"9";                 --Uscita
                                    end if;
                                end if;
                            end if;                               
                                
                        else
                            counter <= counter - 1;
                        end if;                       
                   
                   when x"9" =>
                       hold_hg <= '0';
                       hold_lg <= '0';
                       BLKSM <= x"A";
                       
                       start_c_raz <= x"06";
                       
                       P_ENERGY_0_LG <= BUFFER_DATA_LG(0);
                       P_ENERGY_0_HG <= BUFFER_DATA_HG(0);
                       P_HIT_0(0) <= BUFFER_HIT(0);
                       P_ENERGY_1_LG <= BUFFER_DATA_LG(1);
                       P_ENERGY_1_HG <= BUFFER_DATA_HG(1);
                       P_HIT_1(0) <= BUFFER_HIT(1);
                       P_ENERGY_2_LG <= BUFFER_DATA_LG(2);
                       P_ENERGY_2_HG <= BUFFER_DATA_HG(2);
                       P_HIT_2(0) <= BUFFER_HIT(2);
                       P_ENERGY_3_LG <= BUFFER_DATA_LG(3);
                       P_ENERGY_3_HG <= BUFFER_DATA_HG(3);
                       P_HIT_3(0) <= BUFFER_HIT(3);
                       P_ENERGY_4_LG <= BUFFER_DATA_LG(4);
                       P_ENERGY_4_HG <= BUFFER_DATA_HG(4);
                       P_HIT_4(0) <= BUFFER_HIT(4);
                       P_ENERGY_5_LG <= BUFFER_DATA_LG(5);
                       P_ENERGY_5_HG <= BUFFER_DATA_HG(5);
                       P_HIT_5(0) <= BUFFER_HIT(5);
                       P_ENERGY_6_LG <= BUFFER_DATA_LG(6);
                       P_ENERGY_6_HG <= BUFFER_DATA_HG(6);
                       P_HIT_6(0) <= BUFFER_HIT(6);
                       P_ENERGY_7_LG <= BUFFER_DATA_LG(7);
                       P_ENERGY_7_HG <= BUFFER_DATA_HG(7);
                       P_HIT_7(0) <= BUFFER_HIT(7);
                       P_ENERGY_8_LG <= BUFFER_DATA_LG(8);
                       P_ENERGY_8_HG <= BUFFER_DATA_HG(8);
                       P_HIT_8(0) <= BUFFER_HIT(8);
                       P_ENERGY_9_LG <= BUFFER_DATA_LG(9);
                       P_ENERGY_9_HG <= BUFFER_DATA_HG(9);
                       P_HIT_9(0) <= BUFFER_HIT(9);
                       P_ENERGY_10_LG <= BUFFER_DATA_LG(10);
                       P_ENERGY_10_HG <= BUFFER_DATA_HG(10);
                       P_HIT_10(0) <= BUFFER_HIT(10);
                       P_ENERGY_11_LG <= BUFFER_DATA_LG(11);
                       P_ENERGY_11_HG <= BUFFER_DATA_HG(11);
                       P_HIT_11(0) <= BUFFER_HIT(11);
                       P_ENERGY_12_LG <= BUFFER_DATA_LG(12);
                       P_ENERGY_12_HG <= BUFFER_DATA_HG(12);
                       P_HIT_12(0) <= BUFFER_HIT(12);
                       P_ENERGY_13_LG <= BUFFER_DATA_LG(13);
                       P_ENERGY_13_HG <= BUFFER_DATA_HG(13);
                       P_HIT_13(0) <= BUFFER_HIT(13);
                       P_ENERGY_14_LG <= BUFFER_DATA_LG(14);
                       P_ENERGY_14_HG <= BUFFER_DATA_HG(14);
                       P_HIT_14(0) <= BUFFER_HIT(14);
                       P_ENERGY_15_LG <= BUFFER_DATA_LG(15);
                       P_ENERGY_15_HG <= BUFFER_DATA_HG(15);
                       P_HIT_15(0) <= BUFFER_HIT(15);
                       P_ENERGY_16_LG <= BUFFER_DATA_LG(16);
                       P_ENERGY_16_HG <= BUFFER_DATA_HG(16);
                       P_HIT_16(0) <= BUFFER_HIT(16);
                       P_ENERGY_17_LG <= BUFFER_DATA_LG(17);
                       P_ENERGY_17_HG <= BUFFER_DATA_HG(17);
                       P_HIT_17(0) <= BUFFER_HIT(17);
                       P_ENERGY_18_LG <= BUFFER_DATA_LG(18);
                       P_ENERGY_18_HG <= BUFFER_DATA_HG(18);
                       P_HIT_18(0) <= BUFFER_HIT(18);
                       P_ENERGY_19_LG <= BUFFER_DATA_LG(19);
                       P_ENERGY_19_HG <= BUFFER_DATA_HG(19);
                       P_HIT_19(0) <= BUFFER_HIT(19);
                       P_ENERGY_20_LG <= BUFFER_DATA_LG(20);
                       P_ENERGY_20_HG <= BUFFER_DATA_HG(20);
                       P_HIT_20(0) <= BUFFER_HIT(20);
                       P_ENERGY_21_LG <= BUFFER_DATA_LG(21);
                       P_ENERGY_21_HG <= BUFFER_DATA_HG(21);
                       P_HIT_21(0) <= BUFFER_HIT(21);
                       P_ENERGY_22_LG <= BUFFER_DATA_LG(22);
                       P_ENERGY_22_HG <= BUFFER_DATA_HG(22);
                       P_HIT_22(0) <= BUFFER_HIT(22);
                       P_ENERGY_23_LG <= BUFFER_DATA_LG(23);
                       P_ENERGY_23_HG <= BUFFER_DATA_HG(23);
                       P_HIT_23(0) <= BUFFER_HIT(23);
                       P_ENERGY_24_LG <= BUFFER_DATA_LG(24);
                       P_ENERGY_24_HG <= BUFFER_DATA_HG(24);
                       P_HIT_24(0) <= BUFFER_HIT(24);
                       P_ENERGY_25_LG <= BUFFER_DATA_LG(25);
                       P_ENERGY_25_HG <= BUFFER_DATA_HG(25);
                       P_HIT_25(0) <= BUFFER_HIT(25);
                       P_ENERGY_26_LG <= BUFFER_DATA_LG(26);
                       P_ENERGY_26_HG <= BUFFER_DATA_HG(26);
                       P_HIT_26(0) <= BUFFER_HIT(26);
                       P_ENERGY_27_LG <= BUFFER_DATA_LG(27);
                       P_ENERGY_27_HG <= BUFFER_DATA_HG(27);
                       P_HIT_27(0) <= BUFFER_HIT(27);
                       P_ENERGY_28_LG <= BUFFER_DATA_LG(28);
                       P_ENERGY_28_HG <= BUFFER_DATA_HG(28);
                       P_HIT_28(0) <= BUFFER_HIT(28);
                       P_ENERGY_29_LG <= BUFFER_DATA_LG(29);
                       P_ENERGY_29_HG <= BUFFER_DATA_HG(29);
                       P_HIT_29(0) <= BUFFER_HIT(29);
                       P_ENERGY_30_LG <= BUFFER_DATA_LG(30);
                       P_ENERGY_30_HG <= BUFFER_DATA_HG(30);
                       P_HIT_30(0) <= BUFFER_HIT(30);
                       P_ENERGY_31_LG <= BUFFER_DATA_LG(31);
                       P_ENERGY_31_HG <= BUFFER_DATA_HG(31);
                       P_HIT_31(0) <= BUFFER_HIT(31);
                       P_DV <= "1";                           
                    
					   P_FRAME_DATA <=	"000" & BUFFER_HIT(0) & BUFFER_DATA_LG(0)(13 DOWNTO 0) & BUFFER_DATA_HG(0)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(1) & BUFFER_DATA_LG(1)(13 DOWNTO 0) & BUFFER_DATA_HG(1)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(2) & BUFFER_DATA_LG(2)(13 DOWNTO 0) & BUFFER_DATA_HG(2)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(3) & BUFFER_DATA_LG(3)(13 DOWNTO 0) & BUFFER_DATA_HG(3)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(4) & BUFFER_DATA_LG(4)(13 DOWNTO 0) & BUFFER_DATA_HG(4)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(5) & BUFFER_DATA_LG(5)(13 DOWNTO 0) & BUFFER_DATA_HG(5)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(6) & BUFFER_DATA_LG(6)(13 DOWNTO 0) & BUFFER_DATA_HG(6)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(7) & BUFFER_DATA_LG(7)(13 DOWNTO 0) & BUFFER_DATA_HG(7)(13 DOWNTO 0) &
                                            
                                            "000" & BUFFER_HIT(8) & BUFFER_DATA_LG(8)(13 DOWNTO 0) & BUFFER_DATA_HG(8)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(9) & BUFFER_DATA_LG(9)(13 DOWNTO 0) & BUFFER_DATA_HG(9)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(10) & BUFFER_DATA_LG(10)(13 DOWNTO 0) & BUFFER_DATA_HG(10)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(11) & BUFFER_DATA_LG(11)(13 DOWNTO 0) & BUFFER_DATA_HG(11)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(12) & BUFFER_DATA_LG(12)(13 DOWNTO 0) & BUFFER_DATA_HG(12)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(13) & BUFFER_DATA_LG(13)(13 DOWNTO 0) & BUFFER_DATA_HG(13)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(14) & BUFFER_DATA_LG(14)(13 DOWNTO 0) & BUFFER_DATA_HG(14)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(15) & BUFFER_DATA_LG(15)(13 DOWNTO 0) & BUFFER_DATA_HG(15)(13 DOWNTO 0) &
                                            
                                            "000" & BUFFER_HIT(16) & BUFFER_DATA_LG(16)(13 DOWNTO 0) & BUFFER_DATA_HG(16)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(17) & BUFFER_DATA_LG(17)(13 DOWNTO 0) & BUFFER_DATA_HG(17)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(18) & BUFFER_DATA_LG(18)(13 DOWNTO 0) & BUFFER_DATA_HG(18)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(19) & BUFFER_DATA_LG(19)(13 DOWNTO 0) & BUFFER_DATA_HG(19)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(20) & BUFFER_DATA_LG(20)(13 DOWNTO 0) & BUFFER_DATA_HG(20)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(21) & BUFFER_DATA_LG(21)(13 DOWNTO 0) & BUFFER_DATA_HG(21)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(22) & BUFFER_DATA_LG(22)(13 DOWNTO 0) & BUFFER_DATA_HG(22)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(23) & BUFFER_DATA_LG(23)(13 DOWNTO 0) & BUFFER_DATA_HG(23)(13 DOWNTO 0) &
                                            
                                            "000" & BUFFER_HIT(24) & BUFFER_DATA_LG(24)(13 DOWNTO 0) & BUFFER_DATA_HG(24)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(25) & BUFFER_DATA_LG(25)(13 DOWNTO 0) & BUFFER_DATA_HG(25)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(26) & BUFFER_DATA_LG(26)(13 DOWNTO 0) & BUFFER_DATA_HG(26)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(27) & BUFFER_DATA_LG(27)(13 DOWNTO 0) & BUFFER_DATA_HG(27)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(28) & BUFFER_DATA_LG(28)(13 DOWNTO 0) & BUFFER_DATA_HG(28)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(29) & BUFFER_DATA_LG(29)(13 DOWNTO 0) & BUFFER_DATA_HG(29)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(30) & BUFFER_DATA_LG(30)(13 DOWNTO 0) & BUFFER_DATA_HG(30)(13 DOWNTO 0) &
                                            "000" & BUFFER_HIT(31) & BUFFER_DATA_LG(31)(13 DOWNTO 0) & BUFFER_DATA_HG(31)(13 DOWNTO 0);
							
							P_FRAME_DV <= "1";			
								
                    when x"A" =>
                        if start_c_raz = x"00" then
                                raz_chn <= '0';
                                BLKSM <= x"B";
                                start_c_raz <= x"1F";
                                --val_evnt <= '1';
                        else
                                if start_c_raz = x"06" then
                                    raz_chn <= '0';
                                  --  val_evnt <= '0';
                                else
                                    if start_c_raz = x"04" then
                                        raz_chn <= '1';
                                    else
                                        if start_c_raz = x"02" then
                                            raz_chn <= '0';
                                        end if;
                                    end if;
                                end if;
                                    start_c_raz <= start_c_raz -1; 
                        end if;
                    when x"B" =>     --dead time
                        if start_c_raz = x"00" then
                            BLKSM <= x"0";
                        else
                            start_c_raz <= start_c_raz -1; 
                        end if;                   
					when others =>
                        BLKSM <= x"0";
              end case;
    
                if reject_data ='1' then
                    BLKSM <= x"A"; 
                    start_c_raz <= x"06";                                    --avvia la procedura di reset dell'ASIC
                end if;

				if P_FRAME_ACK ="1" then
					P_FRAME_DV <= "0";				
				end if;
            end if;
        end process;
    end block;
end Behavioral;
