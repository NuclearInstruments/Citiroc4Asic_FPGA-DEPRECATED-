----------------------------------------------------------------------------------
-- Company: 	Nuclear Instruments SRL
-- Engineer: 	Andrea Abba
-- 
-- Create Date: 05.05.2017 17:29:18
-- Design Name: Petiroc Readout System for DT5550W
-- Module Name: TOP_NEWCitirocDesignforDT0WReadoutsoftware
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
-- http://www.nuclearinstruments.eu
-- Nuclear Instruments SRL, via lecco 16, Lambrugo (CO), ITALY
-- info@nuclearinstruments.eu
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_misc.all;
use ieee.math_real.all;
library UNISIM;
use UNISIM.VComponents.all;

Library xpm;
use xpm.vcomponents.all;
    
entity TOP_NEWCitirocDesignforDT0WReadoutsoftware is
    Port (  
		    
			  
			--security eeprom			  
			EEMOSI : out STD_LOGIC;
			EEMISO : in STD_LOGIC;
			EECLK : out STD_LOGIC;
			EECS : out STD_LOGIC;	

			--CDCE clock generator
			CK_SPI_LE : out  STD_LOGIC;
			CK_SPI_CLK : out  STD_LOGIC;
			CK_SPI_MOSI : out  STD_LOGIC;
			CK_SPI_NSYNC : out  STD_LOGIC;

			--FLASH Direct Access
			FLASH_SPI_CS : out std_logic;
			FLASH_SPI_DIN : in std_logic;
			FLASH_SPI_DOUT : out std_logic;	
			
			--AUX CLOCK OUT
			CLK_AUX_OUT_25 : out std_logic;	

			--LEMO IO
			LEMO0 : inout STD_LOGIC;
			LEMO1 : inout STD_LOGIC;
			LEMO2 : inout STD_LOGIC;
			LEMO3 : inout STD_LOGIC;
					 
			LEMO4 : inout STD_LOGIC;
			LEMO5 : inout STD_LOGIC;
			LEMO6 : inout STD_LOGIC;
			LEMO7 : inout STD_LOGIC;

			LEMO01_dir : out STD_LOGIC;
			LEMO23_dir : out STD_LOGIC;
			LEMO45_dir : out STD_LOGIC;
			LEMO67_dir : out STD_LOGIC;		
			
			--FTDI INTERFACE
			FTDI_CLK : in  STD_LOGIC;
			FTDI_ADBUS : inout  STD_LOGIC_VECTOR (31 downto 0);
			FTDI_BE : inout  STD_LOGIC_VECTOR (3 downto 0);
			FTDI_RXFN : in  STD_LOGIC;
			FTDI_TXEN : in  STD_LOGIC;
			FTDI_TXN : out  STD_LOGIC;
			FTDI_SIWU : out  STD_LOGIC;
			FTDI_RDN : out  STD_LOGIC;
			FTDI_OEN : out  STD_LOGIC;

			
			--CITIROC A slow control
			A_RESETB_SR : out STD_LOGIC;
			A_SR_CK : out STD_LOGIC;
			A_SR_IN : out STD_LOGIC;
			A_SRLOAD : out STD_LOGIC;
			A_SELECT : out STD_LOGIC;           

			--CITIROC B slow control
			B_RESETB_SR : out STD_LOGIC;
            B_SR_CK : out STD_LOGIC;
            B_SR_IN : out STD_LOGIC;
            B_SRLOAD : out STD_LOGIC;
            B_SELECT : out STD_LOGIC;          

			--CITIROC C slow control
			C_RESETB_SR : out STD_LOGIC;
            C_SR_CK : out STD_LOGIC;
            C_SR_IN : out STD_LOGIC;
            C_SRLOAD : out STD_LOGIC;
            C_SELECT : out STD_LOGIC;          

			--CITIROC D slow control
			D_RESETB_SR : out STD_LOGIC;
            D_SR_CK : out STD_LOGIC;
            D_SR_IN : out STD_LOGIC;
            D_SRLOAD : out STD_LOGIC;
            D_SELECT : out STD_LOGIC; 

			--CITIROC EVENT VALIDATION
			A_VAL_EVT_P : out STD_LOGIC;
			A_VAL_EVT_N : out STD_LOGIC;
			B_VAL_EVT_P : out STD_LOGIC;
			B_VAL_EVT_N : out STD_LOGIC;
			C_VAL_EVT_P : out STD_LOGIC;
			C_VAL_EVT_N : out STD_LOGIC;
			D_VAL_EVT_P : out STD_LOGIC;
			D_VAL_EVT_N : out STD_LOGIC;

			--CITIROC LATCH RESET
			A_RAZ_CHN_P : out STD_LOGIC;
			A_RAZ_CHN_N : out STD_LOGIC;
			B_RAZ_CHN_P : out STD_LOGIC;
			B_RAZ_CHN_N : out STD_LOGIC;
			C_RAZ_CHN_P : out STD_LOGIC;
			C_RAZ_CHN_N : out STD_LOGIC;
			D_RAZ_CHN_P : out STD_LOGIC;
			D_RAZ_CHN_N : out STD_LOGIC;

			--CITIROC EXTERNAL TEST TRIGGER 
			A_TRIG_EXT : out STD_LOGIC;
			C_TRIG_EXT : out STD_LOGIC;
			B_TRIG_EXT : out STD_LOGIC;
			D_TRIG_EXT : out STD_LOGIC;
			
			--CITIROC EXTERNAL TEST TRIGGER 
            A_RESETB_READ : out STD_LOGIC;
            B_RESETB_READ : out STD_LOGIC;
            C_RESETB_READ : out STD_LOGIC;
            D_RESETB_READ : out STD_LOGIC;			

			--CITIROC RSTV_PSC
			A_RESETB_PSC : out STD_LOGIC;
			B_RESETB_PSC : out STD_LOGIC;
			C_RESETB_PSC : out STD_LOGIC;
			D_RESETB_PSC : out STD_LOGIC;

			--CITIROC RSTV_PA
			A_RESETB_PA : out STD_LOGIC;
			B_RESETB_PA : out STD_LOGIC;
			C_RESETB_PA : out STD_LOGIC;
			D_RESETB_PA : out STD_LOGIC;

			
			--160 MHz CLOCK
			D_LVDS_DCLK_P :  in STD_LOGIC;
			D_LVDS_DCLK_N :  in STD_LOGIC;


			--CITIROC TRIGGER OUT
			A_TRG : in STD_LOGIC_VECTOR(31 downto 0);          
			B_TRG : in STD_LOGIC_VECTOR(31 downto 0);
			C_TRG : in STD_LOGIC_VECTOR(31 downto 0);          
			D_TRG : in STD_LOGIC_VECTOR(31 downto 0);

			--CITIROC SR_IN
			A_ANALOG_DIN : out STD_LOGIC;
			B_ANALOG_DIN : out STD_LOGIC;
			C_ANALOG_DIN : out STD_LOGIC;
			D_ANALOG_DIN : out STD_LOGIC;

			--CITIROC SR_CLK
			A_ANALOG_CLK : out STD_LOGIC;
			B_ANALOG_CLK : out STD_LOGIC;
			C_ANALOG_CLK : out STD_LOGIC;
			D_ANALOG_CLK : out STD_LOGIC;

			--CITIROC OR32_CHARGE
			A_NOR_CHARGE : in STD_LOGIC;
			B_NOR_CHARGE : in STD_LOGIC;
			C_NOR_CHARGE : in STD_LOGIC;
			D_NOR_CHARGE : in STD_LOGIC;
			
			--CITIROC OR32_CHARGE
            A_OR32 : in STD_LOGIC;
            B_OR32 : in STD_LOGIC;
            C_OR32 : in STD_LOGIC;
            D_OR32 : in STD_LOGIC;			

			-- --CITIROC OR32_TIME
			A_NOR_TIME : in STD_LOGIC;
            B_NOR_TIME : in STD_LOGIC;
            C_NOR_TIME : in STD_LOGIC;
            D_NOR_TIME : in STD_LOGIC;
			
			--CITIROC DIGITAL PROBE
			A_DIG_PROBE : in STD_LOGIC;
			B_DIG_PROBE : in STD_LOGIC;
			C_DIG_PROBE : in STD_LOGIC;
			D_DIG_PROBE : in STD_LOGIC;   

			--CITIROC TRIGB_MUX
			A_DIG_OUT : in STD_LOGIC;
			B_DIG_OUT : in STD_LOGIC;
			C_DIG_OUT : in STD_LOGIC;
			D_DIG_OUT : in STD_LOGIC;   

            A_HOLD_LG : out std_logic;
            A_HOLD_HG : out std_logic;
            B_HOLD_LG : out std_logic;
            B_HOLD_HG : out std_logic;
            C_HOLD_LG : out std_logic;
            C_HOLD_HG : out std_logic;
            D_HOLD_LG : out std_logic;
            D_HOLD_HG : out std_logic;
            
			--ANALOG INTERFACE
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
			SMADC_1_CLK : out std_logic;
			SMADC_1_MOSI : out std_logic;
			SMADC_1_PD : out std_logic;

			--i2c
			iic_scl : inout std_logic;
			iic_sda : inout std_logic;
			--SERVICE CLOCK
			clk_100 : in std_logic
                              
                              
			  ); 
end TOP_NEWCitirocDesignforDT0WReadoutsoftware;

architecture Behavioral of TOP_NEWCitirocDesignforDT0WReadoutsoftware is
	attribute keep : string;     
    
    component ft600_fifo245_wrapper is
    Port ( 
	
          --EEPROM SICUREZZE
          EEMOSI : out STD_LOGIC;
          EEMISO : in STD_LOGIC;
          EECLK : out STD_LOGIC;
          EECS : out STD_LOGIC;
          license_ok : out std_logic;
		  
          FTDI_ADBUS : inout STD_LOGIC_VECTOR (31 downto 0);
          FTDI_BE     : inout STD_LOGIC_VECTOR (3 downto 0);
          FTDI_RXFN : in STD_LOGIC;            --EMPTY
          FTDI_TXEN : in STD_LOGIC;         --FULL
          FTDI_RDN    : out STD_LOGIC;        --READ ENABLE
          FTDI_TXN    : out STD_LOGIC;        --WRITE ENABLE
          FTDI_CLK    : in STD_LOGIC;            --FTDI CLOCK
          FTDI_OEN    : out STD_LOGIC;        --OUTPUT ENABLE NEGATO LATO FTDI
          FTDI_SIWU : out STD_LOGIC;        --COMMIT A PACKET IMMEDIATLY
    
          
			-- Register interface          
				BUS_i2c_master_0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_i2c_master_0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_i2c_master_0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_i2c_master_0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_i2c_master_0_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_i2c_master_0_CTRL_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_i2c_master_0_CTRL_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_i2c_master_0_MON_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_i2c_master_0_MON_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_TRIG_A_SEL_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_TRIG_A_SEL_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_TRIG_A_SEL_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_TRIG_A_SEL_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_VET_A_EN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_VET_A_EN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_VET_A_EN_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_VET_A_EN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_VET_B_EN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_VET_B_EN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_VET_B_EN_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_VET_B_EN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_VET_C_EN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_VET_C_EN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_VET_C_EN_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_VET_C_EN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_VET_D_EN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_VET_D_EN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_VET_D_EN_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_VET_D_EN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_SW_VET_A_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_SW_VET_A_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_SW_VET_A_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_SW_VET_A_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_SW_VET_B_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_SW_VET_B_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_SW_VET_B_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_SW_VET_B_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_SW_VET_C_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_SW_VET_C_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_SW_VET_C_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_SW_VET_C_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_SW_VET_D_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_SW_VET_D_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_SW_VET_D_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_SW_VET_D_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_TRIG_GBL_SEL_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_TRIG_GBL_SEL_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_TRIG_GBL_SEL_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_TRIG_GBL_SEL_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_EXT_DELAY_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_EXT_DELAY_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_EXT_DELAY_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_EXT_DELAY_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_SW_TRIG_FREQ_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_SW_TRIG_FREQ_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_SW_TRIG_FREQ_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_SW_TRIG_FREQ_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_A_RATE_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_A_RATE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_A_RATE_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_A_RATE_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_B_RATE_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_B_RATE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_B_RATE_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_B_RATE_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_C_RATE_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_C_RATE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_C_RATE_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_C_RATE_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_D_RATE_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_D_RATE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_D_RATE_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_D_RATE_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_T0_COUNT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_T0_COUNT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_T0_COUNT_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_T0_COUNT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_A_TRG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_A_TRG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_A_TRG_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_A_TRG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_B_TRG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_B_TRG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_B_TRG_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_B_TRG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_C_TRG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_C_TRG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_C_TRG_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_C_TRG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_D_TRG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_D_TRG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_D_TRG_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_D_TRG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_RUNSTART_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_RUNSTART_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_RUNSTART_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_RUNSTART_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_RUN_TIME_LSB_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_RUN_TIME_LSB_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_RUN_TIME_LSB_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_RUN_TIME_LSB_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_RUN_TIME_MSB_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_RUN_TIME_MSB_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_RUN_TIME_MSB_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_RUN_TIME_MSB_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_DEAD_TIME_LSB_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_DEAD_TIME_LSB_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_DEAD_TIME_LSB_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_DEAD_TIME_LSB_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_DEAD_TIME_MSB_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_DEAD_TIME_MSB_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_DEAD_TIME_MSB_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_DEAD_TIME_MSB_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_A_LOST_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_A_LOST_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_A_LOST_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_A_LOST_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_B_LOST_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_B_LOST_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_B_LOST_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_B_LOST_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_C_LOST_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_C_LOST_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_C_LOST_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_C_LOST_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_D_LOST_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_D_LOST_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_D_LOST_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_D_LOST_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_2_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_RateMeter_2_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_2_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_2_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_2_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_2_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_3_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_RateMeter_3_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_3_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_3_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_3_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_3_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_0_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_RateMeter_0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_0_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Oscilloscope_1_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Oscilloscope_1_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Oscilloscope_1_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Oscilloscope_1_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Oscilloscope_1_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Oscilloscope_1_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_1_READ_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_1_READ_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_1_READ_POSITION_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_1_READ_POSITION_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_1_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_1_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_1_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_1_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_1_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_1_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_1_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_1_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_1_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_1_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_1_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_RateMeter_1_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_1_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_1_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_1_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_1_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Oscilloscope_2_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Oscilloscope_2_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Oscilloscope_2_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Oscilloscope_2_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Oscilloscope_2_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Oscilloscope_2_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_2_READ_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_2_READ_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_2_READ_POSITION_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_2_READ_POSITION_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_2_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_2_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_2_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_2_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_2_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_2_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_2_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_2_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_2_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_2_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CitirocCfg1_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CitirocCfg1_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CitirocCfg1_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CitirocCfg1_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CitirocCfg1_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG0_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG0_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG1_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG1_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG2_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG2_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG3_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG3_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG4_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG4_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG5_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG5_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG6_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG6_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG7_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG7_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG8_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG8_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG9_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG9_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG10_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG10_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG11_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG11_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG12_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG12_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG13_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG13_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG14_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG14_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG15_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG15_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG16_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG16_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG17_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG17_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG18_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG18_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG19_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG19_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG20_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG20_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG21_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG21_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG22_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG22_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG23_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG23_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG24_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG24_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG25_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG25_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG26_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG26_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG27_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG27_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG28_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG28_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG29_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG29_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG30_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG30_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG31_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG31_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG32_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG32_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG33_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG33_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG34_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG34_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_REG_CFG35_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_REG_CFG35_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg1_START_REG_CFG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg1_START_REG_CFG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CitirocCfg2_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CitirocCfg2_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CitirocCfg2_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CitirocCfg2_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CitirocCfg2_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG0_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG0_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG1_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG1_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG2_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG2_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG3_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG3_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG4_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG4_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG5_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG5_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG6_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG6_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG7_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG7_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG8_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG8_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG9_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG9_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG10_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG10_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG11_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG11_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG12_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG12_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG13_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG13_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG14_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG14_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG15_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG15_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG16_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG16_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG17_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG17_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG18_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG18_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG19_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG19_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG20_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG20_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG21_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG21_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG22_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG22_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG23_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG23_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG24_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG24_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG25_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG25_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG26_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG26_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG27_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG27_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG28_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG28_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG29_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG29_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG30_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG30_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG31_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG31_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG32_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG32_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG33_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG33_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG34_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG34_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_REG_CFG35_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_REG_CFG35_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg2_START_REG_CFG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg2_START_REG_CFG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CitirocCfg3_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CitirocCfg3_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CitirocCfg3_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CitirocCfg3_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CitirocCfg3_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG0_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG0_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG1_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG1_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG2_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG2_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG3_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG3_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG4_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG4_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG5_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG5_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG6_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG6_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG7_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG7_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG8_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG8_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG9_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG9_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG10_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG10_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG11_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG11_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG12_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG12_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG13_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG13_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG14_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG14_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG15_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG15_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG16_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG16_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG17_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG17_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG18_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG18_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG19_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG19_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG20_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG20_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG21_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG21_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG22_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG22_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG23_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG23_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG24_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG24_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG25_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG25_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG26_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG26_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG27_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG27_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG28_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG28_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG29_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG29_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG30_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG30_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG31_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG31_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG32_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG32_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG33_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG33_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG34_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG34_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_REG_CFG35_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_REG_CFG35_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg3_START_REG_CFG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg3_START_REG_CFG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CitirocCfg0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CitirocCfg0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CitirocCfg0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CitirocCfg0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CitirocCfg0_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG0_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG0_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG1_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG1_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG2_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG2_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG3_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG3_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG4_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG4_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG5_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG5_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG6_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG6_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG7_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG7_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG8_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG8_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG9_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG9_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG10_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG10_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG11_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG11_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG12_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG12_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG13_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG13_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG14_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG14_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG15_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG15_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG16_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG16_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG17_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG17_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG18_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG18_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG19_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG19_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG20_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG20_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG21_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG21_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG22_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG22_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG23_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG23_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG24_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG24_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG25_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG25_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG26_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG26_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG27_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG27_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG28_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG28_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG29_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG29_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG30_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG30_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG31_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG31_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG32_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG32_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG33_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG33_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG34_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG34_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_REG_CFG35_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_REG_CFG35_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocCfg0_START_REG_CFG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocCfg0_START_REG_CFG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CitirocFrame0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CitirocFrame0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CitirocFrame0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CitirocFrame0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CitirocFrame0_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocFrame0_CONTROL_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocFrame0_CONTROL_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CitirocFrame0_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_CitirocFrame0_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_T0_SOFT_FREQ_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_T0_SOFT_FREQ_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_T0_SOFT_FREQ_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_T0_SOFT_FREQ_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_T0_SEL_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_T0_SEL_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_T0_SEL_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_T0_SEL_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Oscilloscope_0_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Oscilloscope_0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Oscilloscope_0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Oscilloscope_0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Oscilloscope_0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Oscilloscope_0_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_0_READ_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_0_READ_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_0_READ_POSITION_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_0_READ_POSITION_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_0_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_0_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_0_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_0_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_0_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_0_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Oscilloscope_3_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Oscilloscope_3_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Oscilloscope_3_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Oscilloscope_3_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Oscilloscope_3_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Oscilloscope_3_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_3_READ_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_3_READ_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_3_READ_POSITION_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_3_READ_POSITION_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_3_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_3_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_3_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_3_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_3_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_3_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_3_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_3_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_3_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_3_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_HOLD_TIME_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_HOLD_TIME_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_HOLD_TIME_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_HOLD_TIME_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_FR_IFP_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_FR_IFP_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_FR_IFP_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_FR_IFP_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_FR_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_FR_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_FR_LIMIT_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_FR_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_FR_IFP2_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_FR_IFP2_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_FR_IFP2_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_FR_IFP2_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_FR_MODE_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_FR_MODE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_FR_MODE_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_FR_MODE_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_FR_DBG1_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_FR_DBG1_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_FR_DBG1_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_FR_DBG1_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_FR_DBG2_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_FR_DBG2_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_FR_DBG2_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_FR_DBG2_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CP_0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CP_0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CP_0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CP_0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CP_0_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_CP_0_READ_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_CP_0_READ_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CP_0_READ_VALID_WORDS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_CP_0_READ_VALID_WORDS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CP_0_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CP_0_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_UNIQUE_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_UNIQUE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
	

			REG_Fiforeset_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
			REG_Fiforeset_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
			INT_Fiforeset_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
			INT_Fiforeset_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 


			--FLASH CONTROLLER   
			BUS_Flash_0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0);
			BUS_Flash_0_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
			BUS_Flash_0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
			BUS_Flash_0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
			BUS_Flash_0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
			BUS_Flash_0_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 

			REG_FLASH_CNTR_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
			REG_FLASH_CNTR_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
			INT_FLASH_CNTR_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
			INT_FLASH_CNTR_WR : OUT STD_LOGIC_VECTOR(0 downto 0);               

			REG_FLASH_ADDRESS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
			REG_FLASH_ADDRESS_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
			INT_FLASH_ADDRESS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
			INT_FLASH_ADDRESS_WR : OUT STD_LOGIC_VECTOR(0 downto 0);     


			--test
			BUS_Test_0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0);
			BUS_Test_0_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
			BUS_Test_0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
			BUS_Test_0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
			BUS_Test_0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
			BUS_Test_0_VLD : IN STD_LOGIC_VECTOR(0 downto 0);   			


			REG_FIRMWARE_BUILD : IN STD_LOGIC_VECTOR(31 downto 0);

			--LATO FPGA
			f_CLK : IN STD_LOGIC;
			f_RESET : IN STD_LOGIC
                        
                  
    );
    
    end component;
    
    
    component adcs_top is
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
    end component;    
    
	
    
    component init_clock_gen is
        Generic (ComponentBaseAddress : std_logic_vector(15 downto 0));
        Port ( clk : in  STD_LOGIC;
               CK_SPI_LE : out  STD_LOGIC;
               CK_SPI_CLK : out  STD_LOGIC;
               CK_SPI_MOSI : out  STD_LOGIC;
               CK_PD : out  STD_LOGIC;
               CK_LOCK : in  STD_LOGIC;
               CK_CONFIG_DONE : OUT  STD_LOGIC:='0';
               reset : in  STD_LOGIC;
               reset_out : out  STD_LOGIC;
               REG_addr : in STD_LOGIC_VECTOR (15 downto 0);
               REG_din : in STD_LOGIC_VECTOR (31 downto 0);
               REG_wrint : in STD_LOGIC
               );
    end component;
    

    
    component FlashController is
        Port (
                clk : in STD_LOGIC;
                BUS_Flash_0_READ_DATA : OUT STD_LOGIC_VECTOR(31 downto 0);
                BUS_Flash_0_ADDRESS : IN STD_LOGIC_VECTOR(15 downto 0); 
                BUS_Flash_0_WRITE_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
                BUS_Flash_0_W_INT : IN STD_LOGIC_VECTOR(0 downto 0); 
                BUS_Flash_0_R_INT : IN STD_LOGIC_VECTOR(0 downto 0); 
                BUS_Flash_0_VLD : OUT STD_LOGIC_VECTOR(0 downto 0); 
                
                REG_FLASH_CNTR_RD : OUT STD_LOGIC_VECTOR(31 downto 0); 
                REG_FLASH_CNTR_WR : IN STD_LOGIC_VECTOR(31 downto 0); 
                INT_FLASH_CNTR_RD : IN STD_LOGIC_VECTOR(0 downto 0); 
                INT_FLASH_CNTR_WR : IN STD_LOGIC_VECTOR(0 downto 0);  
                    
                REG_FLASH_ADDRESS_RD : OUT STD_LOGIC_VECTOR(31 downto 0); 
                REG_FLASH_ADDRESS_WR : IN STD_LOGIC_VECTOR(31 downto 0); 
                INT_FLASH_ADDRESS_RD : IN STD_LOGIC_VECTOR(0 downto 0); 
                INT_FLASH_ADDRESS_WR : IN STD_LOGIC_VECTOR(0 downto 0);                 
                
                
                SPI_CS : out  STD_LOGIC;
                SPI_DIN : in  STD_LOGIC;
                SPI_DOUT : out  STD_LOGIC;
                SPI_CLK : out  STD_LOGIC 
        );
    end component;    
	
	component TestBram IS
         PORT (
           clka : IN STD_LOGIC;
           wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
           addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
           dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
           douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
         );
       END component;
       	
        
    component DTClockGenerator
    port
    (  
     signal clk_out1 : out std_logic;
     signal clk_out2 : out std_logic;
     signal clk_out3 : out std_logic;
     signal clk_out4 : out std_logic;
	 signal clk_out5 : out std_logic;
     signal locked : out std_logic;
     signal clk_in1  :  in std_logic
    );
    end component;

	component fast_clock is
	port (
		clk_100 : out  STD_LOGIC;
		clk_200 : out  STD_LOGIC;
		clk_250 : out  STD_LOGIC;
		clk_250_90 : out  STD_LOGIC;
		clk_500 : out  STD_LOGIC;
		clk_500_90 : out  STD_LOGIC;
					
		reset : in  STD_LOGIC;
		locked : out  STD_LOGIC;
		clk_in1 : in  STD_LOGIC
	);
	end component;

	
	signal license_ok : std_logic;
    signal BUS_CLK     	 : STD_LOGIC_VECTOR(0 downto 0);								--CLOCK BUS
    signal CK_CONFIG_DONE :  STD_LOGIC:='0';
   
    signal sys_reset : std_LOGIC;
	
	signal D_LVDS_DCLK : STD_LOGIC;
    signal iD_LVDS_DCLK : STD_LOGIC;
     
    signal fifo_reset : std_logic_VECTOR(0 DOWNTO 0) := "0";
    signal cFiforeset : std_logic :='0';    
	signal REG_Fiforeset : std_logic_vector (31 downto 0) := (others => '0');
	
    signal CLK_80 : std_logic_vector(0 downto 0); 
    signal CLK_40 :  std_logic_vector(0 downto 0); 
    signal CLK_160 :  std_logic_vector(0 downto 0);   
    signal CLK_320 : std_logic_vector(0 downto 0); 
	signal FAST_CLK_100 : std_logic_vector (0 downto 0) := "0";
	signal FAST_CLK_200 : std_logic_vector (0 downto 0) := "0";
	signal FAST_CLK_250 : std_logic_vector (0 downto 0) := "0";
	signal FAST_CLK_250_90 : std_logic_vector (0 downto 0) := "0";
	signal FAST_CLK_500 : std_logic_vector (0 downto 0) := "0";
	signal FAST_CLK_500_90 : std_logic_vector (0 downto 0) := "0";
    
    signal async_clk : std_logic_vector (0 downto 0) := "0";
	signal GlobalClock : std_logic_vector (0 downto 0) := "0";
	
    signal GlobalReset : std_logic_vector (0 downto 0) := "0";
    signal GlobalDCMLock : std_logic; 
    signal CLK_ACQ : std_logic_vector (0 downto 0) := "0";
	
	signal itimecode_clock : std_logic;
	signal timecode_clock : std_logic;
    
    signal a_val_evt : std_logic := '0';
    signal a_val_evti : std_logic := '0';
    signal b_val_evt : std_logic := '0';
    signal c_val_evt : std_logic := '0'; 
    signal c_val_evti : std_logic := '0';
    signal d_val_evt : std_logic := '0';
        
    signal a_raz_chn : std_logic := '0';
    signal b_raz_chn : std_logic := '0';
    signal b_raz_chn_i : std_logic := '0';
    signal c_raz_chn : std_logic := '0';
    signal d_raz_chn : std_logic := '1';
    signal raz_chn_f : std_logic := '1';
    signal d_raz_chn_i : std_logic := '0';
    
    signal A_LVDS_DOUT : STD_LOGIC;
    signal B_LVDS_DOUT : STD_LOGIC;
    signal D_LVDS_DOUT : STD_LOGIC;
    signal D_LVDS_DOUTn : STD_LOGIC;        
    signal C_LVDS_DOUT : STD_LOGIC;
    signal C_LVDS_DOUTn : STD_LOGIC;
           


	signal A_STARTB_ADC_EXT_s : std_logic_vector (0 downto 0) := "0"; 
	signal B_STARTB_ADC_EXT_s : std_logic_vector (0 downto 0) := "0"; 
	signal C_STARTB_ADC_EXT_s : std_logic_vector (0 downto 0) := "0"; 
	signal D_STARTB_ADC_EXT_s : std_logic_vector (0 downto 0) := "0"; 	

	signal A_VAL_EVT_s : std_logic_vector (0 downto 0) := "1"; 
	signal B_VAL_EVT_s : std_logic_vector (0 downto 0) := "1"; 
	signal C_VAL_EVT_s : std_logic_vector (0 downto 0) := "1"; 
	signal D_VAL_EVT_s : std_logic_vector (0 downto 0) := "1"; 	

	signal A_RAZ_CHN_s : std_logic_vector (0 downto 0) := "1"; 
	signal B_RAZ_CHN_s : std_logic_vector (0 downto 0) := "1"; 
	signal C_RAZ_CHN_s : std_logic_vector (0 downto 0) := "1"; 
	signal D_RAZ_CHN_s : std_logic_vector (0 downto 0) := "1"; 	
		

    signal CITIROC_A_SRIN_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal CITIROC_B_SRIN_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal CITIROC_C_SRIN_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal CITIROC_D_SRIN_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	
	signal CITIROC_A_SCLK_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal CITIROC_B_SCLK_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal CITIROC_C_SCLK_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal CITIROC_D_SCLK_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	
	signal CITIROC_A_CHARGE_HIT_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal CITIROC_B_CHARGE_HIT_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal CITIROC_C_CHARGE_HIT_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal CITIROC_D_CHARGE_HIT_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	
	signal CITIROC_A_RESET_READ_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal CITIROC_B_RESET_READ_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal CITIROC_C_RESET_READ_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal CITIROC_D_RESET_READ_s:  STD_LOGIC_VECTOR(0 downto 0) := "0";
	
	

    signal CITIROC_A_ADC_ENERGY_LG : std_logic_vector(15 downto 0);
    signal CITIROC_B_ADC_ENERGY_LG : std_logic_vector(15 downto 0);
    signal CITIROC_C_ADC_ENERGY_LG : std_logic_vector(15 downto 0);
    signal CITIROC_D_ADC_ENERGY_LG : std_logic_vector(15 downto 0);

    signal CITIROC_A_ADC_ENERGY_HG : std_logic_vector(15 downto 0);
    signal CITIROC_B_ADC_ENERGY_HG : std_logic_vector(15 downto 0);
    signal CITIROC_C_ADC_ENERGY_HG : std_logic_vector(15 downto 0);
    signal CITIROC_D_ADC_ENERGY_HG : std_logic_vector(15 downto 0);
    
	signal TRIGGER_EXT_A_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal TRIGGER_EXT_B_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal TRIGGER_EXT_C_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal TRIGGER_EXT_D_s : STD_LOGIC_VECTOR(0 downto 0) := "0";
	
	
    signal A_RESETB_SR_s :  STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal A_SR_CK_s :      STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal A_SR_IN_s :      STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal A_SRLOAD_s :     STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal A_SELECT_s :     STD_LOGIC_VECTOR(0 downto 0) := "0";           

    --CITIROC B slow control
    signal B_RESETB_SR_s :  STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal B_SR_CK_s :      STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal B_SR_IN_s :      STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal B_SRLOAD_s :     STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal B_SELECT_s :     STD_LOGIC_VECTOR(0 downto 0) := "0";   

    --CITIROC C slow control
    signal C_RESETB_SR_s :  STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal C_SR_CK_s :      STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal C_SR_IN_s :      STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal C_SRLOAD_s :     STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal C_SELECT_s :     STD_LOGIC_VECTOR(0 downto 0) := "0";

    --CITIROC D slow control
    signal D_RESETB_SR_s :  STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal D_SR_CK_s :      STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal D_SR_IN_s :      STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal D_SRLOAD_s :     STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal D_SELECT_s :     STD_LOGIC_VECTOR(0 downto 0) := "0";
	
    signal A_HOLD_LG_s : std_logic_vector(0 downto 0) := "0";
    signal A_HOLD_HG_s : std_logic_vector(0 downto 0) := "0";         
    signal B_HOLD_LG_s : std_logic_vector(0 downto 0) := "0";
    signal B_HOLD_HG_s : std_logic_vector(0 downto 0) := "0";         
    signal C_HOLD_LG_s : std_logic_vector(0 downto 0) := "0";
    signal C_HOLD_HG_s : std_logic_vector(0 downto 0) := "0";         
    signal D_HOLD_LG_s : std_logic_vector(0 downto 0) := "0";
    signal D_HOLD_HG_s : std_logic_vector(0 downto 0) := "0";         
	
	
	signal A_TRIG0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG1 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG2 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG3 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG4 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG5 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG6 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG7 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG8 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG9 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG10 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG11 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG12 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG13 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG14 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG15 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG16 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG17 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG18 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG19 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG20 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG21 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG22 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG23 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG24 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG25 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG26 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG27 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG28 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG29 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG30 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIG31 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal A_TRIGs : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
	signal B_TRIG0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG1 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG2 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG3 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG4 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG5 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG6 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG7 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG8 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG9 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG10 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG11 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG12 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG13 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG14 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG15 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG16 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG17 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG18 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG19 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG20 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG21 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG22 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG23 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG24 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG25 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG26 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG27 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG28 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG29 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG30 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIG31 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_TRIGs : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";	
	signal C_TRIG0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG1 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG2 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG3 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG4 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG5 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG6 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG7 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG8 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG9 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG10 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG11 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG12 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG13 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG14 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG15 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG16 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG17 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG18 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG19 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG20 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG21 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG22 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG23 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG24 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG25 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG26 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG27 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG28 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG29 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG30 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIG31 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_TRIGs : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";	
	signal D_TRIG0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG1 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG2 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG3 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG4 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG5 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG6 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG7 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG8 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG9 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG10 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG11 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG12 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG13 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG14 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG15 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG16 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG17 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG18 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG19 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG20 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG21 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG22 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG23 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG24 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG25 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG26 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG27 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG28 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG29 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG30 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIG31 : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_TRIGs : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
	
	signal A_OR_CHARGE : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_OR_CHARGE : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_OR_CHARGE : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_OR_CHARGE : STD_LOGIC_VECTOR (0 downto 0) := "0";
	
	signal A_OR_TIME : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal B_OR_TIME : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal C_OR_TIME : STD_LOGIC_VECTOR (0 downto 0) := "0";
	signal D_OR_TIME : STD_LOGIC_VECTOR (0 downto 0) := "0";
		
	signal LEMO_0_1_A_OUT : std_logic_vector(0 downto 0);
    signal LEMO_0_1_A_IN : std_logic_vector(0 downto 0);
    signal LEMO_0_1_B_OUT : std_logic_vector(0 downto 0);
    signal LEMO_0_1_B_IN : std_logic_vector(0 downto 0);
	signal LEMO_2_3_A_OUT : std_logic_vector(0 downto 0);
    signal LEMO_2_3_A_IN : std_logic_vector(0 downto 0);
    signal LEMO_2_3_B_OUT : std_logic_vector(0 downto 0);
    signal LEMO_2_3_B_IN : std_logic_vector(0 downto 0);
	signal LEMO_4_5_A_OUT : std_logic_vector(0 downto 0);
    signal LEMO_4_5_A_IN : std_logic_vector(0 downto 0);
    signal LEMO_4_5_B_OUT : std_logic_vector(0 downto 0);
    signal LEMO_4_5_B_IN : std_logic_vector(0 downto 0);
	signal LEMO_6_7_A_OUT : std_logic_vector(0 downto 0);
    signal LEMO_6_7_A_IN : std_logic_vector(0 downto 0);
    signal LEMO_6_7_B_OUT : std_logic_vector(0 downto 0);
    signal LEMO_6_7_B_IN : std_logic_vector(0 downto 0);

    signal LEMO_0_1_DIRECTION : std_logic_vector(0 downto 0) := "0";
    signal LEMO_2_3_DIRECTION : std_logic_vector(0 downto 0) := "0";
    signal LEMO_4_5_DIRECTION : std_logic_vector(0 downto 0) := "0";
    signal LEMO_6_7_DIRECTION : std_logic_vector(0 downto 0) := "0";	
     	          
    signal ADC_A0 : std_logic_vector(15 downto 0);
    signal ADC_A1 : std_logic_vector(15 downto 0);
    signal ADC_A2 : std_logic_vector(15 downto 0);
    signal ADC_A3 : std_logic_vector(15 downto 0);
    signal ADC_A4 : std_logic_vector(15 downto 0);
    signal ADC_A5 : std_logic_vector(15 downto 0);
    signal ADC_A6 : std_logic_vector(15 downto 0);
    signal ADC_A7 : std_logic_vector(15 downto 0);

    signal ANALOG_INPUT_INVERSION : std_logic_vector(7 downto 0) := x"00";
    
    signal ADCreset :  std_logic := '0';
    signal EXT_READY : std_logic;
    
    attribute keep of ADC_A0: signal is "true";
    attribute keep of ADC_A1: signal is "true";
    attribute keep of ADC_A2: signal is "true";
    attribute keep of ADC_A3: signal is "true";
    attribute keep of ADC_A4: signal is "true";
    attribute keep of ADC_A5: signal is "true";
    attribute keep of ADC_A6: signal is "true";
    attribute keep of ADC_A7: signal is "true";
    
    
    signal BUS_Flash_0_READ_DATA :  STD_LOGIC_VECTOR(31 downto 0);
    signal BUS_Flash_0_ADDRESS :  STD_LOGIC_VECTOR(15 downto 0); 
    signal BUS_Flash_0_WRITE_DATA :  STD_LOGIC_VECTOR(31 downto 0); 
    signal BUS_Flash_0_W_INT :  STD_LOGIC_VECTOR(0 downto 0); 
    signal BUS_Flash_0_R_INT :  STD_LOGIC_VECTOR(0 downto 0); 
    signal BUS_Flash_0_VLD :  STD_LOGIC_VECTOR(0 downto 0);   
    
    signal REG_FLASH_CNTR_RD :  STD_LOGIC_VECTOR(31 downto 0); 
    signal REG_FLASH_CNTR_WR :  STD_LOGIC_VECTOR(31 downto 0); 
    signal INT_FLASH_CNTR_RD :  STD_LOGIC_VECTOR(0 downto 0); 
    signal INT_FLASH_CNTR_WR :  STD_LOGIC_VECTOR(0 downto 0); 
    
    signal REG_FLASH_ADDRESS_RD :  STD_LOGIC_VECTOR(31 downto 0); 
    signal REG_FLASH_ADDRESS_WR :  STD_LOGIC_VECTOR(31 downto 0); 
    signal INT_FLASH_ADDRESS_RD :  STD_LOGIC_VECTOR(0 downto 0); 
    signal INT_FLASH_ADDRESS_WR :  STD_LOGIC_VECTOR(0 downto 0);         
    
	signal BUS_Test_0_READ_DATA :  STD_LOGIC_VECTOR(31 downto 0);
    signal BUS_Test_0_ADDRESS :  STD_LOGIC_VECTOR(15 downto 0); 
    signal BUS_Test_0_WRITE_DATA :  STD_LOGIC_VECTOR(31 downto 0); 
    signal BUS_Test_0_W_INT :  STD_LOGIC_VECTOR(0 downto 0); 
    signal BUS_Test_0_R_INT :  STD_LOGIC_VECTOR(0 downto 0); 
    signal BUS_Test_0_VLD :  STD_LOGIC_VECTOR(0 downto 0) := "1";  
	
    signal FLASH_SPI_CLK : std_logic;
               
    signal clock_prog_mux_out : std_logic;
    signal done_sig : std_logic;
    signal cfg_clk : std_logic;
    
  
    signal RESET_DCM2 : std_logic;
    signal LOCKED_DCM2 : std_logic;
	
	
	signal REG_i2c_master_0_MON_RD : STD_LOGIC_VECTOR (31 DOWNTO 0);
COMPONENT i2cmaster
  GENERIC( 
	CLK_FREQ : INTEGER := 160000;
	BAUD : INTEGER := 100 );
PORT( 
	scl : inout STD_LOGIC;
	sda : inout STD_LOGIC;
	INT_REG_CTRL_WR : in STD_LOGIC_VECTOR(0 downto 0);
	REG_CTRL_WR : in STD_LOGIC_VECTOR(31 downto 0);
	REG_MON_RD : out STD_LOGIC_VECTOR(31 downto 0);
	sys_clk : in STD_LOGIC;
	sys_rst : in STD_LOGIC );
END COMPONENT;
COMPONENT CitirocSlowControl
  GENERIC( 
	CfgDefault : STD_LOGIC_VECTOR(1143 downto 0) := "1110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110110111111111111111111111111111111111111111111011111100111111101111001111011100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000111111110100101100010010110011111111111111011";
	CfgMonitorDefault : STD_LOGIC_VECTOR(255 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	DoStartupSetup : STD_LOGIC_VECTOR(0 downto 0) := "1" );
PORT( 
	ASIC_CONFIGURATION : in STD_LOGIC_VECTOR(1143 downto 0);
	ASIC_MONITOR_CONFIGURATION : in STD_LOGIC_VECTOR(255 downto 0);
	LOAD_CFG : in STD_LOGIC_VECTOR(0 downto 0);
	LOAD_MONITOR : in STD_LOGIC_VECTOR(0 downto 0);
	START_CFG : in STD_LOGIC_VECTOR(0 downto 0);
	START_MONITOR : in STD_LOGIC_VECTOR(0 downto 0);
	BUSY : out STD_LOGIC_VECTOR(0 downto 0);
	Citiroc_CLK : out STD_LOGIC;
	Citiroc_MOSI : out STD_LOGIC;
	Citiroc_SLOAD : out STD_LOGIC;
	Citiroc_RESETB : out STD_LOGIC;
	Citiroc_SELECT : out STD_LOGIC;
	reset : in STD_LOGIC;
	clk : in STD_LOGIC;
	REG_CFG0 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG1 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG2 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG3 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG4 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG5 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG6 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG7 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG8 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG9 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG10 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG11 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG12 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG13 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG14 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG15 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG16 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG17 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG18 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG19 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG20 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG21 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG22 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG23 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG24 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG25 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG26 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG27 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG28 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG29 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG30 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG31 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG32 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG33 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG34 : in STD_LOGIC_VECTOR(31 downto 0);
	REG_CFG35 : in STD_LOGIC_VECTOR(31 downto 0);
	START_REG_CFG : in STD_LOGIC_VECTOR(31 downto 0) );
END COMPONENT;
signal variable_A_FRAME_DATA : std_logic_vector (1023 downto 0); 
signal variable_A_FRAME_DV : std_logic_vector (0 downto 0); 
signal variable_B_FRAME_DATA : std_logic_vector (1023 downto 0); 
signal variable_B_FRAME_DV : std_logic_vector (0 downto 0); 
signal variable_C_FRAME_DATA : std_logic_vector (1023 downto 0); 
signal variable_C_FRAME_DV : std_logic_vector (0 downto 0); 
signal variable_D_FRAME_DATA : std_logic_vector (1023 downto 0); 
signal variable_D_FRAME_DV : std_logic_vector (0 downto 0); 
signal variable_A_TRIG_T : std_logic_vector (0 downto 0); 
signal variable_A_TRIG_C : std_logic_vector (0 downto 0); 
signal variable_B_TRIG_T : std_logic_vector (0 downto 0); 
signal variable_B_TRIG_C : std_logic_vector (0 downto 0); 
signal variable_C_TRIG_T : std_logic_vector (0 downto 0); 
signal variable_C_TRIG_C : std_logic_vector (0 downto 0); 
signal variable_D_TRIG_T : std_logic_vector (0 downto 0); 
signal variable_D_TRIG_C : std_logic_vector (0 downto 0); 
signal U20_EXT_TRIG : std_logic_vector (0 downto 0); 
signal U21_GLOBAL_TRIG : std_logic_vector (0 downto 0); 
signal U22_A_FRAME_DATA : std_logic_vector (1023 downto 0); 
signal U23_B_FRAME_DATA : std_logic_vector (1023 downto 0); 
signal U24_C_FRAME_DATA : std_logic_vector (1023 downto 0); 
signal U25_D_FRAME_DATA : std_logic_vector (1023 downto 0); 
signal U26_A_FRAME_DV : std_logic_vector (0 downto 0); 
signal U27_B_FRAME_DV : std_logic_vector (0 downto 0); 
signal U28_C_FRAME_DV : std_logic_vector (0 downto 0); 
signal U29_D_FRAME_DV : std_logic_vector (0 downto 0); 
signal U30_G_TS0 : std_logic_vector (31 downto 0); 
signal U31_G_TS : std_logic_vector (63 downto 0); 
signal U32_G_TS0 : std_logic_vector (31 downto 0); 
signal U33_G_TS : std_logic_vector (63 downto 0); 
signal U34_G_TS0 : std_logic_vector (31 downto 0); 
signal U35_G_TS : std_logic_vector (63 downto 0); 
signal U36_TRIG0 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG1 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG2 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG3 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG4 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG5 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG6 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG7 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG8 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG9 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG10 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG11 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG12 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG13 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG14 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG15 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG16 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG17 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG18 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG19 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG20 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG21 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG22 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG23 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG24 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG25 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG26 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG27 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG28 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG29 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG30 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_TRIG31 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_OR_TIME : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U36_OR_CHARGE : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U37_G_TS0 : std_logic_vector (31 downto 0); 
signal U38_G_TS : std_logic_vector (63 downto 0); 
signal variable_A_TS : std_logic_vector (63 downto 0); 
signal variable_A_TS0 : std_logic_vector (31 downto 0); 
signal variable_B_TS : std_logic_vector (63 downto 0); 
signal variable_B_TS0 : std_logic_vector (31 downto 0); 
signal variable_C_TS : std_logic_vector (63 downto 0); 
signal variable_C_TS0 : std_logic_vector (31 downto 0); 
signal variable_D_TS : std_logic_vector (63 downto 0); 
signal variable_D_TS0 : std_logic_vector (31 downto 0); 
signal U47_TRIG0 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG1 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG2 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG3 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG4 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG5 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG6 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG7 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG8 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG9 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG10 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG11 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG12 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG13 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG14 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG15 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG16 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG17 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG18 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG19 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG20 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG21 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG22 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG23 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG24 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG25 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG26 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG27 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG28 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG29 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG30 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_TRIG31 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_OR_TIME : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U47_OR_CHARGE : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG0 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG1 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG2 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG3 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG4 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG5 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG6 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG7 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG8 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG9 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG10 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG11 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG12 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG13 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG14 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG15 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG16 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG17 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG18 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG19 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG20 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG21 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG22 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG23 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG24 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG25 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG26 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG27 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG28 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG29 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG30 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_TRIG31 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_OR_TIME : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U48_OR_CHARGE : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U49_A_TS : std_logic_vector (63 downto 0); 
signal U50_A_TS0 : std_logic_vector (31 downto 0); 
signal U51_B_TS : std_logic_vector (63 downto 0); 
signal U52_B_TS0 : std_logic_vector (31 downto 0); 
signal U53_C_TS : std_logic_vector (63 downto 0); 
signal U54_C_TS0 : std_logic_vector (31 downto 0); 
signal U55_D_TS : std_logic_vector (63 downto 0); 
signal U56_D_TS0 : std_logic_vector (31 downto 0); 
signal U57_SELF_TRIG : std_logic_vector (0 downto 0); 
signal U58_out_0 : std_logic_vector(2 downto 0);
signal U59_EXT_VETO : std_logic_vector (0 downto 0); 
signal U60_EXT_TRIG : std_logic_vector (0 downto 0); 
signal U61_GLOBAL_TRIG : std_logic_vector (0 downto 0); 
signal U62_SELF_TRIG : std_logic_vector (0 downto 0); 
signal U63_EXT_VETO : std_logic_vector (0 downto 0); 
signal U64_EXT_TRIG : std_logic_vector (0 downto 0); 
signal U65_GLOBAL_TRIG : std_logic_vector (0 downto 0); 
signal U66_SELF_TRIG : std_logic_vector (0 downto 0); 
signal U67_EXT_VETO : std_logic_vector (0 downto 0); 
signal U68_EXT_TRIG : std_logic_vector (0 downto 0); 
signal U69_GLOBAL_TRIG : std_logic_vector (0 downto 0); 
signal U70_SELF_TRIG : std_logic_vector (0 downto 0); 
signal U71_EXT_VETO : std_logic_vector (0 downto 0); 
signal U72_out_0 : std_logic_vector(2 downto 0);
signal U73_out_0 : std_logic_vector(2 downto 0);
signal U74_out_0 : std_logic_vector(2 downto 0);
signal U75_out_0 : std_logic_vector(0 downto 0);
signal U76_out_0 : std_logic_vector(0 downto 0);
signal U77_out_0 : std_logic_vector(0 downto 0);
signal U78_out_0 : std_logic_vector(0 downto 0);
signal U79_out_0 : std_logic_vector(0 downto 0);
signal U80_out_0 : std_logic_vector(0 downto 0);
signal U81_out_0 : std_logic_vector(0 downto 0);
signal U82_out_0 : std_logic_vector(0 downto 0);
signal U83_A_TRIG_T : std_logic_vector (0 downto 0); 
signal U84_B_TRIG_T : std_logic_vector (0 downto 0); 
signal U85_C_TRIG_T : std_logic_vector (0 downto 0); 
signal U86_D_TRIG_T : std_logic_vector (0 downto 0); 
signal U87_A_TRIG_C : std_logic_vector (0 downto 0); 
signal U88_B_TRIG_C : std_logic_vector (0 downto 0); 
signal U89_C_TRIG_C : std_logic_vector (0 downto 0); 
signal U90_D_TRIG_C : std_logic_vector (0 downto 0); 
signal U91_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U92_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U93_out : std_logic_vector(0 downto 0);
signal variable_GLOBAL_TRIG : std_logic_vector (0 downto 0); 
signal U95_out_0 : std_logic_vector(0 downto 0);
signal U96_LEMO_4_5_A_OUT : std_logic_vector(0 downto 0) := "0";
signal U96_LEMO_4_5_B_OUT : std_logic_vector(0 downto 0) := "0";
signal  U97_const_bin : std_logic_vector(0 downto 0) := "1";

COMPONENT SW_GATE_AND_DELAY
Generic (	maxDelay : integer := 16);
PORT(
    RESET: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    CLK: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    PORT_IN: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    DELAY: IN INTEGER; 
    GATE: IN INTEGER; 
    PORT_OUT: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)); 
END COMPONENT;
signal U98_out : std_logic_vector(0 downto 0) := (others => '0');
signal U99_out_0 : integer;
signal U100_CONST : INTEGER := 0;
signal variable_EXT_TRIG : std_logic_vector (0 downto 0); 
signal variable_EXT_VETO : std_logic_vector (0 downto 0); 
signal U104_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
COMPONENT d_latch
  GENERIC( 
	IN_SIZE : INTEGER := 1;
	EDGE : STRING := "rising" );
PORT( 
	a : in STD_LOGIC_VECTOR(IN_SIZE-1 downto 0);
	CE : in STD_LOGIC;
	clk : in STD_LOGIC;
	reset : in STD_LOGIC;
	reset_val : in STD_LOGIC_VECTOR(IN_SIZE-1 downto 0);
	b : out STD_LOGIC_VECTOR(IN_SIZE-1 downto 0) );
END COMPONENT;
signal U105_PULSE : STD_LOGIC_VECTOR (0 DOWNTO 0);
COMPONENT PULSE_GENERATOR
PORT( 
	PULSE_OUT : out STD_LOGIC_VECTOR(0 downto 0);
	PULSE_PERIOD : in STD_LOGIC_VECTOR(31 downto 0);
	PULSE_WIDTH : in STD_LOGIC_VECTOR(31 downto 0);
	CE : in STD_LOGIC_VECTOR(0 downto 0);
	CLK : in STD_LOGIC_VECTOR(0 downto 0);
	RESET : in STD_LOGIC_VECTOR(0 downto 0) );
END COMPONENT;
signal U106_out_0 : std_logic_vector(31 downto 0);
signal U107_CONST : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal variable_SELF_TRIG : std_logic_vector (0 downto 0); 
signal variable_A_M_LG : std_logic_vector (15 downto 0); 
signal variable_A_M_HG : std_logic_vector (15 downto 0); 
signal variable_A_M_CLK : std_logic_vector (0 downto 0); 
signal variable_A_M_SR : std_logic_vector (0 downto 0); 
signal variable_B_M_LG : std_logic_vector (15 downto 0); 
signal variable_B_M_HG : std_logic_vector (15 downto 0); 
signal variable_B_M_CLK : std_logic_vector (0 downto 0); 
signal variable_B_M_SR : std_logic_vector (0 downto 0); 
signal variable_C_M_LG : std_logic_vector (15 downto 0); 
signal variable_C_M_HG : std_logic_vector (15 downto 0); 
signal variable_C_M_CLK : std_logic_vector (0 downto 0); 
signal variable_C_M_SR : std_logic_vector (0 downto 0); 
signal variable_D_M_LG : std_logic_vector (15 downto 0); 
signal variable_D_M_HG : std_logic_vector (15 downto 0); 
signal variable_D_M_CLK : std_logic_vector (0 downto 0); 
signal variable_D_M_SR : std_logic_vector (0 downto 0); 
signal U125_A_M_LG : std_logic_vector (15 downto 0); 
signal U126_A_M_HG : std_logic_vector (15 downto 0); 
signal U127_A_M_CLK : std_logic_vector (0 downto 0); 
signal U128_A_M_SR : std_logic_vector (0 downto 0); 
signal U129_B_M_LG : std_logic_vector (15 downto 0); 
signal U130_B_M_HG : std_logic_vector (15 downto 0); 
signal U131_B_M_CLK : std_logic_vector (0 downto 0); 
signal U132_B_M_SR : std_logic_vector (0 downto 0); 
signal U133_C_M_LG : std_logic_vector (15 downto 0); 
signal U134_C_M_HG : std_logic_vector (15 downto 0); 
signal U135_C_M_CLK : std_logic_vector (0 downto 0); 
signal U136_C_M_SR : std_logic_vector (0 downto 0); 
signal U137_D_M_LG : std_logic_vector (15 downto 0); 
signal U138_D_M_HG : std_logic_vector (15 downto 0); 
signal U139_D_M_CLK : std_logic_vector (0 downto 0); 
signal U140_D_M_SR : std_logic_vector (0 downto 0); 
signal BUS_Oscilloscope_1_READ_DATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal BUS_Oscilloscope_1_VLD : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal REG_Oscilloscope_1_READ_STATUS_RD : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal REG_Oscilloscope_1_READ_POSITION_RD : STD_LOGIC_VECTOR (31 DOWNTO 0);
COMPONENT xlx_oscilloscope_sync
  GENERIC( 
	channels : INTEGER := 2;
	memLength : INTEGER := 1024;
	wordWidth : INTEGER := 16 );
PORT( 
	ANALOG : in STD_LOGIC_VECTOR(31 downto 0);
	D0 : in STD_LOGIC_VECTOR(1 downto 0);
	D1 : in STD_LOGIC_VECTOR(1 downto 0);
	D2 : in STD_LOGIC_VECTOR(1 downto 0);
	D3 : in STD_LOGIC_VECTOR(1 downto 0);
	TRIG : in STD_LOGIC_VECTOR(0 downto 0);
	BUSY : out STD_LOGIC_VECTOR(0 downto 0);
	CE : in STD_LOGIC_VECTOR(0 downto 0);
	CLK_WRITE : in STD_LOGIC_VECTOR(0 downto 0);
	RESET : in STD_LOGIC_VECTOR(0 downto 0);
	CLK_READ : in STD_LOGIC_VECTOR(0 downto 0);
	READ_ADDRESS : in STD_LOGIC_VECTOR(15 downto 0);
	READ_DATA : out STD_LOGIC_VECTOR(31 downto 0);
	READ_DATAVALID : out STD_LOGIC_VECTOR(0 downto 0);
	READ_STATUS : out STD_LOGIC_VECTOR(31 downto 0);
	READ_POSITION : out STD_LOGIC_VECTOR(31 downto 0);
	CONFIG_TRIGGER_MODE : in STD_LOGIC_VECTOR(31 downto 0);
	CONFIG_TRIGGER_LEVEL : in STD_LOGIC_VECTOR(31 downto 0);
	CONFIG_PRETRIGGER : in STD_LOGIC_VECTOR(31 downto 0);
	CONFIG_DECIMATOR : in STD_LOGIC_VECTOR(31 downto 0);
	CONFIG_ARM : in STD_LOGIC_VECTOR(31 downto 0) );
END COMPONENT;
signal BUS_Oscilloscope_2_READ_DATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal BUS_Oscilloscope_2_VLD : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal REG_Oscilloscope_2_READ_STATUS_RD : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal REG_Oscilloscope_2_READ_POSITION_RD : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal BUS_Oscilloscope_3_READ_DATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal BUS_Oscilloscope_3_VLD : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal REG_Oscilloscope_3_READ_STATUS_RD : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal REG_Oscilloscope_3_READ_POSITION_RD : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal variable_LEMO_TRG_EXT : std_logic_vector (0 downto 0); 
signal variable_LEMO_VET_EXT : std_logic_vector (0 downto 0); 
signal U149_LEMO_TRG_EXT : std_logic_vector (0 downto 0); 
signal U150_LEMO_VET_EXT : std_logic_vector (0 downto 0); 
signal U151_LEMO_TRG_EXT : std_logic_vector (0 downto 0); 
signal U152_LEMO_VET_EXT : std_logic_vector (0 downto 0); 
signal U153_LEMO_TRG_EXT : std_logic_vector (0 downto 0); 
signal U154_LEMO_VET_EXT : std_logic_vector (0 downto 0); 
signal U155_LEMO_TRG_EXT : std_logic_vector (0 downto 0); 
signal U156_LEMO_VET_EXT : std_logic_vector (0 downto 0); 
signal U157_A_TRIG_T : std_logic_vector (0 downto 0); 
signal U158_B_TRIG_T : std_logic_vector (0 downto 0); 
signal U159_D_TRIG_T : std_logic_vector (0 downto 0); 
signal U160_A_TRIG_C : std_logic_vector (0 downto 0); 
signal U161_B_TRIG_C : std_logic_vector (0 downto 0); 
signal U162_C_TRIG_C : std_logic_vector (0 downto 0); 
signal U163_D_TRIG_C : std_logic_vector (0 downto 0); 
signal variable_A_TRG : std_logic_vector (0 downto 0); 
signal variable_B_TRG : std_logic_vector (0 downto 0); 
signal variable_C_TRG : std_logic_vector (0 downto 0); 
signal variable_D_TRG : std_logic_vector (0 downto 0); 
signal U168_A_TRG : std_logic_vector (0 downto 0); 
signal U169_B_TRG : std_logic_vector (0 downto 0); 
signal U170_C_TRG : std_logic_vector (0 downto 0); 
signal U171_D_TRG : std_logic_vector (0 downto 0); 
signal U172_C_TRIG_T : std_logic_vector (0 downto 0); 
Component FREQ_METER Is
   Generic(bitSize : Integer := 1);
   port(        RESET :  IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CLK: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        SIGIN : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        ENABLE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        FREQ: OUT STD_LOGIC_VECTOR (31 downto 0);
        INTTIME: IN INTEGER
        );
End component;
signal U173_freq : std_logic_vector(31 downto 0) := (others => '0');
signal U174_freq : std_logic_vector(31 downto 0) := (others => '0');
signal U175_freq : std_logic_vector(31 downto 0) := (others => '0');
signal U176_freq : std_logic_vector(31 downto 0) := (others => '0');
signal U177_A_TRG : std_logic_vector (0 downto 0); 
signal U178_B_TRG : std_logic_vector (0 downto 0); 
signal U179_C_TRG : std_logic_vector (0 downto 0); 
signal U180_D_TRG : std_logic_vector (0 downto 0); 
signal U181_CONST : INTEGER := 0;
signal U182_CONST : INTEGER := 0;
signal U183_CONST : INTEGER := 0;
signal U184_CONST : INTEGER := 0;
signal U185_hold : std_logic_vector(31 downto 0);
signal U186_hold : std_logic_vector(31 downto 0);
signal U187_hold : std_logic_vector(31 downto 0);
signal U188_hold : std_logic_vector(31 downto 0);
signal U189_out : std_logic_vector(0 downto 0) := (others => '0');
signal U190_CONST : INTEGER := 0;
signal U191_GLOBAL_TRIG : std_logic_vector (0 downto 0); 
signal U193_TIMESTAMP : STD_LOGIC_VECTOR (31 DOWNTO 0);
COMPONENT TimestampGenerator
  GENERIC( 
	nbits : INTEGER := 32 );
PORT( 
	TIMESTAMP : out STD_LOGIC_VECTOR(nbits-1 downto 0);
	T0 : in STD_LOGIC;
	CLK_READ : in STD_LOGIC;
	ClkCounter : in STD_LOGIC );
END COMPONENT;
signal U194_TIMESTAMP : STD_LOGIC_VECTOR (63 DOWNTO 0);
signal variable_G_TS : std_logic_vector (63 downto 0); 
signal variable_G_TS0 : std_logic_vector (31 downto 0); 
signal U197_LEMO_6_7_A_OUT : std_logic_vector(0 downto 0) := "0";
signal U197_LEMO_6_7_B_OUT : std_logic_vector(0 downto 0) := "0";
signal  U198_const_bin : std_logic_vector(0 downto 0) := "1";
Component COUNTER_RISING Is
   Generic(bitSize : Integer := 1);
   port(        RESET :  IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CE: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CLK: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        SIGIN : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        ENABLE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        COUNTER: OUT STD_LOGIC_VECTOR (31 downto 0);
        OVERFLOW: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
End component;
signal U199_counts : std_logic_vector(31 downto 0) := (others => '0');
signal U200_hold : std_logic_vector(31 downto 0);
signal U201_counts : std_logic_vector(31 downto 0) := (others => '0');
signal U202_counts : std_logic_vector(31 downto 0) := (others => '0');
signal U203_counts : std_logic_vector(31 downto 0) := (others => '0');
signal U204_counts : std_logic_vector(31 downto 0) := (others => '0');
signal U205_A_TRG : std_logic_vector (0 downto 0); 
signal U206_B_TRG : std_logic_vector (0 downto 0); 
signal U207_C_TRG : std_logic_vector (0 downto 0); 
signal U208_D_TRG : std_logic_vector (0 downto 0); 
signal U209_hold : std_logic_vector(31 downto 0);
signal U210_hold : std_logic_vector(31 downto 0);
signal U211_hold : std_logic_vector(31 downto 0);
signal U212_hold : std_logic_vector(31 downto 0);
signal U213_out_0 : std_logic_vector(0 downto 0);
signal U213_int : std_logic_vector(0 downto 0);
signal U214_RUN_START : std_logic_vector (0 downto 0); 
signal U215_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U216_RUN_START : std_logic_vector (0 downto 0); 
signal U217_RUN_START : std_logic_vector (0 downto 0); 
signal U218_RUN_START : std_logic_vector (0 downto 0); 
signal U219_RUN_START : std_logic_vector (0 downto 0); 
signal U220_RUN_START : std_logic_vector (0 downto 0); 
signal U221_out : std_logic_vector(0 downto 0) := (others => '0');
signal U222_CONST : INTEGER := 0;
signal variable_RUN_START : std_logic_vector (0 downto 0); 
signal variable_FIFO_RESET : std_logic_vector (0 downto 0); 
signal U226_FIFO_RESET : std_logic_vector (0 downto 0); 
signal U227_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal variable_DEAD_SIG : std_logic_vector (0 downto 0); 
signal U229_DEAD_SIG : std_logic_vector (0 downto 0); 
signal U230_TIME_LSB : std_logic_vector(31 downto 0);
signal U230_TIME_MSB : std_logic_vector(31 downto 0);

COMPONENT SUBPAGE_Timer64
PORT(
	Enable : IN std_logic_vector(0 downto 0);
	Reset : IN std_logic_vector(0 downto 0);
	TIME_LSB : OUT std_logic_vector(31 downto 0);
	TIME_MSB : OUT std_logic_vector(31 downto 0);
    GlobalReset: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    CLK_ACQ: in std_logic_vector (0 downto 0); 
    BUS_CLK: in std_logic_vector (0 downto 0); 
    CLK_40: in std_logic_vector (0 downto 0); 
    CLK_80: in std_logic_vector (0 downto 0); 
    clk_160: in std_logic_vector (0 downto 0); 
    clk_320: in std_logic_vector (0 downto 0); 
    FAST_CLK_100: in std_logic_vector (0 downto 0); 
    FAST_CLK_200: in std_logic_vector (0 downto 0); 
    FAST_CLK_250: in std_logic_vector (0 downto 0); 
    FAST_CLK_250_90: in std_logic_vector (0 downto 0); 
    FAST_CLK_500: in std_logic_vector (0 downto 0); 
    FAST_CLK_500_90: in std_logic_vector (0 downto 0); 
    GlobalClock: in std_logic_vector (0 downto 0); 
    async_clk: IN STD_LOGIC_VECTOR(0 DOWNTO 0)); 
END COMPONENT;
signal  U231_const_bin : std_logic_vector(0 downto 0) := "1";
signal U232_FIFO_RESET : std_logic_vector (0 downto 0); 
signal U233_TIME_LSB : std_logic_vector(31 downto 0);
signal U233_TIME_MSB : std_logic_vector(31 downto 0);
signal U234_FIFO_RESET : std_logic_vector (0 downto 0); 
signal U235_DEAD_SIG : std_logic_vector (0 downto 0); 
signal U236_counts : std_logic_vector(31 downto 0) := (others => '0');
signal U237_counts : std_logic_vector(31 downto 0) := (others => '0');
signal U238_counts : std_logic_vector(31 downto 0) := (others => '0');
signal U239_counts : std_logic_vector(31 downto 0) := (others => '0');
signal U240_A_TRG : std_logic_vector (0 downto 0); 
signal U241_B_TRG : std_logic_vector (0 downto 0); 
signal U242_C_TRG : std_logic_vector (0 downto 0); 
signal U243_D_TRG : std_logic_vector (0 downto 0); 
signal U244_RUN_START : std_logic_vector (0 downto 0); 
signal U245_RUN_START : std_logic_vector (0 downto 0); 
signal U246_RUN_START : std_logic_vector (0 downto 0); 
signal U247_RUN_START : std_logic_vector (0 downto 0); 
signal U248_DEAD_SIG : std_logic_vector (0 downto 0); 
signal U249_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U250_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U251_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U252_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U253_hold : std_logic_vector(31 downto 0);
signal U254_hold : std_logic_vector(31 downto 0);
signal U255_hold : std_logic_vector(31 downto 0);
signal U256_hold : std_logic_vector(31 downto 0);
signal U257_hold : std_logic_vector(31 downto 0);
signal U258_hold : std_logic_vector(31 downto 0);
signal U259_hold : std_logic_vector(31 downto 0);
signal U260_hold : std_logic_vector(31 downto 0);
signal U261_FIFO_RESET : std_logic_vector (0 downto 0); 
signal variable_A_ABUSY : std_logic_vector (0 downto 0); 
signal variable_B_ABUSY : std_logic_vector (0 downto 0); 
signal variable_C_ABUSY : std_logic_vector (0 downto 0); 
signal variable_D_ABUSY : std_logic_vector (0 downto 0); 
signal U266_A_ABUSY : std_logic_vector (0 downto 0); 
signal U267_B_ABUSY : std_logic_vector (0 downto 0); 
signal U268_C_ABUSY : std_logic_vector (0 downto 0); 
signal U269_D_ABUSY : std_logic_vector (0 downto 0); 
signal variable_A_DEAD : std_logic_vector (0 downto 0); 
signal variable_B_DEAD : std_logic_vector (0 downto 0); 
signal variable_C_DEAD : std_logic_vector (0 downto 0); 
signal variable_D_DEAD : std_logic_vector (0 downto 0); 
signal U274_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U275_DEAD_SIG : std_logic_vector (0 downto 0); 
signal U276_DEAD_SIG : std_logic_vector (0 downto 0); 
signal U277_DEAD_SIG : std_logic_vector (0 downto 0); 
signal U278_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U279_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U280_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal BUS_RateMeter_0_READ_DATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal BUS_RateMeter_0_VLD : STD_LOGIC_VECTOR (0 DOWNTO 0);
COMPONENT MCRateMeter
  GENERIC( 
	CHANNEL_COUNT : INTEGER := 32;
	CLK_FREQ : INTEGER := 160000000 );
PORT( 
	trigger : in STD_LOGIC_VECTOR(31 downto 0);
	VETO : in STD_LOGIC;
	CLK : in STD_LOGIC;
	CLK_READ : in STD_LOGIC_VECTOR(0 downto 0);
	READ_ADDRESS : in STD_LOGIC_VECTOR(15 downto 0);
	READ_DATA : out STD_LOGIC_VECTOR(31 downto 0);
	READ_DATAVALID : out STD_LOGIC_VECTOR(0 downto 0) );
END COMPONENT;
signal BUS_RateMeter_1_READ_DATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal BUS_RateMeter_1_VLD : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal BUS_RateMeter_2_READ_DATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal BUS_RateMeter_2_VLD : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal BUS_RateMeter_3_READ_DATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal BUS_RateMeter_3_VLD : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG0 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG1 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG2 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG3 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG4 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG5 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG6 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG7 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG8 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG9 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG10 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG11 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG12 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG13 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG14 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG15 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG16 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG17 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG18 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG19 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG20 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG21 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG22 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG23 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG24 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG25 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG26 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG27 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG28 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG29 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG30 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_TRIG31 : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_OR_TIME : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U295_OR_CHARGE : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U296_A_FRAME_ACK : std_logic_vector (0 downto 0); 
signal U297_B_FRAME_ACK : std_logic_vector (0 downto 0); 
signal U298_C_FRAME_ACK : std_logic_vector (0 downto 0); 
signal U299_D_FRAME_ACK : std_logic_vector (0 downto 0); 
signal variable_A_FRAME_ACK : std_logic_vector (0 downto 0); 
signal variable_B_FRAME_ACK : std_logic_vector (0 downto 0); 
signal variable_C_FRAME_ACK : std_logic_vector (0 downto 0); 
signal variable_D_FRAME_ACK : std_logic_vector (0 downto 0); 
signal U305_ACK_A : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U305_ACK_B : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U305_ACK_C : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U305_ACK_D : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U305_FULL : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U305_BUSY : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal REG_CitirocFrame0_STATUS_RD : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal BUS_CitirocFrame0_READ_DATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal BUS_CitirocFrame0_VLD : STD_LOGIC_VECTOR (0 DOWNTO 0);
COMPONENT CitirocFrameTransfer
  GENERIC( 
	memLength : INTEGER := 8192 );
PORT( 
	DATA_A : in STD_LOGIC_VECTOR(1023 downto 0);
	TS_T0_A : in STD_LOGIC_VECTOR(31 downto 0);
	TS_A : in STD_LOGIC_VECTOR(63 downto 0);
	DV_A : in STD_LOGIC;
	ACK_A : out STD_LOGIC;
	DATA_B : in STD_LOGIC_VECTOR(1023 downto 0);
	TS_T0_B : in STD_LOGIC_VECTOR(31 downto 0);
	TS_B : in STD_LOGIC_VECTOR(63 downto 0);
	DV_B : in STD_LOGIC;
	ACK_B : out STD_LOGIC;
	DATA_C : in STD_LOGIC_VECTOR(1023 downto 0);
	TS_T0_C : in STD_LOGIC_VECTOR(31 downto 0);
	TS_C : in STD_LOGIC_VECTOR(63 downto 0);
	DV_C : in STD_LOGIC;
	ACK_C : out STD_LOGIC;
	DATA_D : in STD_LOGIC_VECTOR(1023 downto 0);
	TS_T0_D : in STD_LOGIC_VECTOR(31 downto 0);
	TS_D : in STD_LOGIC_VECTOR(63 downto 0);
	DV_D : in STD_LOGIC;
	ACK_D : out STD_LOGIC;
	FIFO_FULL : out STD_LOGIC_VECTOR(0 downto 0);
	DATA_AVAL : out STD_LOGIC_VECTOR(0 downto 0);
	BUSY : out STD_LOGIC_VECTOR(0 downto 0);
	READ_RESET : in STD_LOGIC;
	READ_CLK : in STD_LOGIC;
	CLK : in STD_LOGIC;
	RESET : in STD_LOGIC;
	CONTROL_REG : in STD_LOGIC_VECTOR(31 downto 0);
	STATUS_REG : out STD_LOGIC_VECTOR(31 downto 0);
	READ_DATA : out STD_LOGIC_VECTOR(31 downto 0);
	READ_DATAVALID : out STD_LOGIC_VECTOR(0 downto 0);
	READ_RD_INT : in STD_LOGIC_VECTOR(0 downto 0) );
END COMPONENT;
signal U306_PULSE : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U307_out : std_logic_vector(0 downto 0);
signal U308_CONST : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal U309_out_0 : std_logic_vector(31 downto 0);
signal U310_out_0 : std_logic_vector(0 downto 0);
signal BUS_Oscilloscope_0_READ_DATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal BUS_Oscilloscope_0_VLD : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal REG_Oscilloscope_0_READ_STATUS_RD : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal REG_Oscilloscope_0_READ_POSITION_RD : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal variable_A_HIT : std_logic_vector (0 downto 0); 
signal variable_B_HIT : std_logic_vector (0 downto 0); 
signal variable_C_HIT : std_logic_vector (0 downto 0); 
signal variable_D_HIT : std_logic_vector (0 downto 0); 
signal U317_A_HIT : std_logic_vector (0 downto 0); 
signal U318_B_HIT : std_logic_vector (0 downto 0); 
signal U319_C_HIT : std_logic_vector (0 downto 0); 
signal U320_D_HIT : std_logic_vector (0 downto 0); 
signal U321_BUSY : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U321_S_HIT : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U321_P_FRAME_DV : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U321_P_FRAME_DATA : STD_LOGIC_VECTOR (1023 DOWNTO 0);
signal U321_M_ENERGY_HG : STD_LOGIC_VECTOR (15 DOWNTO 0);
signal U321_M_ENERGY_LG : STD_LOGIC_VECTOR (15 DOWNTO 0);
signal U321_M_CLK : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U321_M_DIN : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U321_TS_OUT : STD_LOGIC_VECTOR (63 DOWNTO 0);
signal U321_TS0_OUT : STD_LOGIC_VECTOR (31 DOWNTO 0);
COMPONENT CitirocAnalogReadout
  GENERIC( 
	CLKDIV : INTEGER := 320 );
PORT( 
	TRIG : in STD_LOGIC;
	reject_data : in STD_LOGIC;
	HOLD_WIN_LENGTH : in STD_LOGIC_VECTOR(15 downto 0);
	BUSY : out STD_LOGIC;
	S_CHID : out STD_LOGIC_VECTOR(4 downto 0);
	S_ENERGY_LG : out STD_LOGIC_VECTOR(15 downto 0);
	S_ENERGY_HG : out STD_LOGIC_VECTOR(15 downto 0);
	S_HIT : out STD_LOGIC;
	S_DV : out STD_LOGIC;
	P_ENERGY_0_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_0_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_0 : out STD_LOGIC;
	P_ENERGY_1_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_1_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_1 : out STD_LOGIC;
	P_ENERGY_2_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_2_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_2 : out STD_LOGIC;
	P_ENERGY_3_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_3_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_3 : out STD_LOGIC;
	P_ENERGY_4_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_4_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_4 : out STD_LOGIC;
	P_ENERGY_5_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_5_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_5 : out STD_LOGIC;
	P_ENERGY_6_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_6_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_6 : out STD_LOGIC;
	P_ENERGY_7_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_7_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_7 : out STD_LOGIC;
	P_ENERGY_8_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_8_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_8 : out STD_LOGIC;
	P_ENERGY_9_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_9_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_9 : out STD_LOGIC;
	P_ENERGY_10_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_10_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_10 : out STD_LOGIC;
	P_ENERGY_11_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_11_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_11 : out STD_LOGIC;
	P_ENERGY_12_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_12_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_12 : out STD_LOGIC;
	P_ENERGY_13_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_13_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_13 : out STD_LOGIC;
	P_ENERGY_14_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_14_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_14 : out STD_LOGIC;
	P_ENERGY_15_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_15_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_15 : out STD_LOGIC;
	P_ENERGY_16_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_16_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_16 : out STD_LOGIC;
	P_ENERGY_17_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_17_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_17 : out STD_LOGIC;
	P_ENERGY_18_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_18_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_18 : out STD_LOGIC;
	P_ENERGY_19_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_19_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_19 : out STD_LOGIC;
	P_ENERGY_20_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_20_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_20 : out STD_LOGIC;
	P_ENERGY_21_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_21_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_21 : out STD_LOGIC;
	P_ENERGY_22_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_22_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_22 : out STD_LOGIC;
	P_ENERGY_23_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_23_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_23 : out STD_LOGIC;
	P_ENERGY_24_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_24_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_24 : out STD_LOGIC;
	P_ENERGY_25_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_25_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_25 : out STD_LOGIC;
	P_ENERGY_26_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_26_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_26 : out STD_LOGIC;
	P_ENERGY_27_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_27_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_27 : out STD_LOGIC;
	P_ENERGY_28_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_28_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_28 : out STD_LOGIC;
	P_ENERGY_29_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_29_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_29 : out STD_LOGIC;
	P_ENERGY_30_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_30_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_30 : out STD_LOGIC;
	P_ENERGY_31_HG : out STD_LOGIC_VECTOR(15 downto 0);
	P_ENERGY_31_LG : out STD_LOGIC_VECTOR(15 downto 0);
	P_HIT_31 : out STD_LOGIC;
	P_DV : out STD_LOGIC;
	P_FRAME_DV : out STD_LOGIC;
	P_FRAME_ACK : in STD_LOGIC;
	P_FRAME_DATA : out STD_LOGIC_VECTOR(1023 downto 0);
	M_ENERGY_HG : out STD_LOGIC_VECTOR(15 downto 0);
	M_ENERGY_LG : out STD_LOGIC_VECTOR(15 downto 0);
	M_CLK : out STD_LOGIC_VECTOR(0 downto 0);
	M_DIN : out STD_LOGIC_VECTOR(0 downto 0);
	TS_IN : in STD_LOGIC_VECTOR(63 downto 0);
	TS_OUT : out STD_LOGIC_VECTOR(63 downto 0);
	TS0_IN : in STD_LOGIC_VECTOR(31 downto 0);
	TS0_OUT : out STD_LOGIC_VECTOR(31 downto 0);
	ADC_IN_HG : in STD_LOGIC_VECTOR(15 downto 0);
	ADC_IN_LG : in STD_LOGIC_VECTOR(15 downto 0);
	CHARGE_HIT_in : in STD_LOGIC;
	chrage_srin_a : out STD_LOGIC;
	chrage_clk_a : out STD_LOGIC;
	chrage_sr_resetb : out STD_LOGIC;
	val_evnt : out STD_LOGIC;
	raz_chn : out STD_LOGIC;
	hold_hg : out STD_LOGIC;
	hold_lg : out STD_LOGIC;
	clk : in STD_LOGIC;
	reset : in STD_LOGIC );
END COMPONENT;
signal U322_BUSY : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U322_S_HIT : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U322_P_FRAME_DV : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U322_P_FRAME_DATA : STD_LOGIC_VECTOR (1023 DOWNTO 0);
signal U322_M_ENERGY_HG : STD_LOGIC_VECTOR (15 DOWNTO 0);
signal U322_M_ENERGY_LG : STD_LOGIC_VECTOR (15 DOWNTO 0);
signal U322_M_CLK : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U322_M_DIN : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U322_TS_OUT : STD_LOGIC_VECTOR (63 DOWNTO 0);
signal U322_TS0_OUT : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal U323_BUSY : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U323_S_HIT : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U323_P_FRAME_DV : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U323_P_FRAME_DATA : STD_LOGIC_VECTOR (1023 DOWNTO 0);
signal U323_M_ENERGY_HG : STD_LOGIC_VECTOR (15 DOWNTO 0);
signal U323_M_ENERGY_LG : STD_LOGIC_VECTOR (15 DOWNTO 0);
signal U323_M_CLK : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U323_M_DIN : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U323_TS_OUT : STD_LOGIC_VECTOR (63 DOWNTO 0);
signal U323_TS0_OUT : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal U324_BUSY : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U324_S_HIT : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U324_P_FRAME_DV : STD_LOGIC_VECTOR(0 downto 0) := "0";
signal U324_P_FRAME_DATA : STD_LOGIC_VECTOR (1023 DOWNTO 0);
signal U324_M_ENERGY_HG : STD_LOGIC_VECTOR (15 DOWNTO 0);
signal U324_M_ENERGY_LG : STD_LOGIC_VECTOR (15 DOWNTO 0);
signal U324_M_CLK : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U324_M_DIN : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U324_TS_OUT : STD_LOGIC_VECTOR (63 DOWNTO 0);
signal U324_TS0_OUT : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal U325_out_0 : std_logic_vector(15 downto 0);
signal U326_out_0 : std_logic_vector(15 downto 0);
signal U327_out_0 : std_logic_vector(15 downto 0);
signal U328_out_0 : std_logic_vector(15 downto 0);
signal U329_TRIG_OUT : std_logic_vector(0 downto 0);
signal U329_TRIG_EXT_OUT : std_logic_vector(0 downto 0);

COMPONENT SUBPAGE_TriggerLogic
PORT(
	TRIG_T : IN std_logic_vector(0 downto 0);
	TRIG_C : IN std_logic_vector(0 downto 0);
	EXT_TRIG : IN std_logic_vector(0 downto 0);
	GLB_TRIG : IN std_logic_vector(0 downto 0);
	SELF_TRIG : IN std_logic_vector(0 downto 0);
	SEL_TRIG : IN std_logic_vector(2 downto 0);
	EN_VETO : IN std_logic_vector(0 downto 0);
	EXT_VETO : IN std_logic_vector(0 downto 0);
	SW_VETO : IN std_logic_vector(0 downto 0);
	TRIG_OUT : OUT std_logic_vector(0 downto 0);
	TRIG_EXT_OUT : OUT std_logic_vector(0 downto 0);
    GlobalReset: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    CLK_ACQ: in std_logic_vector (0 downto 0); 
    BUS_CLK: in std_logic_vector (0 downto 0); 
    CLK_40: in std_logic_vector (0 downto 0); 
    CLK_80: in std_logic_vector (0 downto 0); 
    clk_160: in std_logic_vector (0 downto 0); 
    clk_320: in std_logic_vector (0 downto 0); 
    FAST_CLK_100: in std_logic_vector (0 downto 0); 
    FAST_CLK_200: in std_logic_vector (0 downto 0); 
    FAST_CLK_250: in std_logic_vector (0 downto 0); 
    FAST_CLK_250_90: in std_logic_vector (0 downto 0); 
    FAST_CLK_500: in std_logic_vector (0 downto 0); 
    FAST_CLK_500_90: in std_logic_vector (0 downto 0); 
    GlobalClock: in std_logic_vector (0 downto 0); 
    async_clk: IN STD_LOGIC_VECTOR(0 DOWNTO 0)); 
END COMPONENT;
signal U330_TRIG_OUT : std_logic_vector(0 downto 0);
signal U330_TRIG_EXT_OUT : std_logic_vector(0 downto 0);
signal U331_TRIG_OUT : std_logic_vector(0 downto 0);
signal U331_TRIG_EXT_OUT : std_logic_vector(0 downto 0);
signal U332_TRIG_OUT : std_logic_vector(0 downto 0);
signal U332_TRIG_EXT_OUT : std_logic_vector(0 downto 0);
signal U333_C_0 : std_logic_vector(31 downto 0);
signal U333_C_1 : std_logic_vector(31 downto 0);
signal U333_C_2 : std_logic_vector(31 downto 0);
signal U333_C_3 : std_logic_vector(31 downto 0);
signal U333_C_4 : std_logic_vector(31 downto 0);
signal U333_C_5 : std_logic_vector(31 downto 0);
signal U333_C_6 : std_logic_vector(31 downto 0);
signal U333_C_7 : std_logic_vector(31 downto 0);
signal U333_C_8 : std_logic_vector(31 downto 0);
signal U333_C_9 : std_logic_vector(31 downto 0);
signal U333_C_10 : std_logic_vector(31 downto 0);
signal U333_C_11 : std_logic_vector(31 downto 0);
signal U333_C_12 : std_logic_vector(31 downto 0);
signal U333_C_13 : std_logic_vector(31 downto 0);
signal U333_C_14 : std_logic_vector(31 downto 0);
signal U333_C_15 : std_logic_vector(31 downto 0);
signal U333_C_16 : std_logic_vector(31 downto 0);
signal U333_C_17 : std_logic_vector(31 downto 0);
signal U333_C_18 : std_logic_vector(31 downto 0);
signal U333_C_19 : std_logic_vector(31 downto 0);
signal U333_C_20 : std_logic_vector(31 downto 0);
signal U333_C_21 : std_logic_vector(31 downto 0);
signal U333_C_22 : std_logic_vector(31 downto 0);
signal U333_C_23 : std_logic_vector(31 downto 0);
signal U333_C_24 : std_logic_vector(31 downto 0);
signal U333_C_25 : std_logic_vector(31 downto 0);
signal U333_C_26 : std_logic_vector(31 downto 0);
signal U333_C_27 : std_logic_vector(31 downto 0);
signal U333_C_28 : std_logic_vector(31 downto 0);
signal U333_C_29 : std_logic_vector(31 downto 0);
signal U333_C_30 : std_logic_vector(31 downto 0);
signal U333_C_31 : std_logic_vector(31 downto 0);

COMPONENT SUBPAGE_Framing
PORT(
	T_0 : IN std_logic_vector(0 downto 0);
	T_1 : IN std_logic_vector(0 downto 0);
	T_2 : IN std_logic_vector(0 downto 0);
	T_3 : IN std_logic_vector(0 downto 0);
	T_4 : IN std_logic_vector(0 downto 0);
	T_5 : IN std_logic_vector(0 downto 0);
	T_6 : IN std_logic_vector(0 downto 0);
	T_7 : IN std_logic_vector(0 downto 0);
	T_8 : IN std_logic_vector(0 downto 0);
	T_9 : IN std_logic_vector(0 downto 0);
	T_10 : IN std_logic_vector(0 downto 0);
	T_11 : IN std_logic_vector(0 downto 0);
	T_12 : IN std_logic_vector(0 downto 0);
	T_13 : IN std_logic_vector(0 downto 0);
	T_14 : IN std_logic_vector(0 downto 0);
	T_15 : IN std_logic_vector(0 downto 0);
	T_16 : IN std_logic_vector(0 downto 0);
	T_17 : IN std_logic_vector(0 downto 0);
	T_18 : IN std_logic_vector(0 downto 0);
	T_19 : IN std_logic_vector(0 downto 0);
	T_20 : IN std_logic_vector(0 downto 0);
	T_21 : IN std_logic_vector(0 downto 0);
	T_22 : IN std_logic_vector(0 downto 0);
	T_23 : IN std_logic_vector(0 downto 0);
	T_24 : IN std_logic_vector(0 downto 0);
	T_25 : IN std_logic_vector(0 downto 0);
	T_26 : IN std_logic_vector(0 downto 0);
	T_27 : IN std_logic_vector(0 downto 0);
	T_28 : IN std_logic_vector(0 downto 0);
	T_29 : IN std_logic_vector(0 downto 0);
	T_30 : IN std_logic_vector(0 downto 0);
	T_31 : IN std_logic_vector(0 downto 0);
	FRAME : IN std_logic_vector(0 downto 0);
	C_0 : OUT std_logic_vector(31 downto 0);
	C_1 : OUT std_logic_vector(31 downto 0);
	C_2 : OUT std_logic_vector(31 downto 0);
	C_3 : OUT std_logic_vector(31 downto 0);
	C_4 : OUT std_logic_vector(31 downto 0);
	C_5 : OUT std_logic_vector(31 downto 0);
	C_6 : OUT std_logic_vector(31 downto 0);
	C_7 : OUT std_logic_vector(31 downto 0);
	C_8 : OUT std_logic_vector(31 downto 0);
	C_9 : OUT std_logic_vector(31 downto 0);
	C_10 : OUT std_logic_vector(31 downto 0);
	C_11 : OUT std_logic_vector(31 downto 0);
	C_12 : OUT std_logic_vector(31 downto 0);
	C_13 : OUT std_logic_vector(31 downto 0);
	C_14 : OUT std_logic_vector(31 downto 0);
	C_15 : OUT std_logic_vector(31 downto 0);
	C_16 : OUT std_logic_vector(31 downto 0);
	C_17 : OUT std_logic_vector(31 downto 0);
	C_18 : OUT std_logic_vector(31 downto 0);
	C_19 : OUT std_logic_vector(31 downto 0);
	C_20 : OUT std_logic_vector(31 downto 0);
	C_21 : OUT std_logic_vector(31 downto 0);
	C_22 : OUT std_logic_vector(31 downto 0);
	C_23 : OUT std_logic_vector(31 downto 0);
	C_24 : OUT std_logic_vector(31 downto 0);
	C_25 : OUT std_logic_vector(31 downto 0);
	C_26 : OUT std_logic_vector(31 downto 0);
	C_27 : OUT std_logic_vector(31 downto 0);
	C_28 : OUT std_logic_vector(31 downto 0);
	C_29 : OUT std_logic_vector(31 downto 0);
	C_30 : OUT std_logic_vector(31 downto 0);
	C_31 : OUT std_logic_vector(31 downto 0);
    GlobalReset: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    CLK_ACQ: in std_logic_vector (0 downto 0); 
    BUS_CLK: in std_logic_vector (0 downto 0); 
    CLK_40: in std_logic_vector (0 downto 0); 
    CLK_80: in std_logic_vector (0 downto 0); 
    clk_160: in std_logic_vector (0 downto 0); 
    clk_320: in std_logic_vector (0 downto 0); 
    FAST_CLK_100: in std_logic_vector (0 downto 0); 
    FAST_CLK_200: in std_logic_vector (0 downto 0); 
    FAST_CLK_250: in std_logic_vector (0 downto 0); 
    FAST_CLK_250_90: in std_logic_vector (0 downto 0); 
    FAST_CLK_500: in std_logic_vector (0 downto 0); 
    FAST_CLK_500_90: in std_logic_vector (0 downto 0); 
    GlobalClock: in std_logic_vector (0 downto 0); 
    async_clk: IN STD_LOGIC_VECTOR(0 DOWNTO 0)); 
END COMPONENT;
signal U334_C_0 : std_logic_vector(31 downto 0);
signal U334_C_1 : std_logic_vector(31 downto 0);
signal U334_C_2 : std_logic_vector(31 downto 0);
signal U334_C_3 : std_logic_vector(31 downto 0);
signal U334_C_4 : std_logic_vector(31 downto 0);
signal U334_C_5 : std_logic_vector(31 downto 0);
signal U334_C_6 : std_logic_vector(31 downto 0);
signal U334_C_7 : std_logic_vector(31 downto 0);
signal U334_C_8 : std_logic_vector(31 downto 0);
signal U334_C_9 : std_logic_vector(31 downto 0);
signal U334_C_10 : std_logic_vector(31 downto 0);
signal U334_C_11 : std_logic_vector(31 downto 0);
signal U334_C_12 : std_logic_vector(31 downto 0);
signal U334_C_13 : std_logic_vector(31 downto 0);
signal U334_C_14 : std_logic_vector(31 downto 0);
signal U334_C_15 : std_logic_vector(31 downto 0);
signal U334_C_16 : std_logic_vector(31 downto 0);
signal U334_C_17 : std_logic_vector(31 downto 0);
signal U334_C_18 : std_logic_vector(31 downto 0);
signal U334_C_19 : std_logic_vector(31 downto 0);
signal U334_C_20 : std_logic_vector(31 downto 0);
signal U334_C_21 : std_logic_vector(31 downto 0);
signal U334_C_22 : std_logic_vector(31 downto 0);
signal U334_C_23 : std_logic_vector(31 downto 0);
signal U334_C_24 : std_logic_vector(31 downto 0);
signal U334_C_25 : std_logic_vector(31 downto 0);
signal U334_C_26 : std_logic_vector(31 downto 0);
signal U334_C_27 : std_logic_vector(31 downto 0);
signal U334_C_28 : std_logic_vector(31 downto 0);
signal U334_C_29 : std_logic_vector(31 downto 0);
signal U334_C_30 : std_logic_vector(31 downto 0);
signal U334_C_31 : std_logic_vector(31 downto 0);
signal U335_C_0 : std_logic_vector(31 downto 0);
signal U335_C_1 : std_logic_vector(31 downto 0);
signal U335_C_2 : std_logic_vector(31 downto 0);
signal U335_C_3 : std_logic_vector(31 downto 0);
signal U335_C_4 : std_logic_vector(31 downto 0);
signal U335_C_5 : std_logic_vector(31 downto 0);
signal U335_C_6 : std_logic_vector(31 downto 0);
signal U335_C_7 : std_logic_vector(31 downto 0);
signal U335_C_8 : std_logic_vector(31 downto 0);
signal U335_C_9 : std_logic_vector(31 downto 0);
signal U335_C_10 : std_logic_vector(31 downto 0);
signal U335_C_11 : std_logic_vector(31 downto 0);
signal U335_C_12 : std_logic_vector(31 downto 0);
signal U335_C_13 : std_logic_vector(31 downto 0);
signal U335_C_14 : std_logic_vector(31 downto 0);
signal U335_C_15 : std_logic_vector(31 downto 0);
signal U335_C_16 : std_logic_vector(31 downto 0);
signal U335_C_17 : std_logic_vector(31 downto 0);
signal U335_C_18 : std_logic_vector(31 downto 0);
signal U335_C_19 : std_logic_vector(31 downto 0);
signal U335_C_20 : std_logic_vector(31 downto 0);
signal U335_C_21 : std_logic_vector(31 downto 0);
signal U335_C_22 : std_logic_vector(31 downto 0);
signal U335_C_23 : std_logic_vector(31 downto 0);
signal U335_C_24 : std_logic_vector(31 downto 0);
signal U335_C_25 : std_logic_vector(31 downto 0);
signal U335_C_26 : std_logic_vector(31 downto 0);
signal U335_C_27 : std_logic_vector(31 downto 0);
signal U335_C_28 : std_logic_vector(31 downto 0);
signal U335_C_29 : std_logic_vector(31 downto 0);
signal U335_C_30 : std_logic_vector(31 downto 0);
signal U335_C_31 : std_logic_vector(31 downto 0);
signal U336_C_0 : std_logic_vector(31 downto 0);
signal U336_C_1 : std_logic_vector(31 downto 0);
signal U336_C_2 : std_logic_vector(31 downto 0);
signal U336_C_3 : std_logic_vector(31 downto 0);
signal U336_C_4 : std_logic_vector(31 downto 0);
signal U336_C_5 : std_logic_vector(31 downto 0);
signal U336_C_6 : std_logic_vector(31 downto 0);
signal U336_C_7 : std_logic_vector(31 downto 0);
signal U336_C_8 : std_logic_vector(31 downto 0);
signal U336_C_9 : std_logic_vector(31 downto 0);
signal U336_C_10 : std_logic_vector(31 downto 0);
signal U336_C_11 : std_logic_vector(31 downto 0);
signal U336_C_12 : std_logic_vector(31 downto 0);
signal U336_C_13 : std_logic_vector(31 downto 0);
signal U336_C_14 : std_logic_vector(31 downto 0);
signal U336_C_15 : std_logic_vector(31 downto 0);
signal U336_C_16 : std_logic_vector(31 downto 0);
signal U336_C_17 : std_logic_vector(31 downto 0);
signal U336_C_18 : std_logic_vector(31 downto 0);
signal U336_C_19 : std_logic_vector(31 downto 0);
signal U336_C_20 : std_logic_vector(31 downto 0);
signal U336_C_21 : std_logic_vector(31 downto 0);
signal U336_C_22 : std_logic_vector(31 downto 0);
signal U336_C_23 : std_logic_vector(31 downto 0);
signal U336_C_24 : std_logic_vector(31 downto 0);
signal U336_C_25 : std_logic_vector(31 downto 0);
signal U336_C_26 : std_logic_vector(31 downto 0);
signal U336_C_27 : std_logic_vector(31 downto 0);
signal U336_C_28 : std_logic_vector(31 downto 0);
signal U336_C_29 : std_logic_vector(31 downto 0);
signal U336_C_30 : std_logic_vector(31 downto 0);
signal U336_C_31 : std_logic_vector(31 downto 0);
signal U337_A_TRG_0 : std_logic_vector(0 downto 0) := "0";
signal U338_A_TRG_1 : std_logic_vector(0 downto 0) := "0";
signal U339_A_TRG_2 : std_logic_vector(0 downto 0) := "0";
signal U340_A_TRG_3 : std_logic_vector(0 downto 0) := "0";
signal U341_A_TRG_4 : std_logic_vector(0 downto 0) := "0";
signal U342_A_TRG_5 : std_logic_vector(0 downto 0) := "0";
signal U343_A_TRG_6 : std_logic_vector(0 downto 0) := "0";
signal U344_A_TRG_7 : std_logic_vector(0 downto 0) := "0";
signal U345_A_TRG_8 : std_logic_vector(0 downto 0) := "0";
signal U346_A_TRG_9 : std_logic_vector(0 downto 0) := "0";
signal U347_A_TRG_10 : std_logic_vector(0 downto 0) := "0";
signal U348_A_TRG_11 : std_logic_vector(0 downto 0) := "0";
signal U349_A_TRG_12 : std_logic_vector(0 downto 0) := "0";
signal U350_A_TRG_13 : std_logic_vector(0 downto 0) := "0";
signal U351_A_TRG_14 : std_logic_vector(0 downto 0) := "0";
signal U352_A_TRG_15 : std_logic_vector(0 downto 0) := "0";
signal U353_A_TRG_16 : std_logic_vector(0 downto 0) := "0";
signal U354_A_TRG_17 : std_logic_vector(0 downto 0) := "0";
signal U355_A_TRG_18 : std_logic_vector(0 downto 0) := "0";
signal U356_A_TRG_19 : std_logic_vector(0 downto 0) := "0";
signal U357_A_TRG_20 : std_logic_vector(0 downto 0) := "0";
signal U358_A_TRG_21 : std_logic_vector(0 downto 0) := "0";
signal U359_A_TRG_22 : std_logic_vector(0 downto 0) := "0";
signal U360_A_TRG_23 : std_logic_vector(0 downto 0) := "0";
signal U361_A_TRG_24 : std_logic_vector(0 downto 0) := "0";
signal U362_A_TRG_25 : std_logic_vector(0 downto 0) := "0";
signal U363_A_TRG_26 : std_logic_vector(0 downto 0) := "0";
signal U364_A_TRG_27 : std_logic_vector(0 downto 0) := "0";
signal U365_A_TRG_28 : std_logic_vector(0 downto 0) := "0";
signal U366_A_TRG_29 : std_logic_vector(0 downto 0) := "0";
signal U367_A_TRG_30 : std_logic_vector(0 downto 0) := "0";
signal U368_A_TRG_31 : std_logic_vector(0 downto 0) := "0";
signal U369_B_TRG_0 : std_logic_vector(0 downto 0) := "0";
signal U370_B_TRG_1 : std_logic_vector(0 downto 0) := "0";
signal U371_B_TRG_2 : std_logic_vector(0 downto 0) := "0";
signal U372_B_TRG_3 : std_logic_vector(0 downto 0) := "0";
signal U373_B_TRG_4 : std_logic_vector(0 downto 0) := "0";
signal U374_B_TRG_5 : std_logic_vector(0 downto 0) := "0";
signal U375_B_TRG_6 : std_logic_vector(0 downto 0) := "0";
signal U376_B_TRG_7 : std_logic_vector(0 downto 0) := "0";
signal U377_B_TRG_8 : std_logic_vector(0 downto 0) := "0";
signal U378_B_TRG_9 : std_logic_vector(0 downto 0) := "0";
signal U379_B_TRG_10 : std_logic_vector(0 downto 0) := "0";
signal U380_B_TRG_11 : std_logic_vector(0 downto 0) := "0";
signal U381_B_TRG_12 : std_logic_vector(0 downto 0) := "0";
signal U382_B_TRG_13 : std_logic_vector(0 downto 0) := "0";
signal U383_B_TRG_14 : std_logic_vector(0 downto 0) := "0";
signal U384_B_TRG_15 : std_logic_vector(0 downto 0) := "0";
signal U385_B_TRG_16 : std_logic_vector(0 downto 0) := "0";
signal U386_B_TRG_17 : std_logic_vector(0 downto 0) := "0";
signal U387_B_TRG_18 : std_logic_vector(0 downto 0) := "0";
signal U388_B_TRG_19 : std_logic_vector(0 downto 0) := "0";
signal U389_B_TRG_20 : std_logic_vector(0 downto 0) := "0";
signal U390_B_TRG_21 : std_logic_vector(0 downto 0) := "0";
signal U391_B_TRG_22 : std_logic_vector(0 downto 0) := "0";
signal U392_B_TRG_23 : std_logic_vector(0 downto 0) := "0";
signal U393_B_TRG_24 : std_logic_vector(0 downto 0) := "0";
signal U394_B_TRG_25 : std_logic_vector(0 downto 0) := "0";
signal U395_B_TRG_26 : std_logic_vector(0 downto 0) := "0";
signal U396_B_TRG_27 : std_logic_vector(0 downto 0) := "0";
signal U397_B_TRG_28 : std_logic_vector(0 downto 0) := "0";
signal U398_B_TRG_29 : std_logic_vector(0 downto 0) := "0";
signal U399_B_TRG_30 : std_logic_vector(0 downto 0) := "0";
signal U400_B_TRG_31 : std_logic_vector(0 downto 0) := "0";
signal U401_C_TRG_0 : std_logic_vector(0 downto 0) := "0";
signal U402_C_TRG_1 : std_logic_vector(0 downto 0) := "0";
signal U403_C_TRG_2 : std_logic_vector(0 downto 0) := "0";
signal U404_C_TRG_3 : std_logic_vector(0 downto 0) := "0";
signal U405_C_TRG_4 : std_logic_vector(0 downto 0) := "0";
signal U406_C_TRG_5 : std_logic_vector(0 downto 0) := "0";
signal U407_C_TRG_6 : std_logic_vector(0 downto 0) := "0";
signal U408_C_TRG_7 : std_logic_vector(0 downto 0) := "0";
signal U409_C_TRG_8 : std_logic_vector(0 downto 0) := "0";
signal U410_C_TRG_9 : std_logic_vector(0 downto 0) := "0";
signal U411_C_TRG_10 : std_logic_vector(0 downto 0) := "0";
signal U412_C_TRG_11 : std_logic_vector(0 downto 0) := "0";
signal U413_C_TRG_12 : std_logic_vector(0 downto 0) := "0";
signal U414_C_TRG_13 : std_logic_vector(0 downto 0) := "0";
signal U415_C_TRG_14 : std_logic_vector(0 downto 0) := "0";
signal U416_C_TRG_15 : std_logic_vector(0 downto 0) := "0";
signal U417_C_TRG_16 : std_logic_vector(0 downto 0) := "0";
signal U418_C_TRG_17 : std_logic_vector(0 downto 0) := "0";
signal U419_C_TRG_18 : std_logic_vector(0 downto 0) := "0";
signal U420_C_TRG_19 : std_logic_vector(0 downto 0) := "0";
signal U421_C_TRG_20 : std_logic_vector(0 downto 0) := "0";
signal U422_C_TRG_21 : std_logic_vector(0 downto 0) := "0";
signal U423_C_TRG_22 : std_logic_vector(0 downto 0) := "0";
signal U424_C_TRG_23 : std_logic_vector(0 downto 0) := "0";
signal U425_C_TRG_24 : std_logic_vector(0 downto 0) := "0";
signal U426_C_TRG_25 : std_logic_vector(0 downto 0) := "0";
signal U427_C_TRG_26 : std_logic_vector(0 downto 0) := "0";
signal U428_C_TRG_27 : std_logic_vector(0 downto 0) := "0";
signal U429_C_TRG_28 : std_logic_vector(0 downto 0) := "0";
signal U430_C_TRG_29 : std_logic_vector(0 downto 0) := "0";
signal U431_C_TRG_30 : std_logic_vector(0 downto 0) := "0";
signal U432_C_TRG_31 : std_logic_vector(0 downto 0) := "0";
signal U433_D_TRG_0 : std_logic_vector(0 downto 0) := "0";
signal U434_D_TRG_1 : std_logic_vector(0 downto 0) := "0";
signal U435_D_TRG_2 : std_logic_vector(0 downto 0) := "0";
signal U436_D_TRG_3 : std_logic_vector(0 downto 0) := "0";
signal U437_D_TRG_4 : std_logic_vector(0 downto 0) := "0";
signal U438_D_TRG_5 : std_logic_vector(0 downto 0) := "0";
signal U439_D_TRG_6 : std_logic_vector(0 downto 0) := "0";
signal U440_D_TRG_7 : std_logic_vector(0 downto 0) := "0";
signal U441_D_TRG_8 : std_logic_vector(0 downto 0) := "0";
signal U442_D_TRG_9 : std_logic_vector(0 downto 0) := "0";
signal U443_D_TRG_10 : std_logic_vector(0 downto 0) := "0";
signal U444_D_TRG_11 : std_logic_vector(0 downto 0) := "0";
signal U445_D_TRG_12 : std_logic_vector(0 downto 0) := "0";
signal U446_D_TRG_13 : std_logic_vector(0 downto 0) := "0";
signal U447_D_TRG_14 : std_logic_vector(0 downto 0) := "0";
signal U448_D_TRG_15 : std_logic_vector(0 downto 0) := "0";
signal U449_D_TRG_16 : std_logic_vector(0 downto 0) := "0";
signal U450_D_TRG_17 : std_logic_vector(0 downto 0) := "0";
signal U451_D_TRG_18 : std_logic_vector(0 downto 0) := "0";
signal U452_D_TRG_19 : std_logic_vector(0 downto 0) := "0";
signal U453_D_TRG_20 : std_logic_vector(0 downto 0) := "0";
signal U454_D_TRG_21 : std_logic_vector(0 downto 0) := "0";
signal U455_D_TRG_22 : std_logic_vector(0 downto 0) := "0";
signal U456_D_TRG_23 : std_logic_vector(0 downto 0) := "0";
signal U457_D_TRG_24 : std_logic_vector(0 downto 0) := "0";
signal U458_D_TRG_25 : std_logic_vector(0 downto 0) := "0";
signal U459_D_TRG_26 : std_logic_vector(0 downto 0) := "0";
signal U460_D_TRG_27 : std_logic_vector(0 downto 0) := "0";
signal U461_D_TRG_28 : std_logic_vector(0 downto 0) := "0";
signal U462_D_TRG_29 : std_logic_vector(0 downto 0) := "0";
signal U463_D_TRG_30 : std_logic_vector(0 downto 0) := "0";
signal U464_D_TRG_31 : std_logic_vector(0 downto 0) := "0";
signal U465_PULSE : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U466_out_0 : std_logic_vector(31 downto 0);
signal U467_CONST : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal U468_out : std_logic_vector(0 downto 0);
signal U469_FR_FRAME_SIG : std_logic_vector (0 downto 0); 
signal U470_FR_FRAME_SIG : std_logic_vector (0 downto 0); 
signal U471_FR_FRAME_SIG : std_logic_vector (0 downto 0); 
signal U472_FR_FRAME_SIG : std_logic_vector (0 downto 0); 
signal U473_FR_FRAME_SIG : std_logic_vector (0 downto 0); 
signal U475_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U476_A_TS : std_logic_vector (63 downto 0); 
signal variable_FR_FRAME_SIG : std_logic_vector (0 downto 0); 
Component EDGE_DETECTOR_RE Is
   Generic(bitSize : Integer := 1);
   port(        Reset :  IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CE: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CLK: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        PORT_IN: IN STD_LOGIC_VECTOR(bitSize-1 DOWNTO 0);
        PULSE_WIDTH: IN INTEGER;
        PORT_OUT: OUT STD_LOGIC_VECTOR(bitSize - 1 DOWNTO 0)
        );
End component;
signal U478_out : std_logic_vector(0 downto 0) := (others => '0');
signal variable_vLEMO_7 : std_logic_vector (0 downto 0); 
signal U480_vLEMO_7 : std_logic_vector (0 downto 0); 
signal U481_counts : std_logic_vector(31 downto 0) := (others => '0');
signal U482_out : std_logic_vector(0 downto 0) := (others => '0');
signal U483_counts : std_logic_vector(31 downto 0) := (others => '0');
signal U484_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U485_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
COMPONENT comparator
  GENERIC( 
	IN_SIZE : INTEGER := 32;
	IN_SIGN : STRING := "unsigned";
	REGISTER_OUT : STRING := "false";
	OPERATION : STRING := "smaller" );
PORT( 
	in1 : in STD_LOGIC_VECTOR(IN_SIZE-1 downto 0);
	in2 : in STD_LOGIC_VECTOR(IN_SIZE-1 downto 0);
	clk : in STD_LOGIC;
	comp_out : out STD_LOGIC_VECTOR(0 downto 0) );
END COMPONENT;
signal U486_out : std_logic_vector(0 downto 0);
signal U487_RUN_START : std_logic_vector (0 downto 0); 
signal U488_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal variable_FT_CNT_EXT : std_logic_vector (31 downto 0); 
signal variable_FT_CNT_WIN : std_logic_vector (31 downto 0); 
signal U491_FT_CNT_EXT : std_logic_vector (31 downto 0); 
signal U492_FT_CNT_WIN : std_logic_vector (31 downto 0); 
signal U493_out_0 : std_logic_vector(31 downto 0);
signal U494_out : std_logic_vector(0 downto 0);
signal U495_PULSE : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U496_CONST : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal U497_out_0 : std_logic_vector(31 downto 0);
signal U498_out_0 : std_logic_vector(1 downto 0);
signal U499_hold : std_logic_vector(31 downto 0);
signal U500_hold : std_logic_vector(31 downto 0);
signal  U501_const_bin : std_logic_vector(0 downto 0) := "0";
signal BUS_CP_0_READ_DATA : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal BUS_CP_0_VLD : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal REG_CP_0_READ_STATUS_RD : STD_LOGIC_VECTOR (31 DOWNTO 0);
signal REG_CP_0_READ_VALID_WORDS_RD : STD_LOGIC_VECTOR (31 DOWNTO 0);
COMPONENT U503_custompacket
  GENERIC( 
	memLength : INTEGER := 32768;
	wordWidth : INTEGER := 32 );
PORT( 
	IN_1 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_2 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_3 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_4 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_5 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_6 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_7 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_8 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_9 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_10 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_11 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_12 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_13 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_14 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_15 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_16 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_17 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_18 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_19 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_20 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_21 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_22 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_23 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_24 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_25 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_26 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_27 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_28 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_29 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_30 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_31 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_32 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_33 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_34 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_35 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_36 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_37 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_38 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_39 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_40 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_41 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_42 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_43 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_44 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_45 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_46 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_47 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_48 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_49 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_50 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_51 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_52 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_53 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_54 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_55 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_56 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_57 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_58 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_59 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_60 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_61 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_62 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_63 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_64 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_65 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_66 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_67 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_68 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_69 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_70 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_71 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_72 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_73 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_74 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_75 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_76 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_77 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_78 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_79 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_80 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_81 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_82 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_83 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_84 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_85 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_86 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_87 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_88 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_89 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_90 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_91 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_92 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_93 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_94 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_95 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_96 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_97 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_98 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_99 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_100 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_101 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_102 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_103 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_104 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_105 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_106 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_107 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_108 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_109 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_110 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_111 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_112 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_113 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_114 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_115 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_116 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_117 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_118 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_119 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_120 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_121 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_122 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_123 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_124 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_125 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_126 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_127 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_128 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_129 : in STD_LOGIC_VECTOR(63 downto 0);
	IN_130 : in STD_LOGIC_VECTOR(31 downto 0);
	IN_131 : in STD_LOGIC_VECTOR(31 downto 0);
	TRIG : in STD_LOGIC_VECTOR(0 downto 0);
	CLK_WRITE : in STD_LOGIC_VECTOR(0 downto 0);
	SYNC_TRIG : in STD_LOGIC_VECTOR(0 downto 0);
	SYNC_RESET : in STD_LOGIC_VECTOR(0 downto 0);
	SYNC_CLK : in STD_LOGIC_VECTOR(0 downto 0);
	BUSY : out STD_LOGIC_VECTOR(0 downto 0);
	FIFO_FULL : out STD_LOGIC_VECTOR(0 downto 0);
	RESET : in STD_LOGIC_VECTOR(0 downto 0);
	CLK_READ : in STD_LOGIC_VECTOR(0 downto 0);
	READ_DATA : out STD_LOGIC_VECTOR(31 downto 0);
	READ_DATAVALID : out STD_LOGIC_VECTOR(0 downto 0);
	READ_RD_INT : in STD_LOGIC_VECTOR(0 downto 0);
	READ_STATUS : out STD_LOGIC_VECTOR(31 downto 0);
	READ_VALID_WORDS : out STD_LOGIC_VECTOR(31 downto 0);
	CONFIG : in STD_LOGIC_VECTOR(31 downto 0) );
END COMPONENT;
	signal BUS_i2c_master_0_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_i2c_master_0_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_i2c_master_0_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_i2c_master_0_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_i2c_master_0_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_i2c_master_0_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_i2c_master_0_CTRL_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_i2c_master_0_CTRL_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_i2c_master_0_MON_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_RateMeter_2_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_RateMeter_2_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_RateMeter_2_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_RateMeter_2_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_RateMeter_3_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_RateMeter_3_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_RateMeter_3_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_RateMeter_3_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_RateMeter_0_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_RateMeter_0_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_RateMeter_0_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_RateMeter_0_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Oscilloscope_1_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Oscilloscope_1_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Oscilloscope_1_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Oscilloscope_1_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Oscilloscope_1_READ_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Oscilloscope_1_READ_POSITION_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_1_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_1_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_1_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_1_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_1_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_1_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_1_CONFIG_ARM_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_1_CONFIG_ARM_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_1_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_1_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_RateMeter_1_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_RateMeter_1_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_RateMeter_1_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_RateMeter_1_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Oscilloscope_2_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Oscilloscope_2_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Oscilloscope_2_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Oscilloscope_2_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Oscilloscope_2_READ_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Oscilloscope_2_READ_POSITION_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_2_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_2_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_2_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_2_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_2_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_2_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_2_CONFIG_ARM_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_2_CONFIG_ARM_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_2_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_2_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CitirocCfg1_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_CitirocCfg1_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_CitirocCfg1_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_CitirocCfg1_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CitirocCfg1_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CitirocCfg1_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_CitirocCfg1_REG_CFG0_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG0_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG1_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG1_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG2_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG2_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG3_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG3_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG4_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG4_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG5_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG5_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG6_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG6_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG7_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG7_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG8_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG8_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG9_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG9_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG10_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG10_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG11_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG11_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG12_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG12_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG13_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG13_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG14_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG14_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG15_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG15_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG16_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG16_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG17_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG17_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG18_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG18_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG19_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG19_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG20_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG20_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG21_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG21_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG22_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG22_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG23_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG23_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG24_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG24_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG25_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG25_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG26_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG26_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG27_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG27_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG28_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG28_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG29_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG29_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG30_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG30_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG31_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG31_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG32_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG32_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG33_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG33_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG34_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG34_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_REG_CFG35_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_REG_CFG35_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg1_START_REG_CFG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg1_START_REG_CFG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CitirocCfg2_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_CitirocCfg2_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_CitirocCfg2_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_CitirocCfg2_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CitirocCfg2_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CitirocCfg2_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_CitirocCfg2_REG_CFG0_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG0_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG1_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG1_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG2_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG2_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG3_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG3_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG4_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG4_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG5_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG5_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG6_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG6_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG7_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG7_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG8_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG8_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG9_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG9_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG10_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG10_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG11_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG11_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG12_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG12_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG13_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG13_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG14_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG14_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG15_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG15_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG16_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG16_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG17_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG17_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG18_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG18_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG19_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG19_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG20_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG20_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG21_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG21_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG22_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG22_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG23_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG23_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG24_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG24_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG25_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG25_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG26_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG26_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG27_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG27_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG28_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG28_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG29_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG29_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG30_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG30_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG31_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG31_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG32_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG32_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG33_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG33_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG34_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG34_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_REG_CFG35_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_REG_CFG35_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg2_START_REG_CFG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg2_START_REG_CFG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CitirocCfg3_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_CitirocCfg3_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_CitirocCfg3_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_CitirocCfg3_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CitirocCfg3_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CitirocCfg3_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_CitirocCfg3_REG_CFG0_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG0_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG1_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG1_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG2_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG2_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG3_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG3_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG4_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG4_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG5_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG5_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG6_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG6_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG7_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG7_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG8_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG8_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG9_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG9_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG10_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG10_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG11_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG11_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG12_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG12_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG13_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG13_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG14_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG14_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG15_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG15_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG16_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG16_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG17_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG17_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG18_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG18_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG19_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG19_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG20_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG20_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG21_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG21_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG22_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG22_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG23_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG23_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG24_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG24_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG25_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG25_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG26_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG26_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG27_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG27_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG28_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG28_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG29_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG29_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG30_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG30_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG31_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG31_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG32_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG32_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG33_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG33_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG34_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG34_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_REG_CFG35_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_REG_CFG35_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg3_START_REG_CFG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg3_START_REG_CFG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CitirocCfg0_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_CitirocCfg0_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_CitirocCfg0_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_CitirocCfg0_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CitirocCfg0_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CitirocCfg0_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_CitirocCfg0_REG_CFG0_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG0_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG1_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG1_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG2_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG2_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG3_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG3_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG4_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG4_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG5_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG5_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG6_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG6_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG7_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG7_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG8_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG8_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG9_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG9_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG10_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG10_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG11_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG11_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG12_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG12_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG13_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG13_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG14_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG14_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG15_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG15_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG16_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG16_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG17_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG17_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG18_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG18_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG19_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG19_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG20_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG20_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG21_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG21_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG22_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG22_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG23_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG23_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG24_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG24_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG25_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG25_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG26_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG26_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG27_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG27_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG28_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG28_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG29_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG29_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG30_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG30_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG31_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG31_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG32_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG32_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG33_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG33_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG34_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG34_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_REG_CFG35_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_REG_CFG35_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocCfg0_START_REG_CFG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocCfg0_START_REG_CFG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CitirocFrame0_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_CitirocFrame0_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_CitirocFrame0_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CitirocFrame0_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CitirocFrame0_CONTROL_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CitirocFrame0_CONTROL_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_CitirocFrame0_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Oscilloscope_0_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Oscilloscope_0_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Oscilloscope_0_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Oscilloscope_0_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Oscilloscope_0_READ_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Oscilloscope_0_READ_POSITION_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_0_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_0_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_0_CONFIG_ARM_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_0_CONFIG_ARM_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_0_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_0_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Oscilloscope_3_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Oscilloscope_3_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Oscilloscope_3_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Oscilloscope_3_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Oscilloscope_3_READ_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Oscilloscope_3_READ_POSITION_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_3_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_3_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_3_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_3_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_3_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_3_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_3_CONFIG_ARM_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_3_CONFIG_ARM_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_3_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_3_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CP_0_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_CP_0_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_CP_0_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_CP_0_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_CP_0_READ_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_CP_0_READ_VALID_WORDS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_CP_0_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_CP_0_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_TRIG_A_SEL_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_TRIG_A_SEL_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_TRIG_A_SEL_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_TRIG_A_SEL_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_VET_A_EN_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_VET_A_EN_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_VET_A_EN_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_VET_A_EN_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_VET_B_EN_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_VET_B_EN_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_VET_B_EN_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_VET_B_EN_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_VET_C_EN_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_VET_C_EN_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_VET_C_EN_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_VET_C_EN_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_VET_D_EN_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_VET_D_EN_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_VET_D_EN_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_VET_D_EN_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_SW_VET_A_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_SW_VET_A_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_SW_VET_A_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_SW_VET_A_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_SW_VET_B_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_SW_VET_B_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_SW_VET_B_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_SW_VET_B_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_SW_VET_C_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_SW_VET_C_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_SW_VET_C_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_SW_VET_C_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_SW_VET_D_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_SW_VET_D_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_SW_VET_D_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_SW_VET_D_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_TRIG_GBL_SEL_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_TRIG_GBL_SEL_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_TRIG_GBL_SEL_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_TRIG_GBL_SEL_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_EXT_DELAY_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_EXT_DELAY_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_EXT_DELAY_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_EXT_DELAY_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_SW_TRIG_FREQ_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_SW_TRIG_FREQ_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_SW_TRIG_FREQ_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_SW_TRIG_FREQ_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_A_RATE_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_A_RATE_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_A_RATE_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_A_RATE_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_B_RATE_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_B_RATE_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_B_RATE_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_B_RATE_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_C_RATE_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_C_RATE_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_C_RATE_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_C_RATE_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_D_RATE_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_D_RATE_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_D_RATE_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_D_RATE_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_T0_COUNT_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_T0_COUNT_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_T0_COUNT_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_T0_COUNT_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_A_TRG_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_A_TRG_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_A_TRG_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_A_TRG_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_B_TRG_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_B_TRG_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_B_TRG_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_B_TRG_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_C_TRG_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_C_TRG_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_C_TRG_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_C_TRG_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_D_TRG_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_D_TRG_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_D_TRG_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_D_TRG_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_RUNSTART_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_RUNSTART_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_RUNSTART_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_RUNSTART_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_RUN_TIME_LSB_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_RUN_TIME_LSB_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_RUN_TIME_LSB_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_RUN_TIME_LSB_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_RUN_TIME_MSB_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_RUN_TIME_MSB_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_RUN_TIME_MSB_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_RUN_TIME_MSB_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_DEAD_TIME_LSB_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_DEAD_TIME_LSB_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_DEAD_TIME_LSB_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_DEAD_TIME_LSB_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_DEAD_TIME_MSB_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_DEAD_TIME_MSB_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_DEAD_TIME_MSB_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_DEAD_TIME_MSB_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_A_LOST_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_A_LOST_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_A_LOST_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_A_LOST_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_B_LOST_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_B_LOST_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_B_LOST_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_B_LOST_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_C_LOST_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_C_LOST_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_C_LOST_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_C_LOST_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_D_LOST_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_D_LOST_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_D_LOST_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_D_LOST_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_T0_SOFT_FREQ_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_T0_SOFT_FREQ_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_T0_SOFT_FREQ_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_T0_SOFT_FREQ_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_T0_SEL_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_T0_SEL_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_T0_SEL_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_T0_SEL_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_HOLD_TIME_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_HOLD_TIME_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_HOLD_TIME_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_HOLD_TIME_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_FR_IFP_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_FR_IFP_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_FR_IFP_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_FR_IFP_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_FR_LIMIT_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_FR_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_FR_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_FR_LIMIT_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_FR_IFP2_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_FR_IFP2_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_FR_IFP2_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_FR_IFP2_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_FR_MODE_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_FR_MODE_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_FR_MODE_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_FR_MODE_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_FR_DBG1_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_FR_DBG1_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_FR_DBG1_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_FR_DBG1_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_FR_DBG2_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_FR_DBG2_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_FR_DBG2_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_FR_DBG2_RD : STD_LOGIC_VECTOR(0 downto 0); 

	
begin

   D_CLK_LVDS : IBUFDS
   generic map (
      DIFF_TERM => TRUE, 
      IBUF_LOW_PWR => TRUE,
      IOSTANDARD => "LVDS25")
   port map (
      O => D_LVDS_DCLK, 
      I => D_LVDS_DCLK_P,
      IB => D_LVDS_DCLK_N
   );   
   
   dcm_top: DTClockGenerator
    port map
     (
       clk_out1 => CLK_320(0),
       clk_out2 => CLK_160(0),
       clk_out3 => CLK_80(0),
       clk_out4 => CLK_40(0),
	   clk_out5 => CLK_AUX_OUT_25,
       locked => GlobalDCMLock,
       clk_in1  => D_LVDS_DCLK
     );
     
	RESET_DCM2 <= not GlobalDCMLock;
	  
	FASTCLOCKGEN : fast_clock 
        port Map(
            clk_100 => FAST_CLK_100(0),
            clk_200 => FAST_CLK_200(0),
            clk_250 => FAST_CLK_250(0),
            clk_250_90=> FAST_CLK_250_90(0),
            clk_500 => FAST_CLK_500(0),
            clk_500_90 => FAST_CLK_500_90(0),
                        
            reset => RESET_DCM2,
            locked => LOCKED_DCM2,
            clk_in1 => CLK_80(0)
        );		
		
	async_clk(0) <= D_LVDS_DCLK;
	CLK_ACQ(0) <= D_LVDS_DCLK;
	GlobalClock(0) <= D_LVDS_DCLK;
	BUS_CLK(0) <= D_LVDS_DCLK;
	
	GlobalReset(0) <= not LOCKED_DCM2;

	--LED_TEST <= license_ok and LOCKED_DCM2;		

   
   
    xpm_cdc_single_inst: xpm_cdc_single
      generic map (
         DEST_SYNC_FF   => 4, -- integer; range: 2-10
         INIT_SYNC_FF   => 0, -- integer; 0=disable simulation init values, 1=enable simulation init values
         SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
         SRC_INPUT_REG  => 1  -- integer; 0=do not register input, 1=register input
      )
      port map (
         src_clk  => BUS_CLK(0),  -- optional; required when SRC_INPUT_REG = 1
         src_in   => REG_Fiforeset(0),
         dest_clk => GlobalClock(0),
         dest_out => cFiforeset
      );

	fifo_reset(0) <= cFiforeset;

	
	USBInterface: ft600_fifo245_wrapper PORT MAP(
	
	    EEMOSI => EEMOSI,
        EEMISO => EEMISO,
        EECLK => EECLK,
        EECS => EECS,    
        license_ok => license_ok,
        
		
		FTDI_ADBUS => FTDI_ADBUS,
        FTDI_RXFN => FTDI_RXFN,
        FTDI_TXEN => FTDI_TXEN,
        FTDI_RDN => FTDI_RDN,
        FTDI_TXN => FTDI_TXN,
        FTDI_CLK => FTDI_CLK,
        FTDI_OEN => FTDI_OEN,
        FTDI_SIWU => FTDI_SIWU,
        FTDI_BE => FTDI_BE,
        f_CLK => BUS_CLK(0),

        REG_Fiforeset_RD => REG_Fiforeset, 
        REG_Fiforeset_WR => REG_Fiforeset, 
        INT_Fiforeset_RD => open, 
        INT_Fiforeset_WR => open,
        
     
         
        REG_FIRMWARE_BUILD =>x"19052901",
        
      --FLASH CONTROLLER
        BUS_Flash_0_READ_DATA => BUS_Flash_0_READ_DATA,
        BUS_Flash_0_ADDRESS => BUS_Flash_0_ADDRESS, 
        BUS_Flash_0_WRITE_DATA => BUS_Flash_0_WRITE_DATA, 
        BUS_Flash_0_W_INT => BUS_Flash_0_W_INT, 
        BUS_Flash_0_R_INT => BUS_Flash_0_R_INT, 
        BUS_Flash_0_VLD => BUS_Flash_0_VLD, 
        
        REG_FLASH_CNTR_RD => REG_FLASH_CNTR_RD, 
        REG_FLASH_CNTR_WR => REG_FLASH_CNTR_WR, 
        INT_FLASH_CNTR_RD => INT_FLASH_CNTR_RD, 
        INT_FLASH_CNTR_WR => INT_FLASH_CNTR_WR, 
        
        REG_FLASH_ADDRESS_RD => REG_FLASH_ADDRESS_RD, 
        REG_FLASH_ADDRESS_WR => REG_FLASH_ADDRESS_WR, 
        INT_FLASH_ADDRESS_RD => INT_FLASH_ADDRESS_RD, 
        INT_FLASH_ADDRESS_WR => INT_FLASH_ADDRESS_WR,     
        
        -- Test 
        BUS_Test_0_READ_DATA => BUS_Test_0_READ_DATA,
        BUS_Test_0_ADDRESS => BUS_Test_0_ADDRESS, 
        BUS_Test_0_WRITE_DATA => BUS_Test_0_WRITE_DATA, 
        BUS_Test_0_W_INT => BUS_Test_0_W_INT, 
        BUS_Test_0_R_INT => BUS_Test_0_R_INT, 
        BUS_Test_0_VLD => BUS_Test_0_VLD,         
   	
		-- Register interface  
			BUS_i2c_master_0_READ_DATA => BUS_i2c_master_0_READ_DATA,
	BUS_i2c_master_0_WRITE_DATA => BUS_i2c_master_0_WRITE_DATA,
	BUS_i2c_master_0_W_INT => BUS_i2c_master_0_W_INT,
	BUS_i2c_master_0_R_INT => BUS_i2c_master_0_R_INT,
	BUS_i2c_master_0_VLD => BUS_i2c_master_0_VLD,
		REG_i2c_master_0_CTRL_WR => REG_i2c_master_0_CTRL_WR,
		INT_i2c_master_0_CTRL_WR => INT_i2c_master_0_CTRL_WR,
		REG_i2c_master_0_MON_RD => REG_i2c_master_0_MON_RD,
		INT_i2c_master_0_MON_RD => INT_i2c_master_0_MON_RD,
		REG_TRIG_A_SEL_RD => REG_TRIG_A_SEL_RD,
		REG_TRIG_A_SEL_WR => REG_TRIG_A_SEL_WR,
		INT_TRIG_A_SEL_RD => INT_TRIG_A_SEL_RD,
		INT_TRIG_A_SEL_WR => INT_TRIG_A_SEL_WR,
		REG_VET_A_EN_RD => REG_VET_A_EN_RD,
		REG_VET_A_EN_WR => REG_VET_A_EN_WR,
		INT_VET_A_EN_RD => INT_VET_A_EN_RD,
		INT_VET_A_EN_WR => INT_VET_A_EN_WR,
		REG_VET_B_EN_RD => REG_VET_B_EN_RD,
		REG_VET_B_EN_WR => REG_VET_B_EN_WR,
		INT_VET_B_EN_RD => INT_VET_B_EN_RD,
		INT_VET_B_EN_WR => INT_VET_B_EN_WR,
		REG_VET_C_EN_RD => REG_VET_C_EN_RD,
		REG_VET_C_EN_WR => REG_VET_C_EN_WR,
		INT_VET_C_EN_RD => INT_VET_C_EN_RD,
		INT_VET_C_EN_WR => INT_VET_C_EN_WR,
		REG_VET_D_EN_RD => REG_VET_D_EN_RD,
		REG_VET_D_EN_WR => REG_VET_D_EN_WR,
		INT_VET_D_EN_RD => INT_VET_D_EN_RD,
		INT_VET_D_EN_WR => INT_VET_D_EN_WR,
		REG_SW_VET_A_RD => REG_SW_VET_A_RD,
		REG_SW_VET_A_WR => REG_SW_VET_A_WR,
		INT_SW_VET_A_RD => INT_SW_VET_A_RD,
		INT_SW_VET_A_WR => INT_SW_VET_A_WR,
		REG_SW_VET_B_RD => REG_SW_VET_B_RD,
		REG_SW_VET_B_WR => REG_SW_VET_B_WR,
		INT_SW_VET_B_RD => INT_SW_VET_B_RD,
		INT_SW_VET_B_WR => INT_SW_VET_B_WR,
		REG_SW_VET_C_RD => REG_SW_VET_C_RD,
		REG_SW_VET_C_WR => REG_SW_VET_C_WR,
		INT_SW_VET_C_RD => INT_SW_VET_C_RD,
		INT_SW_VET_C_WR => INT_SW_VET_C_WR,
		REG_SW_VET_D_RD => REG_SW_VET_D_RD,
		REG_SW_VET_D_WR => REG_SW_VET_D_WR,
		INT_SW_VET_D_RD => INT_SW_VET_D_RD,
		INT_SW_VET_D_WR => INT_SW_VET_D_WR,
		REG_TRIG_GBL_SEL_RD => REG_TRIG_GBL_SEL_RD,
		REG_TRIG_GBL_SEL_WR => REG_TRIG_GBL_SEL_WR,
		INT_TRIG_GBL_SEL_RD => INT_TRIG_GBL_SEL_RD,
		INT_TRIG_GBL_SEL_WR => INT_TRIG_GBL_SEL_WR,
		REG_EXT_DELAY_RD => REG_EXT_DELAY_RD,
		REG_EXT_DELAY_WR => REG_EXT_DELAY_WR,
		INT_EXT_DELAY_RD => INT_EXT_DELAY_RD,
		INT_EXT_DELAY_WR => INT_EXT_DELAY_WR,
		REG_SW_TRIG_FREQ_RD => REG_SW_TRIG_FREQ_RD,
		REG_SW_TRIG_FREQ_WR => REG_SW_TRIG_FREQ_WR,
		INT_SW_TRIG_FREQ_RD => INT_SW_TRIG_FREQ_RD,
		INT_SW_TRIG_FREQ_WR => INT_SW_TRIG_FREQ_WR,
		REG_A_RATE_RD => REG_A_RATE_RD,
		REG_A_RATE_WR => REG_A_RATE_WR,
		INT_A_RATE_RD => INT_A_RATE_RD,
		INT_A_RATE_WR => INT_A_RATE_WR,
		REG_B_RATE_RD => REG_B_RATE_RD,
		REG_B_RATE_WR => REG_B_RATE_WR,
		INT_B_RATE_RD => INT_B_RATE_RD,
		INT_B_RATE_WR => INT_B_RATE_WR,
		REG_C_RATE_RD => REG_C_RATE_RD,
		REG_C_RATE_WR => REG_C_RATE_WR,
		INT_C_RATE_RD => INT_C_RATE_RD,
		INT_C_RATE_WR => INT_C_RATE_WR,
		REG_D_RATE_RD => REG_D_RATE_RD,
		REG_D_RATE_WR => REG_D_RATE_WR,
		INT_D_RATE_RD => INT_D_RATE_RD,
		INT_D_RATE_WR => INT_D_RATE_WR,
		REG_T0_COUNT_RD => REG_T0_COUNT_RD,
		REG_T0_COUNT_WR => REG_T0_COUNT_WR,
		INT_T0_COUNT_RD => INT_T0_COUNT_RD,
		INT_T0_COUNT_WR => INT_T0_COUNT_WR,
		REG_A_TRG_RD => REG_A_TRG_RD,
		REG_A_TRG_WR => REG_A_TRG_WR,
		INT_A_TRG_RD => INT_A_TRG_RD,
		INT_A_TRG_WR => INT_A_TRG_WR,
		REG_B_TRG_RD => REG_B_TRG_RD,
		REG_B_TRG_WR => REG_B_TRG_WR,
		INT_B_TRG_RD => INT_B_TRG_RD,
		INT_B_TRG_WR => INT_B_TRG_WR,
		REG_C_TRG_RD => REG_C_TRG_RD,
		REG_C_TRG_WR => REG_C_TRG_WR,
		INT_C_TRG_RD => INT_C_TRG_RD,
		INT_C_TRG_WR => INT_C_TRG_WR,
		REG_D_TRG_RD => REG_D_TRG_RD,
		REG_D_TRG_WR => REG_D_TRG_WR,
		INT_D_TRG_RD => INT_D_TRG_RD,
		INT_D_TRG_WR => INT_D_TRG_WR,
		REG_RUNSTART_RD => REG_RUNSTART_RD,
		REG_RUNSTART_WR => REG_RUNSTART_WR,
		INT_RUNSTART_RD => INT_RUNSTART_RD,
		INT_RUNSTART_WR => INT_RUNSTART_WR,
		REG_RUN_TIME_LSB_RD => REG_RUN_TIME_LSB_RD,
		REG_RUN_TIME_LSB_WR => REG_RUN_TIME_LSB_WR,
		INT_RUN_TIME_LSB_RD => INT_RUN_TIME_LSB_RD,
		INT_RUN_TIME_LSB_WR => INT_RUN_TIME_LSB_WR,
		REG_RUN_TIME_MSB_RD => REG_RUN_TIME_MSB_RD,
		REG_RUN_TIME_MSB_WR => REG_RUN_TIME_MSB_WR,
		INT_RUN_TIME_MSB_RD => INT_RUN_TIME_MSB_RD,
		INT_RUN_TIME_MSB_WR => INT_RUN_TIME_MSB_WR,
		REG_DEAD_TIME_LSB_RD => REG_DEAD_TIME_LSB_RD,
		REG_DEAD_TIME_LSB_WR => REG_DEAD_TIME_LSB_WR,
		INT_DEAD_TIME_LSB_RD => INT_DEAD_TIME_LSB_RD,
		INT_DEAD_TIME_LSB_WR => INT_DEAD_TIME_LSB_WR,
		REG_DEAD_TIME_MSB_RD => REG_DEAD_TIME_MSB_RD,
		REG_DEAD_TIME_MSB_WR => REG_DEAD_TIME_MSB_WR,
		INT_DEAD_TIME_MSB_RD => INT_DEAD_TIME_MSB_RD,
		INT_DEAD_TIME_MSB_WR => INT_DEAD_TIME_MSB_WR,
		REG_A_LOST_RD => REG_A_LOST_RD,
		REG_A_LOST_WR => REG_A_LOST_WR,
		INT_A_LOST_RD => INT_A_LOST_RD,
		INT_A_LOST_WR => INT_A_LOST_WR,
		REG_B_LOST_RD => REG_B_LOST_RD,
		REG_B_LOST_WR => REG_B_LOST_WR,
		INT_B_LOST_RD => INT_B_LOST_RD,
		INT_B_LOST_WR => INT_B_LOST_WR,
		REG_C_LOST_RD => REG_C_LOST_RD,
		REG_C_LOST_WR => REG_C_LOST_WR,
		INT_C_LOST_RD => INT_C_LOST_RD,
		INT_C_LOST_WR => INT_C_LOST_WR,
		REG_D_LOST_RD => REG_D_LOST_RD,
		REG_D_LOST_WR => REG_D_LOST_WR,
		INT_D_LOST_RD => INT_D_LOST_RD,
		INT_D_LOST_WR => INT_D_LOST_WR,
	BUS_RateMeter_2_READ_ADDRESS => BUS_RateMeter_2_READ_ADDRESS,
	BUS_RateMeter_2_READ_DATA => BUS_RateMeter_2_READ_DATA,
	BUS_RateMeter_2_WRITE_DATA => BUS_RateMeter_2_WRITE_DATA,
	BUS_RateMeter_2_W_INT => BUS_RateMeter_2_W_INT,
	BUS_RateMeter_2_R_INT => BUS_RateMeter_2_R_INT,
	BUS_RateMeter_2_VLD => BUS_RateMeter_2_VLD,
	BUS_RateMeter_3_READ_ADDRESS => BUS_RateMeter_3_READ_ADDRESS,
	BUS_RateMeter_3_READ_DATA => BUS_RateMeter_3_READ_DATA,
	BUS_RateMeter_3_WRITE_DATA => BUS_RateMeter_3_WRITE_DATA,
	BUS_RateMeter_3_W_INT => BUS_RateMeter_3_W_INT,
	BUS_RateMeter_3_R_INT => BUS_RateMeter_3_R_INT,
	BUS_RateMeter_3_VLD => BUS_RateMeter_3_VLD,
	BUS_RateMeter_0_READ_ADDRESS => BUS_RateMeter_0_READ_ADDRESS,
	BUS_RateMeter_0_READ_DATA => BUS_RateMeter_0_READ_DATA,
	BUS_RateMeter_0_WRITE_DATA => BUS_RateMeter_0_WRITE_DATA,
	BUS_RateMeter_0_W_INT => BUS_RateMeter_0_W_INT,
	BUS_RateMeter_0_R_INT => BUS_RateMeter_0_R_INT,
	BUS_RateMeter_0_VLD => BUS_RateMeter_0_VLD,
	BUS_Oscilloscope_1_READ_ADDRESS => BUS_Oscilloscope_1_READ_ADDRESS,
	BUS_Oscilloscope_1_READ_DATA => BUS_Oscilloscope_1_READ_DATA,
	BUS_Oscilloscope_1_WRITE_DATA => BUS_Oscilloscope_1_WRITE_DATA,
	BUS_Oscilloscope_1_W_INT => BUS_Oscilloscope_1_W_INT,
	BUS_Oscilloscope_1_R_INT => BUS_Oscilloscope_1_R_INT,
	BUS_Oscilloscope_1_VLD => BUS_Oscilloscope_1_VLD,
		REG_Oscilloscope_1_READ_STATUS_RD => REG_Oscilloscope_1_READ_STATUS_RD,
		INT_Oscilloscope_1_READ_STATUS_RD => INT_Oscilloscope_1_READ_STATUS_RD,
		REG_Oscilloscope_1_READ_POSITION_RD => REG_Oscilloscope_1_READ_POSITION_RD,
		INT_Oscilloscope_1_READ_POSITION_RD => INT_Oscilloscope_1_READ_POSITION_RD,
		REG_Oscilloscope_1_CONFIG_TRIGGER_MODE_WR => REG_Oscilloscope_1_CONFIG_TRIGGER_MODE_WR,
		INT_Oscilloscope_1_CONFIG_TRIGGER_MODE_WR => INT_Oscilloscope_1_CONFIG_TRIGGER_MODE_WR,
		REG_Oscilloscope_1_CONFIG_PRETRIGGER_WR => REG_Oscilloscope_1_CONFIG_PRETRIGGER_WR,
		INT_Oscilloscope_1_CONFIG_PRETRIGGER_WR => INT_Oscilloscope_1_CONFIG_PRETRIGGER_WR,
		REG_Oscilloscope_1_CONFIG_TRIGGER_LEVEL_WR => REG_Oscilloscope_1_CONFIG_TRIGGER_LEVEL_WR,
		INT_Oscilloscope_1_CONFIG_TRIGGER_LEVEL_WR => INT_Oscilloscope_1_CONFIG_TRIGGER_LEVEL_WR,
		REG_Oscilloscope_1_CONFIG_ARM_WR => REG_Oscilloscope_1_CONFIG_ARM_WR,
		INT_Oscilloscope_1_CONFIG_ARM_WR => INT_Oscilloscope_1_CONFIG_ARM_WR,
		REG_Oscilloscope_1_CONFIG_DECIMATOR_WR => REG_Oscilloscope_1_CONFIG_DECIMATOR_WR,
		INT_Oscilloscope_1_CONFIG_DECIMATOR_WR => INT_Oscilloscope_1_CONFIG_DECIMATOR_WR,
	BUS_RateMeter_1_READ_ADDRESS => BUS_RateMeter_1_READ_ADDRESS,
	BUS_RateMeter_1_READ_DATA => BUS_RateMeter_1_READ_DATA,
	BUS_RateMeter_1_WRITE_DATA => BUS_RateMeter_1_WRITE_DATA,
	BUS_RateMeter_1_W_INT => BUS_RateMeter_1_W_INT,
	BUS_RateMeter_1_R_INT => BUS_RateMeter_1_R_INT,
	BUS_RateMeter_1_VLD => BUS_RateMeter_1_VLD,
	BUS_Oscilloscope_2_READ_ADDRESS => BUS_Oscilloscope_2_READ_ADDRESS,
	BUS_Oscilloscope_2_READ_DATA => BUS_Oscilloscope_2_READ_DATA,
	BUS_Oscilloscope_2_WRITE_DATA => BUS_Oscilloscope_2_WRITE_DATA,
	BUS_Oscilloscope_2_W_INT => BUS_Oscilloscope_2_W_INT,
	BUS_Oscilloscope_2_R_INT => BUS_Oscilloscope_2_R_INT,
	BUS_Oscilloscope_2_VLD => BUS_Oscilloscope_2_VLD,
		REG_Oscilloscope_2_READ_STATUS_RD => REG_Oscilloscope_2_READ_STATUS_RD,
		INT_Oscilloscope_2_READ_STATUS_RD => INT_Oscilloscope_2_READ_STATUS_RD,
		REG_Oscilloscope_2_READ_POSITION_RD => REG_Oscilloscope_2_READ_POSITION_RD,
		INT_Oscilloscope_2_READ_POSITION_RD => INT_Oscilloscope_2_READ_POSITION_RD,
		REG_Oscilloscope_2_CONFIG_TRIGGER_MODE_WR => REG_Oscilloscope_2_CONFIG_TRIGGER_MODE_WR,
		INT_Oscilloscope_2_CONFIG_TRIGGER_MODE_WR => INT_Oscilloscope_2_CONFIG_TRIGGER_MODE_WR,
		REG_Oscilloscope_2_CONFIG_PRETRIGGER_WR => REG_Oscilloscope_2_CONFIG_PRETRIGGER_WR,
		INT_Oscilloscope_2_CONFIG_PRETRIGGER_WR => INT_Oscilloscope_2_CONFIG_PRETRIGGER_WR,
		REG_Oscilloscope_2_CONFIG_TRIGGER_LEVEL_WR => REG_Oscilloscope_2_CONFIG_TRIGGER_LEVEL_WR,
		INT_Oscilloscope_2_CONFIG_TRIGGER_LEVEL_WR => INT_Oscilloscope_2_CONFIG_TRIGGER_LEVEL_WR,
		REG_Oscilloscope_2_CONFIG_ARM_WR => REG_Oscilloscope_2_CONFIG_ARM_WR,
		INT_Oscilloscope_2_CONFIG_ARM_WR => INT_Oscilloscope_2_CONFIG_ARM_WR,
		REG_Oscilloscope_2_CONFIG_DECIMATOR_WR => REG_Oscilloscope_2_CONFIG_DECIMATOR_WR,
		INT_Oscilloscope_2_CONFIG_DECIMATOR_WR => INT_Oscilloscope_2_CONFIG_DECIMATOR_WR,
	BUS_CitirocCfg1_READ_DATA => BUS_CitirocCfg1_READ_DATA,
	BUS_CitirocCfg1_WRITE_DATA => BUS_CitirocCfg1_WRITE_DATA,
	BUS_CitirocCfg1_W_INT => BUS_CitirocCfg1_W_INT,
	BUS_CitirocCfg1_R_INT => BUS_CitirocCfg1_R_INT,
	BUS_CitirocCfg1_VLD => BUS_CitirocCfg1_VLD,
		REG_CitirocCfg1_REG_CFG0_WR => REG_CitirocCfg1_REG_CFG0_WR,
		INT_CitirocCfg1_REG_CFG0_WR => INT_CitirocCfg1_REG_CFG0_WR,
		REG_CitirocCfg1_REG_CFG1_WR => REG_CitirocCfg1_REG_CFG1_WR,
		INT_CitirocCfg1_REG_CFG1_WR => INT_CitirocCfg1_REG_CFG1_WR,
		REG_CitirocCfg1_REG_CFG2_WR => REG_CitirocCfg1_REG_CFG2_WR,
		INT_CitirocCfg1_REG_CFG2_WR => INT_CitirocCfg1_REG_CFG2_WR,
		REG_CitirocCfg1_REG_CFG3_WR => REG_CitirocCfg1_REG_CFG3_WR,
		INT_CitirocCfg1_REG_CFG3_WR => INT_CitirocCfg1_REG_CFG3_WR,
		REG_CitirocCfg1_REG_CFG4_WR => REG_CitirocCfg1_REG_CFG4_WR,
		INT_CitirocCfg1_REG_CFG4_WR => INT_CitirocCfg1_REG_CFG4_WR,
		REG_CitirocCfg1_REG_CFG5_WR => REG_CitirocCfg1_REG_CFG5_WR,
		INT_CitirocCfg1_REG_CFG5_WR => INT_CitirocCfg1_REG_CFG5_WR,
		REG_CitirocCfg1_REG_CFG6_WR => REG_CitirocCfg1_REG_CFG6_WR,
		INT_CitirocCfg1_REG_CFG6_WR => INT_CitirocCfg1_REG_CFG6_WR,
		REG_CitirocCfg1_REG_CFG7_WR => REG_CitirocCfg1_REG_CFG7_WR,
		INT_CitirocCfg1_REG_CFG7_WR => INT_CitirocCfg1_REG_CFG7_WR,
		REG_CitirocCfg1_REG_CFG8_WR => REG_CitirocCfg1_REG_CFG8_WR,
		INT_CitirocCfg1_REG_CFG8_WR => INT_CitirocCfg1_REG_CFG8_WR,
		REG_CitirocCfg1_REG_CFG9_WR => REG_CitirocCfg1_REG_CFG9_WR,
		INT_CitirocCfg1_REG_CFG9_WR => INT_CitirocCfg1_REG_CFG9_WR,
		REG_CitirocCfg1_REG_CFG10_WR => REG_CitirocCfg1_REG_CFG10_WR,
		INT_CitirocCfg1_REG_CFG10_WR => INT_CitirocCfg1_REG_CFG10_WR,
		REG_CitirocCfg1_REG_CFG11_WR => REG_CitirocCfg1_REG_CFG11_WR,
		INT_CitirocCfg1_REG_CFG11_WR => INT_CitirocCfg1_REG_CFG11_WR,
		REG_CitirocCfg1_REG_CFG12_WR => REG_CitirocCfg1_REG_CFG12_WR,
		INT_CitirocCfg1_REG_CFG12_WR => INT_CitirocCfg1_REG_CFG12_WR,
		REG_CitirocCfg1_REG_CFG13_WR => REG_CitirocCfg1_REG_CFG13_WR,
		INT_CitirocCfg1_REG_CFG13_WR => INT_CitirocCfg1_REG_CFG13_WR,
		REG_CitirocCfg1_REG_CFG14_WR => REG_CitirocCfg1_REG_CFG14_WR,
		INT_CitirocCfg1_REG_CFG14_WR => INT_CitirocCfg1_REG_CFG14_WR,
		REG_CitirocCfg1_REG_CFG15_WR => REG_CitirocCfg1_REG_CFG15_WR,
		INT_CitirocCfg1_REG_CFG15_WR => INT_CitirocCfg1_REG_CFG15_WR,
		REG_CitirocCfg1_REG_CFG16_WR => REG_CitirocCfg1_REG_CFG16_WR,
		INT_CitirocCfg1_REG_CFG16_WR => INT_CitirocCfg1_REG_CFG16_WR,
		REG_CitirocCfg1_REG_CFG17_WR => REG_CitirocCfg1_REG_CFG17_WR,
		INT_CitirocCfg1_REG_CFG17_WR => INT_CitirocCfg1_REG_CFG17_WR,
		REG_CitirocCfg1_REG_CFG18_WR => REG_CitirocCfg1_REG_CFG18_WR,
		INT_CitirocCfg1_REG_CFG18_WR => INT_CitirocCfg1_REG_CFG18_WR,
		REG_CitirocCfg1_REG_CFG19_WR => REG_CitirocCfg1_REG_CFG19_WR,
		INT_CitirocCfg1_REG_CFG19_WR => INT_CitirocCfg1_REG_CFG19_WR,
		REG_CitirocCfg1_REG_CFG20_WR => REG_CitirocCfg1_REG_CFG20_WR,
		INT_CitirocCfg1_REG_CFG20_WR => INT_CitirocCfg1_REG_CFG20_WR,
		REG_CitirocCfg1_REG_CFG21_WR => REG_CitirocCfg1_REG_CFG21_WR,
		INT_CitirocCfg1_REG_CFG21_WR => INT_CitirocCfg1_REG_CFG21_WR,
		REG_CitirocCfg1_REG_CFG22_WR => REG_CitirocCfg1_REG_CFG22_WR,
		INT_CitirocCfg1_REG_CFG22_WR => INT_CitirocCfg1_REG_CFG22_WR,
		REG_CitirocCfg1_REG_CFG23_WR => REG_CitirocCfg1_REG_CFG23_WR,
		INT_CitirocCfg1_REG_CFG23_WR => INT_CitirocCfg1_REG_CFG23_WR,
		REG_CitirocCfg1_REG_CFG24_WR => REG_CitirocCfg1_REG_CFG24_WR,
		INT_CitirocCfg1_REG_CFG24_WR => INT_CitirocCfg1_REG_CFG24_WR,
		REG_CitirocCfg1_REG_CFG25_WR => REG_CitirocCfg1_REG_CFG25_WR,
		INT_CitirocCfg1_REG_CFG25_WR => INT_CitirocCfg1_REG_CFG25_WR,
		REG_CitirocCfg1_REG_CFG26_WR => REG_CitirocCfg1_REG_CFG26_WR,
		INT_CitirocCfg1_REG_CFG26_WR => INT_CitirocCfg1_REG_CFG26_WR,
		REG_CitirocCfg1_REG_CFG27_WR => REG_CitirocCfg1_REG_CFG27_WR,
		INT_CitirocCfg1_REG_CFG27_WR => INT_CitirocCfg1_REG_CFG27_WR,
		REG_CitirocCfg1_REG_CFG28_WR => REG_CitirocCfg1_REG_CFG28_WR,
		INT_CitirocCfg1_REG_CFG28_WR => INT_CitirocCfg1_REG_CFG28_WR,
		REG_CitirocCfg1_REG_CFG29_WR => REG_CitirocCfg1_REG_CFG29_WR,
		INT_CitirocCfg1_REG_CFG29_WR => INT_CitirocCfg1_REG_CFG29_WR,
		REG_CitirocCfg1_REG_CFG30_WR => REG_CitirocCfg1_REG_CFG30_WR,
		INT_CitirocCfg1_REG_CFG30_WR => INT_CitirocCfg1_REG_CFG30_WR,
		REG_CitirocCfg1_REG_CFG31_WR => REG_CitirocCfg1_REG_CFG31_WR,
		INT_CitirocCfg1_REG_CFG31_WR => INT_CitirocCfg1_REG_CFG31_WR,
		REG_CitirocCfg1_REG_CFG32_WR => REG_CitirocCfg1_REG_CFG32_WR,
		INT_CitirocCfg1_REG_CFG32_WR => INT_CitirocCfg1_REG_CFG32_WR,
		REG_CitirocCfg1_REG_CFG33_WR => REG_CitirocCfg1_REG_CFG33_WR,
		INT_CitirocCfg1_REG_CFG33_WR => INT_CitirocCfg1_REG_CFG33_WR,
		REG_CitirocCfg1_REG_CFG34_WR => REG_CitirocCfg1_REG_CFG34_WR,
		INT_CitirocCfg1_REG_CFG34_WR => INT_CitirocCfg1_REG_CFG34_WR,
		REG_CitirocCfg1_REG_CFG35_WR => REG_CitirocCfg1_REG_CFG35_WR,
		INT_CitirocCfg1_REG_CFG35_WR => INT_CitirocCfg1_REG_CFG35_WR,
		REG_CitirocCfg1_START_REG_CFG_WR => REG_CitirocCfg1_START_REG_CFG_WR,
		INT_CitirocCfg1_START_REG_CFG_WR => INT_CitirocCfg1_START_REG_CFG_WR,
	BUS_CitirocCfg2_READ_DATA => BUS_CitirocCfg2_READ_DATA,
	BUS_CitirocCfg2_WRITE_DATA => BUS_CitirocCfg2_WRITE_DATA,
	BUS_CitirocCfg2_W_INT => BUS_CitirocCfg2_W_INT,
	BUS_CitirocCfg2_R_INT => BUS_CitirocCfg2_R_INT,
	BUS_CitirocCfg2_VLD => BUS_CitirocCfg2_VLD,
		REG_CitirocCfg2_REG_CFG0_WR => REG_CitirocCfg2_REG_CFG0_WR,
		INT_CitirocCfg2_REG_CFG0_WR => INT_CitirocCfg2_REG_CFG0_WR,
		REG_CitirocCfg2_REG_CFG1_WR => REG_CitirocCfg2_REG_CFG1_WR,
		INT_CitirocCfg2_REG_CFG1_WR => INT_CitirocCfg2_REG_CFG1_WR,
		REG_CitirocCfg2_REG_CFG2_WR => REG_CitirocCfg2_REG_CFG2_WR,
		INT_CitirocCfg2_REG_CFG2_WR => INT_CitirocCfg2_REG_CFG2_WR,
		REG_CitirocCfg2_REG_CFG3_WR => REG_CitirocCfg2_REG_CFG3_WR,
		INT_CitirocCfg2_REG_CFG3_WR => INT_CitirocCfg2_REG_CFG3_WR,
		REG_CitirocCfg2_REG_CFG4_WR => REG_CitirocCfg2_REG_CFG4_WR,
		INT_CitirocCfg2_REG_CFG4_WR => INT_CitirocCfg2_REG_CFG4_WR,
		REG_CitirocCfg2_REG_CFG5_WR => REG_CitirocCfg2_REG_CFG5_WR,
		INT_CitirocCfg2_REG_CFG5_WR => INT_CitirocCfg2_REG_CFG5_WR,
		REG_CitirocCfg2_REG_CFG6_WR => REG_CitirocCfg2_REG_CFG6_WR,
		INT_CitirocCfg2_REG_CFG6_WR => INT_CitirocCfg2_REG_CFG6_WR,
		REG_CitirocCfg2_REG_CFG7_WR => REG_CitirocCfg2_REG_CFG7_WR,
		INT_CitirocCfg2_REG_CFG7_WR => INT_CitirocCfg2_REG_CFG7_WR,
		REG_CitirocCfg2_REG_CFG8_WR => REG_CitirocCfg2_REG_CFG8_WR,
		INT_CitirocCfg2_REG_CFG8_WR => INT_CitirocCfg2_REG_CFG8_WR,
		REG_CitirocCfg2_REG_CFG9_WR => REG_CitirocCfg2_REG_CFG9_WR,
		INT_CitirocCfg2_REG_CFG9_WR => INT_CitirocCfg2_REG_CFG9_WR,
		REG_CitirocCfg2_REG_CFG10_WR => REG_CitirocCfg2_REG_CFG10_WR,
		INT_CitirocCfg2_REG_CFG10_WR => INT_CitirocCfg2_REG_CFG10_WR,
		REG_CitirocCfg2_REG_CFG11_WR => REG_CitirocCfg2_REG_CFG11_WR,
		INT_CitirocCfg2_REG_CFG11_WR => INT_CitirocCfg2_REG_CFG11_WR,
		REG_CitirocCfg2_REG_CFG12_WR => REG_CitirocCfg2_REG_CFG12_WR,
		INT_CitirocCfg2_REG_CFG12_WR => INT_CitirocCfg2_REG_CFG12_WR,
		REG_CitirocCfg2_REG_CFG13_WR => REG_CitirocCfg2_REG_CFG13_WR,
		INT_CitirocCfg2_REG_CFG13_WR => INT_CitirocCfg2_REG_CFG13_WR,
		REG_CitirocCfg2_REG_CFG14_WR => REG_CitirocCfg2_REG_CFG14_WR,
		INT_CitirocCfg2_REG_CFG14_WR => INT_CitirocCfg2_REG_CFG14_WR,
		REG_CitirocCfg2_REG_CFG15_WR => REG_CitirocCfg2_REG_CFG15_WR,
		INT_CitirocCfg2_REG_CFG15_WR => INT_CitirocCfg2_REG_CFG15_WR,
		REG_CitirocCfg2_REG_CFG16_WR => REG_CitirocCfg2_REG_CFG16_WR,
		INT_CitirocCfg2_REG_CFG16_WR => INT_CitirocCfg2_REG_CFG16_WR,
		REG_CitirocCfg2_REG_CFG17_WR => REG_CitirocCfg2_REG_CFG17_WR,
		INT_CitirocCfg2_REG_CFG17_WR => INT_CitirocCfg2_REG_CFG17_WR,
		REG_CitirocCfg2_REG_CFG18_WR => REG_CitirocCfg2_REG_CFG18_WR,
		INT_CitirocCfg2_REG_CFG18_WR => INT_CitirocCfg2_REG_CFG18_WR,
		REG_CitirocCfg2_REG_CFG19_WR => REG_CitirocCfg2_REG_CFG19_WR,
		INT_CitirocCfg2_REG_CFG19_WR => INT_CitirocCfg2_REG_CFG19_WR,
		REG_CitirocCfg2_REG_CFG20_WR => REG_CitirocCfg2_REG_CFG20_WR,
		INT_CitirocCfg2_REG_CFG20_WR => INT_CitirocCfg2_REG_CFG20_WR,
		REG_CitirocCfg2_REG_CFG21_WR => REG_CitirocCfg2_REG_CFG21_WR,
		INT_CitirocCfg2_REG_CFG21_WR => INT_CitirocCfg2_REG_CFG21_WR,
		REG_CitirocCfg2_REG_CFG22_WR => REG_CitirocCfg2_REG_CFG22_WR,
		INT_CitirocCfg2_REG_CFG22_WR => INT_CitirocCfg2_REG_CFG22_WR,
		REG_CitirocCfg2_REG_CFG23_WR => REG_CitirocCfg2_REG_CFG23_WR,
		INT_CitirocCfg2_REG_CFG23_WR => INT_CitirocCfg2_REG_CFG23_WR,
		REG_CitirocCfg2_REG_CFG24_WR => REG_CitirocCfg2_REG_CFG24_WR,
		INT_CitirocCfg2_REG_CFG24_WR => INT_CitirocCfg2_REG_CFG24_WR,
		REG_CitirocCfg2_REG_CFG25_WR => REG_CitirocCfg2_REG_CFG25_WR,
		INT_CitirocCfg2_REG_CFG25_WR => INT_CitirocCfg2_REG_CFG25_WR,
		REG_CitirocCfg2_REG_CFG26_WR => REG_CitirocCfg2_REG_CFG26_WR,
		INT_CitirocCfg2_REG_CFG26_WR => INT_CitirocCfg2_REG_CFG26_WR,
		REG_CitirocCfg2_REG_CFG27_WR => REG_CitirocCfg2_REG_CFG27_WR,
		INT_CitirocCfg2_REG_CFG27_WR => INT_CitirocCfg2_REG_CFG27_WR,
		REG_CitirocCfg2_REG_CFG28_WR => REG_CitirocCfg2_REG_CFG28_WR,
		INT_CitirocCfg2_REG_CFG28_WR => INT_CitirocCfg2_REG_CFG28_WR,
		REG_CitirocCfg2_REG_CFG29_WR => REG_CitirocCfg2_REG_CFG29_WR,
		INT_CitirocCfg2_REG_CFG29_WR => INT_CitirocCfg2_REG_CFG29_WR,
		REG_CitirocCfg2_REG_CFG30_WR => REG_CitirocCfg2_REG_CFG30_WR,
		INT_CitirocCfg2_REG_CFG30_WR => INT_CitirocCfg2_REG_CFG30_WR,
		REG_CitirocCfg2_REG_CFG31_WR => REG_CitirocCfg2_REG_CFG31_WR,
		INT_CitirocCfg2_REG_CFG31_WR => INT_CitirocCfg2_REG_CFG31_WR,
		REG_CitirocCfg2_REG_CFG32_WR => REG_CitirocCfg2_REG_CFG32_WR,
		INT_CitirocCfg2_REG_CFG32_WR => INT_CitirocCfg2_REG_CFG32_WR,
		REG_CitirocCfg2_REG_CFG33_WR => REG_CitirocCfg2_REG_CFG33_WR,
		INT_CitirocCfg2_REG_CFG33_WR => INT_CitirocCfg2_REG_CFG33_WR,
		REG_CitirocCfg2_REG_CFG34_WR => REG_CitirocCfg2_REG_CFG34_WR,
		INT_CitirocCfg2_REG_CFG34_WR => INT_CitirocCfg2_REG_CFG34_WR,
		REG_CitirocCfg2_REG_CFG35_WR => REG_CitirocCfg2_REG_CFG35_WR,
		INT_CitirocCfg2_REG_CFG35_WR => INT_CitirocCfg2_REG_CFG35_WR,
		REG_CitirocCfg2_START_REG_CFG_WR => REG_CitirocCfg2_START_REG_CFG_WR,
		INT_CitirocCfg2_START_REG_CFG_WR => INT_CitirocCfg2_START_REG_CFG_WR,
	BUS_CitirocCfg3_READ_DATA => BUS_CitirocCfg3_READ_DATA,
	BUS_CitirocCfg3_WRITE_DATA => BUS_CitirocCfg3_WRITE_DATA,
	BUS_CitirocCfg3_W_INT => BUS_CitirocCfg3_W_INT,
	BUS_CitirocCfg3_R_INT => BUS_CitirocCfg3_R_INT,
	BUS_CitirocCfg3_VLD => BUS_CitirocCfg3_VLD,
		REG_CitirocCfg3_REG_CFG0_WR => REG_CitirocCfg3_REG_CFG0_WR,
		INT_CitirocCfg3_REG_CFG0_WR => INT_CitirocCfg3_REG_CFG0_WR,
		REG_CitirocCfg3_REG_CFG1_WR => REG_CitirocCfg3_REG_CFG1_WR,
		INT_CitirocCfg3_REG_CFG1_WR => INT_CitirocCfg3_REG_CFG1_WR,
		REG_CitirocCfg3_REG_CFG2_WR => REG_CitirocCfg3_REG_CFG2_WR,
		INT_CitirocCfg3_REG_CFG2_WR => INT_CitirocCfg3_REG_CFG2_WR,
		REG_CitirocCfg3_REG_CFG3_WR => REG_CitirocCfg3_REG_CFG3_WR,
		INT_CitirocCfg3_REG_CFG3_WR => INT_CitirocCfg3_REG_CFG3_WR,
		REG_CitirocCfg3_REG_CFG4_WR => REG_CitirocCfg3_REG_CFG4_WR,
		INT_CitirocCfg3_REG_CFG4_WR => INT_CitirocCfg3_REG_CFG4_WR,
		REG_CitirocCfg3_REG_CFG5_WR => REG_CitirocCfg3_REG_CFG5_WR,
		INT_CitirocCfg3_REG_CFG5_WR => INT_CitirocCfg3_REG_CFG5_WR,
		REG_CitirocCfg3_REG_CFG6_WR => REG_CitirocCfg3_REG_CFG6_WR,
		INT_CitirocCfg3_REG_CFG6_WR => INT_CitirocCfg3_REG_CFG6_WR,
		REG_CitirocCfg3_REG_CFG7_WR => REG_CitirocCfg3_REG_CFG7_WR,
		INT_CitirocCfg3_REG_CFG7_WR => INT_CitirocCfg3_REG_CFG7_WR,
		REG_CitirocCfg3_REG_CFG8_WR => REG_CitirocCfg3_REG_CFG8_WR,
		INT_CitirocCfg3_REG_CFG8_WR => INT_CitirocCfg3_REG_CFG8_WR,
		REG_CitirocCfg3_REG_CFG9_WR => REG_CitirocCfg3_REG_CFG9_WR,
		INT_CitirocCfg3_REG_CFG9_WR => INT_CitirocCfg3_REG_CFG9_WR,
		REG_CitirocCfg3_REG_CFG10_WR => REG_CitirocCfg3_REG_CFG10_WR,
		INT_CitirocCfg3_REG_CFG10_WR => INT_CitirocCfg3_REG_CFG10_WR,
		REG_CitirocCfg3_REG_CFG11_WR => REG_CitirocCfg3_REG_CFG11_WR,
		INT_CitirocCfg3_REG_CFG11_WR => INT_CitirocCfg3_REG_CFG11_WR,
		REG_CitirocCfg3_REG_CFG12_WR => REG_CitirocCfg3_REG_CFG12_WR,
		INT_CitirocCfg3_REG_CFG12_WR => INT_CitirocCfg3_REG_CFG12_WR,
		REG_CitirocCfg3_REG_CFG13_WR => REG_CitirocCfg3_REG_CFG13_WR,
		INT_CitirocCfg3_REG_CFG13_WR => INT_CitirocCfg3_REG_CFG13_WR,
		REG_CitirocCfg3_REG_CFG14_WR => REG_CitirocCfg3_REG_CFG14_WR,
		INT_CitirocCfg3_REG_CFG14_WR => INT_CitirocCfg3_REG_CFG14_WR,
		REG_CitirocCfg3_REG_CFG15_WR => REG_CitirocCfg3_REG_CFG15_WR,
		INT_CitirocCfg3_REG_CFG15_WR => INT_CitirocCfg3_REG_CFG15_WR,
		REG_CitirocCfg3_REG_CFG16_WR => REG_CitirocCfg3_REG_CFG16_WR,
		INT_CitirocCfg3_REG_CFG16_WR => INT_CitirocCfg3_REG_CFG16_WR,
		REG_CitirocCfg3_REG_CFG17_WR => REG_CitirocCfg3_REG_CFG17_WR,
		INT_CitirocCfg3_REG_CFG17_WR => INT_CitirocCfg3_REG_CFG17_WR,
		REG_CitirocCfg3_REG_CFG18_WR => REG_CitirocCfg3_REG_CFG18_WR,
		INT_CitirocCfg3_REG_CFG18_WR => INT_CitirocCfg3_REG_CFG18_WR,
		REG_CitirocCfg3_REG_CFG19_WR => REG_CitirocCfg3_REG_CFG19_WR,
		INT_CitirocCfg3_REG_CFG19_WR => INT_CitirocCfg3_REG_CFG19_WR,
		REG_CitirocCfg3_REG_CFG20_WR => REG_CitirocCfg3_REG_CFG20_WR,
		INT_CitirocCfg3_REG_CFG20_WR => INT_CitirocCfg3_REG_CFG20_WR,
		REG_CitirocCfg3_REG_CFG21_WR => REG_CitirocCfg3_REG_CFG21_WR,
		INT_CitirocCfg3_REG_CFG21_WR => INT_CitirocCfg3_REG_CFG21_WR,
		REG_CitirocCfg3_REG_CFG22_WR => REG_CitirocCfg3_REG_CFG22_WR,
		INT_CitirocCfg3_REG_CFG22_WR => INT_CitirocCfg3_REG_CFG22_WR,
		REG_CitirocCfg3_REG_CFG23_WR => REG_CitirocCfg3_REG_CFG23_WR,
		INT_CitirocCfg3_REG_CFG23_WR => INT_CitirocCfg3_REG_CFG23_WR,
		REG_CitirocCfg3_REG_CFG24_WR => REG_CitirocCfg3_REG_CFG24_WR,
		INT_CitirocCfg3_REG_CFG24_WR => INT_CitirocCfg3_REG_CFG24_WR,
		REG_CitirocCfg3_REG_CFG25_WR => REG_CitirocCfg3_REG_CFG25_WR,
		INT_CitirocCfg3_REG_CFG25_WR => INT_CitirocCfg3_REG_CFG25_WR,
		REG_CitirocCfg3_REG_CFG26_WR => REG_CitirocCfg3_REG_CFG26_WR,
		INT_CitirocCfg3_REG_CFG26_WR => INT_CitirocCfg3_REG_CFG26_WR,
		REG_CitirocCfg3_REG_CFG27_WR => REG_CitirocCfg3_REG_CFG27_WR,
		INT_CitirocCfg3_REG_CFG27_WR => INT_CitirocCfg3_REG_CFG27_WR,
		REG_CitirocCfg3_REG_CFG28_WR => REG_CitirocCfg3_REG_CFG28_WR,
		INT_CitirocCfg3_REG_CFG28_WR => INT_CitirocCfg3_REG_CFG28_WR,
		REG_CitirocCfg3_REG_CFG29_WR => REG_CitirocCfg3_REG_CFG29_WR,
		INT_CitirocCfg3_REG_CFG29_WR => INT_CitirocCfg3_REG_CFG29_WR,
		REG_CitirocCfg3_REG_CFG30_WR => REG_CitirocCfg3_REG_CFG30_WR,
		INT_CitirocCfg3_REG_CFG30_WR => INT_CitirocCfg3_REG_CFG30_WR,
		REG_CitirocCfg3_REG_CFG31_WR => REG_CitirocCfg3_REG_CFG31_WR,
		INT_CitirocCfg3_REG_CFG31_WR => INT_CitirocCfg3_REG_CFG31_WR,
		REG_CitirocCfg3_REG_CFG32_WR => REG_CitirocCfg3_REG_CFG32_WR,
		INT_CitirocCfg3_REG_CFG32_WR => INT_CitirocCfg3_REG_CFG32_WR,
		REG_CitirocCfg3_REG_CFG33_WR => REG_CitirocCfg3_REG_CFG33_WR,
		INT_CitirocCfg3_REG_CFG33_WR => INT_CitirocCfg3_REG_CFG33_WR,
		REG_CitirocCfg3_REG_CFG34_WR => REG_CitirocCfg3_REG_CFG34_WR,
		INT_CitirocCfg3_REG_CFG34_WR => INT_CitirocCfg3_REG_CFG34_WR,
		REG_CitirocCfg3_REG_CFG35_WR => REG_CitirocCfg3_REG_CFG35_WR,
		INT_CitirocCfg3_REG_CFG35_WR => INT_CitirocCfg3_REG_CFG35_WR,
		REG_CitirocCfg3_START_REG_CFG_WR => REG_CitirocCfg3_START_REG_CFG_WR,
		INT_CitirocCfg3_START_REG_CFG_WR => INT_CitirocCfg3_START_REG_CFG_WR,
	BUS_CitirocCfg0_READ_DATA => BUS_CitirocCfg0_READ_DATA,
	BUS_CitirocCfg0_WRITE_DATA => BUS_CitirocCfg0_WRITE_DATA,
	BUS_CitirocCfg0_W_INT => BUS_CitirocCfg0_W_INT,
	BUS_CitirocCfg0_R_INT => BUS_CitirocCfg0_R_INT,
	BUS_CitirocCfg0_VLD => BUS_CitirocCfg0_VLD,
		REG_CitirocCfg0_REG_CFG0_WR => REG_CitirocCfg0_REG_CFG0_WR,
		INT_CitirocCfg0_REG_CFG0_WR => INT_CitirocCfg0_REG_CFG0_WR,
		REG_CitirocCfg0_REG_CFG1_WR => REG_CitirocCfg0_REG_CFG1_WR,
		INT_CitirocCfg0_REG_CFG1_WR => INT_CitirocCfg0_REG_CFG1_WR,
		REG_CitirocCfg0_REG_CFG2_WR => REG_CitirocCfg0_REG_CFG2_WR,
		INT_CitirocCfg0_REG_CFG2_WR => INT_CitirocCfg0_REG_CFG2_WR,
		REG_CitirocCfg0_REG_CFG3_WR => REG_CitirocCfg0_REG_CFG3_WR,
		INT_CitirocCfg0_REG_CFG3_WR => INT_CitirocCfg0_REG_CFG3_WR,
		REG_CitirocCfg0_REG_CFG4_WR => REG_CitirocCfg0_REG_CFG4_WR,
		INT_CitirocCfg0_REG_CFG4_WR => INT_CitirocCfg0_REG_CFG4_WR,
		REG_CitirocCfg0_REG_CFG5_WR => REG_CitirocCfg0_REG_CFG5_WR,
		INT_CitirocCfg0_REG_CFG5_WR => INT_CitirocCfg0_REG_CFG5_WR,
		REG_CitirocCfg0_REG_CFG6_WR => REG_CitirocCfg0_REG_CFG6_WR,
		INT_CitirocCfg0_REG_CFG6_WR => INT_CitirocCfg0_REG_CFG6_WR,
		REG_CitirocCfg0_REG_CFG7_WR => REG_CitirocCfg0_REG_CFG7_WR,
		INT_CitirocCfg0_REG_CFG7_WR => INT_CitirocCfg0_REG_CFG7_WR,
		REG_CitirocCfg0_REG_CFG8_WR => REG_CitirocCfg0_REG_CFG8_WR,
		INT_CitirocCfg0_REG_CFG8_WR => INT_CitirocCfg0_REG_CFG8_WR,
		REG_CitirocCfg0_REG_CFG9_WR => REG_CitirocCfg0_REG_CFG9_WR,
		INT_CitirocCfg0_REG_CFG9_WR => INT_CitirocCfg0_REG_CFG9_WR,
		REG_CitirocCfg0_REG_CFG10_WR => REG_CitirocCfg0_REG_CFG10_WR,
		INT_CitirocCfg0_REG_CFG10_WR => INT_CitirocCfg0_REG_CFG10_WR,
		REG_CitirocCfg0_REG_CFG11_WR => REG_CitirocCfg0_REG_CFG11_WR,
		INT_CitirocCfg0_REG_CFG11_WR => INT_CitirocCfg0_REG_CFG11_WR,
		REG_CitirocCfg0_REG_CFG12_WR => REG_CitirocCfg0_REG_CFG12_WR,
		INT_CitirocCfg0_REG_CFG12_WR => INT_CitirocCfg0_REG_CFG12_WR,
		REG_CitirocCfg0_REG_CFG13_WR => REG_CitirocCfg0_REG_CFG13_WR,
		INT_CitirocCfg0_REG_CFG13_WR => INT_CitirocCfg0_REG_CFG13_WR,
		REG_CitirocCfg0_REG_CFG14_WR => REG_CitirocCfg0_REG_CFG14_WR,
		INT_CitirocCfg0_REG_CFG14_WR => INT_CitirocCfg0_REG_CFG14_WR,
		REG_CitirocCfg0_REG_CFG15_WR => REG_CitirocCfg0_REG_CFG15_WR,
		INT_CitirocCfg0_REG_CFG15_WR => INT_CitirocCfg0_REG_CFG15_WR,
		REG_CitirocCfg0_REG_CFG16_WR => REG_CitirocCfg0_REG_CFG16_WR,
		INT_CitirocCfg0_REG_CFG16_WR => INT_CitirocCfg0_REG_CFG16_WR,
		REG_CitirocCfg0_REG_CFG17_WR => REG_CitirocCfg0_REG_CFG17_WR,
		INT_CitirocCfg0_REG_CFG17_WR => INT_CitirocCfg0_REG_CFG17_WR,
		REG_CitirocCfg0_REG_CFG18_WR => REG_CitirocCfg0_REG_CFG18_WR,
		INT_CitirocCfg0_REG_CFG18_WR => INT_CitirocCfg0_REG_CFG18_WR,
		REG_CitirocCfg0_REG_CFG19_WR => REG_CitirocCfg0_REG_CFG19_WR,
		INT_CitirocCfg0_REG_CFG19_WR => INT_CitirocCfg0_REG_CFG19_WR,
		REG_CitirocCfg0_REG_CFG20_WR => REG_CitirocCfg0_REG_CFG20_WR,
		INT_CitirocCfg0_REG_CFG20_WR => INT_CitirocCfg0_REG_CFG20_WR,
		REG_CitirocCfg0_REG_CFG21_WR => REG_CitirocCfg0_REG_CFG21_WR,
		INT_CitirocCfg0_REG_CFG21_WR => INT_CitirocCfg0_REG_CFG21_WR,
		REG_CitirocCfg0_REG_CFG22_WR => REG_CitirocCfg0_REG_CFG22_WR,
		INT_CitirocCfg0_REG_CFG22_WR => INT_CitirocCfg0_REG_CFG22_WR,
		REG_CitirocCfg0_REG_CFG23_WR => REG_CitirocCfg0_REG_CFG23_WR,
		INT_CitirocCfg0_REG_CFG23_WR => INT_CitirocCfg0_REG_CFG23_WR,
		REG_CitirocCfg0_REG_CFG24_WR => REG_CitirocCfg0_REG_CFG24_WR,
		INT_CitirocCfg0_REG_CFG24_WR => INT_CitirocCfg0_REG_CFG24_WR,
		REG_CitirocCfg0_REG_CFG25_WR => REG_CitirocCfg0_REG_CFG25_WR,
		INT_CitirocCfg0_REG_CFG25_WR => INT_CitirocCfg0_REG_CFG25_WR,
		REG_CitirocCfg0_REG_CFG26_WR => REG_CitirocCfg0_REG_CFG26_WR,
		INT_CitirocCfg0_REG_CFG26_WR => INT_CitirocCfg0_REG_CFG26_WR,
		REG_CitirocCfg0_REG_CFG27_WR => REG_CitirocCfg0_REG_CFG27_WR,
		INT_CitirocCfg0_REG_CFG27_WR => INT_CitirocCfg0_REG_CFG27_WR,
		REG_CitirocCfg0_REG_CFG28_WR => REG_CitirocCfg0_REG_CFG28_WR,
		INT_CitirocCfg0_REG_CFG28_WR => INT_CitirocCfg0_REG_CFG28_WR,
		REG_CitirocCfg0_REG_CFG29_WR => REG_CitirocCfg0_REG_CFG29_WR,
		INT_CitirocCfg0_REG_CFG29_WR => INT_CitirocCfg0_REG_CFG29_WR,
		REG_CitirocCfg0_REG_CFG30_WR => REG_CitirocCfg0_REG_CFG30_WR,
		INT_CitirocCfg0_REG_CFG30_WR => INT_CitirocCfg0_REG_CFG30_WR,
		REG_CitirocCfg0_REG_CFG31_WR => REG_CitirocCfg0_REG_CFG31_WR,
		INT_CitirocCfg0_REG_CFG31_WR => INT_CitirocCfg0_REG_CFG31_WR,
		REG_CitirocCfg0_REG_CFG32_WR => REG_CitirocCfg0_REG_CFG32_WR,
		INT_CitirocCfg0_REG_CFG32_WR => INT_CitirocCfg0_REG_CFG32_WR,
		REG_CitirocCfg0_REG_CFG33_WR => REG_CitirocCfg0_REG_CFG33_WR,
		INT_CitirocCfg0_REG_CFG33_WR => INT_CitirocCfg0_REG_CFG33_WR,
		REG_CitirocCfg0_REG_CFG34_WR => REG_CitirocCfg0_REG_CFG34_WR,
		INT_CitirocCfg0_REG_CFG34_WR => INT_CitirocCfg0_REG_CFG34_WR,
		REG_CitirocCfg0_REG_CFG35_WR => REG_CitirocCfg0_REG_CFG35_WR,
		INT_CitirocCfg0_REG_CFG35_WR => INT_CitirocCfg0_REG_CFG35_WR,
		REG_CitirocCfg0_START_REG_CFG_WR => REG_CitirocCfg0_START_REG_CFG_WR,
		INT_CitirocCfg0_START_REG_CFG_WR => INT_CitirocCfg0_START_REG_CFG_WR,
	BUS_CitirocFrame0_READ_DATA => BUS_CitirocFrame0_READ_DATA,
	BUS_CitirocFrame0_WRITE_DATA => BUS_CitirocFrame0_WRITE_DATA,
	BUS_CitirocFrame0_W_INT => BUS_CitirocFrame0_W_INT,
	BUS_CitirocFrame0_R_INT => BUS_CitirocFrame0_R_INT,
	BUS_CitirocFrame0_VLD => BUS_CitirocFrame0_VLD,
		REG_CitirocFrame0_CONTROL_WR => REG_CitirocFrame0_CONTROL_WR,
		INT_CitirocFrame0_CONTROL_WR => INT_CitirocFrame0_CONTROL_WR,
		REG_CitirocFrame0_STATUS_RD => REG_CitirocFrame0_STATUS_RD,
		INT_CitirocFrame0_STATUS_RD => INT_CitirocFrame0_STATUS_RD,
		REG_T0_SOFT_FREQ_RD => REG_T0_SOFT_FREQ_RD,
		REG_T0_SOFT_FREQ_WR => REG_T0_SOFT_FREQ_WR,
		INT_T0_SOFT_FREQ_RD => INT_T0_SOFT_FREQ_RD,
		INT_T0_SOFT_FREQ_WR => INT_T0_SOFT_FREQ_WR,
		REG_T0_SEL_RD => REG_T0_SEL_RD,
		REG_T0_SEL_WR => REG_T0_SEL_WR,
		INT_T0_SEL_RD => INT_T0_SEL_RD,
		INT_T0_SEL_WR => INT_T0_SEL_WR,
	BUS_Oscilloscope_0_READ_ADDRESS => BUS_Oscilloscope_0_READ_ADDRESS,
	BUS_Oscilloscope_0_READ_DATA => BUS_Oscilloscope_0_READ_DATA,
	BUS_Oscilloscope_0_WRITE_DATA => BUS_Oscilloscope_0_WRITE_DATA,
	BUS_Oscilloscope_0_W_INT => BUS_Oscilloscope_0_W_INT,
	BUS_Oscilloscope_0_R_INT => BUS_Oscilloscope_0_R_INT,
	BUS_Oscilloscope_0_VLD => BUS_Oscilloscope_0_VLD,
		REG_Oscilloscope_0_READ_STATUS_RD => REG_Oscilloscope_0_READ_STATUS_RD,
		INT_Oscilloscope_0_READ_STATUS_RD => INT_Oscilloscope_0_READ_STATUS_RD,
		REG_Oscilloscope_0_READ_POSITION_RD => REG_Oscilloscope_0_READ_POSITION_RD,
		INT_Oscilloscope_0_READ_POSITION_RD => INT_Oscilloscope_0_READ_POSITION_RD,
		REG_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR => REG_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR,
		INT_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR => INT_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR,
		REG_Oscilloscope_0_CONFIG_PRETRIGGER_WR => REG_Oscilloscope_0_CONFIG_PRETRIGGER_WR,
		INT_Oscilloscope_0_CONFIG_PRETRIGGER_WR => INT_Oscilloscope_0_CONFIG_PRETRIGGER_WR,
		REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR => REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR,
		INT_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR => INT_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR,
		REG_Oscilloscope_0_CONFIG_ARM_WR => REG_Oscilloscope_0_CONFIG_ARM_WR,
		INT_Oscilloscope_0_CONFIG_ARM_WR => INT_Oscilloscope_0_CONFIG_ARM_WR,
		REG_Oscilloscope_0_CONFIG_DECIMATOR_WR => REG_Oscilloscope_0_CONFIG_DECIMATOR_WR,
		INT_Oscilloscope_0_CONFIG_DECIMATOR_WR => INT_Oscilloscope_0_CONFIG_DECIMATOR_WR,
	BUS_Oscilloscope_3_READ_ADDRESS => BUS_Oscilloscope_3_READ_ADDRESS,
	BUS_Oscilloscope_3_READ_DATA => BUS_Oscilloscope_3_READ_DATA,
	BUS_Oscilloscope_3_WRITE_DATA => BUS_Oscilloscope_3_WRITE_DATA,
	BUS_Oscilloscope_3_W_INT => BUS_Oscilloscope_3_W_INT,
	BUS_Oscilloscope_3_R_INT => BUS_Oscilloscope_3_R_INT,
	BUS_Oscilloscope_3_VLD => BUS_Oscilloscope_3_VLD,
		REG_Oscilloscope_3_READ_STATUS_RD => REG_Oscilloscope_3_READ_STATUS_RD,
		INT_Oscilloscope_3_READ_STATUS_RD => INT_Oscilloscope_3_READ_STATUS_RD,
		REG_Oscilloscope_3_READ_POSITION_RD => REG_Oscilloscope_3_READ_POSITION_RD,
		INT_Oscilloscope_3_READ_POSITION_RD => INT_Oscilloscope_3_READ_POSITION_RD,
		REG_Oscilloscope_3_CONFIG_TRIGGER_MODE_WR => REG_Oscilloscope_3_CONFIG_TRIGGER_MODE_WR,
		INT_Oscilloscope_3_CONFIG_TRIGGER_MODE_WR => INT_Oscilloscope_3_CONFIG_TRIGGER_MODE_WR,
		REG_Oscilloscope_3_CONFIG_PRETRIGGER_WR => REG_Oscilloscope_3_CONFIG_PRETRIGGER_WR,
		INT_Oscilloscope_3_CONFIG_PRETRIGGER_WR => INT_Oscilloscope_3_CONFIG_PRETRIGGER_WR,
		REG_Oscilloscope_3_CONFIG_TRIGGER_LEVEL_WR => REG_Oscilloscope_3_CONFIG_TRIGGER_LEVEL_WR,
		INT_Oscilloscope_3_CONFIG_TRIGGER_LEVEL_WR => INT_Oscilloscope_3_CONFIG_TRIGGER_LEVEL_WR,
		REG_Oscilloscope_3_CONFIG_ARM_WR => REG_Oscilloscope_3_CONFIG_ARM_WR,
		INT_Oscilloscope_3_CONFIG_ARM_WR => INT_Oscilloscope_3_CONFIG_ARM_WR,
		REG_Oscilloscope_3_CONFIG_DECIMATOR_WR => REG_Oscilloscope_3_CONFIG_DECIMATOR_WR,
		INT_Oscilloscope_3_CONFIG_DECIMATOR_WR => INT_Oscilloscope_3_CONFIG_DECIMATOR_WR,
		REG_HOLD_TIME_RD => REG_HOLD_TIME_RD,
		REG_HOLD_TIME_WR => REG_HOLD_TIME_WR,
		INT_HOLD_TIME_RD => INT_HOLD_TIME_RD,
		INT_HOLD_TIME_WR => INT_HOLD_TIME_WR,
		REG_FR_IFP_RD => REG_FR_IFP_RD,
		REG_FR_IFP_WR => REG_FR_IFP_WR,
		INT_FR_IFP_RD => INT_FR_IFP_RD,
		INT_FR_IFP_WR => INT_FR_IFP_WR,
		REG_FR_LIMIT_RD => REG_FR_LIMIT_RD,
		REG_FR_LIMIT_WR => REG_FR_LIMIT_WR,
		INT_FR_LIMIT_RD => INT_FR_LIMIT_RD,
		INT_FR_LIMIT_WR => INT_FR_LIMIT_WR,
		REG_FR_IFP2_RD => REG_FR_IFP2_RD,
		REG_FR_IFP2_WR => REG_FR_IFP2_WR,
		INT_FR_IFP2_RD => INT_FR_IFP2_RD,
		INT_FR_IFP2_WR => INT_FR_IFP2_WR,
		REG_FR_MODE_RD => REG_FR_MODE_RD,
		REG_FR_MODE_WR => REG_FR_MODE_WR,
		INT_FR_MODE_RD => INT_FR_MODE_RD,
		INT_FR_MODE_WR => INT_FR_MODE_WR,
		REG_FR_DBG1_RD => REG_FR_DBG1_RD,
		REG_FR_DBG1_WR => REG_FR_DBG1_WR,
		INT_FR_DBG1_RD => INT_FR_DBG1_RD,
		INT_FR_DBG1_WR => INT_FR_DBG1_WR,
		REG_FR_DBG2_RD => REG_FR_DBG2_RD,
		REG_FR_DBG2_WR => REG_FR_DBG2_WR,
		INT_FR_DBG2_RD => INT_FR_DBG2_RD,
		INT_FR_DBG2_WR => INT_FR_DBG2_WR,
	BUS_CP_0_READ_DATA => BUS_CP_0_READ_DATA,
	BUS_CP_0_WRITE_DATA => BUS_CP_0_WRITE_DATA,
	BUS_CP_0_W_INT => BUS_CP_0_W_INT,
	BUS_CP_0_R_INT => BUS_CP_0_R_INT,
	BUS_CP_0_VLD => BUS_CP_0_VLD,
		REG_CP_0_READ_STATUS_RD => REG_CP_0_READ_STATUS_RD,
		INT_CP_0_READ_STATUS_RD => INT_CP_0_READ_STATUS_RD,
		REG_CP_0_READ_VALID_WORDS_RD => REG_CP_0_READ_VALID_WORDS_RD,
		INT_CP_0_READ_VALID_WORDS_RD => INT_CP_0_READ_VALID_WORDS_RD,
		REG_CP_0_CONFIG_WR => REG_CP_0_CONFIG_WR,
		INT_CP_0_CONFIG_WR => INT_CP_0_CONFIG_WR,
		REG_UNIQUE_RD => x"00112244",
		REG_UNIQUE_WR => open,
   
        
        --LATO FPGA
        
        f_RESET => '0'

                            
                      
        );
       
	   

    TBR : TestBram 
         PORT MAP(
           clka => BUS_CLK(0),
           wea => BUS_Test_0_W_INT,
           addra => BUS_Test_0_ADDRESS(9 DOWNTO 0),
           dina => BUS_Test_0_WRITE_DATA,
           douta => BUS_Test_0_READ_DATA
         );
       	   
             
    --ANALOG READOUT SIGNALs
             
	A_ANALOG_CLK <= CITIROC_A_SCLK_s(0);
    A_ANALOG_DIN <= CITIROC_A_SRIN_s(0);
    A_RESETB_READ <= CITIROC_A_RESET_READ_s(0);
    A_HOLD_LG <= A_HOLD_LG_s(0);
    A_HOLD_HG <= A_HOLD_HG_s(0);
	CITIROC_A_CHARGE_HIT_s(0) <= A_DIG_OUT;	
	CITIROC_A_ADC_ENERGY_LG <= ADC_A1;
	CITIROC_A_ADC_ENERGY_HG <= ADC_A0;
	
    B_ANALOG_CLK <= CITIROC_B_SCLK_s(0);
    B_ANALOG_DIN <= CITIROC_B_SRIN_s(0);
	B_RESETB_READ <= CITIROC_B_RESET_READ_s(0);
	CITIROC_B_CHARGE_HIT_s(0) <= B_DIG_OUT;
    B_HOLD_LG <= B_HOLD_LG_s(0);
    B_HOLD_HG <= B_HOLD_HG_s(0);
	CITIROC_B_ADC_ENERGY_LG <= ADC_A3;
	CITIROC_B_ADC_ENERGY_HG <= ADC_A2;

    C_ANALOG_CLK <= CITIROC_C_SCLK_s(0);
    C_ANALOG_DIN <= CITIROC_C_SRIN_s(0);
    C_RESETB_READ <= CITIROC_C_RESET_READ_s(0);
	CITIROC_C_CHARGE_HIT_s(0) <= C_DIG_OUT;
    C_HOLD_LG <= C_HOLD_LG_s(0);
    C_HOLD_HG <= C_HOLD_HG_s(0);	
	CITIROC_C_ADC_ENERGY_LG <= ADC_A5;
	CITIROC_C_ADC_ENERGY_HG <= ADC_A4;

    D_ANALOG_CLK <= CITIROC_D_SCLK_s(0);
    D_ANALOG_DIN <= CITIROC_D_SRIN_s(0);
    D_RESETB_READ <= CITIROC_D_RESET_READ_s(0);
    CITIROC_D_CHARGE_HIT_s(0) <= D_DIG_OUT;
    D_HOLD_LG <= D_HOLD_LG_s(0);
    D_HOLD_HG <= D_HOLD_HG_s(0);	
	CITIROC_D_ADC_ENERGY_LG <= ADC_A7;
	CITIROC_D_ADC_ENERGY_HG <= ADC_A6;
                  
	--EXTERNAL TRIGGER
	D_TRIG_EXT <= TRIGGER_EXT_D_s(0);
    C_TRIG_EXT <= TRIGGER_EXT_C_s(0);
    B_TRIG_EXT <= TRIGGER_EXT_B_s(0);
    A_TRIG_EXT <= TRIGGER_EXT_A_s(0);

	
	--VAL_EVT
	a_val_evt <= A_VAL_EVT_s(0);
	b_val_evt <= B_VAL_EVT_s(0);
	c_val_evt <= C_VAL_EVT_s(0);
	d_val_evt <= D_VAL_EVT_s(0);
	
	--RAZ_CHN
	a_raz_chn <= A_RAZ_CHN_s(0);
	b_raz_chn <= B_RAZ_CHN_s(0);
	c_raz_chn <= C_RAZ_CHN_s(0);
	d_raz_chn <= D_RAZ_CHN_s(0);
	
	
	A_RESETB_PSC <='1';
    B_RESETB_PSC <='1';
    C_RESETB_PSC <='1';
    D_RESETB_PSC <='1';
    
    A_RESETB_PA <= '1';
    B_RESETB_PA <= '1';
    C_RESETB_PA <= '1';
    D_RESETB_PA <= '1';

	--SLOW CONTROL

    A_SR_CK     <= A_SR_CK_s(0); 
    A_SR_IN     <= A_SR_IN_s(0);
    A_SRLOAD    <= A_SRLOAD_s(0);
    A_RESETB_SR <= A_RESETB_SR_s(0);
    A_SELECT    <= A_SELECT_s(0);
    

    B_SR_CK     <= B_SR_CK_s(0); 
    B_SR_IN     <= B_SR_IN_s(0);
    B_SRLOAD    <= B_SRLOAD_s(0);
    B_RESETB_SR <= B_RESETB_SR_s(0);
    B_SELECT    <= B_SELECT_s(0);

    C_SR_CK     <= C_SR_CK_s(0); 
    C_SR_IN     <= C_SR_IN_s(0);
    C_SRLOAD    <= C_SRLOAD_s(0);
    C_RESETB_SR <= C_RESETB_SR_s(0);
    C_SELECT    <= C_SELECT_s(0);
		
    D_SR_CK     <= D_SR_CK_s(0); 
    D_SR_IN     <= D_SR_IN_s(0);
    D_SRLOAD    <= D_SRLOAD_s(0);
    D_RESETB_SR <= D_RESETB_SR_s(0);
    D_SELECT    <= D_SELECT_s(0);

	
	
	--VAL EVENT BUFFERS
	A_VAL : OBUFDS
	generic map (
	  IOSTANDARD => "BLVDS_25",
	  SLEW => "SLOW")  
	port map (
	  O => A_VAL_EVT_P,
	  OB => A_VAL_EVT_N,
	  I => a_val_evt 
	);
		   
	B_VAL : OBUFDS
	generic map (
	  IOSTANDARD => "BLVDS_25",
	  SLEW => "SLOW")  
	port map (
	  O => B_VAL_EVT_P,
	  OB => B_VAL_EVT_N,
	  I => b_val_evt 
	);

	c_val_evti <= not c_val_evt;
	C_VAL : OBUFDS
	generic map (
	  IOSTANDARD => "BLVDS_25",
	  SLEW => "SLOW")  
	port map (
	  O => C_VAL_EVT_P,
	  OB => C_VAL_EVT_N,
	  I => c_val_evti 
	);  

	D_VAL : OBUFDS
	generic map (
	  IOSTANDARD => "BLVDS_25",
	  SLEW => "SLOW")  
	port map (
	  O => D_VAL_EVT_P,
	  OB => D_VAL_EVT_N,
	  I => d_val_evt 
	);   



	--RAZ BUFFERS
	A_RAZ : OBUFDS
	generic map (
	  IOSTANDARD => "BLVDS_25",
	  SLEW => "SLOW")  
	port map (
	  O => A_RAZ_CHN_P,
	  OB => A_RAZ_CHN_N,
	  I => a_raz_chn 
	);

	b_raz_chn_i <= not b_raz_chn;
	B_RAZ : OBUFDS
	generic map (
	  IOSTANDARD => "BLVDS_25",
	  SLEW => "SLOW")  
	port map (
	  O => B_RAZ_CHN_P,
	  OB => B_RAZ_CHN_N,
	  I => b_raz_chn_i 
	);
	  
	C_RAZ : OBUFDS
	generic map (
	  IOSTANDARD => "BLVDS_25",
	  SLEW => "SLOW")  
	port map (
	  O => C_RAZ_CHN_P,
	  OB => C_RAZ_CHN_N,
	  I => c_raz_chn 
	);     

	d_raz_chn_i <= not d_raz_chn;   
	D_RAZ : OBUFDS
	generic map (
	  IOSTANDARD => "BLVDS_25",
	  SLEW => "SLOW")  
	port map (
	  O => D_RAZ_CHN_P,
	  OB => D_RAZ_CHN_N,
	  I => d_raz_chn_i 
	);      

   
   
   
	CK_SPI_NSYNC <= '1';	
	EXT_ready <= CK_CONFIG_DONE;
 
	CDCE0 : init_clock_gen 
   Generic map (ComponentBaseAddress => x"0000")
   Port Map( clk => clk_100,
		  CK_SPI_LE => CK_SPI_LE,
		  CK_SPI_CLK => CK_SPI_CLK,
		  CK_SPI_MOSI => CK_SPI_MOSI,
		  CK_PD => open,
		  CK_LOCK => '1',
		  CK_CONFIG_DONE => CK_CONFIG_DONE,
		  reset => '0',
		  reset_out => sys_reset,
		  REG_addr => x"0000",
		  REG_din => x"00000000",
		  REG_wrint => '0'
		  );   


         
	ADCreset <=not EXT_READY;
	adcs:   adcs_top 
       Port map(
           
           reset => ADCreset,
           sCLK_100 => clk_100,
           ADC_1_CLK_A_P => ADC_1_CLK_A_P,
           ADC_1_CLK_A_N => ADC_1_CLK_A_N,
           ADC_1_FRAME_A_P => ADC_1_FRAME_A_P,
           ADC_1_FRAME_A_N => ADC_1_FRAME_A_N,
           ADC_1_DATA_A_P => ADC_1_DATA_A_P,
           ADC_1_DATA_A_N => ADC_1_DATA_A_N,
           ADC_1_DATA_B_P => ADC_1_DATA_B_P,
           ADC_1_DATA_B_N => ADC_1_DATA_B_N,
           SMADC_1_CSA => SMADC_1_CSA,
           SMADC_1_CSB => open,
           SMADC_1_CLK => SMADC_1_CLK,
           SMADC_1_MOSI => SMADC_1_MOSI,
           SMADC_1_RESET => SMADC_1_RESET,
           READOUT_CLK => CLK_ACQ(0),
           ADC_CLK_OUT => open,
           CH0 => ADC_A0,		
           CH1 => ADC_A1,		--CHARGE
           CH2 => ADC_A2,	
           CH3 => ADC_A3, 		--CHARGE
           CH4 => ADC_A4,	
           CH5 => ADC_A5,		--CHARGE
           CH6 => ADC_A6,
           CH7 => ADC_A7,		--CHARGE
           CHv0_7 => open,
           inversion => ANALOG_INPUT_INVERSION,
           ADC_STATUS => open,
           ADC_READY => open
    );         
	SMADC_1_PD <= '0';
   
   
    
FC : FlashController 
    Port Map(
            clk => BUS_CLK(0),
            BUS_Flash_0_READ_DATA => BUS_Flash_0_READ_DATA,
            BUS_Flash_0_ADDRESS => BUS_Flash_0_ADDRESS, 
            BUS_Flash_0_WRITE_DATA => BUS_Flash_0_WRITE_DATA, 
            BUS_Flash_0_W_INT => BUS_Flash_0_W_INT, 
            BUS_Flash_0_R_INT => BUS_Flash_0_R_INT, 
            BUS_Flash_0_VLD => BUS_Flash_0_VLD, 
            
            REG_FLASH_CNTR_RD => REG_FLASH_CNTR_RD, 
            REG_FLASH_CNTR_WR => REG_FLASH_CNTR_WR, 
            INT_FLASH_CNTR_RD => INT_FLASH_CNTR_RD, 
            INT_FLASH_CNTR_WR => INT_FLASH_CNTR_WR,  
            
            REG_FLASH_ADDRESS_RD => REG_FLASH_ADDRESS_RD, 
            REG_FLASH_ADDRESS_WR => REG_FLASH_ADDRESS_WR, 
            INT_FLASH_ADDRESS_RD => INT_FLASH_ADDRESS_RD, 
            INT_FLASH_ADDRESS_WR => INT_FLASH_ADDRESS_WR,             
            
            SPI_CS => FLASH_SPI_CS,
            SPI_DIN => FLASH_SPI_DIN,
            SPI_DOUT => FLASH_SPI_DOUT,
            SPI_CLK => FLASH_SPI_CLK 
    );
    
    
   STARTUPE2_inst : STARTUPE2
    generic map (
       PROG_USR => "FALSE",  -- Activate program event security feature. Requires encrypted bitstreams.
       SIM_CCLK_FREQ => 0.0  -- Set the Configuration Clock Frequency(ns) for simulation.
    )
    port map (
       CFGCLK => OPEN,       -- 1-bit output: Configuration main clock output
       CFGMCLK => cfg_clk,     -- 1-bit output: Configuration internal oscillator clock output
       EOS => done_sig,             -- 1-bit output: Active high output signal indicating the End Of Startup.
       PREQ => OPEN,           -- 1-bit output: PROGRAM request to fabric output
       CLK => cfg_clk,             -- 1-bit input: User start-up clock input
       GSR => '0',             -- 1-bit input: Global Set/Reset input (GSR cannot be used for the port name)
       GTS => '0',             -- 1-bit input: Global 3-state input (GTS cannot be used for the port name)
       KEYCLEARB => '0', -- 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
       PACK => '0',           -- 1-bit input: PROGRAM acknowledge input
       USRCCLKO => clock_prog_mux_out,   -- 1-bit input: User CCLK input
       USRCCLKTS => '0', -- 1-bit input: User CCLK 3-state enable input
       USRDONEO => '1',   -- 1-bit input: User DONE pin output control
       USRDONETS => '0'  -- 1-bit input: User DONE 3-state enable output
    );
         
     clock_prog_mux_out <= cfg_clk when done_sig = '0' else FLASH_SPI_CLK;

	 

	LEMO01_dir <= not LEMO_0_1_DIRECTION(0);
	LEMO23_dir <= not LEMO_2_3_DIRECTION(0);
	LEMO45_dir <= not LEMO_4_5_DIRECTION(0);
	LEMO67_dir <= not LEMO_6_7_DIRECTION(0);

	LEMO0_BUFF : IOBUF
	generic map (
	  DRIVE => 12,
	  IOSTANDARD => "DEFAULT",
	  SLEW => "SLOW")
	port map (
	  O =>  LEMO_0_1_A_OUT(0),     
	  IO => LEMO0,   
	  I =>  LEMO_0_1_A_IN(0),
	  T =>  LEMO_0_1_DIRECTION(0) 
	); 

	LEMO1_BUFF : IOBUF
	generic map (
	  DRIVE => 12,
	  IOSTANDARD => "DEFAULT",
	  SLEW => "SLOW")
	port map (
	  O =>  LEMO_0_1_B_OUT(0),     
	  IO => LEMO1,   
	  I =>  LEMO_0_1_B_IN(0),
	  T =>  LEMO_0_1_DIRECTION(0) 
	);            

	LEMO2_BUFF : IOBUF
	generic map (
	  DRIVE => 12,
	  IOSTANDARD => "DEFAULT",
	  SLEW => "SLOW")
	port map (
	  O =>  LEMO_2_3_A_OUT(0),     
	  IO => LEMO2,   
	  I =>  LEMO_2_3_A_IN(0),
	  T =>  LEMO_2_3_DIRECTION(0) 
	); 

	LEMO3_BUFF : IOBUF
	generic map (
	  DRIVE => 12,
	  IOSTANDARD => "DEFAULT",
	  SLEW => "SLOW")
	port map (
	  O =>  LEMO_2_3_B_OUT(0),     
	  IO => LEMO3,   
	  I =>  LEMO_2_3_B_IN(0),
	  T =>  LEMO_2_3_DIRECTION(0) 
	);                  

	LEMO4_BUFF : IOBUF
	generic map (
	  DRIVE => 12,
	  IOSTANDARD => "DEFAULT",
	  SLEW => "SLOW")
	port map (
	  O =>  LEMO_4_5_A_OUT(0),     
	  IO => LEMO4,   
	  I =>  LEMO_4_5_A_IN(0),
	  T =>  LEMO_4_5_DIRECTION(0) 
	);   

	LEMO5_BUFF : IOBUF
	generic map (
	  DRIVE => 12,
	  IOSTANDARD => "DEFAULT",
	  SLEW => "SLOW")
	port map (
	  O =>  LEMO_4_5_B_OUT(0),     
	  IO => LEMO5,   
	  I =>  LEMO_4_5_B_IN(0),
	  T =>  LEMO_4_5_DIRECTION(0) 
	);     

	LEMO6_BUFF : IOBUF
	generic map (
	  DRIVE => 12,
	  IOSTANDARD => "DEFAULT",
	  SLEW => "SLOW")
	port map (
	  O =>  LEMO_6_7_A_OUT(0),     
	  IO => LEMO6,   
	  I =>  LEMO_6_7_A_IN(0),
	  T =>  LEMO_6_7_DIRECTION(0) 
	); 

	LEMO7_BUFF : IOBUF
	generic map (
	  DRIVE => 12,
	  IOSTANDARD => "DEFAULT",
	  SLEW => "SLOW")
	port map (
	  O =>  LEMO_6_7_B_OUT(0),     
	  IO => LEMO7,   
	  I =>  LEMO_6_7_B_IN(0),
	  T =>  LEMO_6_7_DIRECTION(0) 
	);      	
		 

	A_TRIG0 (0) <=  A_TRG(0);
	A_TRIG1 (0) <=  A_TRG(1);
	A_TRIG2 (0) <=  A_TRG(2);
	A_TRIG3 (0) <=  A_TRG(3);
	A_TRIG4 (0) <=  A_TRG(4);
	A_TRIG5 (0) <=  A_TRG(5);
	A_TRIG6 (0) <=  A_TRG(6);
	A_TRIG7 (0) <=  A_TRG(7);
	A_TRIG8 (0) <=  A_TRG(8);
	A_TRIG9 (0) <=  A_TRG(9);
	A_TRIG10(0) <=  A_TRG(10);
	A_TRIG11(0) <=  A_TRG(11);
	A_TRIG12(0) <=  A_TRG(12);
	A_TRIG13(0) <=  A_TRG(13);
	A_TRIG14(0) <=  A_TRG(14);
	A_TRIG15(0) <=  A_TRG(15);
	A_TRIG16(0) <=  A_TRG(16);
	A_TRIG17(0) <=  A_TRG(17);
	A_TRIG18(0) <=  A_TRG(18);
	A_TRIG19(0) <=  A_TRG(19);
	A_TRIG20(0) <=  A_TRG(20);
	A_TRIG21(0) <=  A_TRG(21);
	A_TRIG22(0) <=  A_TRG(22);
	A_TRIG23(0) <=  A_TRG(23);
	A_TRIG24(0) <=  A_TRG(24);
	A_TRIG25(0) <=  A_TRG(25);
	A_TRIG26(0) <=  A_TRG(26);
	A_TRIG27(0) <=  A_TRG(27);
	A_TRIG28(0) <=  A_TRG(28);
	A_TRIG29(0) <=  A_TRG(29);
	A_TRIG30(0) <=  A_TRG(30);
	A_TRIG31(0) <=  A_TRG(31);	
	
	B_TRIG0 (0) <=  B_TRG(0);
	B_TRIG1 (0) <=  B_TRG(1);
	B_TRIG2 (0) <=  B_TRG(2);
	B_TRIG3 (0) <=  B_TRG(3);
	B_TRIG4 (0) <=  B_TRG(4);
	B_TRIG5 (0) <=  B_TRG(5);
	B_TRIG6 (0) <=  B_TRG(6);
	B_TRIG7 (0) <=  B_TRG(7);
	B_TRIG8 (0) <=  B_TRG(8);
	B_TRIG9 (0) <=  B_TRG(9);
	B_TRIG10(0) <=  B_TRG(10);
	B_TRIG11(0) <=  B_TRG(11);
	B_TRIG12(0) <=  B_TRG(12);
	B_TRIG13(0) <=  B_TRG(13);
	B_TRIG14(0) <=  B_TRG(14);
	B_TRIG15(0) <=  B_TRG(15);
	B_TRIG16(0) <=  B_TRG(16);
	B_TRIG17(0) <=  B_TRG(17);
	B_TRIG18(0) <=  B_TRG(18);
	B_TRIG19(0) <=  B_TRG(19);
	B_TRIG20(0) <=  B_TRG(20);
	B_TRIG21(0) <=  B_TRG(21);
	B_TRIG22(0) <=  B_TRG(22);
	B_TRIG23(0) <=  B_TRG(23);
	B_TRIG24(0) <=  B_TRG(24);
	B_TRIG25(0) <=  B_TRG(25);
	B_TRIG26(0) <=  B_TRG(26);
	B_TRIG27(0) <=  B_TRG(27);
	B_TRIG28(0) <=  B_TRG(28);
	B_TRIG29(0) <=  B_TRG(29);
	B_TRIG30(0) <=  B_TRG(30);
	B_TRIG31(0) <=  B_TRG(31);	

	C_TRIG0 (0) <=  C_TRG(0);
	C_TRIG1 (0) <=  C_TRG(1);
	C_TRIG2 (0) <=  C_TRG(2);
	C_TRIG3 (0) <=  C_TRG(3);
	C_TRIG4 (0) <=  C_TRG(4);
	C_TRIG5 (0) <=  C_TRG(5);
	C_TRIG6 (0) <=  C_TRG(6);
	C_TRIG7 (0) <=  C_TRG(7);
	C_TRIG8 (0) <=  C_TRG(8);
	C_TRIG9 (0) <=  C_TRG(9);
	C_TRIG10(0) <=  C_TRG(10);
	C_TRIG11(0) <=  C_TRG(11);
	C_TRIG12(0) <=  C_TRG(12);
	C_TRIG13(0) <=  C_TRG(13);
	C_TRIG14(0) <=  C_TRG(14);
	C_TRIG15(0) <=  C_TRG(15);
	C_TRIG16(0) <=  C_TRG(16);
	C_TRIG17(0) <=  C_TRG(17);
	C_TRIG18(0) <=  C_TRG(18);
	C_TRIG19(0) <=  C_TRG(19);
	C_TRIG20(0) <=  C_TRG(20);
	C_TRIG21(0) <=  C_TRG(21);
	C_TRIG22(0) <=  C_TRG(22);
	C_TRIG23(0) <=  C_TRG(23);
	C_TRIG24(0) <=  C_TRG(24);
	C_TRIG25(0) <=  C_TRG(25);
	C_TRIG26(0) <=  C_TRG(26);
	C_TRIG27(0) <=  C_TRG(27);
	C_TRIG28(0) <=  C_TRG(28);
	C_TRIG29(0) <=  C_TRG(29);
	C_TRIG30(0) <=  C_TRG(30);
	C_TRIG31(0) <=  C_TRG(31);	

	D_TRIG0 (0) <=  D_TRG(0);
	D_TRIG1 (0) <=  D_TRG(1);
	D_TRIG2 (0) <=  D_TRG(2);
	D_TRIG3 (0) <=  D_TRG(3);
	D_TRIG4 (0) <=  D_TRG(4);
	D_TRIG5 (0) <=  D_TRG(5);
	D_TRIG6 (0) <=  D_TRG(6);
	D_TRIG7 (0) <=  D_TRG(7);
	D_TRIG8 (0) <=  D_TRG(8);
	D_TRIG9 (0) <=  D_TRG(9);
	D_TRIG10(0) <=  D_TRG(10);
	D_TRIG11(0) <=  D_TRG(11);
	D_TRIG12(0) <=  D_TRG(12);
	D_TRIG13(0) <=  D_TRG(13);
	D_TRIG14(0) <=  D_TRG(14);
	D_TRIG15(0) <=  D_TRG(15);
	D_TRIG16(0) <=  D_TRG(16);
	D_TRIG17(0) <=  D_TRG(17);
	D_TRIG18(0) <=  D_TRG(18);
	D_TRIG19(0) <=  D_TRG(19);
	D_TRIG20(0) <=  D_TRG(20);
	D_TRIG21(0) <=  D_TRG(21);
	D_TRIG22(0) <=  D_TRG(22);
	D_TRIG23(0) <=  D_TRG(23);
	D_TRIG24(0) <=  D_TRG(24);
	D_TRIG25(0) <=  D_TRG(25);
	D_TRIG26(0) <=  D_TRG(26);
	D_TRIG27(0) <=  D_TRG(27);
	D_TRIG28(0) <=  D_TRG(28);
	D_TRIG29(0) <=  D_TRG(29);
	D_TRIG30(0) <=  D_TRG(30);
	D_TRIG31(0) <=  D_TRG(31);	

	A_OR_CHARGE(0)	<=  A_OR32;
	B_OR_CHARGE(0)	<=  B_OR32;
	C_OR_CHARGE(0)	<=  C_OR32;
	D_OR_CHARGE(0)	<=  D_OR32;
	
	A_OR_TIME(0) <= not A_NOR_TIME;
	B_OR_TIME(0) <= not B_NOR_TIME;
	C_OR_TIME(0) <= not C_NOR_TIME;
	D_OR_TIME(0) <= not D_NOR_TIME;

	A_TRIGs <= not A_TRG; 
	B_TRIGs <= not B_TRG; 
	C_TRIGs <= not C_TRG; 
	D_TRIGs <= not D_TRG; 
	

	
	U1 : i2cmaster
  Generic map(
	CLK_FREQ => 	160000,
	BAUD => 	100)
PORT MAP(
	scl => IIC_SCL,
	sda => IIC_SDA,
	INT_REG_CTRL_WR => INT_i2c_master_0_CTRL_WR,
	REG_CTRL_WR => REG_i2c_master_0_CTRL_WR,
	REG_MON_RD => REG_i2c_master_0_MON_RD,
	sys_clk => CLK_ACQ(0),
	sys_rst => '0' );
U3 : CitirocSlowControl
  Generic map(
	CfgDefault => 	"1110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110110111111111111111111111111111111111111111111011111100111111101111001111011100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000111111110100101100010010110011111111111111011",
	CfgMonitorDefault => 	"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	DoStartupSetup => 	"1")
PORT MAP(
	ASIC_CONFIGURATION => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	ASIC_MONITOR_CONFIGURATION => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	LOAD_CFG => "0",
	LOAD_MONITOR => "0",
	START_CFG => "0",
	START_MONITOR => "0",
	BUSY => open,
	Citiroc_CLK => A_SR_CK_s(0),
	Citiroc_MOSI => A_SR_IN_s(0),
	Citiroc_SLOAD => A_SRLOAD_s(0),
	Citiroc_RESETB => A_RESETB_SR_s(0),
	Citiroc_SELECT => A_SELECT_s(0),
	reset => '0',
	clk => GlobalClock(0),
	REG_CFG0 => REG_CitirocCfg0_REG_CFG0_WR,
	REG_CFG1 => REG_CitirocCfg0_REG_CFG1_WR,
	REG_CFG2 => REG_CitirocCfg0_REG_CFG2_WR,
	REG_CFG3 => REG_CitirocCfg0_REG_CFG3_WR,
	REG_CFG4 => REG_CitirocCfg0_REG_CFG4_WR,
	REG_CFG5 => REG_CitirocCfg0_REG_CFG5_WR,
	REG_CFG6 => REG_CitirocCfg0_REG_CFG6_WR,
	REG_CFG7 => REG_CitirocCfg0_REG_CFG7_WR,
	REG_CFG8 => REG_CitirocCfg0_REG_CFG8_WR,
	REG_CFG9 => REG_CitirocCfg0_REG_CFG9_WR,
	REG_CFG10 => REG_CitirocCfg0_REG_CFG10_WR,
	REG_CFG11 => REG_CitirocCfg0_REG_CFG11_WR,
	REG_CFG12 => REG_CitirocCfg0_REG_CFG12_WR,
	REG_CFG13 => REG_CitirocCfg0_REG_CFG13_WR,
	REG_CFG14 => REG_CitirocCfg0_REG_CFG14_WR,
	REG_CFG15 => REG_CitirocCfg0_REG_CFG15_WR,
	REG_CFG16 => REG_CitirocCfg0_REG_CFG16_WR,
	REG_CFG17 => REG_CitirocCfg0_REG_CFG17_WR,
	REG_CFG18 => REG_CitirocCfg0_REG_CFG18_WR,
	REG_CFG19 => REG_CitirocCfg0_REG_CFG19_WR,
	REG_CFG20 => REG_CitirocCfg0_REG_CFG20_WR,
	REG_CFG21 => REG_CitirocCfg0_REG_CFG21_WR,
	REG_CFG22 => REG_CitirocCfg0_REG_CFG22_WR,
	REG_CFG23 => REG_CitirocCfg0_REG_CFG23_WR,
	REG_CFG24 => REG_CitirocCfg0_REG_CFG24_WR,
	REG_CFG25 => REG_CitirocCfg0_REG_CFG25_WR,
	REG_CFG26 => REG_CitirocCfg0_REG_CFG26_WR,
	REG_CFG27 => REG_CitirocCfg0_REG_CFG27_WR,
	REG_CFG28 => REG_CitirocCfg0_REG_CFG28_WR,
	REG_CFG29 => REG_CitirocCfg0_REG_CFG29_WR,
	REG_CFG30 => REG_CitirocCfg0_REG_CFG30_WR,
	REG_CFG31 => REG_CitirocCfg0_REG_CFG31_WR,
	REG_CFG32 => REG_CitirocCfg0_REG_CFG32_WR,
	REG_CFG33 => REG_CitirocCfg0_REG_CFG33_WR,
	REG_CFG34 => REG_CitirocCfg0_REG_CFG34_WR,
	REG_CFG35 => REG_CitirocCfg0_REG_CFG35_WR,
	START_REG_CFG => REG_CitirocCfg0_START_REG_CFG_WR );
variable_A_FRAME_DATA <= U321_P_FRAME_DATA;
variable_A_FRAME_DV <= U321_P_FRAME_DV;
variable_B_FRAME_DATA <= U322_P_FRAME_DATA;
variable_B_FRAME_DV <= U322_P_FRAME_DV;
variable_C_FRAME_DATA <= U323_P_FRAME_DATA;
variable_C_FRAME_DV <= U323_P_FRAME_DV;
variable_D_FRAME_DATA <= U324_P_FRAME_DATA;
variable_D_FRAME_DV <= U324_P_FRAME_DV;
variable_A_TRIG_T <= U295_OR_TIME;
variable_A_TRIG_C <= U295_OR_CHARGE;
variable_B_TRIG_T <= U48_OR_TIME;
variable_B_TRIG_C <= U48_OR_CHARGE;
variable_C_TRIG_T <= U36_OR_TIME;
variable_C_TRIG_C <= U36_OR_CHARGE;
variable_D_TRIG_T <= U47_OR_TIME;
variable_D_TRIG_C <= U47_OR_CHARGE;
U20_EXT_TRIG <= variable_EXT_TRIG;
U21_GLOBAL_TRIG <= variable_GLOBAL_TRIG;
U22_A_FRAME_DATA <= variable_A_FRAME_DATA;
U23_B_FRAME_DATA <= variable_B_FRAME_DATA;
U24_C_FRAME_DATA <= variable_C_FRAME_DATA;
U25_D_FRAME_DATA <= variable_D_FRAME_DATA;
U26_A_FRAME_DV <= variable_A_FRAME_DV;
U27_B_FRAME_DV <= variable_B_FRAME_DV;
U28_C_FRAME_DV <= variable_C_FRAME_DV;
U29_D_FRAME_DV <= variable_D_FRAME_DV;
U30_G_TS0 <= variable_G_TS0;
U31_G_TS <= variable_G_TS;
U32_G_TS0 <= variable_G_TS0;
U33_G_TS <= variable_G_TS;
U34_G_TS0 <= variable_G_TS0;
U35_G_TS <= variable_G_TS;
U36_TRIG0 <= C_TRIG0;
U36_TRIG1 <= C_TRIG1;
U36_TRIG2 <= C_TRIG2;
U36_TRIG3 <= C_TRIG3;
U36_TRIG4 <= C_TRIG4;
U36_TRIG5 <= C_TRIG5;
U36_TRIG6 <= C_TRIG6;
U36_TRIG7 <= C_TRIG7;
U36_TRIG8 <= C_TRIG8;
U36_TRIG9 <= C_TRIG9;
U36_TRIG10 <= C_TRIG10;
U36_TRIG11 <= C_TRIG11;
U36_TRIG12 <= C_TRIG12;
U36_TRIG13 <= C_TRIG13;
U36_TRIG14 <= C_TRIG14;
U36_TRIG15 <= C_TRIG15;
U36_TRIG16 <= C_TRIG16;
U36_TRIG17 <= C_TRIG17;
U36_TRIG18 <= C_TRIG18;
U36_TRIG19 <= C_TRIG19;
U36_TRIG20 <= C_TRIG20;
U36_TRIG21 <= C_TRIG21;
U36_TRIG22 <= C_TRIG22;
U36_TRIG23 <= C_TRIG23;
U36_TRIG24 <= C_TRIG24;
U36_TRIG25 <= C_TRIG25;
U36_TRIG26 <= C_TRIG26;
U36_TRIG27 <= C_TRIG27;
U36_TRIG28 <= C_TRIG28;
U36_TRIG29 <= C_TRIG29;
U36_TRIG30 <= C_TRIG30;
U36_TRIG31 <= C_TRIG31;
U36_OR_TIME <= C_OR_TIME;
U36_OR_CHARGE <= C_OR_CHARGE;
TRIGGER_EXT_C_s <= U331_TRIG_EXT_OUT;

U37_G_TS0 <= variable_G_TS0;
U38_G_TS <= variable_G_TS;
variable_A_TS <= U321_TS_OUT;
variable_A_TS0 <= U321_TS0_OUT;
variable_B_TS <= U322_TS_OUT;
variable_B_TS0 <= U322_TS0_OUT;
variable_C_TS <= U323_TS_OUT;
variable_C_TS0 <= U323_TS0_OUT;
variable_D_TS <= U324_TS_OUT;
variable_D_TS0 <= U324_TS0_OUT;
U47_TRIG0 <= D_TRIG0;
U47_TRIG1 <= D_TRIG1;
U47_TRIG2 <= D_TRIG2;
U47_TRIG3 <= D_TRIG3;
U47_TRIG4 <= D_TRIG4;
U47_TRIG5 <= D_TRIG5;
U47_TRIG6 <= D_TRIG6;
U47_TRIG7 <= D_TRIG7;
U47_TRIG8 <= D_TRIG8;
U47_TRIG9 <= D_TRIG9;
U47_TRIG10 <= D_TRIG10;
U47_TRIG11 <= D_TRIG11;
U47_TRIG12 <= D_TRIG12;
U47_TRIG13 <= D_TRIG13;
U47_TRIG14 <= D_TRIG14;
U47_TRIG15 <= D_TRIG15;
U47_TRIG16 <= D_TRIG16;
U47_TRIG17 <= D_TRIG17;
U47_TRIG18 <= D_TRIG18;
U47_TRIG19 <= D_TRIG19;
U47_TRIG20 <= D_TRIG20;
U47_TRIG21 <= D_TRIG21;
U47_TRIG22 <= D_TRIG22;
U47_TRIG23 <= D_TRIG23;
U47_TRIG24 <= D_TRIG24;
U47_TRIG25 <= D_TRIG25;
U47_TRIG26 <= D_TRIG26;
U47_TRIG27 <= D_TRIG27;
U47_TRIG28 <= D_TRIG28;
U47_TRIG29 <= D_TRIG29;
U47_TRIG30 <= D_TRIG30;
U47_TRIG31 <= D_TRIG31;
U47_OR_TIME <= D_OR_TIME;
U47_OR_CHARGE <= D_OR_CHARGE;
TRIGGER_EXT_D_s <= U332_TRIG_EXT_OUT;

U48_TRIG0 <= B_TRIG0;
U48_TRIG1 <= B_TRIG1;
U48_TRIG2 <= B_TRIG2;
U48_TRIG3 <= B_TRIG3;
U48_TRIG4 <= B_TRIG4;
U48_TRIG5 <= B_TRIG5;
U48_TRIG6 <= B_TRIG6;
U48_TRIG7 <= B_TRIG7;
U48_TRIG8 <= B_TRIG8;
U48_TRIG9 <= B_TRIG9;
U48_TRIG10 <= B_TRIG10;
U48_TRIG11 <= B_TRIG11;
U48_TRIG12 <= B_TRIG12;
U48_TRIG13 <= B_TRIG13;
U48_TRIG14 <= B_TRIG14;
U48_TRIG15 <= B_TRIG15;
U48_TRIG16 <= B_TRIG16;
U48_TRIG17 <= B_TRIG17;
U48_TRIG18 <= B_TRIG18;
U48_TRIG19 <= B_TRIG19;
U48_TRIG20 <= B_TRIG20;
U48_TRIG21 <= B_TRIG21;
U48_TRIG22 <= B_TRIG22;
U48_TRIG23 <= B_TRIG23;
U48_TRIG24 <= B_TRIG24;
U48_TRIG25 <= B_TRIG25;
U48_TRIG26 <= B_TRIG26;
U48_TRIG27 <= B_TRIG27;
U48_TRIG28 <= B_TRIG28;
U48_TRIG29 <= B_TRIG29;
U48_TRIG30 <= B_TRIG30;
U48_TRIG31 <= B_TRIG31;
U48_OR_TIME <= B_OR_TIME;
U48_OR_CHARGE <= B_OR_CHARGE;
TRIGGER_EXT_B_s <= U330_TRIG_EXT_OUT;

U49_A_TS <= variable_A_TS;
U50_A_TS0 <= variable_A_TS0;
U51_B_TS <= variable_B_TS;
U52_B_TS0 <= variable_B_TS0;
U53_C_TS <= variable_C_TS;
U54_C_TS0 <= variable_C_TS0;
U55_D_TS <= variable_D_TS;
U56_D_TS0 <= variable_D_TS0;
U57_SELF_TRIG <= variable_SELF_TRIG;
U58_out_0 <= REG_TRIG_A_SEL_WR(2 downto 0);
U59_EXT_VETO <= variable_EXT_VETO;
U60_EXT_TRIG <= variable_EXT_TRIG;
U61_GLOBAL_TRIG <= variable_GLOBAL_TRIG;
U62_SELF_TRIG <= variable_SELF_TRIG;
U63_EXT_VETO <= variable_EXT_VETO;
U64_EXT_TRIG <= variable_EXT_TRIG;
U65_GLOBAL_TRIG <= variable_GLOBAL_TRIG;
U66_SELF_TRIG <= variable_SELF_TRIG;
U67_EXT_VETO <= variable_EXT_VETO;
U68_EXT_TRIG <= variable_EXT_TRIG;
U69_GLOBAL_TRIG <= variable_GLOBAL_TRIG;
U70_SELF_TRIG <= variable_SELF_TRIG;
U71_EXT_VETO <= variable_EXT_VETO;
U72_out_0 <= REG_TRIG_A_SEL_WR(2 downto 0);
U73_out_0 <= REG_TRIG_A_SEL_WR(2 downto 0);
U74_out_0 <= REG_TRIG_A_SEL_WR(2 downto 0);
U75_out_0 <= REG_VET_A_EN_WR(0 downto 0);
U76_out_0 <= REG_VET_B_EN_WR(0 downto 0);
U77_out_0 <= REG_VET_C_EN_WR(0 downto 0);
U78_out_0 <= REG_VET_D_EN_WR(0 downto 0);
U79_out_0 <= REG_SW_VET_A_WR(0 downto 0);
U80_out_0 <= REG_SW_VET_B_WR(0 downto 0);
U81_out_0 <= REG_SW_VET_C_WR(0 downto 0);
U82_out_0 <= REG_SW_VET_D_WR(0 downto 0);
U83_A_TRIG_T <= variable_A_TRIG_T;
U84_B_TRIG_T <= variable_B_TRIG_T;
U85_C_TRIG_T <= variable_C_TRIG_T;
U86_D_TRIG_T <= variable_D_TRIG_T;
U87_A_TRIG_C <= variable_A_TRIG_C;
U88_B_TRIG_C <= variable_B_TRIG_C;
U89_C_TRIG_C <= variable_C_TRIG_C;
U90_D_TRIG_C <= variable_D_TRIG_C;
U91_OUT <= U83_A_TRIG_T OR U84_B_TRIG_T OR U85_C_TRIG_T OR U86_D_TRIG_T;
U92_OUT <= U87_A_TRIG_C OR U88_B_TRIG_C OR U89_C_TRIG_C OR U90_D_TRIG_C;

U93 : block
begin
U93_out <= U91_OUT when U95_out_0 = "0" else U92_OUT when U95_out_0 = "1"  else (others=>'0');

end block;
variable_GLOBAL_TRIG <= U93_out;
U95_out_0 <= REG_TRIG_GBL_SEL_WR(0 downto 0);
LEMO_4_5_DIRECTION <= U97_const_bin;
U96_LEMO_4_5_A_OUT <= LEMO_4_5_A_OUT;
U96_LEMO_4_5_A_OUT <= LEMO_4_5_A_OUT;
U96_LEMO_4_5_B_OUT <= LEMO_4_5_B_OUT;

U98:SW_GATE_AND_DELAY
GENERIC MAP(
    maxDelay => 1024)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U96_LEMO_4_5_A_OUT,
    DELAY => U99_out_0,
    GATE => U100_CONST,
    PORT_OUT => U98_out
);
U99_out_0 <= conv_integer(REG_EXT_DELAY_WR);
U100_CONST <= 8;
variable_EXT_TRIG <= U98_out;
variable_EXT_VETO <= U104_OUT;
U104 : d_latch
  Generic map(
	IN_SIZE => 	1,
	EDGE => 	"rising")
PORT MAP(
	a => U96_LEMO_4_5_B_OUT,
	CE => '1',
	clk => GlobalClock(0),
	reset => '0',
	reset_val => "0",
	b => U104_OUT );
U105 : PULSE_GENERATOR
PORT MAP(
	PULSE_OUT => U105_PULSE,
	PULSE_PERIOD => U106_out_0,
	PULSE_WIDTH => U107_CONST,
	CE => "1",
	CLK => GlobalClock,
	RESET => "0" );
U106_out_0 <= REG_SW_TRIG_FREQ_WR(31 downto 0);
U107_CONST <= conv_std_logic_vector(8,32);
variable_SELF_TRIG <= U105_PULSE;
variable_A_M_LG <= U321_M_ENERGY_LG;
variable_A_M_HG <= U321_M_ENERGY_HG;
variable_A_M_CLK <= U321_M_CLK;
variable_A_M_SR <= U321_M_DIN;
variable_B_M_LG <= U322_M_ENERGY_LG;
variable_B_M_HG <= U322_M_ENERGY_HG;
variable_B_M_CLK <= U322_M_CLK;
variable_B_M_SR <= U322_M_DIN;
variable_C_M_LG <= U323_M_ENERGY_LG;
variable_C_M_HG <= U323_M_ENERGY_HG;
variable_C_M_CLK <= U323_M_CLK;
variable_C_M_SR <= U323_M_DIN;
variable_D_M_LG <= U324_M_ENERGY_LG;
variable_D_M_HG <= U324_M_ENERGY_HG;
variable_D_M_CLK <= U324_M_CLK;
variable_D_M_SR <= U324_M_DIN;
U125_A_M_LG <= variable_A_M_LG;
U126_A_M_HG <= variable_A_M_HG;
U127_A_M_CLK <= variable_A_M_CLK;
U128_A_M_SR <= variable_A_M_SR;
U129_B_M_LG <= variable_B_M_LG;
U130_B_M_HG <= variable_B_M_HG;
U131_B_M_CLK <= variable_B_M_CLK;
U132_B_M_SR <= variable_B_M_SR;
U133_C_M_LG <= variable_C_M_LG;
U134_C_M_HG <= variable_C_M_HG;
U135_C_M_CLK <= variable_C_M_CLK;
U136_C_M_SR <= variable_C_M_SR;
U137_D_M_LG <= variable_D_M_LG;
U138_D_M_HG <= variable_D_M_HG;
U139_D_M_CLK <= variable_D_M_CLK;
U140_D_M_SR <= variable_D_M_SR;
U142 : xlx_oscilloscope_sync
  Generic map(
	channels => 	2,
	memLength => 	1024,
	wordWidth => 	16)
PORT MAP(
	ANALOG => U130_B_M_HG & U129_B_M_LG,
	D0 => U158_B_TRIG_T & U131_B_M_CLK,
	D1 => U161_B_TRIG_C & U132_B_M_SR,
	D2 => U169_B_TRG & U151_LEMO_TRG_EXT,
	D3 => U318_B_HIT & U152_LEMO_VET_EXT,
	TRIG => U169_B_TRG,
	BUSY => open,
	CE => "1",
	CLK_WRITE => CLK_ACQ,
	RESET => "0",
	CLK_READ => BUS_CLK,
	READ_ADDRESS => BUS_Oscilloscope_1_READ_ADDRESS,
	READ_DATA => BUS_Oscilloscope_1_READ_DATA,
	READ_DATAVALID => BUS_Oscilloscope_1_VLD,
	READ_STATUS => REG_Oscilloscope_1_READ_STATUS_RD,
	READ_POSITION => REG_Oscilloscope_1_READ_POSITION_RD,
	CONFIG_TRIGGER_MODE => REG_Oscilloscope_1_CONFIG_TRIGGER_MODE_WR,
	CONFIG_TRIGGER_LEVEL => REG_Oscilloscope_1_CONFIG_TRIGGER_LEVEL_WR,
	CONFIG_PRETRIGGER => REG_Oscilloscope_1_CONFIG_PRETRIGGER_WR,
	CONFIG_DECIMATOR => REG_Oscilloscope_1_CONFIG_DECIMATOR_WR,
	CONFIG_ARM => REG_Oscilloscope_1_CONFIG_ARM_WR );
U144 : xlx_oscilloscope_sync
  Generic map(
	channels => 	2,
	memLength => 	1024,
	wordWidth => 	16)
PORT MAP(
	ANALOG => U134_C_M_HG & U133_C_M_LG,
	D0 => U172_C_TRIG_T & U135_C_M_CLK,
	D1 => U162_C_TRIG_C & U136_C_M_SR,
	D2 => U170_C_TRG & U153_LEMO_TRG_EXT,
	D3 => U319_C_HIT & U154_LEMO_VET_EXT,
	TRIG => U170_C_TRG,
	BUSY => open,
	CE => "1",
	CLK_WRITE => CLK_ACQ,
	RESET => "0",
	CLK_READ => BUS_CLK,
	READ_ADDRESS => BUS_Oscilloscope_2_READ_ADDRESS,
	READ_DATA => BUS_Oscilloscope_2_READ_DATA,
	READ_DATAVALID => BUS_Oscilloscope_2_VLD,
	READ_STATUS => REG_Oscilloscope_2_READ_STATUS_RD,
	READ_POSITION => REG_Oscilloscope_2_READ_POSITION_RD,
	CONFIG_TRIGGER_MODE => REG_Oscilloscope_2_CONFIG_TRIGGER_MODE_WR,
	CONFIG_TRIGGER_LEVEL => REG_Oscilloscope_2_CONFIG_TRIGGER_LEVEL_WR,
	CONFIG_PRETRIGGER => REG_Oscilloscope_2_CONFIG_PRETRIGGER_WR,
	CONFIG_DECIMATOR => REG_Oscilloscope_2_CONFIG_DECIMATOR_WR,
	CONFIG_ARM => REG_Oscilloscope_2_CONFIG_ARM_WR );
U146 : xlx_oscilloscope_sync
  Generic map(
	channels => 	2,
	memLength => 	1024,
	wordWidth => 	16)
PORT MAP(
	ANALOG => U138_D_M_HG & U137_D_M_LG,
	D0 => U159_D_TRIG_T & U139_D_M_CLK,
	D1 => U163_D_TRIG_C & U140_D_M_SR,
	D2 => U171_D_TRG & U155_LEMO_TRG_EXT,
	D3 => U320_D_HIT & U156_LEMO_VET_EXT,
	TRIG => U171_D_TRG,
	BUSY => open,
	CE => "1",
	CLK_WRITE => CLK_ACQ,
	RESET => "0",
	CLK_READ => BUS_CLK,
	READ_ADDRESS => BUS_Oscilloscope_3_READ_ADDRESS,
	READ_DATA => BUS_Oscilloscope_3_READ_DATA,
	READ_DATAVALID => BUS_Oscilloscope_3_VLD,
	READ_STATUS => REG_Oscilloscope_3_READ_STATUS_RD,
	READ_POSITION => REG_Oscilloscope_3_READ_POSITION_RD,
	CONFIG_TRIGGER_MODE => REG_Oscilloscope_3_CONFIG_TRIGGER_MODE_WR,
	CONFIG_TRIGGER_LEVEL => REG_Oscilloscope_3_CONFIG_TRIGGER_LEVEL_WR,
	CONFIG_PRETRIGGER => REG_Oscilloscope_3_CONFIG_PRETRIGGER_WR,
	CONFIG_DECIMATOR => REG_Oscilloscope_3_CONFIG_DECIMATOR_WR,
	CONFIG_ARM => REG_Oscilloscope_3_CONFIG_ARM_WR );
variable_LEMO_TRG_EXT <= U96_LEMO_4_5_A_OUT;
variable_LEMO_VET_EXT <= U104_OUT;
U149_LEMO_TRG_EXT <= variable_LEMO_TRG_EXT;
U150_LEMO_VET_EXT <= variable_LEMO_VET_EXT;
U151_LEMO_TRG_EXT <= variable_LEMO_TRG_EXT;
U152_LEMO_VET_EXT <= variable_LEMO_VET_EXT;
U153_LEMO_TRG_EXT <= variable_LEMO_TRG_EXT;
U154_LEMO_VET_EXT <= variable_LEMO_VET_EXT;
U155_LEMO_TRG_EXT <= variable_LEMO_TRG_EXT;
U156_LEMO_VET_EXT <= variable_LEMO_VET_EXT;
U157_A_TRIG_T <= variable_A_TRIG_T;
U158_B_TRIG_T <= variable_B_TRIG_T;
U159_D_TRIG_T <= variable_D_TRIG_T;
U160_A_TRIG_C <= variable_A_TRIG_C;
U161_B_TRIG_C <= variable_B_TRIG_C;
U162_C_TRIG_C <= variable_C_TRIG_C;
U163_D_TRIG_C <= variable_D_TRIG_C;
variable_A_TRG <= U329_TRIG_OUT;
variable_B_TRG <= U330_TRIG_OUT;
variable_C_TRG <= U331_TRIG_OUT;
variable_D_TRG <= U332_TRIG_OUT;
U168_A_TRG <= variable_A_TRG;
U169_B_TRG <= variable_B_TRG;
U170_C_TRG <= variable_C_TRG;
U171_D_TRG <= variable_D_TRG;
U172_C_TRIG_T <= variable_C_TRIG_T;
U173 : FREQ_METER
    Generic map(bitSize => 32 )
    port map( 
        RESET => GlobalReset, 
        CLK => async_clk,
        SIGIN => U177_A_TRG,
        ENABLE => "1",
        FREQ => U173_freq,
        INTTIME => U181_CONST
    );
U174 : FREQ_METER
    Generic map(bitSize => 32 )
    port map( 
        RESET => GlobalReset, 
        CLK => async_clk,
        SIGIN => U178_B_TRG,
        ENABLE => "1",
        FREQ => U174_freq,
        INTTIME => U182_CONST
    );
U175 : FREQ_METER
    Generic map(bitSize => 32 )
    port map( 
        RESET => GlobalReset, 
        CLK => async_clk,
        SIGIN => U179_C_TRG,
        ENABLE => "1",
        FREQ => U175_freq,
        INTTIME => U183_CONST
    );
U176 : FREQ_METER
    Generic map(bitSize => 32 )
    port map( 
        RESET => GlobalReset, 
        CLK => async_clk,
        SIGIN => U180_D_TRG,
        ENABLE => "1",
        FREQ => U176_freq,
        INTTIME => U184_CONST
    );
U177_A_TRG <= variable_A_TRG;
U178_B_TRG <= variable_B_TRG;
U179_C_TRG <= variable_C_TRG;
U180_D_TRG <= variable_D_TRG;
U181_CONST <= 160000000;
U182_CONST <= 160000000;
U183_CONST <= 160000000;
U184_CONST <= 160000000;
PROCESS_REG_U185 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U185_hold <= EXT(U173_freq,32);
    end if;
end process;
REG_A_RATE_RD <= EXT(U173_freq,32);
PROCESS_REG_U186 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U186_hold <= EXT(U174_freq,32);
    end if;
end process;
REG_B_RATE_RD <= EXT(U174_freq,32);
PROCESS_REG_U187 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U187_hold <= EXT(U175_freq,32);
    end if;
end process;
REG_C_RATE_RD <= EXT(U175_freq,32);
PROCESS_REG_U188 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U188_hold <= EXT(U176_freq,32);
    end if;
end process;
REG_D_RATE_RD <= EXT(U176_freq,32);

U189:SW_GATE_AND_DELAY
GENERIC MAP(
    maxDelay => 1024)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U307_out,
    DELAY => 1,
    GATE => U190_CONST,
    PORT_OUT => U189_out
);
U190_CONST <= 16;
U191_GLOBAL_TRIG <= variable_GLOBAL_TRIG;
LEMO_2_3_A_IN <= U191_GLOBAL_TRIG;
LEMO_2_3_B_IN <= U189_out;
U193 : TimestampGenerator
  Generic map(
	nbits => 	32)
PORT MAP(
	TIMESTAMP => U193_TIMESTAMP,
	T0 => U307_out(0),
	CLK_READ => GlobalClock(0),
	ClkCounter => GlobalClock(0) );
U194 : TimestampGenerator
  Generic map(
	nbits => 	64)
PORT MAP(
	TIMESTAMP => U194_TIMESTAMP,
	T0 => U215_OUT(0),
	CLK_READ => GlobalClock(0),
	ClkCounter => GlobalClock(0) );
variable_G_TS <= U194_TIMESTAMP;
variable_G_TS0 <= U193_TIMESTAMP;
LEMO_6_7_DIRECTION <= U198_const_bin;
U197_LEMO_6_7_A_OUT <= LEMO_6_7_A_OUT;
U197_LEMO_6_7_B_OUT <= LEMO_6_7_B_OUT;
U197_LEMO_6_7_B_OUT <= LEMO_6_7_B_OUT;
U197_LEMO_6_7_B_OUT <= LEMO_6_7_B_OUT;
U199 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U216_RUN_START, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U197_LEMO_6_7_B_OUT,
        ENABLE => "1",
        COUNTER => U199_counts,
        OVERFLOW => open
    );
PROCESS_REG_U200 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U200_hold <= EXT(U199_counts,32);
    end if;
end process;
REG_T0_COUNT_RD <= EXT(U199_counts,32);
U201 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U217_RUN_START, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U205_A_TRG,
        ENABLE => "1",
        COUNTER => U201_counts,
        OVERFLOW => open
    );
U202 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U218_RUN_START, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U206_B_TRG,
        ENABLE => "1",
        COUNTER => U202_counts,
        OVERFLOW => open
    );
U203 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U219_RUN_START, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U207_C_TRG,
        ENABLE => "1",
        COUNTER => U203_counts,
        OVERFLOW => open
    );
U204 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U220_RUN_START, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U208_D_TRG,
        ENABLE => "1",
        COUNTER => U204_counts,
        OVERFLOW => open
    );
U205_A_TRG <= variable_A_TRG;
U206_B_TRG <= variable_B_TRG;
U207_C_TRG <= variable_C_TRG;
U208_D_TRG <= variable_D_TRG;
PROCESS_REG_U209 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U209_hold <= EXT(U201_counts,32);
    end if;
end process;
REG_A_TRG_RD <= EXT(U201_counts,32);
PROCESS_REG_U210 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U210_hold <= EXT(U202_counts,32);
    end if;
end process;
REG_B_TRG_RD <= EXT(U202_counts,32);
PROCESS_REG_U211 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U211_hold <= EXT(U203_counts,32);
    end if;
end process;
REG_C_TRG_RD <= EXT(U203_counts,32);
PROCESS_REG_U212 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U212_hold <= EXT(U204_counts,32);
    end if;
end process;
REG_D_TRG_RD <= EXT(U204_counts,32);
U213_int <= INT_RUNSTART_WR;
U213_out_0 <= REG_RUNSTART_WR(0 downto 0);
U214_RUN_START <= variable_RUN_START;
U215_OUT <= U214_RUN_START OR U197_LEMO_6_7_A_OUT;
U216_RUN_START <= variable_RUN_START;
U217_RUN_START <= variable_RUN_START;
U218_RUN_START <= variable_RUN_START;
U219_RUN_START <= variable_RUN_START;
U220_RUN_START <= variable_RUN_START;

U221:SW_GATE_AND_DELAY
GENERIC MAP(
    maxDelay => 1024)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U213_int,
    DELAY => 1,
    GATE => U222_CONST,
    PORT_OUT => U221_out
);
U222_CONST <= 16;
variable_RUN_START <= U221_out;
variable_FIFO_RESET <= U213_out_0;
LEMO_0_1_A_IN <= U226_FIFO_RESET;
LEMO_0_1_B_IN <= U229_DEAD_SIG;
U226_FIFO_RESET <= variable_FIFO_RESET;
U227_OUT <= U305_FULL OR U305_BUSY;
variable_DEAD_SIG <= U227_OUT;
U229_DEAD_SIG <= variable_DEAD_SIG;

U230:SUBPAGE_Timer64
PORT MAP(
	Enable => U231_const_bin,
	Reset => U232_FIFO_RESET,
	TIME_LSB => U230_TIME_LSB,
	TIME_MSB => U230_TIME_MSB,
    GlobalReset => GlobalReset,
    CLK_ACQ=>CLK_ACQ ,
    BUS_CLK=>BUS_CLK ,
    CLK_40=>CLK_40 ,
    CLK_80=>CLK_80 ,
    clk_160=>clk_160 ,
    clk_320=>clk_320 ,
    FAST_CLK_100=>FAST_CLK_100 ,
    FAST_CLK_200=>FAST_CLK_200 ,
    FAST_CLK_250=>FAST_CLK_250 ,
    FAST_CLK_250_90=>FAST_CLK_250_90 ,
    FAST_CLK_500=>FAST_CLK_500 ,
    FAST_CLK_500_90=>FAST_CLK_500_90 ,
    GlobalClock=>GlobalClock ,
    async_clk => async_clk 
);
U232_FIFO_RESET <= variable_FIFO_RESET;

U233:SUBPAGE_Timer64
PORT MAP(
	Enable => U235_DEAD_SIG,
	Reset => U234_FIFO_RESET,
	TIME_LSB => U233_TIME_LSB,
	TIME_MSB => U233_TIME_MSB,
    GlobalReset => GlobalReset,
    CLK_ACQ=>CLK_ACQ ,
    BUS_CLK=>BUS_CLK ,
    CLK_40=>CLK_40 ,
    CLK_80=>CLK_80 ,
    clk_160=>clk_160 ,
    clk_320=>clk_320 ,
    FAST_CLK_100=>FAST_CLK_100 ,
    FAST_CLK_200=>FAST_CLK_200 ,
    FAST_CLK_250=>FAST_CLK_250 ,
    FAST_CLK_250_90=>FAST_CLK_250_90 ,
    FAST_CLK_500=>FAST_CLK_500 ,
    FAST_CLK_500_90=>FAST_CLK_500_90 ,
    GlobalClock=>GlobalClock ,
    async_clk => async_clk 
);
U234_FIFO_RESET <= variable_FIFO_RESET;
U235_DEAD_SIG <= variable_DEAD_SIG;
U236 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U244_RUN_START, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U249_OUT,
        ENABLE => "1",
        COUNTER => U236_counts,
        OVERFLOW => open
    );
U237 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U245_RUN_START, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U250_OUT,
        ENABLE => "1",
        COUNTER => U237_counts,
        OVERFLOW => open
    );
U238 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U246_RUN_START, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U251_OUT,
        ENABLE => "1",
        COUNTER => U238_counts,
        OVERFLOW => open
    );
U239 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U247_RUN_START, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U252_OUT,
        ENABLE => "1",
        COUNTER => U239_counts,
        OVERFLOW => open
    );
U240_A_TRG <= variable_A_TRG;
U241_B_TRG <= variable_B_TRG;
U242_C_TRG <= variable_C_TRG;
U243_D_TRG <= variable_D_TRG;
U244_RUN_START <= variable_RUN_START;
U245_RUN_START <= variable_RUN_START;
U246_RUN_START <= variable_RUN_START;
U247_RUN_START <= variable_RUN_START;
U248_DEAD_SIG <= variable_DEAD_SIG;
U249_OUT <= "0" AND U240_A_TRG;
U250_OUT <= "0" AND U241_B_TRG;
U251_OUT <= "0" AND U242_C_TRG;
U252_OUT <= "0" AND U243_D_TRG;
PROCESS_REG_U253 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U253_hold <= EXT(U230_TIME_LSB,32);
    end if;
end process;
REG_RUN_TIME_LSB_RD <= EXT(U230_TIME_LSB,32);
PROCESS_REG_U254 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U254_hold <= EXT(U230_TIME_MSB,32);
    end if;
end process;
REG_RUN_TIME_MSB_RD <= EXT(U230_TIME_MSB,32);
PROCESS_REG_U255 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U255_hold <= EXT(U233_TIME_LSB,32);
    end if;
end process;
REG_DEAD_TIME_LSB_RD <= EXT(U233_TIME_LSB,32);
PROCESS_REG_U256 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U256_hold <= EXT(U233_TIME_MSB,32);
    end if;
end process;
REG_DEAD_TIME_MSB_RD <= EXT(U233_TIME_MSB,32);
PROCESS_REG_U257 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U257_hold <= EXT(U236_counts,32);
    end if;
end process;
REG_A_LOST_RD <= EXT(U236_counts,32);
PROCESS_REG_U258 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U258_hold <= EXT(U237_counts,32);
    end if;
end process;
REG_B_LOST_RD <= EXT(U237_counts,32);
PROCESS_REG_U259 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U259_hold <= EXT(U238_counts,32);
    end if;
end process;
REG_C_LOST_RD <= EXT(U238_counts,32);
PROCESS_REG_U260 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U260_hold <= EXT(U239_counts,32);
    end if;
end process;
REG_D_LOST_RD <= EXT(U239_counts,32);
U261_FIFO_RESET <= variable_FIFO_RESET;
variable_A_ABUSY <= U321_BUSY;
variable_B_ABUSY <= U322_BUSY;
variable_C_ABUSY <= U323_BUSY;
variable_D_ABUSY <= U324_BUSY;
U266_A_ABUSY <= variable_A_ABUSY;
U267_B_ABUSY <= variable_B_ABUSY;
U268_C_ABUSY <= variable_C_ABUSY;
U269_D_ABUSY <= variable_D_ABUSY;
variable_A_DEAD <= U274_OUT;
variable_B_DEAD <= U278_OUT;
variable_C_DEAD <= U279_OUT;
variable_D_DEAD <= U280_OUT;
U274_OUT <= U266_A_ABUSY OR U248_DEAD_SIG;
U275_DEAD_SIG <= variable_DEAD_SIG;
U276_DEAD_SIG <= variable_DEAD_SIG;
U277_DEAD_SIG <= variable_DEAD_SIG;
U278_OUT <= U267_B_ABUSY OR U275_DEAD_SIG;
U279_OUT <= U268_C_ABUSY OR U276_DEAD_SIG;
U280_OUT <= U269_D_ABUSY OR U277_DEAD_SIG;
U282 : MCRateMeter
  Generic map(
	CHANNEL_COUNT => 	32,
	CLK_FREQ => 	160000000)
PORT MAP(
	trigger => U295_TRIG31 & U295_TRIG30 & U295_TRIG29 & U295_TRIG28 & U295_TRIG27 & U295_TRIG26 & U295_TRIG25 & U295_TRIG24 & U295_TRIG23 & U295_TRIG22 & U295_TRIG21 & U295_TRIG20 & U295_TRIG19 & U295_TRIG18 & U295_TRIG17 & U295_TRIG16 & U295_TRIG15 & U295_TRIG14 & U295_TRIG13 & U295_TRIG12 & U295_TRIG11 & U295_TRIG10 & U295_TRIG9 & U295_TRIG8 & U295_TRIG7 & U295_TRIG6 & U295_TRIG5 & U295_TRIG4 & U295_TRIG3 & U295_TRIG2 & U295_TRIG1 & U295_TRIG0,
	VETO => '0',
	CLK => CLK_ACQ(0),
	CLK_READ => BUS_CLK,
	READ_ADDRESS => BUS_RateMeter_0_READ_ADDRESS,
	READ_DATA => BUS_RateMeter_0_READ_DATA,
	READ_DATAVALID => BUS_RateMeter_0_VLD );
U284 : MCRateMeter
  Generic map(
	CHANNEL_COUNT => 	32,
	CLK_FREQ => 	160000000)
PORT MAP(
	trigger => U48_TRIG31 & U48_TRIG30 & U48_TRIG29 & U48_TRIG28 & U48_TRIG27 & U48_TRIG26 & U48_TRIG25 & U48_TRIG24 & U48_TRIG23 & U48_TRIG22 & U48_TRIG21 & U48_TRIG20 & U48_TRIG19 & U48_TRIG18 & U48_TRIG17 & U48_TRIG16 & U48_TRIG15 & U48_TRIG14 & U48_TRIG13 & U48_TRIG12 & U48_TRIG11 & U48_TRIG10 & U48_TRIG9 & U48_TRIG8 & U48_TRIG7 & U48_TRIG6 & U48_TRIG5 & U48_TRIG4 & U48_TRIG3 & U48_TRIG2 & U48_TRIG1 & U48_TRIG0,
	VETO => '0',
	CLK => CLK_ACQ(0),
	CLK_READ => BUS_CLK,
	READ_ADDRESS => BUS_RateMeter_1_READ_ADDRESS,
	READ_DATA => BUS_RateMeter_1_READ_DATA,
	READ_DATAVALID => BUS_RateMeter_1_VLD );
U286 : MCRateMeter
  Generic map(
	CHANNEL_COUNT => 	32,
	CLK_FREQ => 	160000000)
PORT MAP(
	trigger => U36_TRIG31 & U36_TRIG30 & U36_TRIG29 & U36_TRIG28 & U36_TRIG27 & U36_TRIG26 & U36_TRIG25 & U36_TRIG24 & U36_TRIG23 & U36_TRIG22 & U36_TRIG21 & U36_TRIG20 & U36_TRIG19 & U36_TRIG18 & U36_TRIG17 & U36_TRIG16 & U36_TRIG15 & U36_TRIG14 & U36_TRIG13 & U36_TRIG12 & U36_TRIG11 & U36_TRIG10 & U36_TRIG9 & U36_TRIG8 & U36_TRIG7 & U36_TRIG6 & U36_TRIG5 & U36_TRIG4 & U36_TRIG3 & U36_TRIG2 & U36_TRIG1 & U36_TRIG0,
	VETO => '0',
	CLK => CLK_ACQ(0),
	CLK_READ => BUS_CLK,
	READ_ADDRESS => BUS_RateMeter_2_READ_ADDRESS,
	READ_DATA => BUS_RateMeter_2_READ_DATA,
	READ_DATAVALID => BUS_RateMeter_2_VLD );
U288 : MCRateMeter
  Generic map(
	CHANNEL_COUNT => 	32,
	CLK_FREQ => 	160000000)
PORT MAP(
	trigger => U47_TRIG31 & U47_TRIG30 & U47_TRIG29 & U47_TRIG28 & U47_TRIG27 & U47_TRIG26 & U47_TRIG25 & U47_TRIG24 & U47_TRIG23 & U47_TRIG22 & U47_TRIG21 & U47_TRIG20 & U47_TRIG19 & U47_TRIG18 & U47_TRIG17 & U47_TRIG16 & U47_TRIG15 & U47_TRIG14 & U47_TRIG13 & U47_TRIG12 & U47_TRIG11 & U47_TRIG10 & U47_TRIG9 & U47_TRIG8 & U47_TRIG7 & U47_TRIG6 & U47_TRIG5 & U47_TRIG4 & U47_TRIG3 & U47_TRIG2 & U47_TRIG1 & U47_TRIG0,
	VETO => '0',
	CLK => CLK_ACQ(0),
	CLK_READ => BUS_CLK,
	READ_ADDRESS => BUS_RateMeter_3_READ_ADDRESS,
	READ_DATA => BUS_RateMeter_3_READ_DATA,
	READ_DATAVALID => BUS_RateMeter_3_VLD );
U290 : CitirocSlowControl
  Generic map(
	CfgDefault => 	"1110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110110111111111111111111111111111111111111111111011111100111111101111001111011100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000111111110100101100010010110011111111111111011",
	CfgMonitorDefault => 	"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	DoStartupSetup => 	"1")
PORT MAP(
	ASIC_CONFIGURATION => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	ASIC_MONITOR_CONFIGURATION => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	LOAD_CFG => "0",
	LOAD_MONITOR => "0",
	START_CFG => "0",
	START_MONITOR => "0",
	BUSY => open,
	Citiroc_CLK => B_SR_CK_s(0),
	Citiroc_MOSI => B_SR_IN_s(0),
	Citiroc_SLOAD => B_SRLOAD_s(0),
	Citiroc_RESETB => B_RESETB_SR_s(0),
	Citiroc_SELECT => B_SELECT_s(0),
	reset => '0',
	clk => GlobalClock(0),
	REG_CFG0 => REG_CitirocCfg1_REG_CFG0_WR,
	REG_CFG1 => REG_CitirocCfg1_REG_CFG1_WR,
	REG_CFG2 => REG_CitirocCfg1_REG_CFG2_WR,
	REG_CFG3 => REG_CitirocCfg1_REG_CFG3_WR,
	REG_CFG4 => REG_CitirocCfg1_REG_CFG4_WR,
	REG_CFG5 => REG_CitirocCfg1_REG_CFG5_WR,
	REG_CFG6 => REG_CitirocCfg1_REG_CFG6_WR,
	REG_CFG7 => REG_CitirocCfg1_REG_CFG7_WR,
	REG_CFG8 => REG_CitirocCfg1_REG_CFG8_WR,
	REG_CFG9 => REG_CitirocCfg1_REG_CFG9_WR,
	REG_CFG10 => REG_CitirocCfg1_REG_CFG10_WR,
	REG_CFG11 => REG_CitirocCfg1_REG_CFG11_WR,
	REG_CFG12 => REG_CitirocCfg1_REG_CFG12_WR,
	REG_CFG13 => REG_CitirocCfg1_REG_CFG13_WR,
	REG_CFG14 => REG_CitirocCfg1_REG_CFG14_WR,
	REG_CFG15 => REG_CitirocCfg1_REG_CFG15_WR,
	REG_CFG16 => REG_CitirocCfg1_REG_CFG16_WR,
	REG_CFG17 => REG_CitirocCfg1_REG_CFG17_WR,
	REG_CFG18 => REG_CitirocCfg1_REG_CFG18_WR,
	REG_CFG19 => REG_CitirocCfg1_REG_CFG19_WR,
	REG_CFG20 => REG_CitirocCfg1_REG_CFG20_WR,
	REG_CFG21 => REG_CitirocCfg1_REG_CFG21_WR,
	REG_CFG22 => REG_CitirocCfg1_REG_CFG22_WR,
	REG_CFG23 => REG_CitirocCfg1_REG_CFG23_WR,
	REG_CFG24 => REG_CitirocCfg1_REG_CFG24_WR,
	REG_CFG25 => REG_CitirocCfg1_REG_CFG25_WR,
	REG_CFG26 => REG_CitirocCfg1_REG_CFG26_WR,
	REG_CFG27 => REG_CitirocCfg1_REG_CFG27_WR,
	REG_CFG28 => REG_CitirocCfg1_REG_CFG28_WR,
	REG_CFG29 => REG_CitirocCfg1_REG_CFG29_WR,
	REG_CFG30 => REG_CitirocCfg1_REG_CFG30_WR,
	REG_CFG31 => REG_CitirocCfg1_REG_CFG31_WR,
	REG_CFG32 => REG_CitirocCfg1_REG_CFG32_WR,
	REG_CFG33 => REG_CitirocCfg1_REG_CFG33_WR,
	REG_CFG34 => REG_CitirocCfg1_REG_CFG34_WR,
	REG_CFG35 => REG_CitirocCfg1_REG_CFG35_WR,
	START_REG_CFG => REG_CitirocCfg1_START_REG_CFG_WR );
U292 : CitirocSlowControl
  Generic map(
	CfgDefault => 	"1110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110110111111111111111111111111111111111111111111011111100111111101111001111011100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000111111110100101100010010110011111111111111011",
	CfgMonitorDefault => 	"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	DoStartupSetup => 	"1")
PORT MAP(
	ASIC_CONFIGURATION => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	ASIC_MONITOR_CONFIGURATION => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	LOAD_CFG => "0",
	LOAD_MONITOR => "0",
	START_CFG => "0",
	START_MONITOR => "0",
	BUSY => open,
	Citiroc_CLK => C_SR_CK_s(0),
	Citiroc_MOSI => C_SR_IN_s(0),
	Citiroc_SLOAD => C_SRLOAD_s(0),
	Citiroc_RESETB => C_RESETB_SR_s(0),
	Citiroc_SELECT => C_SELECT_s(0),
	reset => '0',
	clk => GlobalClock(0),
	REG_CFG0 => REG_CitirocCfg2_REG_CFG0_WR,
	REG_CFG1 => REG_CitirocCfg2_REG_CFG1_WR,
	REG_CFG2 => REG_CitirocCfg2_REG_CFG2_WR,
	REG_CFG3 => REG_CitirocCfg2_REG_CFG3_WR,
	REG_CFG4 => REG_CitirocCfg2_REG_CFG4_WR,
	REG_CFG5 => REG_CitirocCfg2_REG_CFG5_WR,
	REG_CFG6 => REG_CitirocCfg2_REG_CFG6_WR,
	REG_CFG7 => REG_CitirocCfg2_REG_CFG7_WR,
	REG_CFG8 => REG_CitirocCfg2_REG_CFG8_WR,
	REG_CFG9 => REG_CitirocCfg2_REG_CFG9_WR,
	REG_CFG10 => REG_CitirocCfg2_REG_CFG10_WR,
	REG_CFG11 => REG_CitirocCfg2_REG_CFG11_WR,
	REG_CFG12 => REG_CitirocCfg2_REG_CFG12_WR,
	REG_CFG13 => REG_CitirocCfg2_REG_CFG13_WR,
	REG_CFG14 => REG_CitirocCfg2_REG_CFG14_WR,
	REG_CFG15 => REG_CitirocCfg2_REG_CFG15_WR,
	REG_CFG16 => REG_CitirocCfg2_REG_CFG16_WR,
	REG_CFG17 => REG_CitirocCfg2_REG_CFG17_WR,
	REG_CFG18 => REG_CitirocCfg2_REG_CFG18_WR,
	REG_CFG19 => REG_CitirocCfg2_REG_CFG19_WR,
	REG_CFG20 => REG_CitirocCfg2_REG_CFG20_WR,
	REG_CFG21 => REG_CitirocCfg2_REG_CFG21_WR,
	REG_CFG22 => REG_CitirocCfg2_REG_CFG22_WR,
	REG_CFG23 => REG_CitirocCfg2_REG_CFG23_WR,
	REG_CFG24 => REG_CitirocCfg2_REG_CFG24_WR,
	REG_CFG25 => REG_CitirocCfg2_REG_CFG25_WR,
	REG_CFG26 => REG_CitirocCfg2_REG_CFG26_WR,
	REG_CFG27 => REG_CitirocCfg2_REG_CFG27_WR,
	REG_CFG28 => REG_CitirocCfg2_REG_CFG28_WR,
	REG_CFG29 => REG_CitirocCfg2_REG_CFG29_WR,
	REG_CFG30 => REG_CitirocCfg2_REG_CFG30_WR,
	REG_CFG31 => REG_CitirocCfg2_REG_CFG31_WR,
	REG_CFG32 => REG_CitirocCfg2_REG_CFG32_WR,
	REG_CFG33 => REG_CitirocCfg2_REG_CFG33_WR,
	REG_CFG34 => REG_CitirocCfg2_REG_CFG34_WR,
	REG_CFG35 => REG_CitirocCfg2_REG_CFG35_WR,
	START_REG_CFG => REG_CitirocCfg2_START_REG_CFG_WR );
U294 : CitirocSlowControl
  Generic map(
	CfgDefault => 	"1110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110110111111111111111111111111111111111111111111011111100111111101111001111011100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000000100000000000111111110100101100010010110011111111111111011",
	CfgMonitorDefault => 	"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	DoStartupSetup => 	"1")
PORT MAP(
	ASIC_CONFIGURATION => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	ASIC_MONITOR_CONFIGURATION => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	LOAD_CFG => "0",
	LOAD_MONITOR => "0",
	START_CFG => "0",
	START_MONITOR => "0",
	BUSY => open,
	Citiroc_CLK => D_SR_CK_s(0),
	Citiroc_MOSI => D_SR_IN_s(0),
	Citiroc_SLOAD => D_SRLOAD_s(0),
	Citiroc_RESETB => D_RESETB_SR_s(0),
	Citiroc_SELECT => D_SELECT_s(0),
	reset => '0',
	clk => GlobalClock(0),
	REG_CFG0 => REG_CitirocCfg3_REG_CFG0_WR,
	REG_CFG1 => REG_CitirocCfg3_REG_CFG1_WR,
	REG_CFG2 => REG_CitirocCfg3_REG_CFG2_WR,
	REG_CFG3 => REG_CitirocCfg3_REG_CFG3_WR,
	REG_CFG4 => REG_CitirocCfg3_REG_CFG4_WR,
	REG_CFG5 => REG_CitirocCfg3_REG_CFG5_WR,
	REG_CFG6 => REG_CitirocCfg3_REG_CFG6_WR,
	REG_CFG7 => REG_CitirocCfg3_REG_CFG7_WR,
	REG_CFG8 => REG_CitirocCfg3_REG_CFG8_WR,
	REG_CFG9 => REG_CitirocCfg3_REG_CFG9_WR,
	REG_CFG10 => REG_CitirocCfg3_REG_CFG10_WR,
	REG_CFG11 => REG_CitirocCfg3_REG_CFG11_WR,
	REG_CFG12 => REG_CitirocCfg3_REG_CFG12_WR,
	REG_CFG13 => REG_CitirocCfg3_REG_CFG13_WR,
	REG_CFG14 => REG_CitirocCfg3_REG_CFG14_WR,
	REG_CFG15 => REG_CitirocCfg3_REG_CFG15_WR,
	REG_CFG16 => REG_CitirocCfg3_REG_CFG16_WR,
	REG_CFG17 => REG_CitirocCfg3_REG_CFG17_WR,
	REG_CFG18 => REG_CitirocCfg3_REG_CFG18_WR,
	REG_CFG19 => REG_CitirocCfg3_REG_CFG19_WR,
	REG_CFG20 => REG_CitirocCfg3_REG_CFG20_WR,
	REG_CFG21 => REG_CitirocCfg3_REG_CFG21_WR,
	REG_CFG22 => REG_CitirocCfg3_REG_CFG22_WR,
	REG_CFG23 => REG_CitirocCfg3_REG_CFG23_WR,
	REG_CFG24 => REG_CitirocCfg3_REG_CFG24_WR,
	REG_CFG25 => REG_CitirocCfg3_REG_CFG25_WR,
	REG_CFG26 => REG_CitirocCfg3_REG_CFG26_WR,
	REG_CFG27 => REG_CitirocCfg3_REG_CFG27_WR,
	REG_CFG28 => REG_CitirocCfg3_REG_CFG28_WR,
	REG_CFG29 => REG_CitirocCfg3_REG_CFG29_WR,
	REG_CFG30 => REG_CitirocCfg3_REG_CFG30_WR,
	REG_CFG31 => REG_CitirocCfg3_REG_CFG31_WR,
	REG_CFG32 => REG_CitirocCfg3_REG_CFG32_WR,
	REG_CFG33 => REG_CitirocCfg3_REG_CFG33_WR,
	REG_CFG34 => REG_CitirocCfg3_REG_CFG34_WR,
	REG_CFG35 => REG_CitirocCfg3_REG_CFG35_WR,
	START_REG_CFG => REG_CitirocCfg3_START_REG_CFG_WR );
U295_TRIG0 <= A_TRIG0;
U295_TRIG1 <= A_TRIG1;
U295_TRIG2 <= A_TRIG2;
U295_TRIG3 <= A_TRIG3;
U295_TRIG4 <= A_TRIG4;
U295_TRIG5 <= A_TRIG5;
U295_TRIG6 <= A_TRIG6;
U295_TRIG7 <= A_TRIG7;
U295_TRIG8 <= A_TRIG8;
U295_TRIG9 <= A_TRIG9;
U295_TRIG10 <= A_TRIG10;
U295_TRIG11 <= A_TRIG11;
U295_TRIG12 <= A_TRIG12;
U295_TRIG13 <= A_TRIG13;
U295_TRIG14 <= A_TRIG14;
U295_TRIG15 <= A_TRIG15;
U295_TRIG16 <= A_TRIG16;
U295_TRIG17 <= A_TRIG17;
U295_TRIG18 <= A_TRIG18;
U295_TRIG19 <= A_TRIG19;
U295_TRIG20 <= A_TRIG20;
U295_TRIG21 <= A_TRIG21;
U295_TRIG22 <= A_TRIG22;
U295_TRIG23 <= A_TRIG23;
U295_TRIG24 <= A_TRIG24;
U295_TRIG25 <= A_TRIG25;
U295_TRIG26 <= A_TRIG26;
U295_TRIG27 <= A_TRIG27;
U295_TRIG28 <= A_TRIG28;
U295_TRIG29 <= A_TRIG29;
U295_TRIG30 <= A_TRIG30;
U295_TRIG31 <= A_TRIG31;
U295_OR_TIME <= A_OR_TIME;
U295_OR_CHARGE <= A_OR_CHARGE;
TRIGGER_EXT_A_s <= U329_TRIG_EXT_OUT;

U296_A_FRAME_ACK <= variable_A_FRAME_ACK;
U297_B_FRAME_ACK <= variable_B_FRAME_ACK;
U298_C_FRAME_ACK <= variable_C_FRAME_ACK;
U299_D_FRAME_ACK <= variable_D_FRAME_ACK;
variable_A_FRAME_ACK <= U305_ACK_A;
variable_B_FRAME_ACK <= U305_ACK_B;
variable_C_FRAME_ACK <= U305_ACK_C;
variable_D_FRAME_ACK <= U305_ACK_D;
U305 : CitirocFrameTransfer
  Generic map(
	memLength => 	8192)
PORT MAP(
	DATA_A => U22_A_FRAME_DATA,
	TS_T0_A => U50_A_TS0,
	TS_A => U49_A_TS,
	DV_A => U26_A_FRAME_DV(0),
	ACK_A => U305_ACK_A(0),
	DATA_B => U23_B_FRAME_DATA,
	TS_T0_B => U52_B_TS0,
	TS_B => U51_B_TS,
	DV_B => U27_B_FRAME_DV(0),
	ACK_B => U305_ACK_B(0),
	DATA_C => U24_C_FRAME_DATA,
	TS_T0_C => U54_C_TS0,
	TS_C => U53_C_TS,
	DV_C => U28_C_FRAME_DV(0),
	ACK_C => U305_ACK_C(0),
	DATA_D => U25_D_FRAME_DATA,
	TS_T0_D => U56_D_TS0,
	TS_D => U55_D_TS,
	DV_D => U29_D_FRAME_DV(0),
	ACK_D => U305_ACK_D(0),
	FIFO_FULL => U305_FULL,
	DATA_AVAL => open,
	BUSY => U305_BUSY,
	READ_RESET => U261_FIFO_RESET(0),
	READ_CLK => GlobalClock(0),
	CLK => GlobalClock(0),
	RESET => '0',
	CONTROL_REG => REG_CitirocFrame0_CONTROL_WR,
	STATUS_REG => REG_CitirocFrame0_STATUS_RD,
	READ_DATA => BUS_CitirocFrame0_READ_DATA,
	READ_DATAVALID => BUS_CitirocFrame0_VLD,
	READ_RD_INT => BUS_CitirocFrame0_R_INT );
U306 : PULSE_GENERATOR
PORT MAP(
	PULSE_OUT => U306_PULSE,
	PULSE_PERIOD => U309_out_0,
	PULSE_WIDTH => U308_CONST,
	CE => "1",
	CLK => GlobalClock,
	RESET => "0" );

U307 : block
begin
U307_out <= U197_LEMO_6_7_B_OUT when U310_out_0 = "0" else U306_PULSE when U310_out_0 = "1"  else (others=>'0');

end block;
U308_CONST <= conv_std_logic_vector(4,32);
U309_out_0 <= REG_T0_SOFT_FREQ_WR(31 downto 0);
U310_out_0 <= REG_T0_SEL_WR(0 downto 0);
U312 : xlx_oscilloscope_sync
  Generic map(
	channels => 	2,
	memLength => 	1024,
	wordWidth => 	16)
PORT MAP(
	ANALOG => U126_A_M_HG & U125_A_M_LG,
	D0 => U157_A_TRIG_T & U127_A_M_CLK,
	D1 => U160_A_TRIG_C & U128_A_M_SR,
	D2 => U168_A_TRG & U149_LEMO_TRG_EXT,
	D3 => U317_A_HIT & U150_LEMO_VET_EXT,
	TRIG => U168_A_TRG,
	BUSY => open,
	CE => "1",
	CLK_WRITE => CLK_ACQ,
	RESET => "0",
	CLK_READ => BUS_CLK,
	READ_ADDRESS => BUS_Oscilloscope_0_READ_ADDRESS,
	READ_DATA => BUS_Oscilloscope_0_READ_DATA,
	READ_DATAVALID => BUS_Oscilloscope_0_VLD,
	READ_STATUS => REG_Oscilloscope_0_READ_STATUS_RD,
	READ_POSITION => REG_Oscilloscope_0_READ_POSITION_RD,
	CONFIG_TRIGGER_MODE => REG_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR,
	CONFIG_TRIGGER_LEVEL => REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR,
	CONFIG_PRETRIGGER => REG_Oscilloscope_0_CONFIG_PRETRIGGER_WR,
	CONFIG_DECIMATOR => REG_Oscilloscope_0_CONFIG_DECIMATOR_WR,
	CONFIG_ARM => REG_Oscilloscope_0_CONFIG_ARM_WR );
variable_A_HIT <= U321_S_HIT;
variable_B_HIT <= U322_S_HIT;
variable_C_HIT <= U323_S_HIT;
variable_D_HIT <= U324_S_HIT;
U317_A_HIT <= variable_A_HIT;
U318_B_HIT <= variable_B_HIT;
U319_C_HIT <= variable_C_HIT;
U320_D_HIT <= variable_D_HIT;
U321 : CitirocAnalogReadout
  Generic map(
	CLKDIV => 	320)
PORT MAP(
	TRIG => U329_TRIG_OUT(0),
	reject_data => '0',
	HOLD_WIN_LENGTH => U325_out_0,
	BUSY => U321_BUSY(0),
	S_CHID => open,
	S_ENERGY_LG => open,
	S_ENERGY_HG => open,
	S_HIT => U321_S_HIT(0),
	S_DV => open,
	P_ENERGY_0_HG => open,
	P_ENERGY_0_LG => open,
	P_HIT_0 => open,
	P_ENERGY_1_HG => open,
	P_ENERGY_1_LG => open,
	P_HIT_1 => open,
	P_ENERGY_2_HG => open,
	P_ENERGY_2_LG => open,
	P_HIT_2 => open,
	P_ENERGY_3_HG => open,
	P_ENERGY_3_LG => open,
	P_HIT_3 => open,
	P_ENERGY_4_HG => open,
	P_ENERGY_4_LG => open,
	P_HIT_4 => open,
	P_ENERGY_5_HG => open,
	P_ENERGY_5_LG => open,
	P_HIT_5 => open,
	P_ENERGY_6_HG => open,
	P_ENERGY_6_LG => open,
	P_HIT_6 => open,
	P_ENERGY_7_HG => open,
	P_ENERGY_7_LG => open,
	P_HIT_7 => open,
	P_ENERGY_8_HG => open,
	P_ENERGY_8_LG => open,
	P_HIT_8 => open,
	P_ENERGY_9_HG => open,
	P_ENERGY_9_LG => open,
	P_HIT_9 => open,
	P_ENERGY_10_HG => open,
	P_ENERGY_10_LG => open,
	P_HIT_10 => open,
	P_ENERGY_11_HG => open,
	P_ENERGY_11_LG => open,
	P_HIT_11 => open,
	P_ENERGY_12_HG => open,
	P_ENERGY_12_LG => open,
	P_HIT_12 => open,
	P_ENERGY_13_HG => open,
	P_ENERGY_13_LG => open,
	P_HIT_13 => open,
	P_ENERGY_14_HG => open,
	P_ENERGY_14_LG => open,
	P_HIT_14 => open,
	P_ENERGY_15_HG => open,
	P_ENERGY_15_LG => open,
	P_HIT_15 => open,
	P_ENERGY_16_HG => open,
	P_ENERGY_16_LG => open,
	P_HIT_16 => open,
	P_ENERGY_17_HG => open,
	P_ENERGY_17_LG => open,
	P_HIT_17 => open,
	P_ENERGY_18_HG => open,
	P_ENERGY_18_LG => open,
	P_HIT_18 => open,
	P_ENERGY_19_HG => open,
	P_ENERGY_19_LG => open,
	P_HIT_19 => open,
	P_ENERGY_20_HG => open,
	P_ENERGY_20_LG => open,
	P_HIT_20 => open,
	P_ENERGY_21_HG => open,
	P_ENERGY_21_LG => open,
	P_HIT_21 => open,
	P_ENERGY_22_HG => open,
	P_ENERGY_22_LG => open,
	P_HIT_22 => open,
	P_ENERGY_23_HG => open,
	P_ENERGY_23_LG => open,
	P_HIT_23 => open,
	P_ENERGY_24_HG => open,
	P_ENERGY_24_LG => open,
	P_HIT_24 => open,
	P_ENERGY_25_HG => open,
	P_ENERGY_25_LG => open,
	P_HIT_25 => open,
	P_ENERGY_26_HG => open,
	P_ENERGY_26_LG => open,
	P_HIT_26 => open,
	P_ENERGY_27_HG => open,
	P_ENERGY_27_LG => open,
	P_HIT_27 => open,
	P_ENERGY_28_HG => open,
	P_ENERGY_28_LG => open,
	P_HIT_28 => open,
	P_ENERGY_29_HG => open,
	P_ENERGY_29_LG => open,
	P_HIT_29 => open,
	P_ENERGY_30_HG => open,
	P_ENERGY_30_LG => open,
	P_HIT_30 => open,
	P_ENERGY_31_HG => open,
	P_ENERGY_31_LG => open,
	P_HIT_31 => open,
	P_DV => open,
	P_FRAME_DV => U321_P_FRAME_DV(0),
	P_FRAME_ACK => U296_A_FRAME_ACK(0),
	P_FRAME_DATA => U321_P_FRAME_DATA,
	M_ENERGY_HG => U321_M_ENERGY_HG,
	M_ENERGY_LG => U321_M_ENERGY_LG,
	M_CLK => U321_M_CLK,
	M_DIN => U321_M_DIN,
	TS_IN => U31_G_TS,
	TS_OUT => U321_TS_OUT,
	TS0_IN => U30_G_TS0,
	TS0_OUT => U321_TS0_OUT,
	ADC_IN_HG => Citiroc_A_ADC_ENERGY_HG,
	ADC_IN_LG => Citiroc_A_ADC_ENERGY_LG,
	CHARGE_HIT_in => Citiroc_A_CHARGE_HIT_s(0),
	chrage_srin_a => Citiroc_A_SRIN_s(0),
	chrage_clk_a => Citiroc_A_SCLK_s(0),
	chrage_sr_resetb => Citiroc_A_RESET_READ_s(0),
	val_evnt => A_VAL_EVT_s(0),
	raz_chn => A_RAZ_CHN_s(0),
	hold_hg => A_HOLD_HG_s(0),
	hold_lg => A_HOLD_LG_s(0),
	clk => GlobalClock(0),
	reset => '0' );
U322 : CitirocAnalogReadout
  Generic map(
	CLKDIV => 	320)
PORT MAP(
	TRIG => U330_TRIG_OUT(0),
	reject_data => '0',
	HOLD_WIN_LENGTH => U326_out_0,
	BUSY => U322_BUSY(0),
	S_CHID => open,
	S_ENERGY_LG => open,
	S_ENERGY_HG => open,
	S_HIT => U322_S_HIT(0),
	S_DV => open,
	P_ENERGY_0_HG => open,
	P_ENERGY_0_LG => open,
	P_HIT_0 => open,
	P_ENERGY_1_HG => open,
	P_ENERGY_1_LG => open,
	P_HIT_1 => open,
	P_ENERGY_2_HG => open,
	P_ENERGY_2_LG => open,
	P_HIT_2 => open,
	P_ENERGY_3_HG => open,
	P_ENERGY_3_LG => open,
	P_HIT_3 => open,
	P_ENERGY_4_HG => open,
	P_ENERGY_4_LG => open,
	P_HIT_4 => open,
	P_ENERGY_5_HG => open,
	P_ENERGY_5_LG => open,
	P_HIT_5 => open,
	P_ENERGY_6_HG => open,
	P_ENERGY_6_LG => open,
	P_HIT_6 => open,
	P_ENERGY_7_HG => open,
	P_ENERGY_7_LG => open,
	P_HIT_7 => open,
	P_ENERGY_8_HG => open,
	P_ENERGY_8_LG => open,
	P_HIT_8 => open,
	P_ENERGY_9_HG => open,
	P_ENERGY_9_LG => open,
	P_HIT_9 => open,
	P_ENERGY_10_HG => open,
	P_ENERGY_10_LG => open,
	P_HIT_10 => open,
	P_ENERGY_11_HG => open,
	P_ENERGY_11_LG => open,
	P_HIT_11 => open,
	P_ENERGY_12_HG => open,
	P_ENERGY_12_LG => open,
	P_HIT_12 => open,
	P_ENERGY_13_HG => open,
	P_ENERGY_13_LG => open,
	P_HIT_13 => open,
	P_ENERGY_14_HG => open,
	P_ENERGY_14_LG => open,
	P_HIT_14 => open,
	P_ENERGY_15_HG => open,
	P_ENERGY_15_LG => open,
	P_HIT_15 => open,
	P_ENERGY_16_HG => open,
	P_ENERGY_16_LG => open,
	P_HIT_16 => open,
	P_ENERGY_17_HG => open,
	P_ENERGY_17_LG => open,
	P_HIT_17 => open,
	P_ENERGY_18_HG => open,
	P_ENERGY_18_LG => open,
	P_HIT_18 => open,
	P_ENERGY_19_HG => open,
	P_ENERGY_19_LG => open,
	P_HIT_19 => open,
	P_ENERGY_20_HG => open,
	P_ENERGY_20_LG => open,
	P_HIT_20 => open,
	P_ENERGY_21_HG => open,
	P_ENERGY_21_LG => open,
	P_HIT_21 => open,
	P_ENERGY_22_HG => open,
	P_ENERGY_22_LG => open,
	P_HIT_22 => open,
	P_ENERGY_23_HG => open,
	P_ENERGY_23_LG => open,
	P_HIT_23 => open,
	P_ENERGY_24_HG => open,
	P_ENERGY_24_LG => open,
	P_HIT_24 => open,
	P_ENERGY_25_HG => open,
	P_ENERGY_25_LG => open,
	P_HIT_25 => open,
	P_ENERGY_26_HG => open,
	P_ENERGY_26_LG => open,
	P_HIT_26 => open,
	P_ENERGY_27_HG => open,
	P_ENERGY_27_LG => open,
	P_HIT_27 => open,
	P_ENERGY_28_HG => open,
	P_ENERGY_28_LG => open,
	P_HIT_28 => open,
	P_ENERGY_29_HG => open,
	P_ENERGY_29_LG => open,
	P_HIT_29 => open,
	P_ENERGY_30_HG => open,
	P_ENERGY_30_LG => open,
	P_HIT_30 => open,
	P_ENERGY_31_HG => open,
	P_ENERGY_31_LG => open,
	P_HIT_31 => open,
	P_DV => open,
	P_FRAME_DV => U322_P_FRAME_DV(0),
	P_FRAME_ACK => U297_B_FRAME_ACK(0),
	P_FRAME_DATA => U322_P_FRAME_DATA,
	M_ENERGY_HG => U322_M_ENERGY_HG,
	M_ENERGY_LG => U322_M_ENERGY_LG,
	M_CLK => U322_M_CLK,
	M_DIN => U322_M_DIN,
	TS_IN => U33_G_TS,
	TS_OUT => U322_TS_OUT,
	TS0_IN => U32_G_TS0,
	TS0_OUT => U322_TS0_OUT,
	ADC_IN_HG => Citiroc_B_ADC_ENERGY_HG,
	ADC_IN_LG => Citiroc_B_ADC_ENERGY_LG,
	CHARGE_HIT_in => Citiroc_B_CHARGE_HIT_s(0),
	chrage_srin_a => Citiroc_B_SRIN_s(0),
	chrage_clk_a => Citiroc_B_SCLK_s(0),
	chrage_sr_resetb => Citiroc_B_RESET_READ_s(0),
	val_evnt => B_VAL_EVT_s(0),
	raz_chn => B_RAZ_CHN_s(0),
	hold_hg => B_HOLD_HG_s(0),
	hold_lg => B_HOLD_LG_s(0),
	clk => GlobalClock(0),
	reset => '0' );
U323 : CitirocAnalogReadout
  Generic map(
	CLKDIV => 	320)
PORT MAP(
	TRIG => U331_TRIG_OUT(0),
	reject_data => '0',
	HOLD_WIN_LENGTH => U327_out_0,
	BUSY => U323_BUSY(0),
	S_CHID => open,
	S_ENERGY_LG => open,
	S_ENERGY_HG => open,
	S_HIT => U323_S_HIT(0),
	S_DV => open,
	P_ENERGY_0_HG => open,
	P_ENERGY_0_LG => open,
	P_HIT_0 => open,
	P_ENERGY_1_HG => open,
	P_ENERGY_1_LG => open,
	P_HIT_1 => open,
	P_ENERGY_2_HG => open,
	P_ENERGY_2_LG => open,
	P_HIT_2 => open,
	P_ENERGY_3_HG => open,
	P_ENERGY_3_LG => open,
	P_HIT_3 => open,
	P_ENERGY_4_HG => open,
	P_ENERGY_4_LG => open,
	P_HIT_4 => open,
	P_ENERGY_5_HG => open,
	P_ENERGY_5_LG => open,
	P_HIT_5 => open,
	P_ENERGY_6_HG => open,
	P_ENERGY_6_LG => open,
	P_HIT_6 => open,
	P_ENERGY_7_HG => open,
	P_ENERGY_7_LG => open,
	P_HIT_7 => open,
	P_ENERGY_8_HG => open,
	P_ENERGY_8_LG => open,
	P_HIT_8 => open,
	P_ENERGY_9_HG => open,
	P_ENERGY_9_LG => open,
	P_HIT_9 => open,
	P_ENERGY_10_HG => open,
	P_ENERGY_10_LG => open,
	P_HIT_10 => open,
	P_ENERGY_11_HG => open,
	P_ENERGY_11_LG => open,
	P_HIT_11 => open,
	P_ENERGY_12_HG => open,
	P_ENERGY_12_LG => open,
	P_HIT_12 => open,
	P_ENERGY_13_HG => open,
	P_ENERGY_13_LG => open,
	P_HIT_13 => open,
	P_ENERGY_14_HG => open,
	P_ENERGY_14_LG => open,
	P_HIT_14 => open,
	P_ENERGY_15_HG => open,
	P_ENERGY_15_LG => open,
	P_HIT_15 => open,
	P_ENERGY_16_HG => open,
	P_ENERGY_16_LG => open,
	P_HIT_16 => open,
	P_ENERGY_17_HG => open,
	P_ENERGY_17_LG => open,
	P_HIT_17 => open,
	P_ENERGY_18_HG => open,
	P_ENERGY_18_LG => open,
	P_HIT_18 => open,
	P_ENERGY_19_HG => open,
	P_ENERGY_19_LG => open,
	P_HIT_19 => open,
	P_ENERGY_20_HG => open,
	P_ENERGY_20_LG => open,
	P_HIT_20 => open,
	P_ENERGY_21_HG => open,
	P_ENERGY_21_LG => open,
	P_HIT_21 => open,
	P_ENERGY_22_HG => open,
	P_ENERGY_22_LG => open,
	P_HIT_22 => open,
	P_ENERGY_23_HG => open,
	P_ENERGY_23_LG => open,
	P_HIT_23 => open,
	P_ENERGY_24_HG => open,
	P_ENERGY_24_LG => open,
	P_HIT_24 => open,
	P_ENERGY_25_HG => open,
	P_ENERGY_25_LG => open,
	P_HIT_25 => open,
	P_ENERGY_26_HG => open,
	P_ENERGY_26_LG => open,
	P_HIT_26 => open,
	P_ENERGY_27_HG => open,
	P_ENERGY_27_LG => open,
	P_HIT_27 => open,
	P_ENERGY_28_HG => open,
	P_ENERGY_28_LG => open,
	P_HIT_28 => open,
	P_ENERGY_29_HG => open,
	P_ENERGY_29_LG => open,
	P_HIT_29 => open,
	P_ENERGY_30_HG => open,
	P_ENERGY_30_LG => open,
	P_HIT_30 => open,
	P_ENERGY_31_HG => open,
	P_ENERGY_31_LG => open,
	P_HIT_31 => open,
	P_DV => open,
	P_FRAME_DV => U323_P_FRAME_DV(0),
	P_FRAME_ACK => U298_C_FRAME_ACK(0),
	P_FRAME_DATA => U323_P_FRAME_DATA,
	M_ENERGY_HG => U323_M_ENERGY_HG,
	M_ENERGY_LG => U323_M_ENERGY_LG,
	M_CLK => U323_M_CLK,
	M_DIN => U323_M_DIN,
	TS_IN => U35_G_TS,
	TS_OUT => U323_TS_OUT,
	TS0_IN => U34_G_TS0,
	TS0_OUT => U323_TS0_OUT,
	ADC_IN_HG => Citiroc_C_ADC_ENERGY_HG,
	ADC_IN_LG => Citiroc_C_ADC_ENERGY_LG,
	CHARGE_HIT_in => Citiroc_C_CHARGE_HIT_s(0),
	chrage_srin_a => Citiroc_C_SRIN_s(0),
	chrage_clk_a => Citiroc_C_SCLK_s(0),
	chrage_sr_resetb => Citiroc_C_RESET_READ_s(0),
	val_evnt => C_VAL_EVT_s(0),
	raz_chn => C_RAZ_CHN_s(0),
	hold_hg => C_HOLD_HG_s(0),
	hold_lg => C_HOLD_LG_s(0),
	clk => GlobalClock(0),
	reset => '0' );
U324 : CitirocAnalogReadout
  Generic map(
	CLKDIV => 	320)
PORT MAP(
	TRIG => U332_TRIG_OUT(0),
	reject_data => '0',
	HOLD_WIN_LENGTH => U328_out_0,
	BUSY => U324_BUSY(0),
	S_CHID => open,
	S_ENERGY_LG => open,
	S_ENERGY_HG => open,
	S_HIT => U324_S_HIT(0),
	S_DV => open,
	P_ENERGY_0_HG => open,
	P_ENERGY_0_LG => open,
	P_HIT_0 => open,
	P_ENERGY_1_HG => open,
	P_ENERGY_1_LG => open,
	P_HIT_1 => open,
	P_ENERGY_2_HG => open,
	P_ENERGY_2_LG => open,
	P_HIT_2 => open,
	P_ENERGY_3_HG => open,
	P_ENERGY_3_LG => open,
	P_HIT_3 => open,
	P_ENERGY_4_HG => open,
	P_ENERGY_4_LG => open,
	P_HIT_4 => open,
	P_ENERGY_5_HG => open,
	P_ENERGY_5_LG => open,
	P_HIT_5 => open,
	P_ENERGY_6_HG => open,
	P_ENERGY_6_LG => open,
	P_HIT_6 => open,
	P_ENERGY_7_HG => open,
	P_ENERGY_7_LG => open,
	P_HIT_7 => open,
	P_ENERGY_8_HG => open,
	P_ENERGY_8_LG => open,
	P_HIT_8 => open,
	P_ENERGY_9_HG => open,
	P_ENERGY_9_LG => open,
	P_HIT_9 => open,
	P_ENERGY_10_HG => open,
	P_ENERGY_10_LG => open,
	P_HIT_10 => open,
	P_ENERGY_11_HG => open,
	P_ENERGY_11_LG => open,
	P_HIT_11 => open,
	P_ENERGY_12_HG => open,
	P_ENERGY_12_LG => open,
	P_HIT_12 => open,
	P_ENERGY_13_HG => open,
	P_ENERGY_13_LG => open,
	P_HIT_13 => open,
	P_ENERGY_14_HG => open,
	P_ENERGY_14_LG => open,
	P_HIT_14 => open,
	P_ENERGY_15_HG => open,
	P_ENERGY_15_LG => open,
	P_HIT_15 => open,
	P_ENERGY_16_HG => open,
	P_ENERGY_16_LG => open,
	P_HIT_16 => open,
	P_ENERGY_17_HG => open,
	P_ENERGY_17_LG => open,
	P_HIT_17 => open,
	P_ENERGY_18_HG => open,
	P_ENERGY_18_LG => open,
	P_HIT_18 => open,
	P_ENERGY_19_HG => open,
	P_ENERGY_19_LG => open,
	P_HIT_19 => open,
	P_ENERGY_20_HG => open,
	P_ENERGY_20_LG => open,
	P_HIT_20 => open,
	P_ENERGY_21_HG => open,
	P_ENERGY_21_LG => open,
	P_HIT_21 => open,
	P_ENERGY_22_HG => open,
	P_ENERGY_22_LG => open,
	P_HIT_22 => open,
	P_ENERGY_23_HG => open,
	P_ENERGY_23_LG => open,
	P_HIT_23 => open,
	P_ENERGY_24_HG => open,
	P_ENERGY_24_LG => open,
	P_HIT_24 => open,
	P_ENERGY_25_HG => open,
	P_ENERGY_25_LG => open,
	P_HIT_25 => open,
	P_ENERGY_26_HG => open,
	P_ENERGY_26_LG => open,
	P_HIT_26 => open,
	P_ENERGY_27_HG => open,
	P_ENERGY_27_LG => open,
	P_HIT_27 => open,
	P_ENERGY_28_HG => open,
	P_ENERGY_28_LG => open,
	P_HIT_28 => open,
	P_ENERGY_29_HG => open,
	P_ENERGY_29_LG => open,
	P_HIT_29 => open,
	P_ENERGY_30_HG => open,
	P_ENERGY_30_LG => open,
	P_HIT_30 => open,
	P_ENERGY_31_HG => open,
	P_ENERGY_31_LG => open,
	P_HIT_31 => open,
	P_DV => open,
	P_FRAME_DV => U324_P_FRAME_DV(0),
	P_FRAME_ACK => U299_D_FRAME_ACK(0),
	P_FRAME_DATA => U324_P_FRAME_DATA,
	M_ENERGY_HG => U324_M_ENERGY_HG,
	M_ENERGY_LG => U324_M_ENERGY_LG,
	M_CLK => U324_M_CLK,
	M_DIN => U324_M_DIN,
	TS_IN => U38_G_TS,
	TS_OUT => U324_TS_OUT,
	TS0_IN => U37_G_TS0,
	TS0_OUT => U324_TS0_OUT,
	ADC_IN_HG => Citiroc_D_ADC_ENERGY_HG,
	ADC_IN_LG => Citiroc_D_ADC_ENERGY_LG,
	CHARGE_HIT_in => Citiroc_D_CHARGE_HIT_s(0),
	chrage_srin_a => Citiroc_D_SRIN_s(0),
	chrage_clk_a => Citiroc_D_SCLK_s(0),
	chrage_sr_resetb => Citiroc_D_RESET_READ_s(0),
	val_evnt => D_VAL_EVT_s(0),
	raz_chn => D_RAZ_CHN_s(0),
	hold_hg => D_HOLD_HG_s(0),
	hold_lg => D_HOLD_LG_s(0),
	clk => GlobalClock(0),
	reset => '0' );
U325_out_0 <= REG_HOLD_TIME_WR(15 downto 0);
U326_out_0 <= REG_HOLD_TIME_WR(15 downto 0);
U327_out_0 <= REG_HOLD_TIME_WR(15 downto 0);
U328_out_0 <= REG_HOLD_TIME_WR(15 downto 0);

U329:SUBPAGE_TriggerLogic
PORT MAP(
	TRIG_T => U295_OR_TIME,
	TRIG_C => U295_OR_CHARGE,
	EXT_TRIG => U20_EXT_TRIG,
	GLB_TRIG => U21_GLOBAL_TRIG,
	SELF_TRIG => U57_SELF_TRIG,
	SEL_TRIG => U58_out_0,
	EN_VETO => U75_out_0,
	EXT_VETO => U59_EXT_VETO,
	SW_VETO => U79_out_0,
	TRIG_OUT => U329_TRIG_OUT,
	TRIG_EXT_OUT => U329_TRIG_EXT_OUT,
    GlobalReset => GlobalReset,
    CLK_ACQ=>CLK_ACQ ,
    BUS_CLK=>BUS_CLK ,
    CLK_40=>CLK_40 ,
    CLK_80=>CLK_80 ,
    clk_160=>clk_160 ,
    clk_320=>clk_320 ,
    FAST_CLK_100=>FAST_CLK_100 ,
    FAST_CLK_200=>FAST_CLK_200 ,
    FAST_CLK_250=>FAST_CLK_250 ,
    FAST_CLK_250_90=>FAST_CLK_250_90 ,
    FAST_CLK_500=>FAST_CLK_500 ,
    FAST_CLK_500_90=>FAST_CLK_500_90 ,
    GlobalClock=>GlobalClock ,
    async_clk => async_clk 
);

U330:SUBPAGE_TriggerLogic
PORT MAP(
	TRIG_T => U48_OR_TIME,
	TRIG_C => U48_OR_CHARGE,
	EXT_TRIG => U60_EXT_TRIG,
	GLB_TRIG => U61_GLOBAL_TRIG,
	SELF_TRIG => U62_SELF_TRIG,
	SEL_TRIG => U72_out_0,
	EN_VETO => U76_out_0,
	EXT_VETO => U63_EXT_VETO,
	SW_VETO => U80_out_0,
	TRIG_OUT => U330_TRIG_OUT,
	TRIG_EXT_OUT => U330_TRIG_EXT_OUT,
    GlobalReset => GlobalReset,
    CLK_ACQ=>CLK_ACQ ,
    BUS_CLK=>BUS_CLK ,
    CLK_40=>CLK_40 ,
    CLK_80=>CLK_80 ,
    clk_160=>clk_160 ,
    clk_320=>clk_320 ,
    FAST_CLK_100=>FAST_CLK_100 ,
    FAST_CLK_200=>FAST_CLK_200 ,
    FAST_CLK_250=>FAST_CLK_250 ,
    FAST_CLK_250_90=>FAST_CLK_250_90 ,
    FAST_CLK_500=>FAST_CLK_500 ,
    FAST_CLK_500_90=>FAST_CLK_500_90 ,
    GlobalClock=>GlobalClock ,
    async_clk => async_clk 
);

U331:SUBPAGE_TriggerLogic
PORT MAP(
	TRIG_T => U36_OR_TIME,
	TRIG_C => U36_OR_CHARGE,
	EXT_TRIG => U64_EXT_TRIG,
	GLB_TRIG => U65_GLOBAL_TRIG,
	SELF_TRIG => U66_SELF_TRIG,
	SEL_TRIG => U73_out_0,
	EN_VETO => U77_out_0,
	EXT_VETO => U67_EXT_VETO,
	SW_VETO => U81_out_0,
	TRIG_OUT => U331_TRIG_OUT,
	TRIG_EXT_OUT => U331_TRIG_EXT_OUT,
    GlobalReset => GlobalReset,
    CLK_ACQ=>CLK_ACQ ,
    BUS_CLK=>BUS_CLK ,
    CLK_40=>CLK_40 ,
    CLK_80=>CLK_80 ,
    clk_160=>clk_160 ,
    clk_320=>clk_320 ,
    FAST_CLK_100=>FAST_CLK_100 ,
    FAST_CLK_200=>FAST_CLK_200 ,
    FAST_CLK_250=>FAST_CLK_250 ,
    FAST_CLK_250_90=>FAST_CLK_250_90 ,
    FAST_CLK_500=>FAST_CLK_500 ,
    FAST_CLK_500_90=>FAST_CLK_500_90 ,
    GlobalClock=>GlobalClock ,
    async_clk => async_clk 
);

U332:SUBPAGE_TriggerLogic
PORT MAP(
	TRIG_T => U47_OR_TIME,
	TRIG_C => U47_OR_CHARGE,
	EXT_TRIG => U68_EXT_TRIG,
	GLB_TRIG => U69_GLOBAL_TRIG,
	SELF_TRIG => U70_SELF_TRIG,
	SEL_TRIG => U74_out_0,
	EN_VETO => U78_out_0,
	EXT_VETO => U71_EXT_VETO,
	SW_VETO => U82_out_0,
	TRIG_OUT => U332_TRIG_OUT,
	TRIG_EXT_OUT => U332_TRIG_EXT_OUT,
    GlobalReset => GlobalReset,
    CLK_ACQ=>CLK_ACQ ,
    BUS_CLK=>BUS_CLK ,
    CLK_40=>CLK_40 ,
    CLK_80=>CLK_80 ,
    clk_160=>clk_160 ,
    clk_320=>clk_320 ,
    FAST_CLK_100=>FAST_CLK_100 ,
    FAST_CLK_200=>FAST_CLK_200 ,
    FAST_CLK_250=>FAST_CLK_250 ,
    FAST_CLK_250_90=>FAST_CLK_250_90 ,
    FAST_CLK_500=>FAST_CLK_500 ,
    FAST_CLK_500_90=>FAST_CLK_500_90 ,
    GlobalClock=>GlobalClock ,
    async_clk => async_clk 
);

U333:SUBPAGE_Framing
PORT MAP(
	T_0 => U337_A_TRG_0,
	T_1 => U338_A_TRG_1,
	T_2 => U339_A_TRG_2,
	T_3 => U340_A_TRG_3,
	T_4 => U341_A_TRG_4,
	T_5 => U342_A_TRG_5,
	T_6 => U343_A_TRG_6,
	T_7 => U344_A_TRG_7,
	T_8 => U345_A_TRG_8,
	T_9 => U346_A_TRG_9,
	T_10 => U347_A_TRG_10,
	T_11 => U348_A_TRG_11,
	T_12 => U349_A_TRG_12,
	T_13 => U350_A_TRG_13,
	T_14 => U351_A_TRG_14,
	T_15 => U352_A_TRG_15,
	T_16 => U353_A_TRG_16,
	T_17 => U354_A_TRG_17,
	T_18 => U355_A_TRG_18,
	T_19 => U356_A_TRG_19,
	T_20 => U357_A_TRG_20,
	T_21 => U358_A_TRG_21,
	T_22 => U359_A_TRG_22,
	T_23 => U360_A_TRG_23,
	T_24 => U361_A_TRG_24,
	T_25 => U362_A_TRG_25,
	T_26 => U363_A_TRG_26,
	T_27 => U364_A_TRG_27,
	T_28 => U365_A_TRG_28,
	T_29 => U366_A_TRG_29,
	T_30 => U367_A_TRG_30,
	T_31 => U368_A_TRG_31,
	FRAME => U472_FR_FRAME_SIG,
	C_0 => U333_C_0,
	C_1 => U333_C_1,
	C_2 => U333_C_2,
	C_3 => U333_C_3,
	C_4 => U333_C_4,
	C_5 => U333_C_5,
	C_6 => U333_C_6,
	C_7 => U333_C_7,
	C_8 => U333_C_8,
	C_9 => U333_C_9,
	C_10 => U333_C_10,
	C_11 => U333_C_11,
	C_12 => U333_C_12,
	C_13 => U333_C_13,
	C_14 => U333_C_14,
	C_15 => U333_C_15,
	C_16 => U333_C_16,
	C_17 => U333_C_17,
	C_18 => U333_C_18,
	C_19 => U333_C_19,
	C_20 => U333_C_20,
	C_21 => U333_C_21,
	C_22 => U333_C_22,
	C_23 => U333_C_23,
	C_24 => U333_C_24,
	C_25 => U333_C_25,
	C_26 => U333_C_26,
	C_27 => U333_C_27,
	C_28 => U333_C_28,
	C_29 => U333_C_29,
	C_30 => U333_C_30,
	C_31 => U333_C_31,
    GlobalReset => GlobalReset,
    CLK_ACQ=>CLK_ACQ ,
    BUS_CLK=>BUS_CLK ,
    CLK_40=>CLK_40 ,
    CLK_80=>CLK_80 ,
    clk_160=>clk_160 ,
    clk_320=>clk_320 ,
    FAST_CLK_100=>FAST_CLK_100 ,
    FAST_CLK_200=>FAST_CLK_200 ,
    FAST_CLK_250=>FAST_CLK_250 ,
    FAST_CLK_250_90=>FAST_CLK_250_90 ,
    FAST_CLK_500=>FAST_CLK_500 ,
    FAST_CLK_500_90=>FAST_CLK_500_90 ,
    GlobalClock=>GlobalClock ,
    async_clk => async_clk 
);

U334:SUBPAGE_Framing
PORT MAP(
	T_0 => U401_C_TRG_0,
	T_1 => U402_C_TRG_1,
	T_2 => U403_C_TRG_2,
	T_3 => U404_C_TRG_3,
	T_4 => U405_C_TRG_4,
	T_5 => U406_C_TRG_5,
	T_6 => U407_C_TRG_6,
	T_7 => U408_C_TRG_7,
	T_8 => U409_C_TRG_8,
	T_9 => U410_C_TRG_9,
	T_10 => U411_C_TRG_10,
	T_11 => U412_C_TRG_11,
	T_12 => U413_C_TRG_12,
	T_13 => U414_C_TRG_13,
	T_14 => U415_C_TRG_14,
	T_15 => U416_C_TRG_15,
	T_16 => U417_C_TRG_16,
	T_17 => U418_C_TRG_17,
	T_18 => U419_C_TRG_18,
	T_19 => U420_C_TRG_19,
	T_20 => U421_C_TRG_20,
	T_21 => U422_C_TRG_21,
	T_22 => U423_C_TRG_22,
	T_23 => U424_C_TRG_23,
	T_24 => U425_C_TRG_24,
	T_25 => U426_C_TRG_25,
	T_26 => U427_C_TRG_26,
	T_27 => U428_C_TRG_27,
	T_28 => U429_C_TRG_28,
	T_29 => U430_C_TRG_29,
	T_30 => U431_C_TRG_30,
	T_31 => U432_C_TRG_31,
	FRAME => U470_FR_FRAME_SIG,
	C_0 => U334_C_0,
	C_1 => U334_C_1,
	C_2 => U334_C_2,
	C_3 => U334_C_3,
	C_4 => U334_C_4,
	C_5 => U334_C_5,
	C_6 => U334_C_6,
	C_7 => U334_C_7,
	C_8 => U334_C_8,
	C_9 => U334_C_9,
	C_10 => U334_C_10,
	C_11 => U334_C_11,
	C_12 => U334_C_12,
	C_13 => U334_C_13,
	C_14 => U334_C_14,
	C_15 => U334_C_15,
	C_16 => U334_C_16,
	C_17 => U334_C_17,
	C_18 => U334_C_18,
	C_19 => U334_C_19,
	C_20 => U334_C_20,
	C_21 => U334_C_21,
	C_22 => U334_C_22,
	C_23 => U334_C_23,
	C_24 => U334_C_24,
	C_25 => U334_C_25,
	C_26 => U334_C_26,
	C_27 => U334_C_27,
	C_28 => U334_C_28,
	C_29 => U334_C_29,
	C_30 => U334_C_30,
	C_31 => U334_C_31,
    GlobalReset => GlobalReset,
    CLK_ACQ=>CLK_ACQ ,
    BUS_CLK=>BUS_CLK ,
    CLK_40=>CLK_40 ,
    CLK_80=>CLK_80 ,
    clk_160=>clk_160 ,
    clk_320=>clk_320 ,
    FAST_CLK_100=>FAST_CLK_100 ,
    FAST_CLK_200=>FAST_CLK_200 ,
    FAST_CLK_250=>FAST_CLK_250 ,
    FAST_CLK_250_90=>FAST_CLK_250_90 ,
    FAST_CLK_500=>FAST_CLK_500 ,
    FAST_CLK_500_90=>FAST_CLK_500_90 ,
    GlobalClock=>GlobalClock ,
    async_clk => async_clk 
);

U335:SUBPAGE_Framing
PORT MAP(
	T_0 => U369_B_TRG_0,
	T_1 => U370_B_TRG_1,
	T_2 => U371_B_TRG_2,
	T_3 => U372_B_TRG_3,
	T_4 => U373_B_TRG_4,
	T_5 => U374_B_TRG_5,
	T_6 => U375_B_TRG_6,
	T_7 => U376_B_TRG_7,
	T_8 => U377_B_TRG_8,
	T_9 => U378_B_TRG_9,
	T_10 => U379_B_TRG_10,
	T_11 => U380_B_TRG_11,
	T_12 => U381_B_TRG_12,
	T_13 => U382_B_TRG_13,
	T_14 => U383_B_TRG_14,
	T_15 => U384_B_TRG_15,
	T_16 => U385_B_TRG_16,
	T_17 => U386_B_TRG_17,
	T_18 => U387_B_TRG_18,
	T_19 => U388_B_TRG_19,
	T_20 => U389_B_TRG_20,
	T_21 => U390_B_TRG_21,
	T_22 => U391_B_TRG_22,
	T_23 => U392_B_TRG_23,
	T_24 => U393_B_TRG_24,
	T_25 => U394_B_TRG_25,
	T_26 => U395_B_TRG_26,
	T_27 => U396_B_TRG_27,
	T_28 => U397_B_TRG_28,
	T_29 => U398_B_TRG_29,
	T_30 => U399_B_TRG_30,
	T_31 => U400_B_TRG_31,
	FRAME => U471_FR_FRAME_SIG,
	C_0 => U335_C_0,
	C_1 => U335_C_1,
	C_2 => U335_C_2,
	C_3 => U335_C_3,
	C_4 => U335_C_4,
	C_5 => U335_C_5,
	C_6 => U335_C_6,
	C_7 => U335_C_7,
	C_8 => U335_C_8,
	C_9 => U335_C_9,
	C_10 => U335_C_10,
	C_11 => U335_C_11,
	C_12 => U335_C_12,
	C_13 => U335_C_13,
	C_14 => U335_C_14,
	C_15 => U335_C_15,
	C_16 => U335_C_16,
	C_17 => U335_C_17,
	C_18 => U335_C_18,
	C_19 => U335_C_19,
	C_20 => U335_C_20,
	C_21 => U335_C_21,
	C_22 => U335_C_22,
	C_23 => U335_C_23,
	C_24 => U335_C_24,
	C_25 => U335_C_25,
	C_26 => U335_C_26,
	C_27 => U335_C_27,
	C_28 => U335_C_28,
	C_29 => U335_C_29,
	C_30 => U335_C_30,
	C_31 => U335_C_31,
    GlobalReset => GlobalReset,
    CLK_ACQ=>CLK_ACQ ,
    BUS_CLK=>BUS_CLK ,
    CLK_40=>CLK_40 ,
    CLK_80=>CLK_80 ,
    clk_160=>clk_160 ,
    clk_320=>clk_320 ,
    FAST_CLK_100=>FAST_CLK_100 ,
    FAST_CLK_200=>FAST_CLK_200 ,
    FAST_CLK_250=>FAST_CLK_250 ,
    FAST_CLK_250_90=>FAST_CLK_250_90 ,
    FAST_CLK_500=>FAST_CLK_500 ,
    FAST_CLK_500_90=>FAST_CLK_500_90 ,
    GlobalClock=>GlobalClock ,
    async_clk => async_clk 
);

U336:SUBPAGE_Framing
PORT MAP(
	T_0 => U433_D_TRG_0,
	T_1 => U434_D_TRG_1,
	T_2 => U435_D_TRG_2,
	T_3 => U436_D_TRG_3,
	T_4 => U437_D_TRG_4,
	T_5 => U438_D_TRG_5,
	T_6 => U439_D_TRG_6,
	T_7 => U440_D_TRG_7,
	T_8 => U441_D_TRG_8,
	T_9 => U442_D_TRG_9,
	T_10 => U443_D_TRG_10,
	T_11 => U444_D_TRG_11,
	T_12 => U445_D_TRG_12,
	T_13 => U446_D_TRG_13,
	T_14 => U447_D_TRG_14,
	T_15 => U448_D_TRG_15,
	T_16 => U449_D_TRG_16,
	T_17 => U450_D_TRG_17,
	T_18 => U451_D_TRG_18,
	T_19 => U452_D_TRG_19,
	T_20 => U453_D_TRG_20,
	T_21 => U454_D_TRG_21,
	T_22 => U455_D_TRG_22,
	T_23 => U456_D_TRG_23,
	T_24 => U457_D_TRG_24,
	T_25 => U458_D_TRG_25,
	T_26 => U459_D_TRG_26,
	T_27 => U460_D_TRG_27,
	T_28 => U461_D_TRG_28,
	T_29 => U462_D_TRG_29,
	T_30 => U463_D_TRG_30,
	T_31 => U464_D_TRG_31,
	FRAME => U469_FR_FRAME_SIG,
	C_0 => U336_C_0,
	C_1 => U336_C_1,
	C_2 => U336_C_2,
	C_3 => U336_C_3,
	C_4 => U336_C_4,
	C_5 => U336_C_5,
	C_6 => U336_C_6,
	C_7 => U336_C_7,
	C_8 => U336_C_8,
	C_9 => U336_C_9,
	C_10 => U336_C_10,
	C_11 => U336_C_11,
	C_12 => U336_C_12,
	C_13 => U336_C_13,
	C_14 => U336_C_14,
	C_15 => U336_C_15,
	C_16 => U336_C_16,
	C_17 => U336_C_17,
	C_18 => U336_C_18,
	C_19 => U336_C_19,
	C_20 => U336_C_20,
	C_21 => U336_C_21,
	C_22 => U336_C_22,
	C_23 => U336_C_23,
	C_24 => U336_C_24,
	C_25 => U336_C_25,
	C_26 => U336_C_26,
	C_27 => U336_C_27,
	C_28 => U336_C_28,
	C_29 => U336_C_29,
	C_30 => U336_C_30,
	C_31 => U336_C_31,
    GlobalReset => GlobalReset,
    CLK_ACQ=>CLK_ACQ ,
    BUS_CLK=>BUS_CLK ,
    CLK_40=>CLK_40 ,
    CLK_80=>CLK_80 ,
    clk_160=>clk_160 ,
    clk_320=>clk_320 ,
    FAST_CLK_100=>FAST_CLK_100 ,
    FAST_CLK_200=>FAST_CLK_200 ,
    FAST_CLK_250=>FAST_CLK_250 ,
    FAST_CLK_250_90=>FAST_CLK_250_90 ,
    FAST_CLK_500=>FAST_CLK_500 ,
    FAST_CLK_500_90=>FAST_CLK_500_90 ,
    GlobalClock=>GlobalClock ,
    async_clk => async_clk 
);
U337_A_TRG_0 <= A_TRIG0;
U338_A_TRG_1 <= A_TRIG1;
U339_A_TRG_2 <= A_TRIG2;
U340_A_TRG_3 <= A_TRIG3;
U341_A_TRG_4 <= A_TRIG4;
U342_A_TRG_5 <= A_TRIG5;
U343_A_TRG_6 <= A_TRIG6;
U344_A_TRG_7 <= A_TRIG7;
U345_A_TRG_8 <= A_TRIG8;
U346_A_TRG_9 <= A_TRIG9;
U347_A_TRG_10 <= A_TRIG10;
U348_A_TRG_11 <= A_TRIG11;
U349_A_TRG_12 <= A_TRIG12;
U350_A_TRG_13 <= A_TRIG13;
U351_A_TRG_14 <= A_TRIG14;
U352_A_TRG_15 <= A_TRIG15;
U353_A_TRG_16 <= A_TRIG16;
U354_A_TRG_17 <= A_TRIG17;
U355_A_TRG_18 <= A_TRIG18;
U356_A_TRG_19 <= A_TRIG19;
U357_A_TRG_20 <= A_TRIG20;
U358_A_TRG_21 <= A_TRIG21;
U359_A_TRG_22 <= A_TRIG22;
U360_A_TRG_23 <= A_TRIG23;
U361_A_TRG_24 <= A_TRIG24;
U362_A_TRG_25 <= A_TRIG25;
U363_A_TRG_26 <= A_TRIG26;
U364_A_TRG_27 <= A_TRIG27;
U365_A_TRG_28 <= A_TRIG28;
U366_A_TRG_29 <= A_TRIG29;
U367_A_TRG_30 <= A_TRIG30;
U368_A_TRG_31 <= A_TRIG31;
U369_B_TRG_0 <= B_TRIG0;
U370_B_TRG_1 <= B_TRIG1;
U371_B_TRG_2 <= B_TRIG2;
U372_B_TRG_3 <= B_TRIG3;
U373_B_TRG_4 <= B_TRIG4;
U374_B_TRG_5 <= B_TRIG5;
U375_B_TRG_6 <= B_TRIG6;
U376_B_TRG_7 <= B_TRIG7;
U377_B_TRG_8 <= B_TRIG8;
U378_B_TRG_9 <= B_TRIG9;
U379_B_TRG_10 <= B_TRIG10;
U380_B_TRG_11 <= B_TRIG11;
U381_B_TRG_12 <= B_TRIG12;
U382_B_TRG_13 <= B_TRIG13;
U383_B_TRG_14 <= B_TRIG14;
U384_B_TRG_15 <= B_TRIG15;
U385_B_TRG_16 <= B_TRIG16;
U386_B_TRG_17 <= B_TRIG17;
U387_B_TRG_18 <= B_TRIG18;
U388_B_TRG_19 <= B_TRIG19;
U389_B_TRG_20 <= B_TRIG20;
U390_B_TRG_21 <= B_TRIG21;
U391_B_TRG_22 <= B_TRIG22;
U392_B_TRG_23 <= B_TRIG23;
U393_B_TRG_24 <= B_TRIG24;
U394_B_TRG_25 <= B_TRIG25;
U395_B_TRG_26 <= B_TRIG26;
U396_B_TRG_27 <= B_TRIG27;
U397_B_TRG_28 <= B_TRIG28;
U398_B_TRG_29 <= B_TRIG29;
U399_B_TRG_30 <= B_TRIG30;
U400_B_TRG_31 <= B_TRIG31;
U401_C_TRG_0 <= C_TRIG0;
U402_C_TRG_1 <= C_TRIG1;
U403_C_TRG_2 <= C_TRIG2;
U404_C_TRG_3 <= C_TRIG3;
U405_C_TRG_4 <= C_TRIG4;
U406_C_TRG_5 <= C_TRIG5;
U407_C_TRG_6 <= C_TRIG6;
U408_C_TRG_7 <= C_TRIG7;
U409_C_TRG_8 <= C_TRIG8;
U410_C_TRG_9 <= C_TRIG9;
U411_C_TRG_10 <= C_TRIG10;
U412_C_TRG_11 <= C_TRIG11;
U413_C_TRG_12 <= C_TRIG12;
U414_C_TRG_13 <= C_TRIG13;
U415_C_TRG_14 <= C_TRIG14;
U416_C_TRG_15 <= C_TRIG15;
U417_C_TRG_16 <= C_TRIG16;
U418_C_TRG_17 <= C_TRIG17;
U419_C_TRG_18 <= C_TRIG18;
U420_C_TRG_19 <= C_TRIG19;
U421_C_TRG_20 <= C_TRIG20;
U422_C_TRG_21 <= C_TRIG21;
U423_C_TRG_22 <= C_TRIG22;
U424_C_TRG_23 <= C_TRIG23;
U425_C_TRG_24 <= C_TRIG24;
U426_C_TRG_25 <= C_TRIG25;
U427_C_TRG_26 <= C_TRIG26;
U428_C_TRG_27 <= C_TRIG27;
U429_C_TRG_28 <= C_TRIG28;
U430_C_TRG_29 <= C_TRIG29;
U431_C_TRG_30 <= C_TRIG30;
U432_C_TRG_31 <= C_TRIG31;
U433_D_TRG_0 <= D_TRIG0;
U434_D_TRG_1 <= D_TRIG1;
U435_D_TRG_2 <= D_TRIG2;
U436_D_TRG_3 <= D_TRIG3;
U437_D_TRG_4 <= D_TRIG4;
U438_D_TRG_5 <= D_TRIG5;
U439_D_TRG_6 <= D_TRIG6;
U440_D_TRG_7 <= D_TRIG7;
U441_D_TRG_8 <= D_TRIG8;
U442_D_TRG_9 <= D_TRIG9;
U443_D_TRG_10 <= D_TRIG10;
U444_D_TRG_11 <= D_TRIG11;
U445_D_TRG_12 <= D_TRIG12;
U446_D_TRG_13 <= D_TRIG13;
U447_D_TRG_14 <= D_TRIG14;
U448_D_TRG_15 <= D_TRIG15;
U449_D_TRG_16 <= D_TRIG16;
U450_D_TRG_17 <= D_TRIG17;
U451_D_TRG_18 <= D_TRIG18;
U452_D_TRG_19 <= D_TRIG19;
U453_D_TRG_20 <= D_TRIG20;
U454_D_TRG_21 <= D_TRIG21;
U455_D_TRG_22 <= D_TRIG22;
U456_D_TRG_23 <= D_TRIG23;
U457_D_TRG_24 <= D_TRIG24;
U458_D_TRG_25 <= D_TRIG25;
U459_D_TRG_26 <= D_TRIG26;
U460_D_TRG_27 <= D_TRIG27;
U461_D_TRG_28 <= D_TRIG28;
U462_D_TRG_29 <= D_TRIG29;
U463_D_TRG_30 <= D_TRIG30;
U464_D_TRG_31 <= D_TRIG31;
U465 : PULSE_GENERATOR
PORT MAP(
	PULSE_OUT => U465_PULSE,
	PULSE_PERIOD => U466_out_0,
	PULSE_WIDTH => U467_CONST,
	CE => "1",
	CLK => GlobalClock,
	RESET => "0" );
U466_out_0 <= REG_FR_IFP_WR(31 downto 0);
U467_CONST <= conv_std_logic_vector(1,32);

U468 : block
begin
U468_out <= U465_PULSE when U498_out_0 = "00" else U480_vLEMO_7 when U498_out_0 = "01" else U484_OUT when U498_out_0 = "10" else U484_OUT when U498_out_0 = "11"  else (others=>'0');

end block;
U469_FR_FRAME_SIG <= variable_FR_FRAME_SIG;
U470_FR_FRAME_SIG <= variable_FR_FRAME_SIG;
U471_FR_FRAME_SIG <= variable_FR_FRAME_SIG;
U472_FR_FRAME_SIG <= variable_FR_FRAME_SIG;
U473_FR_FRAME_SIG <= variable_FR_FRAME_SIG;
U475 : d_latch
  Generic map(
	IN_SIZE => 	1,
	EDGE => 	"rising")
PORT MAP(
	a => U473_FR_FRAME_SIG,
	CE => '1',
	clk => GlobalClock(0),
	reset => '0',
	reset_val => "0",
	b => U475_OUT );
U476_A_TS <= variable_A_TS;
variable_FR_FRAME_SIG <= U478_out;
U478 : EDGE_DETECTOR_RE
    Generic map(bitSize => 1 )
    port map( 
        Reset => GlobalReset, 
        CE => "1",
        CLK => async_clk,
        PORT_IN => U468_out,
        PULSE_WIDTH => 1,
        PORT_OUT => U478_out
    );
variable_vLEMO_7 <= U197_LEMO_6_7_B_OUT;
U480_vLEMO_7 <= variable_vLEMO_7;
U481 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U488_OUT, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U478_out,
        ENABLE => "1",
        COUNTER => U481_counts,
        OVERFLOW => open
    );
U482 : EDGE_DETECTOR_RE
    Generic map(bitSize => 1 )
    port map( 
        Reset => GlobalReset, 
        CE => "1",
        CLK => async_clk,
        PORT_IN => U480_vLEMO_7,
        PULSE_WIDTH => 1,
        PORT_OUT => U482_out
    );
U483 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => GlobalReset, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U494_out,
        ENABLE => "1",
        COUNTER => U483_counts,
        OVERFLOW => open
    );
U484_OUT <= U485_OUT AND U465_PULSE;
U485 : comparator
  Generic map(
	IN_SIZE => 	32,
	IN_SIGN => 	"unsigned",
	REGISTER_OUT => 	"false",
	OPERATION => 	"smaller")
PORT MAP(
	in1 => U481_counts,
	in2 => U493_out_0,
	clk => GlobalClock(0),
	comp_out => U485_OUT );

U486 : block
begin
U486_out <= U487_RUN_START when U498_out_0 = "00" else U487_RUN_START when U498_out_0 = "01" else U494_out when U498_out_0 = "10" else U487_RUN_START when U498_out_0 = "11"  else (others=>'0');

end block;
U487_RUN_START <= variable_RUN_START;
U488_OUT <= U487_RUN_START OR U486_out;
variable_FT_CNT_EXT <= U483_counts;
variable_FT_CNT_WIN <= U481_counts;
U491_FT_CNT_EXT <= variable_FT_CNT_EXT;
U492_FT_CNT_WIN <= variable_FT_CNT_WIN;
U493_out_0 <= REG_FR_LIMIT_WR(31 downto 0);

U494 : block
begin
U494_out <= U501_const_bin when U498_out_0 = "00" else U501_const_bin when U498_out_0 = "01" else U482_out when U498_out_0 = "10" else U495_PULSE when U498_out_0 = "11"  else (others=>'0');

end block;
U495 : PULSE_GENERATOR
PORT MAP(
	PULSE_OUT => U495_PULSE,
	PULSE_PERIOD => U497_out_0,
	PULSE_WIDTH => U496_CONST,
	CE => "1",
	CLK => GlobalClock,
	RESET => "0" );
U496_CONST <= conv_std_logic_vector(1,32);
U497_out_0 <= REG_FR_IFP2_WR(31 downto 0);
U498_out_0 <= REG_FR_MODE_WR(1 downto 0);
PROCESS_REG_U499 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U499_hold <= EXT(U481_counts,32);
    end if;
end process;
REG_FR_DBG1_RD <= EXT(U481_counts,32);
PROCESS_REG_U500 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U500_hold <= EXT(U483_counts,32);
    end if;
end process;
REG_FR_DBG2_RD <= EXT(U483_counts,32);
U503 : U503_custompacket
  Generic map(
	memLength => 	32768,
	wordWidth => 	32)
PORT MAP(
	IN_1 => U333_C_0,
	IN_2 => U333_C_1,
	IN_3 => U333_C_2,
	IN_4 => U333_C_3,
	IN_5 => U333_C_4,
	IN_6 => U333_C_5,
	IN_7 => U333_C_6,
	IN_8 => U333_C_7,
	IN_9 => U333_C_8,
	IN_10 => U333_C_9,
	IN_11 => U333_C_10,
	IN_12 => U333_C_11,
	IN_13 => U333_C_12,
	IN_14 => U333_C_13,
	IN_15 => U333_C_14,
	IN_16 => U333_C_15,
	IN_17 => U333_C_16,
	IN_18 => U333_C_17,
	IN_19 => U333_C_18,
	IN_20 => U333_C_19,
	IN_21 => U333_C_20,
	IN_22 => U333_C_21,
	IN_23 => U333_C_22,
	IN_24 => U333_C_23,
	IN_25 => U333_C_24,
	IN_26 => U333_C_25,
	IN_27 => U333_C_26,
	IN_28 => U333_C_27,
	IN_29 => U333_C_28,
	IN_30 => U333_C_29,
	IN_31 => U333_C_30,
	IN_32 => U333_C_31,
	IN_33 => U335_C_0,
	IN_34 => U335_C_1,
	IN_35 => U335_C_2,
	IN_36 => U335_C_3,
	IN_37 => U335_C_4,
	IN_38 => U335_C_5,
	IN_39 => U335_C_6,
	IN_40 => U335_C_7,
	IN_41 => U335_C_8,
	IN_42 => U335_C_9,
	IN_43 => U335_C_10,
	IN_44 => U335_C_11,
	IN_45 => U335_C_12,
	IN_46 => U335_C_13,
	IN_47 => U335_C_14,
	IN_48 => U335_C_15,
	IN_49 => U335_C_16,
	IN_50 => U335_C_17,
	IN_51 => U335_C_18,
	IN_52 => U335_C_19,
	IN_53 => U335_C_20,
	IN_54 => U335_C_21,
	IN_55 => U335_C_22,
	IN_56 => U335_C_23,
	IN_57 => U335_C_24,
	IN_58 => U335_C_25,
	IN_59 => U335_C_26,
	IN_60 => U335_C_27,
	IN_61 => U335_C_28,
	IN_62 => U335_C_29,
	IN_63 => U335_C_30,
	IN_64 => U335_C_31,
	IN_65 => U334_C_0,
	IN_66 => U334_C_1,
	IN_67 => U334_C_2,
	IN_68 => U334_C_3,
	IN_69 => U334_C_4,
	IN_70 => U334_C_5,
	IN_71 => U334_C_6,
	IN_72 => U334_C_7,
	IN_73 => U334_C_8,
	IN_74 => U334_C_9,
	IN_75 => U334_C_10,
	IN_76 => U334_C_11,
	IN_77 => U334_C_12,
	IN_78 => U334_C_13,
	IN_79 => U334_C_14,
	IN_80 => U334_C_15,
	IN_81 => U334_C_16,
	IN_82 => U334_C_17,
	IN_83 => U334_C_18,
	IN_84 => U334_C_19,
	IN_85 => U334_C_20,
	IN_86 => U334_C_21,
	IN_87 => U334_C_22,
	IN_88 => U334_C_23,
	IN_89 => U334_C_24,
	IN_90 => U334_C_25,
	IN_91 => U334_C_26,
	IN_92 => U334_C_27,
	IN_93 => U334_C_28,
	IN_94 => U334_C_29,
	IN_95 => U334_C_30,
	IN_96 => U334_C_31,
	IN_97 => U336_C_0,
	IN_98 => U336_C_1,
	IN_99 => U336_C_2,
	IN_100 => U336_C_3,
	IN_101 => U336_C_4,
	IN_102 => U336_C_5,
	IN_103 => U336_C_6,
	IN_104 => U336_C_7,
	IN_105 => U336_C_8,
	IN_106 => U336_C_9,
	IN_107 => U336_C_10,
	IN_108 => U336_C_11,
	IN_109 => U336_C_12,
	IN_110 => U336_C_13,
	IN_111 => U336_C_14,
	IN_112 => U336_C_15,
	IN_113 => U336_C_16,
	IN_114 => U336_C_17,
	IN_115 => U336_C_18,
	IN_116 => U336_C_19,
	IN_117 => U336_C_20,
	IN_118 => U336_C_21,
	IN_119 => U336_C_22,
	IN_120 => U336_C_23,
	IN_121 => U336_C_24,
	IN_122 => U336_C_25,
	IN_123 => U336_C_26,
	IN_124 => U336_C_27,
	IN_125 => U336_C_28,
	IN_126 => U336_C_29,
	IN_127 => U336_C_30,
	IN_128 => U336_C_31,
	IN_129 => U476_A_TS,
	IN_130 => U491_FT_CNT_EXT,
	IN_131 => U492_FT_CNT_WIN,
	TRIG => U475_OUT,
	CLK_WRITE => CLK_ACQ,
	SYNC_TRIG => "0",
	SYNC_RESET => "0",
	SYNC_CLK => "0",
	BUSY => open,
	FIFO_FULL => open,
	RESET => "0",
	CLK_READ => BUS_CLK,
	READ_DATA => BUS_CP_0_READ_DATA,
	READ_DATAVALID => BUS_CP_0_VLD,
	READ_RD_INT => BUS_CP_0_R_INT,
	READ_STATUS => REG_CP_0_READ_STATUS_RD,
	READ_VALID_WORDS => REG_CP_0_READ_VALID_WORDS_RD,
	CONFIG => REG_CP_0_CONFIG_WR );

		 
end Behavioral;

 