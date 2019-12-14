----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2016 19:06:35
-- Design Name: 
-- Module Name: adcs_top - Behavioral
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

Library xpm;
use xpm.vcomponents.all;

Library UNISIM;
use UNISIM.vcomponents.all;

entity adcs_top is
    Generic (test_mode :  STD_LOGIC := '0');
    Port (  
          Reset : in std_logic;
          sCLK_100 : in std_logic;
          
          SMADC_1_RESET : out STD_LOGIC;
          
          ADC_1_CLK_A_P : in STD_LOGIC;
          ADC_1_CLK_A_N : in STD_LOGIC;
          
          ADC_1_FRAME_A_P : in STD_LOGIC;
          ADC_1_FRAME_A_N : in STD_LOGIC;
          
          ADC_1_DATA_A_P: in STD_LOGIC_VECTOR(7 downto 0);
          ADC_1_DATA_A_N: in STD_LOGIC_VECTOR(7 downto 0);
          
          ADC_1_DATA_B_P: in STD_LOGIC_VECTOR(7 downto 0);
          ADC_1_DATA_B_N: in STD_LOGIC_VECTOR(7 downto 0);
          
          SMADC_1_CSA : out std_logic;
          SMADC_1_CSB : out std_logic;
          SMADC_1_CLK : out std_logic;
          SMADC_1_MOSI : out std_logic;
          
          READOUT_CLK : in STD_LOGIC;
          ADC_CLK_OUT : out STD_LOGIC;
          
          CH0 : out std_logic_vector (15 downto 0);
          CH1 : out std_logic_vector (15 downto 0);
          CH2 : out std_logic_vector (15 downto 0);
          CH3 : out std_logic_vector (15 downto 0);                                            
          CH4 : out std_logic_vector (15 downto 0);
          CH5 : out std_logic_vector (15 downto 0);
          CH6 : out std_logic_vector (15 downto 0);
          CH7 : out std_logic_vector (15 downto 0);
          
          CHv0_7 : out STD_LOGIC;
         
          inversion : in std_logic_vector(7 downto 0);
          
          ADC_STATUS : out STD_LOGIC_VECTOR(11 downto 0);
          ADC_READY : out STD_LOGIC
                  
          );
end adcs_top;

