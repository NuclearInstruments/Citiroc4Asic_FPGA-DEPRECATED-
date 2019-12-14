----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2016 19:00:34
-- Design Name: 
-- Module Name: adc_interface - Behavioral
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


use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity adc_interface is
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
end adc_interface;

architecture Behavioral of adc_interface is
signal counter : std_logic_vector (26 downto 0);
    signal clk : std_logic;

    component ADC_REC_1
    generic
     (-- width of the data for the system
      SYS_W       : integer := 17;
      -- width of the data for the device
      DEV_W       : integer := 238);
    port
     (
      -- From the system into the device
      data_in_from_pins_p     : in    std_logic_vector(SYS_W-1 downto 0);
      data_in_from_pins_n     : in    std_logic_vector(SYS_W-1 downto 0);
      data_in_to_device       : out   std_logic_vector(DEV_W-1 downto 0);
      
      in_delay_reset          : in std_logic;
      in_delay_data_ce        : in    std_logic_vector(SYS_W-1 downto 0);
      in_delay_data_inc       : in    std_logic_vector(SYS_W-1 downto 0);
      in_delay_tap_in         : in    std_logic_vector((5*SYS_W)-1 downto 0);
      in_delay_tap_out        : out   std_logic_vector((5*SYS_W)-1 downto 0);
     
      delay_locked            : out   std_logic;
      ref_clock               : in    std_logic;

      bitslip                 : in    std_logic_vector(SYS_W-1 downto 0);                    -- Bitslip module is enabled in NETWORKING mode
                                                                    -- User should tie it to '0' if not needed
     
    -- Clock and reset signals
      clk_in_int              : in    std_logic;                    -- Differential fast clock from IOB
      clk_div_out             : out   std_logic;                    -- Slow clock output
      clk_reset               : in    std_logic;                    -- Reset signal for Clock circuit
      io_reset                : in    std_logic);                   -- Reset signal for IO circuit
    end component;    
    
   
    component adc_sync 
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
    end component;
    
    
    component fifo_generator_0 
      PORT (
        rst : IN STD_LOGIC;
        wr_clk : IN STD_LOGIC;
        rd_clk : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(223 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR(111 DOWNTO 0);
        full : OUT STD_LOGIC;
        empty : OUT STD_LOGIC
      );
    END component;
    
    
    component ADC_FRAME_S 
        Port ( clk : in STD_LOGIC;
               adc_frame : in STD_LOGIC_VECTOR (13 downto 0);
               bitsleep : out STD_LOGIC;
               start_bitsleep : in STD_LOGIC;
               locked : out STD_LOGIC);
    end component;
    
    
    signal data_in_to_device1 : std_logic_vector (237 downto 0) := (others => '0');
    
    
    signal clk_div_out1             :    std_logic :='0';
       
    attribute keep : string; 
    
    
    signal ADC_F_0 : std_logic_vector (13 downto 0);
    signal ADC_F_1 : std_logic_vector (13 downto 0);
    signal ADC_A_0 : std_logic_vector (13 downto 0);
    signal ADC_B_0 : std_logic_vector (13 downto 0);
    signal ADC_A_1 : std_logic_vector (13 downto 0);
    signal ADC_B_1 : std_logic_vector (13 downto 0);
    signal ADC_A_2 : std_logic_vector (13 downto 0);
    signal ADC_B_2 : std_logic_vector (13 downto 0);
    signal ADC_A_3 : std_logic_vector (13 downto 0);
    signal ADC_B_3 : std_logic_vector (13 downto 0);
    signal ADC_A_4 : std_logic_vector (13 downto 0);
    signal ADC_B_4 : std_logic_vector (13 downto 0);
    signal ADC_A_5 : std_logic_vector (13 downto 0);
    signal ADC_B_5 : std_logic_vector (13 downto 0);
    signal ADC_A_6 : std_logic_vector (13 downto 0);
    signal ADC_B_6 : std_logic_vector (13 downto 0);
    signal ADC_A_7 : std_logic_vector (13 downto 0);
    signal ADC_B_7 : std_logic_vector (13 downto 0);
   
   
   
    signal DATA_A_0 : std_logic_vector (13 downto 0);
    signal DATA_B_0 : std_logic_vector (13 downto 0);
    signal DATA_A_1 : std_logic_vector (13 downto 0);
    signal DATA_B_1 : std_logic_vector (13 downto 0);
    signal DATA_A_2 : std_logic_vector (13 downto 0);
    signal DATA_B_2 : std_logic_vector (13 downto 0);
    signal DATA_A_3 : std_logic_vector (13 downto 0);
    signal DATA_B_3 : std_logic_vector (13 downto 0);
    signal DATA_A_4 : std_logic_vector (13 downto 0);
    signal DATA_B_4 : std_logic_vector (13 downto 0);
    signal DATA_A_5 : std_logic_vector (13 downto 0);
    signal DATA_B_5 : std_logic_vector (13 downto 0);
    signal DATA_A_6 : std_logic_vector (13 downto 0);
    signal DATA_B_6 : std_logic_vector (13 downto 0);
    signal DATA_A_7 : std_logic_vector (13 downto 0);
    signal DATA_B_7 : std_logic_vector (13 downto 0);
 

   
   attribute keep of ADC_F_0: signal is "true";
   attribute keep of ADC_F_1: signal is "true";
   
   attribute keep of ADC_A_0: signal is "true";
   attribute keep of ADC_B_0: signal is "true";
   attribute keep of ADC_A_1: signal is "true";
   attribute keep of ADC_B_1: signal is "true";
   attribute keep of ADC_A_2: signal is "true";
   attribute keep of ADC_B_2: signal is "true";
   attribute keep of ADC_A_3: signal is "true";
   attribute keep of ADC_B_3: signal is "true";
   attribute keep of ADC_A_4: signal is "true";
   attribute keep of ADC_B_4: signal is "true";
   attribute keep of ADC_A_5: signal is "true";
   attribute keep of ADC_B_5: signal is "true";
   attribute keep of ADC_A_6: signal is "true";
   attribute keep of ADC_B_6: signal is "true";
   attribute keep of ADC_A_7: signal is "true";
   attribute keep of ADC_B_7: signal is "true";
   
   attribute keep of DATA_A_0: signal is "true";
   attribute keep of DATA_B_0: signal is "true";
   attribute keep of DATA_A_1: signal is "true";
   attribute keep of DATA_B_1: signal is "true";
   attribute keep of DATA_A_2: signal is "true";
   attribute keep of DATA_B_2: signal is "true";
   attribute keep of DATA_A_3: signal is "true";
   attribute keep of DATA_B_3: signal is "true";
   attribute keep of DATA_A_4: signal is "true";
   attribute keep of DATA_B_4: signal is "true";
   attribute keep of DATA_A_5: signal is "true";
   attribute keep of DATA_B_5: signal is "true";
   attribute keep of DATA_A_6: signal is "true";
   attribute keep of DATA_B_6: signal is "true";
   attribute keep of DATA_A_7: signal is "true";
   attribute keep of DATA_B_7: signal is "true";   
        

   signal bitsleep1 : std_logic_vector(16 downto 0) := "00000000000000000";
   
   
   

   signal serdes1_program_delay : std_logic := '0';
   signal serdes1_delay : std_logic_vector( (5*17) -1 downto 0) := (others => '0');
   signal serdes1_delay_temp : std_logic_vector( 7 downto 0) := (others => '0');
   
   

   
    

    signal FIFO1_DIN : std_logic_vector(223 downto 0);
    signal FIFO1_DOUT : std_logic_vector(111 downto 0);
    signal FIFO1_empty : std_logic;

    
    signal ADC_BIT_CLOCK : std_logic;
    signal ADC_BIT_CLOCKii : std_logic;
    signal bitLook : std_logic_vector(15 downto 0) := x"0000";
    
    signal initialized : std_logic;
    
    signal FIFO_RESET : std_logic;
    
--attribute IODELAY_GROUP : STRING;
--attribute IODELAY_GROUP of IDELAYCTRL_inst: label is IODELAY_GROUP_NAME;
begin


    FIFO_RESET <= not initialized;

    ADC_CLK_OUT <= clk_div_out1;
 
     clk <= sCLK_25;
     
    ADC_OUTFIFO1: fifo_generator_0 
      PORT MAP(
        rst => serdes_ioreset,
        wr_clk => clk_div_out1,
        rd_clk  => eCLK,
        din  => FIFO1_DIN,
        wr_en  => '1',
        rd_en  => eREAD,
        dout =>  FIFO1_DOUT,
        full  => open,
        empty  => FIFO1_empty
      );
      

eDATA_OUT <=       FIFO1_DOUT;



     
     eEMPTY <= FIFO1_empty;
     
    
               

     FIFO1_DIN <=  DATA_B_7 & DATA_B_6 & DATA_B_5 & DATA_B_4 & DATA_B_3 & DATA_B_2 & DATA_B_1 & DATA_B_0 &
                    DATA_A_7 & DATA_A_6 & DATA_A_5 & DATA_A_4 & DATA_A_3 & DATA_A_2 & DATA_A_1 & DATA_A_0;
     



           
    ADDESR: for I in 0 to 13 generate
       begin
        ADS1: process(clk_div_out1) 
           begin

               if rising_edge(clk_div_out1) then
               --frame
                   ADC_F_0(I) <=   data_in_to_device1 ( (I * 17) + 0 );
               --A 0
                   if ADC_B_INV(0) = '0' then
                    ADC_A_0(I) <=   data_in_to_device1 ( (I * 17) + 1 );
                   else
                    ADC_A_0(I) <=   not data_in_to_device1 ( (I * 17) + 1 );
                   end if;
               --B 0
                   if ADC_A_INV(0) = '0' then
                    ADC_B_0(I) <=   data_in_to_device1 ( (I * 17) + 2 );
                   else
                    ADC_B_0(I) <=   not data_in_to_device1 ( (I * 17) + 2 );
                   end if;
               --A 1
                   if ADC_B_INV(1) = '0' then    
                    ADC_A_1(I) <=   data_in_to_device1 ( (I * 17) + 3 );
                   else
                    ADC_A_1(I) <=   not data_in_to_device1 ( (I * 17) + 3 );
                   end if;
               --B 1
                   if ADC_A_INV(1) = '0' then   
                    ADC_B_1(I) <=   data_in_to_device1 ( (I * 17) + 4 );
                   else
                    ADC_B_1(I) <=   not data_in_to_device1 ( (I * 17) + 4 );
                   end if;
               --A 2
                   if ADC_B_INV(2) = '0' then                    
                    ADC_A_2(I) <=   data_in_to_device1 ( (I * 17) + 5 );
                   else
                    ADC_A_2(I) <=   not data_in_to_device1 ( (I * 17) + 5 );
                   end if;
               --B 2
                   if ADC_A_INV(2) = '0' then  
                    ADC_B_2(I) <=   data_in_to_device1 ( (I * 17) + 6 );
                   else
                    ADC_B_2(I) <=   not data_in_to_device1 ( (I * 17) + 6 );
                   end if;
               --A 3
                   if ADC_B_INV(3) = '0' then  
                    ADC_A_3(I) <=   data_in_to_device1 ( (I * 17) + 7 );
                   else
                    ADC_A_3(I) <=   not data_in_to_device1 ( (I * 17) + 7 );
                   end if;
               --B 3 
                   if ADC_A_INV(3) = '0' then
                    ADC_B_3(I) <=   data_in_to_device1 ( (I * 17) + 8 ); 
                   else
                    ADC_B_3(I) <=   not data_in_to_device1 ( (I * 17) + 8 ); 
                   end if;
               --A 4
                   if ADC_B_INV(4) = '0' then
                    ADC_A_4(I) <=   data_in_to_device1 ( (I * 17) + 9 );
                   else
                    ADC_A_4(I) <=   not data_in_to_device1 ( (I * 17) + 9 );
                   end if;
               --B 4
                   if ADC_A_INV(4) = '0' then
                    ADC_B_4(I) <=   data_in_to_device1 ( (I * 17) + 10 );
                   else
                    ADC_B_4(I) <=   not data_in_to_device1 ( (I * 17) + 10 );
                   end if;
               --A 5
                   if ADC_B_INV(5) = '0' then    
                    ADC_A_5(I) <=   data_in_to_device1 ( (I * 17) + 11 );
                   else
                    ADC_A_5(I) <=   not data_in_to_device1 ( (I * 17) + 11 );
                   end if;
               --B 5
                   if ADC_A_INV(5) = '0' then   
                    ADC_B_5(I) <=   data_in_to_device1 ( (I * 17) + 12 );
                   else
                    ADC_B_5(I) <=   not data_in_to_device1 ( (I * 17) + 12 );
                   end if;
               --A 6
                   if ADC_B_INV(6) = '0' then                    
                    ADC_A_6(I) <=   data_in_to_device1 ( (I * 17) + 13 );
                   else
                    ADC_A_6(I) <=   not data_in_to_device1 ( (I * 17) + 13 );
                   end if;
               --B 6
                   if ADC_A_INV(6) = '0' then  
                    ADC_B_6(I) <=   data_in_to_device1 ( (I * 17) + 14 );
                   else
                    ADC_B_6(I) <=   not data_in_to_device1 ( (I * 17) + 14 );
                   end if;
               --A 7
                   if ADC_B_INV(7) = '0' then  
                    ADC_A_7(I) <=   data_in_to_device1 ( (I * 17) + 15 );
                   else
                    ADC_A_7(I) <=   not data_in_to_device1 ( (I * 17) + 15 );
                   end if;
               --B 7 
                   if ADC_A_INV(7) = '0' then
                    ADC_B_7(I) <=   data_in_to_device1 ( (I * 17) + 16 ); 
                   else
                    ADC_B_7(I) <=   not data_in_to_device1 ( (I * 17) + 16 ); 
                   end if;                                                                              
               end if;
           end process; 
           
           
                                   
        
        DATA_A_0(13-I) <= ADC_A_0(I);
        DATA_A_1(13-I) <= ADC_A_1(I);
        DATA_A_2(13-I) <= ADC_A_2(I);
        DATA_A_3(13-I) <= ADC_A_3(I);
        DATA_A_4(13-I) <= ADC_A_4(I);
        DATA_A_5(13-I) <= ADC_A_5(I);
        DATA_A_6(13-I) <= ADC_A_6(I);
        DATA_A_7(13-I) <= ADC_A_7(I);
        
        DATA_B_0(13-I) <= ADC_B_0(I);
        DATA_B_1(13-I) <= ADC_B_1(I);
        DATA_B_2(13-I) <= ADC_B_2(I);
        DATA_B_3(13-I) <= ADC_B_3(I);
        DATA_B_4(13-I) <= ADC_B_4(I);
        DATA_B_5(13-I) <= ADC_B_5(I);
        DATA_B_6(13-I) <= ADC_B_6(I);
        DATA_B_7(13-I) <= ADC_B_7(I);

        
    end generate;
             
--     DATA_A_0 <= ADC_A_0(7) & ADC_A_0(8) & ADC_A_0(9) & ADC_A_0(10) & ADC_A_0(11) & ADC_A_0(12) & ADC_A_0(13) & ADC_B_0(7) & ADC_B_0(8) & ADC_B_0(9) & ADC_B_0(10) & ADC_B_0(11) & ADC_B_0(12) & ADC_B_0(13) ;
--     DATA_B_0 <= ADC_A_0(0) & ADC_A_0(1) & ADC_A_0(2) & ADC_A_0(3) &  ADC_A_0(4) &  ADC_A_0(5) &  ADC_A_0(6) &  ADC_B_0(0) & ADC_B_0(1) & ADC_B_0(2) & ADC_B_0(3) &  ADC_B_0(4) &  ADC_B_0(5) &  ADC_B_0(6) ;     
--     DATA_A_1 <= ADC_A_1(7) & ADC_A_1(8) & ADC_A_1(9) & ADC_A_1(10) & ADC_A_1(11) & ADC_A_1(12) & ADC_A_1(13) & ADC_B_1(7) & ADC_B_1(8) & ADC_B_1(9) & ADC_B_1(10) & ADC_B_1(11) & ADC_B_1(12) & ADC_B_1(13) ;
--     DATA_B_1 <= ADC_A_1(0) & ADC_A_1(1) & ADC_A_1(2) & ADC_A_1(3) &  ADC_A_1(4) &  ADC_A_1(5) &  ADC_A_1(6) &  ADC_B_1(0) & ADC_B_1(1) & ADC_B_1(2) & ADC_B_1(3) &  ADC_B_1(4) &  ADC_B_1(5) &  ADC_B_1(6) ;
--     DATA_A_2 <= ADC_A_2(7) & ADC_A_2(8) & ADC_A_2(9) & ADC_A_2(10) & ADC_A_2(11) & ADC_A_2(12) & ADC_A_2(13) & ADC_B_2(7) & ADC_B_2(8) & ADC_B_2(9) & ADC_B_2(10) & ADC_B_2(11) & ADC_B_2(12) & ADC_B_2(13) ;
--     DATA_B_2 <= ADC_A_2(0) & ADC_A_2(1) & ADC_A_2(2) & ADC_A_2(3) &  ADC_A_2(4) &  ADC_A_2(5) &  ADC_A_2(6) &  ADC_B_2(0) & ADC_B_2(1) & ADC_B_2(2) & ADC_B_2(3) &  ADC_B_2(4) &  ADC_B_2(5) &  ADC_B_2(6) ;
--     DATA_A_3 <= ADC_A_3(7) & ADC_A_3(8) & ADC_A_3(9) & ADC_A_3(10) & ADC_A_3(11) & ADC_A_3(12) & ADC_A_3(13) & ADC_B_3(7) & ADC_B_3(8) & ADC_B_3(9) & ADC_B_3(10) & ADC_B_3(11) & ADC_B_3(12) & ADC_B_3(13) ;
--     DATA_B_3 <= ADC_A_3(0) & ADC_A_3(1) & ADC_A_3(2) & ADC_A_3(3) &  ADC_A_3(4) &  ADC_A_3(5) &  ADC_A_3(6) &  ADC_B_3(0) & ADC_B_3(1) & ADC_B_3(2) & ADC_B_3(3) &  ADC_B_3(4) &  ADC_B_3(5) &  ADC_B_3(6) ;     
--     DATA_A_4 <= ADC_A_4(7) & ADC_A_4(8) & ADC_A_4(9) & ADC_A_4(10) & ADC_A_4(11) & ADC_A_4(12) & ADC_A_4(13) & ADC_B_4(7) & ADC_B_4(8) & ADC_B_4(9) & ADC_B_4(10) & ADC_B_4(11) & ADC_B_4(12) & ADC_B_4(13) ;
--     DATA_B_4 <= ADC_A_4(0) & ADC_A_4(1) & ADC_A_4(2) & ADC_A_4(3) &  ADC_A_4(4) &  ADC_A_4(5) &  ADC_A_4(6) &  ADC_B_4(0) & ADC_B_4(1) & ADC_B_4(2) & ADC_B_4(3) &  ADC_B_4(4) &  ADC_B_4(5) &  ADC_B_4(6) ;
--     DATA_A_5 <= ADC_A_5(7) & ADC_A_5(8) & ADC_A_5(9) & ADC_A_5(10) & ADC_A_5(11) & ADC_A_5(12) & ADC_A_5(13) & ADC_B_5(7) & ADC_B_5(8) & ADC_B_5(9) & ADC_B_5(10) & ADC_B_5(11) & ADC_B_5(12) & ADC_B_5(13) ;
--     DATA_B_5 <= ADC_A_5(0) & ADC_A_5(1) & ADC_A_5(2) & ADC_A_5(3) &  ADC_A_5(4) &  ADC_A_5(5) &  ADC_A_5(6) &  ADC_B_5(0) & ADC_B_5(1) & ADC_B_5(2) & ADC_B_5(3) &  ADC_B_5(4) &  ADC_B_5(5) &  ADC_B_5(6) ;
--     DATA_A_6 <= ADC_A_6(7) & ADC_A_6(8) & ADC_A_6(9) & ADC_A_6(10) & ADC_A_6(11) & ADC_A_6(12) & ADC_A_6(13) & ADC_B_6(7) & ADC_B_6(8) & ADC_B_6(9) & ADC_B_6(10) & ADC_B_6(11) & ADC_B_6(12) & ADC_B_6(13) ;
--     DATA_B_6 <= ADC_A_6(0) & ADC_A_6(1) & ADC_A_6(2) & ADC_A_6(3) &  ADC_A_6(4) &  ADC_A_6(5) &  ADC_A_6(6) &  ADC_B_6(0) & ADC_B_6(1) & ADC_B_6(2) & ADC_B_6(3) &  ADC_B_6(4) &  ADC_B_6(5) &  ADC_B_6(6) ;
--     DATA_A_7 <= ADC_A_7(7) & ADC_A_7(8) & ADC_A_7(9) & ADC_A_7(10) & ADC_A_7(11) & ADC_A_7(12) & ADC_A_7(13) & ADC_B_7(7) & ADC_B_7(8) & ADC_B_7(9) & ADC_B_7(10) & ADC_B_7(11) & ADC_B_7(12) & ADC_B_7(13) ;
--     DATA_B_7 <= ADC_A_7(0) & ADC_A_7(1) & ADC_A_7(2) & ADC_A_7(3) &  ADC_A_7(4) &  ADC_A_7(5) &  ADC_A_7(6) &  ADC_B_7(0) & ADC_B_7(1) & ADC_B_7(2) & ADC_B_7(3) &  ADC_B_7(4) &  ADC_B_7(5) &  ADC_B_7(6) ;
 

     
     
     

     
      ADC_DESER1 : ADC_REC_1
       port map 
       ( 
       data_in_from_pins_p(0) => ADC_BUS_FRAME_A_P,
       data_in_from_pins_p(1) => ADC_BUS_DATA_B_P(0),     --1
       data_in_from_pins_p(2) => ADC_BUS_DATA_A_P(0), 
       data_in_from_pins_p(3) => ADC_BUS_DATA_B_P(1),     --4
       data_in_from_pins_p(4) => ADC_BUS_DATA_A_P(1),
       data_in_from_pins_p(5) => ADC_BUS_DATA_B_P(2),     --5
       data_in_from_pins_p(6) => ADC_BUS_DATA_A_P(2),     
       data_in_from_pins_p(7) => ADC_BUS_DATA_B_P(3),     --8
       data_in_from_pins_p(8) => ADC_BUS_DATA_A_P(3),
       data_in_from_pins_p(9) => ADC_BUS_DATA_B_P(4),
       data_in_from_pins_p(10) => ADC_BUS_DATA_A_P(4),
       data_in_from_pins_p(11) => ADC_BUS_DATA_B_P(5),
       data_in_from_pins_p(12) => ADC_BUS_DATA_A_P(5),
       data_in_from_pins_p(13) => ADC_BUS_DATA_B_P(6),
       data_in_from_pins_p(14) => ADC_BUS_DATA_A_P(6),
       data_in_from_pins_p(15) => ADC_BUS_DATA_B_P(7),
       data_in_from_pins_p(16) => ADC_BUS_DATA_A_P(7),
       data_in_from_pins_n(0) => ADC_BUS_FRAME_A_N,
       data_in_from_pins_n(1) => ADC_BUS_DATA_B_N(0),
       data_in_from_pins_n(2) => ADC_BUS_DATA_A_N(0),
       data_in_from_pins_n(3) => ADC_BUS_DATA_B_N(1),
       data_in_from_pins_n(4) => ADC_BUS_DATA_A_N(1),
       data_in_from_pins_n(5) => ADC_BUS_DATA_B_N(2),
       data_in_from_pins_n(6) => ADC_BUS_DATA_A_N(2),
       data_in_from_pins_n(7) => ADC_BUS_DATA_B_N(3),
       data_in_from_pins_n(8) => ADC_BUS_DATA_A_N(3),
       data_in_from_pins_n(9) => ADC_BUS_DATA_B_N(4),
       data_in_from_pins_n(10) => ADC_BUS_DATA_A_N(4),
       data_in_from_pins_n(11) => ADC_BUS_DATA_B_N(5),
       data_in_from_pins_n(12) => ADC_BUS_DATA_A_N(5),
       data_in_from_pins_n(13) => ADC_BUS_DATA_B_N(6),
       data_in_from_pins_n(14) => ADC_BUS_DATA_A_N(6),
       data_in_from_pins_n(15) => ADC_BUS_DATA_B_N(7),
       data_in_from_pins_n(16) => ADC_BUS_DATA_A_N(7),

       data_in_to_device => data_in_to_device1,
       bitslip => bitsleep1,                           
       clk_in_int => ADC_BIT_CLOCK,                          
       clk_div_out => clk_div_out1,                       
       clk_reset => serdes_ioreset,
       io_reset => serdes_reset,

       in_delay_reset          => serdes1_program_delay,
       in_delay_data_ce        => "00000000000000000",
       in_delay_data_inc       => "00000000000000000",
       in_delay_tap_in         => serdes1_delay,
       in_delay_tap_out        => open,
       delay_locked            => serdes1_delaylock,
       ref_clock               => clock_ref
       
       
    );
    
    
       ADC_SYNC1: adc_sync 
         Port Map( 
            start_bitsleep => '0',
             clk => clk_div_out1,
             start_delay => start_delay,
             bitsleep => open, --bitsleep1
             probe_data => ADC_A_0,
             adc_frame => DATA_A_0,--adc_F_0,
             serdes_delay => serdes1_delay_temp,
             serdes_dprog => serdes1_program_delay,
             obit_locked => bit_locked1,
             initialized => initialized
         );

     
    serdes1_delay <= serdes1_delay_temp(4 downto 0) & serdes1_delay_temp(4 downto 0) & serdes1_delay_temp(4 downto 0) & serdes1_delay_temp(4 downto 0) &
                     serdes1_delay_temp(4 downto 0) & serdes1_delay_temp(4 downto 0) & serdes1_delay_temp(4 downto 0) & serdes1_delay_temp(4 downto 0) &
                     serdes1_delay_temp(4 downto 0) & serdes1_delay_temp(4 downto 0) & serdes1_delay_temp(4 downto 0) & serdes1_delay_temp(4 downto 0) &
                     serdes1_delay_temp(4 downto 0) & serdes1_delay_temp(4 downto 0) & serdes1_delay_temp(4 downto 0) & serdes1_delay_temp(4 downto 0) &
                     serdes1_delay_temp(4 downto 0);


-- gen_clk_inv : if ADC_CLK_INV = '1' generate
-- begin
--    ADC_BIT_CLOCK <= not ADC_BIT_CLOCKii;
-- end generate;
 
-- gen_clk_notinv : if ADC_CLK_INV = '0' generate
-- begin
     ADC_BIT_CLOCK <= ADC_BIT_CLOCKii;
--  end generate;
    
    
  ADC_CLOCK_BUFFER : IBUFDS
   generic map (
      DIFF_TERM => TRUE, 
      IBUF_LOW_PWR => FALSE,
      IOSTANDARD => "LVDS")
   port map (
      O => ADC_BIT_CLOCKii, 
      I => ADC_BUS_CLK_A_P,
      IB => ADC_BUS_CLK_A_N
   );      
              
    initialized1 <= and_reduce(bitLook);
    
AF_A0 : ADC_FRAME_S 
   Port MAP( clk => clk_div_out1,
          adc_frame => DATA_A_0,
          bitsleep => bitsleep1(1),
          start_bitsleep => start_bitsleep,
          locked => bitLook(0));
          
AF_B0 : ADC_FRAME_S 
Port MAP( clk => clk_div_out1,
       adc_frame => DATA_B_0,
       bitsleep => bitsleep1(2),
       start_bitsleep => start_bitsleep,
       locked => bitLook(1));   

AF_A1 : ADC_FRAME_S 
Port MAP( clk => clk_div_out1,
       adc_frame => DATA_A_1,
       bitsleep => bitsleep1(3),
       start_bitsleep => start_bitsleep,
       locked => bitLook(2));   

AF_B1 : ADC_FRAME_S 
Port MAP( clk => clk_div_out1,
       adc_frame => DATA_B_1,
       bitsleep => bitsleep1(4),
       start_bitsleep => start_bitsleep,
       locked => bitLook(3));   
       
AF_A2 : ADC_FRAME_S 
Port MAP( clk => clk_div_out1,
      adc_frame => DATA_A_2,
      bitsleep => bitsleep1(5),
      start_bitsleep => start_bitsleep,
      locked => bitLook(4));   

AF_B2 : ADC_FRAME_S 
Port MAP( clk => clk_div_out1,
      adc_frame => DATA_B_2,
      bitsleep => bitsleep1(6),
      start_bitsleep => start_bitsleep,
      locked => bitLook(5));   

AF_A3 : ADC_FRAME_S 
Port MAP( clk => clk_div_out1,
      adc_frame => DATA_A_3,
      bitsleep => bitsleep1(7),
      start_bitsleep => start_bitsleep,
      locked => bitLook(6));   

AF_B3 : ADC_FRAME_S 
Port MAP( clk => clk_div_out1,
      adc_frame => DATA_B_3,
      bitsleep => bitsleep1(8),
      start_bitsleep => start_bitsleep,
      locked => bitLook(7));   
          
AF_A4 : ADC_FRAME_S 
Port MAP( clk => clk_div_out1,
    adc_frame => DATA_A_4,
    bitsleep => bitsleep1(9),
    start_bitsleep => start_bitsleep,
    locked => bitLook(8));   

AF_B4 : ADC_FRAME_S 
Port MAP( clk => clk_div_out1,
    adc_frame => DATA_B_4,
    bitsleep => bitsleep1(10),
    start_bitsleep => start_bitsleep,
    locked => bitLook(9));   

AF_A5 : ADC_FRAME_S 
Port MAP( clk => clk_div_out1,
      adc_frame => DATA_A_5,
      bitsleep => bitsleep1(11),
      start_bitsleep => start_bitsleep,
      locked => bitLook(10));   

AF_B5 : ADC_FRAME_S 
Port MAP( clk => clk_div_out1,
      adc_frame => DATA_B_5,
      bitsleep => bitsleep1(12),
      start_bitsleep => start_bitsleep,
      locked => bitLook(11));   
  
AF_A6 : ADC_FRAME_S 
Port MAP( clk => clk_div_out1,
    adc_frame => DATA_A_6,
    bitsleep => bitsleep1(13),
    start_bitsleep => start_bitsleep,
    locked => bitLook(12));
             
AF_B6 : ADC_FRAME_S 
Port MAP( clk => clk_div_out1,
    adc_frame => DATA_B_6,
    bitsleep => bitsleep1(14),
    start_bitsleep => start_bitsleep,
    locked => bitLook(13));   

AF_A7 : ADC_FRAME_S 
Port MAP( clk => clk_div_out1,
      adc_frame => DATA_A_7,
      bitsleep => bitsleep1(15),
      start_bitsleep => start_bitsleep,
      locked => bitLook(14));   

AF_B7 : ADC_FRAME_S 
Port MAP( clk => clk_div_out1,
      adc_frame => DATA_B_7,
      bitsleep => bitsleep1(16),
      start_bitsleep => start_bitsleep,
      locked => bitLook(15));   

end Behavioral;

