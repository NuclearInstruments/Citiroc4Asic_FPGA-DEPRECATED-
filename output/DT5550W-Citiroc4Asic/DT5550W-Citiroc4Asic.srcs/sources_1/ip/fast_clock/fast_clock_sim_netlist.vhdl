-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Wed Jun 19 13:31:39 2019
-- Host        : ABBA-NI running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               C:/OpenHardware/UserProject/DT5550W-Citiroc4Asic/output/DT5550W-Citiroc4Asic/DT5550W-Citiroc4Asic.srcs/sources_1/ip/fast_clock/fast_clock_sim_netlist.vhdl
-- Design      : fast_clock
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k160tffg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fast_clockfast_clock_clk_wiz is
  port (
    clk_100 : out STD_LOGIC;
    clk_200 : out STD_LOGIC;
    clk_250 : out STD_LOGIC;
    clk_250_90 : out STD_LOGIC;
    clk_500 : out STD_LOGIC;
    clk_500_90 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fast_clockfast_clock_clk_wiz : entity is "fast_clock_clk_wiz";
end fast_clockfast_clock_clk_wiz;

architecture STRUCTURE of fast_clockfast_clock_clk_wiz is
  signal clk_100_fast_clock : STD_LOGIC;
  signal clk_200_fast_clock : STD_LOGIC;
  signal clk_250_90_fast_clock : STD_LOGIC;
  signal clk_250_fast_clock : STD_LOGIC;
  signal clk_500_90_fast_clock : STD_LOGIC;
  signal clk_500_fast_clock : STD_LOGIC;
  signal clkfbout_buf_fast_clock : STD_LOGIC;
  signal clkfbout_fast_clock : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkf_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout2_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout3_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout4_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout5_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout6_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of mmcm_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_fast_clock,
      O => clkfbout_buf_fast_clock
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_100_fast_clock,
      O => clk_100
    );
clkout2_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_200_fast_clock,
      O => clk_200
    );
clkout3_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_250_fast_clock,
      O => clk_250
    );
clkout4_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_250_90_fast_clock,
      O => clk_250_90
    );
clkout5_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_500_fast_clock,
      O => clk_500
    );
clkout6_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_500_90_fast_clock,
      O => clk_500_90
    );
mmcm_adv_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 12.500000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 12.500000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 10.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 5,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => false,
      CLKOUT2_DIVIDE => 4,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => false,
      CLKOUT3_DIVIDE => 4,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 90.000000,
      CLKOUT3_USE_FINE_PS => false,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 2,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => false,
      CLKOUT5_DIVIDE => 2,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 90.000000,
      CLKOUT5_USE_FINE_PS => false,
      CLKOUT6_DIVIDE => 1,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      CLKOUT6_USE_FINE_PS => false,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 1,
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => false
    )
        port map (
      CLKFBIN => clkfbout_buf_fast_clock,
      CLKFBOUT => clkfbout_fast_clock,
      CLKFBOUTB => NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => clk_in1,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => clk_100_fast_clock,
      CLKOUT0B => NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => clk_200_fast_clock,
      CLKOUT1B => NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => clk_250_fast_clock,
      CLKOUT2B => NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => clk_250_90_fast_clock,
      CLKOUT3B => NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => clk_500_fast_clock,
      CLKOUT5 => clk_500_90_fast_clock,
      CLKOUT6 => NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_mmcm_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_mmcm_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => locked,
      PSCLK => '0',
      PSDONE => NLW_mmcm_adv_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fast_clock is
  port (
    clk_100 : out STD_LOGIC;
    clk_200 : out STD_LOGIC;
    clk_250 : out STD_LOGIC;
    clk_250_90 : out STD_LOGIC;
    clk_500 : out STD_LOGIC;
    clk_500_90 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of fast_clock : entity is true;
end fast_clock;

architecture STRUCTURE of fast_clock is
begin
inst: entity work.fast_clockfast_clock_clk_wiz
     port map (
      clk_100 => clk_100,
      clk_200 => clk_200,
      clk_250 => clk_250,
      clk_250_90 => clk_250_90,
      clk_500 => clk_500,
      clk_500_90 => clk_500_90,
      clk_in1 => clk_in1,
      locked => locked,
      reset => reset
    );
end STRUCTURE;