architecture Behavioral of adcs_top is
    component clk_wiz_0
    port
    (  
     signal clk_out1 : out std_logic;
     signal clk_out2 : out std_logic;
     signal clk_out3 : out std_logic;
     signal clk_out4 : out std_logic;
     signal clk_out5 : out std_logic;
     signal reset : in std_logic;
     signal locked : out std_logic;
     signal clk_in1  :  in std_logic
    );
    end component;
        
    
    component adc_interface 
        Generic (ADC_A_INV : std_logic_vector(7 downto 0) := x"00";
                 ADC_B_INV : std_logic_vector(7 downto 0) := x"00";
                 ADC_CLK_INV : std_logic := '0';
                 IODELAY_GROUP_NAME : string := "ADC_DESER_group"
        );    
        Port ( clock_ref : in STD_LOGIC;
               locked_dcmref : in STD_LOGIC;
               SMADC_1_RESET : out STD_LOGIC;
               sCLK_25 : in std_logic;
               
             
               ADC_BUS_CLK_A_P : in STD_LOGIC;
               ADC_BUS_CLK_A_N : in STD_LOGIC;
               
               ADC_BUS_FRAME_A_P : in STD_LOGIC;
               ADC_BUS_FRAME_A_N : in STD_LOGIC;
               
               ADC_BUS_DATA_A_P: in STD_LOGIC_VECTOR(7 downto 0);
               ADC_BUS_DATA_A_N: in STD_LOGIC_VECTOR(7 downto 0);
               
               ADC_BUS_DATA_B_P: in STD_LOGIC_VECTOR(7 downto 0);
               ADC_BUS_DATA_B_N: in STD_LOGIC_VECTOR(7 downto 0);
               
               eDATA_OUT: out STD_LOGIC_VECTOR((14*8)-1 downto 0);
               eEMPTY : out STD_LOGIC;
               eCLK : in STD_LOGIC;
               eREAD : in STD_LOGIC;
               ADC_CLK_OUT : out STD_LOGIC;
                  
               start_delay : IN std_logic ;
               bit_locked1 : OUT std_logic ;
               initialized1 : OUT std_logic ;
               start_bitsleep : IN std_logic;
                 

               serdes_ioreset : IN std_logic;
               serdes_delayreset : IN std_logic;
               serdes_reset : IN std_logic;
               serdes1_delaylock : OUT std_logic 
    
               );
    end component;
    
    
    
    
    signal locked_dcmref : std_logic := '0';
    signal clock_ref : std_logic;       
    
    signal clock_ref1 : std_logic; 
    signal clock_ref2 : std_logic; 
    signal clock_ref3 : std_logic; 
    signal clock_ref4 : std_logic;                  
    signal clk25 : std_logic;
    
    signal ADC_CS : std_logic;
    
   
    
    SIGNAL  eDATA_OUT1 : STD_LOGIC_VECTOR((14*8)-1 downto 0);
    SIGNAL  eEMPTY1    : STD_LOGIC := '0';
    SIGNAL  eREAD1     : STD_LOGIC := '0';
    
 
             
    attribute keep : string; 
    
    
    attribute keep of eEMPTY1: signal is "true";   

    
    
    signal iCH0 :  std_logic_vector (15 downto 0);
    signal iCH1 :  std_logic_vector (15 downto 0);
    signal iCH2 :  std_logic_vector (15 downto 0);
    signal iCH3 :  std_logic_vector (15 downto 0);                                            
    signal iCH4 :  std_logic_vector (15 downto 0);
    signal iCH5 :  std_logic_vector (15 downto 0);
    signal iCH6 :  std_logic_vector (15 downto 0);
    signal iCH7 :  std_logic_vector (15 downto 0);
  
    
    signal serdes_ioreset : std_logic := '0';
    signal serdes_delayreset : std_logic := '0';
    signal serdes_reset : std_logic := '0';
    
        signal SMADC_CS :  std_logic_vector(3 downto 0) := "1111";

    signal start_delay : std_logic := '0';
    signal start_bitsleep : std_logic := '0';
    signal bit_locked1 : std_logic := '0';
    signal initialized1 :std_logic := '0';
    signal bit_locked2 : std_logic := '0';
    signal initialized2 :std_logic := '0';
    signal bit_locked3 : std_logic := '0';
    signal initialized3 :std_logic := '0';
    signal bit_locked4 : std_logic := '0';
    signal initialized4 :std_logic := '0';
    
    SIGNAL serdes1_delaylock :  std_logic := '0'; 
    SIGNAL serdes2_delaylock :  std_logic := '0';
    SIGNAL serdes3_delaylock :  std_logic := '0';
    SIGNAL serdes4_delaylock :  std_logic := '0';
    
    signal ay_ADC_READY : STD_LOGIC;
    
     
     signal ay_ADC_STATUS :  STD_LOGIC_VECTOR(12 downto 0);
     signal s_ADC_STATUS :  STD_LOGIC_VECTOR(12 downto 0);  
begin


   dcm_ref: clk_wiz_0
