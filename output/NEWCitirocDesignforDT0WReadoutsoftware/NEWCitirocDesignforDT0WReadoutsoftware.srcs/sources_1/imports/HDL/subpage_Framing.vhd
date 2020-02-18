library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;



entity SUBPAGE_Framing is
    Port (	
		T_0 : in std_logic_vector(0 downto 0);
T_1 : in std_logic_vector(0 downto 0);
T_2 : in std_logic_vector(0 downto 0);
T_3 : in std_logic_vector(0 downto 0);
T_4 : in std_logic_vector(0 downto 0);
T_5 : in std_logic_vector(0 downto 0);
T_6 : in std_logic_vector(0 downto 0);
T_7 : in std_logic_vector(0 downto 0);
T_8 : in std_logic_vector(0 downto 0);
T_9 : in std_logic_vector(0 downto 0);
T_10 : in std_logic_vector(0 downto 0);
T_11 : in std_logic_vector(0 downto 0);
T_12 : in std_logic_vector(0 downto 0);
T_13 : in std_logic_vector(0 downto 0);
T_14 : in std_logic_vector(0 downto 0);
T_15 : in std_logic_vector(0 downto 0);
T_16 : in std_logic_vector(0 downto 0);
T_17 : in std_logic_vector(0 downto 0);
T_18 : in std_logic_vector(0 downto 0);
T_19 : in std_logic_vector(0 downto 0);
T_20 : in std_logic_vector(0 downto 0);
T_21 : in std_logic_vector(0 downto 0);
T_22 : in std_logic_vector(0 downto 0);
T_23 : in std_logic_vector(0 downto 0);
T_24 : in std_logic_vector(0 downto 0);
T_25 : in std_logic_vector(0 downto 0);
T_26 : in std_logic_vector(0 downto 0);
T_27 : in std_logic_vector(0 downto 0);
T_28 : in std_logic_vector(0 downto 0);
T_29 : in std_logic_vector(0 downto 0);
T_30 : in std_logic_vector(0 downto 0);
T_31 : in std_logic_vector(0 downto 0);
C_0 : out std_logic_vector(31 downto 0);
C_1 : out std_logic_vector(31 downto 0);
C_2 : out std_logic_vector(31 downto 0);
C_3 : out std_logic_vector(31 downto 0);
C_4 : out std_logic_vector(31 downto 0);
C_5 : out std_logic_vector(31 downto 0);
C_6 : out std_logic_vector(31 downto 0);
C_7 : out std_logic_vector(31 downto 0);
C_8 : out std_logic_vector(31 downto 0);
C_9 : out std_logic_vector(31 downto 0);
C_10 : out std_logic_vector(31 downto 0);
C_11 : out std_logic_vector(31 downto 0);
C_12 : out std_logic_vector(31 downto 0);
C_13 : out std_logic_vector(31 downto 0);
C_14 : out std_logic_vector(31 downto 0);
C_15 : out std_logic_vector(31 downto 0);
C_16 : out std_logic_vector(31 downto 0);
C_17 : out std_logic_vector(31 downto 0);
C_18 : out std_logic_vector(31 downto 0);
C_19 : out std_logic_vector(31 downto 0);
C_20 : out std_logic_vector(31 downto 0);
C_21 : out std_logic_vector(31 downto 0);
C_22 : out std_logic_vector(31 downto 0);
C_23 : out std_logic_vector(31 downto 0);
C_24 : out std_logic_vector(31 downto 0);
C_25 : out std_logic_vector(31 downto 0);
C_26 : out std_logic_vector(31 downto 0);
C_27 : out std_logic_vector(31 downto 0);
C_28 : out std_logic_vector(31 downto 0);
C_29 : out std_logic_vector(31 downto 0);
C_30 : out std_logic_vector(31 downto 0);
C_31 : out std_logic_vector(31 downto 0);
FRAME : in std_logic_vector(0 downto 0);

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
end SUBPAGE_Framing;

architecture Behavioral of SUBPAGE_Framing is
signal U0_T_0 : std_logic_vector(0 downto 0);
signal U1_T_1 : std_logic_vector(0 downto 0);
signal U2_T_2 : std_logic_vector(0 downto 0);
signal U3_T_3 : std_logic_vector(0 downto 0);
signal U4_T_4 : std_logic_vector(0 downto 0);
signal U5_T_5 : std_logic_vector(0 downto 0);
signal U6_T_6 : std_logic_vector(0 downto 0);
signal U7_T_7 : std_logic_vector(0 downto 0);
signal U8_T_8 : std_logic_vector(0 downto 0);
signal U9_T_9 : std_logic_vector(0 downto 0);
signal U10_T_10 : std_logic_vector(0 downto 0);
signal U11_T_11 : std_logic_vector(0 downto 0);
signal U12_T_12 : std_logic_vector(0 downto 0);
signal U13_T_13 : std_logic_vector(0 downto 0);
signal U14_T_14 : std_logic_vector(0 downto 0);
signal U15_T_15 : std_logic_vector(0 downto 0);
signal U16_T_16 : std_logic_vector(0 downto 0);
signal U17_T_17 : std_logic_vector(0 downto 0);
signal U18_T_18 : std_logic_vector(0 downto 0);
signal U19_T_19 : std_logic_vector(0 downto 0);
signal U20_T_20 : std_logic_vector(0 downto 0);
signal U21_T_21 : std_logic_vector(0 downto 0);
signal U22_T_22 : std_logic_vector(0 downto 0);
signal U23_T_23 : std_logic_vector(0 downto 0);
signal U24_T_24 : std_logic_vector(0 downto 0);
signal U25_T_25 : std_logic_vector(0 downto 0);
signal U26_T_26 : std_logic_vector(0 downto 0);
signal U27_T_27 : std_logic_vector(0 downto 0);
signal U28_T_28 : std_logic_vector(0 downto 0);
signal U29_T_29 : std_logic_vector(0 downto 0);
signal U30_T_30 : std_logic_vector(0 downto 0);
signal U31_T_31 : std_logic_vector(0 downto 0);
signal U32_CNT : std_logic_vector(31 downto 0);

COMPONENT SUBPAGE_frameproc
PORT(
	T : IN std_logic_vector(0 downto 0);
	FR : IN std_logic_vector(0 downto 0);
	CNT : OUT std_logic_vector(31 downto 0);
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
signal U33_CNT : std_logic_vector(31 downto 0);
signal U34_CNT : std_logic_vector(31 downto 0);
signal U35_CNT : std_logic_vector(31 downto 0);
signal U36_CNT : std_logic_vector(31 downto 0);
signal U37_CNT : std_logic_vector(31 downto 0);
signal U38_CNT : std_logic_vector(31 downto 0);
signal U39_CNT : std_logic_vector(31 downto 0);
signal U40_CNT : std_logic_vector(31 downto 0);
signal U41_CNT : std_logic_vector(31 downto 0);
signal U42_CNT : std_logic_vector(31 downto 0);
signal U43_CNT : std_logic_vector(31 downto 0);
signal U44_CNT : std_logic_vector(31 downto 0);
signal U45_CNT : std_logic_vector(31 downto 0);
signal U46_CNT : std_logic_vector(31 downto 0);
signal U47_CNT : std_logic_vector(31 downto 0);
signal U48_CNT : std_logic_vector(31 downto 0);
signal U49_CNT : std_logic_vector(31 downto 0);
signal U50_CNT : std_logic_vector(31 downto 0);
signal U51_CNT : std_logic_vector(31 downto 0);
signal U52_CNT : std_logic_vector(31 downto 0);
signal U53_CNT : std_logic_vector(31 downto 0);
signal U54_CNT : std_logic_vector(31 downto 0);
signal U55_CNT : std_logic_vector(31 downto 0);
signal U56_CNT : std_logic_vector(31 downto 0);
signal U57_CNT : std_logic_vector(31 downto 0);
signal U58_CNT : std_logic_vector(31 downto 0);
signal U59_CNT : std_logic_vector(31 downto 0);
signal U60_CNT : std_logic_vector(31 downto 0);
signal U61_CNT : std_logic_vector(31 downto 0);
signal U62_CNT : std_logic_vector(31 downto 0);
signal U63_CNT : std_logic_vector(31 downto 0);
signal U96_FRAME : std_logic_vector(0 downto 0);

begin
U0_T_0 <= T_0;
U1_T_1 <= T_1;
U2_T_2 <= T_2;
U3_T_3 <= T_3;
U4_T_4 <= T_4;
U5_T_5 <= T_5;
U6_T_6 <= T_6;
U7_T_7 <= T_7;
U8_T_8 <= T_8;
U9_T_9 <= T_9;
U10_T_10 <= T_10;
U11_T_11 <= T_11;
U12_T_12 <= T_12;
U13_T_13 <= T_13;
U14_T_14 <= T_14;
U15_T_15 <= T_15;
U16_T_16 <= T_16;
U17_T_17 <= T_17;
U18_T_18 <= T_18;
U19_T_19 <= T_19;
U20_T_20 <= T_20;
U21_T_21 <= T_21;
U22_T_22 <= T_22;
U23_T_23 <= T_23;
U24_T_24 <= T_24;
U25_T_25 <= T_25;
U26_T_26 <= T_26;
U27_T_27 <= T_27;
U28_T_28 <= T_28;
U29_T_29 <= T_29;
U30_T_30 <= T_30;
U31_T_31 <= T_31;

U32:SUBPAGE_frameproc
PORT MAP(
	T => U0_T_0,
	FR => U96_FRAME,
	CNT => U32_CNT,
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

U33:SUBPAGE_frameproc
PORT MAP(
	T => U1_T_1,
	FR => U96_FRAME,
	CNT => U33_CNT,
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

U34:SUBPAGE_frameproc
PORT MAP(
	T => U2_T_2,
	FR => U96_FRAME,
	CNT => U34_CNT,
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

U35:SUBPAGE_frameproc
PORT MAP(
	T => U3_T_3,
	FR => U96_FRAME,
	CNT => U35_CNT,
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

U36:SUBPAGE_frameproc
PORT MAP(
	T => U4_T_4,
	FR => U96_FRAME,
	CNT => U36_CNT,
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

U37:SUBPAGE_frameproc
PORT MAP(
	T => U5_T_5,
	FR => U96_FRAME,
	CNT => U37_CNT,
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

U38:SUBPAGE_frameproc
PORT MAP(
	T => U6_T_6,
	FR => U96_FRAME,
	CNT => U38_CNT,
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

U39:SUBPAGE_frameproc
PORT MAP(
	T => U7_T_7,
	FR => U96_FRAME,
	CNT => U39_CNT,
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

U40:SUBPAGE_frameproc
PORT MAP(
	T => U8_T_8,
	FR => U96_FRAME,
	CNT => U40_CNT,
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

U41:SUBPAGE_frameproc
PORT MAP(
	T => U9_T_9,
	FR => U96_FRAME,
	CNT => U41_CNT,
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

U42:SUBPAGE_frameproc
PORT MAP(
	T => U10_T_10,
	FR => U96_FRAME,
	CNT => U42_CNT,
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

U43:SUBPAGE_frameproc
PORT MAP(
	T => U11_T_11,
	FR => U96_FRAME,
	CNT => U43_CNT,
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

U44:SUBPAGE_frameproc
PORT MAP(
	T => U12_T_12,
	FR => U96_FRAME,
	CNT => U44_CNT,
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

U45:SUBPAGE_frameproc
PORT MAP(
	T => U13_T_13,
	FR => U96_FRAME,
	CNT => U45_CNT,
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

U46:SUBPAGE_frameproc
PORT MAP(
	T => U14_T_14,
	FR => U96_FRAME,
	CNT => U46_CNT,
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

U47:SUBPAGE_frameproc
PORT MAP(
	T => U15_T_15,
	FR => U96_FRAME,
	CNT => U47_CNT,
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

U48:SUBPAGE_frameproc
PORT MAP(
	T => U16_T_16,
	FR => U96_FRAME,
	CNT => U48_CNT,
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

U49:SUBPAGE_frameproc
PORT MAP(
	T => U17_T_17,
	FR => U96_FRAME,
	CNT => U49_CNT,
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

U50:SUBPAGE_frameproc
PORT MAP(
	T => U18_T_18,
	FR => U96_FRAME,
	CNT => U50_CNT,
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

U51:SUBPAGE_frameproc
PORT MAP(
	T => U19_T_19,
	FR => U96_FRAME,
	CNT => U51_CNT,
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

U52:SUBPAGE_frameproc
PORT MAP(
	T => U20_T_20,
	FR => U96_FRAME,
	CNT => U52_CNT,
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

U53:SUBPAGE_frameproc
PORT MAP(
	T => U21_T_21,
	FR => U96_FRAME,
	CNT => U53_CNT,
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

U54:SUBPAGE_frameproc
PORT MAP(
	T => U22_T_22,
	FR => U96_FRAME,
	CNT => U54_CNT,
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

U55:SUBPAGE_frameproc
PORT MAP(
	T => U23_T_23,
	FR => U96_FRAME,
	CNT => U55_CNT,
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

U56:SUBPAGE_frameproc
PORT MAP(
	T => U24_T_24,
	FR => U96_FRAME,
	CNT => U56_CNT,
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

U57:SUBPAGE_frameproc
PORT MAP(
	T => U25_T_25,
	FR => U96_FRAME,
	CNT => U57_CNT,
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

U58:SUBPAGE_frameproc
PORT MAP(
	T => U26_T_26,
	FR => U96_FRAME,
	CNT => U58_CNT,
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

U59:SUBPAGE_frameproc
PORT MAP(
	T => U27_T_27,
	FR => U96_FRAME,
	CNT => U59_CNT,
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

U60:SUBPAGE_frameproc
PORT MAP(
	T => U28_T_28,
	FR => U96_FRAME,
	CNT => U60_CNT,
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

U61:SUBPAGE_frameproc
PORT MAP(
	T => U29_T_29,
	FR => U96_FRAME,
	CNT => U61_CNT,
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

U62:SUBPAGE_frameproc
PORT MAP(
	T => U30_T_30,
	FR => U96_FRAME,
	CNT => U62_CNT,
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

U63:SUBPAGE_frameproc
PORT MAP(
	T => U31_T_31,
	FR => U96_FRAME,
	CNT => U63_CNT,
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
C_0 <= U32_CNT;
C_1 <= U33_CNT;
C_2 <= U34_CNT;
C_3 <= U35_CNT;
C_4 <= U36_CNT;
C_5 <= U37_CNT;
C_6 <= U38_CNT;
C_7 <= U39_CNT;
C_8 <= U40_CNT;
C_9 <= U41_CNT;
C_10 <= U42_CNT;
C_11 <= U43_CNT;
C_12 <= U44_CNT;
C_13 <= U45_CNT;
C_14 <= U46_CNT;
C_15 <= U47_CNT;
C_16 <= U48_CNT;
C_17 <= U49_CNT;
C_18 <= U50_CNT;
C_19 <= U51_CNT;
C_20 <= U52_CNT;
C_21 <= U53_CNT;
C_22 <= U54_CNT;
C_23 <= U55_CNT;
C_24 <= U56_CNT;
C_25 <= U57_CNT;
C_26 <= U58_CNT;
C_27 <= U59_CNT;
C_28 <= U60_CNT;
C_29 <= U61_CNT;
C_30 <= U62_CNT;
C_31 <= U63_CNT;
U96_FRAME <= FRAME;

end Behavioral;
