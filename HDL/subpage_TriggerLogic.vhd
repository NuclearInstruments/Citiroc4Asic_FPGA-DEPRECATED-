library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;



entity SUBPAGE_TriggerLogic is
    Port (	
		EXT_TRIG : in std_logic_vector(0 downto 0);
GLB_TRIG : in std_logic_vector(0 downto 0);
SELF_TRIG : in std_logic_vector(0 downto 0);
SEL_TRIG : in std_logic_vector(2 downto 0);
EN_VETO : in std_logic_vector(0 downto 0);
SW_VETO : in std_logic_vector(0 downto 0);
EXT_VETO : in std_logic_vector(0 downto 0);
TRIG_OUT : out std_logic_vector(0 downto 0);
TRIG_T : in std_logic_vector(0 downto 0);
TRIG_C : in std_logic_vector(0 downto 0);

		async_clk : in std_logic_vector (0 downto 0);
		CLK_ACQ : in std_logic_vector (0 downto 0);
		BUS_CLK : in std_logic_vector (0 downto 0);
		CLK_40 : in std_logic_vector (0 downto 0);
		CLK_80 : in std_logic_vector (0 downto 0);
		clk_160 : in std_logic_vector (0 downto 0);
		clk_320 : in std_logic_vector (0 downto 0);
		FAST_CLK_100 : in std_logic_vector (0 downto 0);
		FAST_CLK_200 : in std_logic_vector (0 downto 0);
		FAST_CLK_250 : in std_logic_vector (0 downto 0);
		FAST_CLK_250_90 : in std_logic_vector (0 downto 0);
		FAST_CLK_500 : in std_logic_vector (0 downto 0);
		FAST_CLK_500_90 : in std_logic_vector (0 downto 0);
		GlobalClock : in std_logic_vector (0 downto 0);
		GlobalReset : in std_logic_vector (0 downto 0)
		
 );
end SUBPAGE_TriggerLogic;

architecture Behavioral of SUBPAGE_TriggerLogic is
signal U0_out : std_logic_vector(0 downto 0);
signal U1_EXT_TRIG : std_logic_vector(0 downto 0);
signal U2_GLB_TRIG : std_logic_vector(0 downto 0);
signal U3_SELF_TRIG : std_logic_vector(0 downto 0);
signal U4_SEL_TRIG : std_logic_vector(2 downto 0);
signal U5_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U6_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U7_EN_VETO : std_logic_vector(0 downto 0);
signal U8_SW_VETO : std_logic_vector(0 downto 0);
signal U9_EXT_VETO : std_logic_vector(0 downto 0);
signal U10_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);
signal U12_TRIG_T : std_logic_vector(0 downto 0);
signal U13_TRIG_C : std_logic_vector(0 downto 0);

begin

U0 : block
begin
U0_out <= U12_TRIG_T when U4_SEL_TRIG = "000" else U13_TRIG_C when U4_SEL_TRIG = "001" else U1_EXT_TRIG when U4_SEL_TRIG = "010" else U2_GLB_TRIG when U4_SEL_TRIG = "011" else U3_SELF_TRIG when U4_SEL_TRIG = "100"  else (others=>'0');

end block;
U1_EXT_TRIG <= EXT_TRIG;
U2_GLB_TRIG <= GLB_TRIG;
U3_SELF_TRIG <= SELF_TRIG;
U4_SEL_TRIG <= SEL_TRIG;
U5_OUT <= U0_out AND ( NOT sxt(U10_OUT,1));
U6_OUT <= U7_EN_VETO AND U9_EXT_VETO;
U7_EN_VETO <= EN_VETO;
U8_SW_VETO <= SW_VETO;
U9_EXT_VETO <= EXT_VETO;
U10_OUT <= U6_OUT OR U8_SW_VETO;
TRIG_OUT <= U5_OUT;
U12_TRIG_T <= TRIG_T;
U13_TRIG_C <= TRIG_C;

end Behavioral;