port map
 (
   clk_out1 => clock_ref1,
   clk_out2 => clock_ref2,
   clk_out3 => clk25,
   clk_out4 => clock_ref3,
   clk_out5 => clock_ref4,
   reset => '0',
   locked =>locked_dcmref ,
   clk_in1  => sCLK_100
 );
 
 
 
 
 
     SMADC_1_CSA <= SMADC_CS(0);
     SMADC_1_CSB <= SMADC_CS(0);
     
     
 aaprog: block
         signal SMADC : std_logic_vector(3 downto 0) := x"0";
         signal SMADCnew : std_logic_vector(3 downto 0) := x"0";
         signal SMADCwordwrite : std_logic_vector(23 downto 0) := x"000000";
         signal SMID : integer :=0;
         signal idx : integer := 0;
         signal SMdelay : std_logic_vector(15 downto 0);
         signal ramp_counter : std_logic_vector(13 downto 0):= (others => '0');
         signal ramp_next : std_logic;
         signal delay_end : integer ;
         signal sbitlock1 : std_logic;
         signal ssbitlock1 : std_logic;
         signal sinitialized1 : std_logic;
         signal ssinitialized1 : std_logic;
         signal sbitlock2 : std_logic;
         signal ssbitlock2 : std_logic;
         signal sinitialized2 : std_logic;
         signal ssinitialized2 : std_logic;
         signal sbitlock3 : std_logic;
         signal ssbitlock3 : std_logic;
         signal sinitialized3 : std_logic;
         signal ssinitialized3 : std_logic;
         signal sbitlock4 : std_logic;
         signal ssbitlock4 : std_logic;
         signal sinitialized4 : std_logic;
         signal ssinitialized4 : std_logic;
         
         SIGNAL WATCH_DOG : INTEGER;
         SIGNAL WATCH_DOG_arm : STD_LOGIC := '0';
         
         signal sserdes1_delaylock : std_logic;
         signal sSserdes1_delaylock : std_logic;
         signal sserdes2_delaylock : std_logic;
         signal sSserdes2_delaylock : std_logic;
         signal sserdes3_delaylock : std_logic;
         signal sSserdes3_delaylock : std_logic;
         signal sserdes4_delaylock : std_logic;
         signal sSserdes4_delaylock : std_logic;

         attribute keep of ramp_next: signal is "true";
         attribute keep of ramp_counter: signal is "true";
         
          signal SMADC_CS_CTRL :  std_logic_vector(3 downto 0) := "1111";
            
            signal reset_counter : integer :=0;
            signal reset_sm : std_logic_vector(3 downto 0) := x"0";
            signal reset_sm_d : std_logic_vector(3 downto 0) := x"0";
            signal delay_rs : std_logic_vector(15 downto 0) := x"0000";    
            signal reset_clkref_dcm : std_logic := '0';
         
             
            signal adc_programmed : std_logic := '0';  
           
     begin
     

      reset_process : process(clk25)
          begin
                if Reset = '1' then
                    start_delay <= '0';
                    reset_sm<= x"0";
              elsif rising_edge(clk25) then
              sserdes1_delaylock <= serdes1_delaylock;
              ssserdes1_delaylock <= sserdes1_delaylock;
              sserdes2_delaylock <= serdes2_delaylock;
              ssserdes2_delaylock <= sserdes2_delaylock;
              sserdes3_delaylock <= serdes3_delaylock;
              ssserdes3_delaylock <= sserdes3_delaylock;
              sserdes4_delaylock <= serdes4_delaylock;
              ssserdes4_delaylock <= sserdes4_delaylock;
              
                  case reset_sm is
                      when x"0" =>
                          start_delay <= '0';
                          reset_clkref_dcm <= '1';
                          delay_rs <= x"000F";
                          reset_sm_d <= x"1";
                          reset_sm <= x"F";
                       
                      when x"1" =>
                          reset_clkref_dcm <= '0';
                          if locked_dcmref = '1' and adc_programmed = '1' then
                              reset_sm <= x"2";
                          end if;
                          
                      when x"2" =>
                          serdes_ioreset <= '1';
                          delay_rs <= x"000F";
                          reset_sm_d <= x"3";
                          reset_sm <= x"F";
                      when x"3" =>
                          serdes_ioreset <= '0';
                          delay_rs <= x"003F";
                          reset_sm_d <= x"4";
                          reset_sm <= x"F";
                      when x"4" =>
                         serdes_delayreset <= '1';
                         delay_rs <= x"000F";
                         reset_sm_d <= x"5";
                         reset_sm <= x"F";               
                      when x"5" =>
                         serdes_delayreset <= '0';
                         delay_rs <= x"003F";
                         reset_sm_d <= x"6";
                          reset_sm <= x"F";
                      when x"6" =>
                         serdes_reset <= '1';
                         delay_rs <= x"000F";
                         reset_sm_d <= x"7";
                         reset_sm <= x"F";
                      when x"7" =>
                         serdes_reset <= '0';
                         delay_rs <= x"003F";
                         reset_sm_d <= x"8";                                                                    
                         reset_sm <= x"F";
                      when x"8" =>
                         if ssserdes1_delaylock = '1' then
                           start_delay <= '1';
                         end if;
                         
                         IF adc_programmed = '0' THEN
                            reset_sm <= x"0";
                         END IF;
                          
                      when x"F" =>
                          if delay_rs = x"0000" then
                              reset_sm <= reset_sm_d;
                          else
                              delay_rs <= delay_rs-1;
                          end if;
                      when others =>
                        reset_sm <= x"0";
                    end case;
              end  if;
          
          end process;
     
         
              
         programmachine : process (clk25) 
         begin
             if Reset = '1' then
                            
                             SMADC<= x"0";
                             SMID <=0;
                       elsif rising_edge(clk25) then
             sbitlock1 <= bit_locked1;
             ssbitlock1 <= sbitlock1;
             sinitialized1<= initialized1;
             ssinitialized1<= sinitialized1;
             sbitlock2 <= bit_locked2;
             ssbitlock2 <= sbitlock2;
             sinitialized2<= initialized2;
             ssinitialized2<= sinitialized2;
             sbitlock3 <= bit_locked3;
             ssbitlock3 <= sbitlock3;
             sinitialized3<= initialized3;
             ssinitialized3<= sinitialized3;
             sbitlock4 <= bit_locked4;
             ssbitlock4 <= sbitlock4;
             sinitialized4<= initialized4;
             ssinitialized4<= sinitialized4;

             ramp_next <= '0';
                 case SMADC is
                     
                     when x"0" =>
                         SMADC_CS <= "1111";
                         SMADC_1_MOSI <= '1';
                         idx <= 0;
                         case SMID is
                             when 0 =>
                                 adc_programmed <= '0';
                                 ay_ADC_READY <= '0'; 
                                 SMADC <= x"F";
                                 SMADCnew <= x"0";
                                 SMdelay <= x"03FF";                        
                                 SMID <= SMID +1;
                                 SMADC_1_RESET <= '1';
                                 start_bitsleep <= '0';
                                 WATCH_DOG <= 25000000;
                                 WATCH_DOG_arm <= '1';
                             when 1 =>
                                 --SMADCwordwrite <= X"000001";
                                 SMADC_1_RESET <= '0';
                                 SMID <= SMID +1;
                                 --SMADC <= x"1";
                             when 2 =>
                                 SMADC <= x"F";
                                 SMADCnew <= x"0";
                                 SMdelay <= x"FFFF";                        
                                 SMID <= SMID +1;                                                            
                             when 3 =>
                                 SMADCwordwrite <= X"46A409";
                                 SMADC_CS_CTRL <= "0000";
                                 SMID <= SMID +1;
                                 SMADC <= x"1";
                             when 4 =>
                                 SMADCwordwrite <= X"2880FF";
                                 SMADC_CS_CTRL <= "0000";
                                 SMID <= SMID +1;
                                 SMADC <= x"1";
                             when 5 =>
                                 SMADCwordwrite <= X"450001";
                                 SMADC_CS_CTRL <= "0000";
                                 SMID <= SMID +1;
                                 SMADC <= x"1";

                             when 6 =>
                                 SMADCwordwrite <= X"420060";
                                 SMADC_CS_CTRL <= "0100";                                 
                                 SMID <= SMID +1;
                                 SMADC <= x"1";

 
                             when 7 =>
                                 adc_programmed <= '1'; 
                                 
                                 if ssbitlock1 = '1' then --and initialized2 = '1'  then
                                     delay_end <= 90000;
                                     SMID <= SMID +1;
                                 end if;
                             when 8=>
                                 if delay_end = 0 then
                                     SMADCwordwrite <= X"450000";
                                     SMADC_CS_CTRL <= "0000";
                                     SMID <= SMID +1;
                                     SMADC <= x"1";
                                 else
                                     delay_end <= delay_end -1;
                                 end if;
                                 
                             when 9=>
                                 if delay_end = 0 then
                                     SMADCwordwrite <= X"26F800";
                                     SMADC_CS_CTRL <= "0000";
                                     SMID <= SMID +1;
                                     SMADC <= x"1";
                                 else
                                     delay_end <= delay_end -1;
                                 end if;

                             when 10=>
                                 if delay_end = 0 then
                                     SMADCwordwrite <= X"25001F";
                                     SMADC_CS_CTRL <= "0000";
                                     SMID <= SMID +1;
                                     SMADC <= x"1";
                                 else
                                     delay_end <= delay_end -1;
                                 end if;
                                                                  
                                 --ramp_next <= '1';   
                                 --SMADCwordwrite <= X"03" & "10" & ramp_counter(13 downto 8);
                                 --SMID <= SMID +1;
                                 --SMADCwordwrite <= X"250000";  --250040 per la rampa
                                 --SMID <= 9;
                                 --SMADC <= x"1";                               
                             when 11=>
                                 start_bitsleep <= '1';
                                 --SMADCwordwrite <= X"04" & ramp_counter(7 downto 0);
                                 SMID <= SMID +1;
                            --     SMADC <= x"1";                        
                                 ramp_counter <= ramp_counter +1;   
                             
                             when 12=>
                                 
                                 if ssinitialized1 = '1' then
                                  start_bitsleep <= '0';
                                  SMID <= SMID +1;
                                  delay_end <= 9000;
                                 end if; 
                                 
                             when 13=>
                                 if delay_end = 0 then
                                    SMADCwordwrite <= X"450000";
                                    SMADC_CS_CTRL <= "0000";
                                  -- SMID <= SMID +1;
                                     SMID <= SMID +1;
                                     SMADC <= x"1";                                
                                 
                                 else
                                     delay_end <= delay_end -1;
                                 end if;
                                    
                             when 14=>
                                if TEST_MODE = '1' then
                                 SMADCwordwrite <= X"250040";
                                 SMADC_CS_CTRL <= "0000";
                                else
                                 SMADCwordwrite <= X"250000";
                                 SMADC_CS_CTRL <= "0000";
                                end if;
                                SMID <= SMID +1;
                                SMADC <= x"1";                            
                             when 15=>       
                                    ay_ADC_READY <= '1';
                                    WATCH_DOG_arm <= '0';
                             when others =>
                         end case;
                     when x"1" => 
                         SMADC_1_CLK <= '0';
                         SMADC_CS <= SMADC_CS_CTRL;
                         SMADC <= x"F";
                         SMADCnew <= x"2";
                         SMdelay <= x"00FF";
                         
                     when x"2" =>
                         SMADC_1_CLK <= '0';
                         SMADC_CS <= SMADC_CS_CTRL;
                         SMADC_1_MOSI <= SMADCwordwrite(23-idx);   
                         idx <= idx +1;
                         SMdelay <= x"00FF";
                         SMADC <= x"F";
                         SMADCnew <= x"3";
                         
                     when x"3" =>
                         SMADC_1_CLK <= '1';
                         SMdelay <= x"00FF";
                         SMADC <= x"F";
                         SMADCnew <= x"2";
                         
                         if idx = 24 then
                             SMdelay <= x"00FF";
                             SMADC <= x"F";
                             SMADCnew <= x"A";
                         end if;
                         
                     when x"A" =>
                          SMADC_CS <= SMADC_CS_CTRL;
                          SMdelay <= x"01FF";
                          SMADC <= x"F";
                          SMADCnew <= x"0";                     
       
           
                     when x"F" => 
                         if SMdelay = x"0000" then
                             SMADC <= SMADCnew;
                         else
                             SMdelay <= SMdelay-1; 
                         end if;
                         
                         
                     when others =>
                  end case;
                    

                  IF WATCH_DOG_arm = '1' THEN
                    IF WATCH_DOG = 0 THEN
                         SMID <= 0;
                         SMADC <= x"0";
                        SMADCnew <= x"0";   
                    ELSE
                        WATCH_DOG <= WATCH_DOG -1;
                    END IF;
                  END IF;         
             end if;
         end process;
         
       end block; 
     
 

--SMADC_1_CSA <= ADC_CS;
--SMADC_2_CSA <= ADC_CS;
--SMADC_3_CSA <= ADC_CS;
--SMADC_4_CSA <= ADC_CS;

--SMADC_1_CSB <= ADC_CS;
--SMADC_2_CSB <= ADC_CS;
--SMADC_3_CSB <= ADC_CS;
--SMADC_4_CSB <= ADC_CS;
    
adc_interface1:  adc_interface 
generic map(
    ADC_A_INV => "11111010",
    ADC_B_INV => "11101110",
    ADC_CLK_INV => '0',
    IODELAY_GROUP_NAME =>  "ADC_DESER_group1"
)
port map
( clock_ref => clock_ref1,
  locked_dcmref => locked_dcmref,
  SMADC_1_RESET => SMADC_1_RESET,
  sCLK_25 => clk25,
  
  ADC_BUS_CLK_A_P => ADC_1_CLK_A_P,
  ADC_BUS_CLK_A_N => ADC_1_CLK_A_N,
  
  ADC_BUS_FRAME_A_P => ADC_1_FRAME_A_P,
  ADC_BUS_FRAME_A_N => ADC_1_FRAME_A_N,
  
  ADC_BUS_DATA_A_P => ADC_1_DATA_A_P,
  ADC_BUS_DATA_A_N => ADC_1_DATA_A_N,
                          
  ADC_BUS_DATA_B_P => ADC_1_DATA_B_P,
  ADC_BUS_DATA_B_N => ADC_1_DATA_B_N,
  
  eDATA_OUT => eDATA_OUT1,
  eEMPTY => eEMPTY1, 
  eCLK =>  READOUT_CLK, 
  eREAD => eREAD1,
  
  ADC_CLK_OUT => ADC_CLK_OUT,
    
  start_delay => start_delay,
  bit_locked1 => bit_locked1,
  initialized1 => initialized1,
  start_bitsleep => start_bitsleep,
    
  serdes_ioreset => serdes_ioreset,
  serdes_delayreset => serdes_delayreset,
  serdes_reset => serdes_reset,
  
  serdes1_delaylock => serdes1_delaylock 


  );
  
 eREAD1 <= NOT eEMPTY1;
 
 
iCH0 <= "00" & eDATA_OUT1( (14*1)-1 downto	(14*(1-1)));
iCH1 <= "00" & eDATA_OUT1( (14*2)-1 downto	(14*(2-1)));
iCH2 <= "00" & eDATA_OUT1( (14*3)-1 downto	(14*(3-1)));
iCH3 <= "00" & eDATA_OUT1( (14*4)-1 downto	(14*(4-1)));
iCH4 <= "00" & eDATA_OUT1( (14*5)-1 downto	(14*(5-1)));
iCH5 <= "00" & eDATA_OUT1( (14*6)-1 downto	(14*(6-1)));
iCH6 <= "00" & eDATA_OUT1( (14*7)-1 downto	(14*(7-1)));
iCH7 <= "00" & eDATA_OUT1( (14*8)-1 downto	(14*(8-1)));

inv : process (READOUT_CLK)
begin
    if rising_edge(READOUT_CLK) then
        if inversion(0) = '0' then
            CH0 <= iCH0;
        else
            CH0 <= x"3FFF" - iCH0;
        end if;
        
        if inversion(1) = '0' then
            CH1 <= iCH1;
        else
            CH1 <= x"3FFF" - iCH1;
        end if;        
        
        if inversion(2) = '0' then
            CH2 <= iCH2;
        else
            CH2 <= x"3FFF" - iCH2;
        end if;        
        
        if inversion(3) = '0' then
            CH3 <= iCH3;
        else
            CH3 <= x"3FFF" - iCH3;
        end if;
        
        if inversion(4) = '0' then
            CH4 <= iCH4;
        else
            CH4 <= x"3FFF" - iCH4;
        end if;
        
        if inversion(5) = '0' then
            CH5 <= iCH5;
        else
            CH5 <= x"3FFF" - iCH5;
        end if;        
        
        if inversion(6) = '0' then
            CH6 <= iCH6;
        else
            CH6 <= x"3FFF" - iCH6;
        end if;        
        
        if inversion(7) = '0' then
            CH7 <= iCH7;
        else
            CH7 <= x"3FFF" - iCH7;
        end if;        
            
              
    end if;
end process;



ay_ADC_STATUS(0) <= bit_locked1;
ay_ADC_STATUS(1) <= bit_locked2;
ay_ADC_STATUS(2) <= bit_locked3;
ay_ADC_STATUS(3) <= bit_locked4;

ay_ADC_STATUS(4) <= initialized1;
ay_ADC_STATUS(5) <= initialized2;
ay_ADC_STATUS(6) <= initialized3;
ay_ADC_STATUS(7) <= initialized4;

ay_ADC_STATUS(8) <= serdes1_delaylock;
ay_ADC_STATUS(9) <= serdes2_delaylock;
ay_ADC_STATUS(10) <= serdes3_delaylock;
ay_ADC_STATUS(11) <= serdes4_delaylock;

ay_ADC_STATUS(12) <= ay_ADC_READY;


ADC_STATUS <= s_ADC_STATUS(11 downto 0);
ADC_READY <= s_ADC_STATUS(12); 


STATUS_SYNC: xpm_cdc_array_single
  generic map (

    -- Common module generics
    DEST_SYNC_FF   => 4, -- integer; range: 2-10
    INIT_SYNC_FF   => 0, -- integer; 0=disable simulation init values, 1=enable simulation init values
    SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
    SRC_INPUT_REG  => 0, -- integer; 0=do not register input, 1=register input
    WIDTH          => 13  -- integer; range: 1-1024

  )
  port map (

    src_clk  => '1',  -- optional; required when SRC_INPUT_REG = 1
    src_in   => ay_ADC_STATUS,
    dest_clk => READOUT_CLK,
    dest_out => s_ADC_STATUS
  );

end Behavioral;

