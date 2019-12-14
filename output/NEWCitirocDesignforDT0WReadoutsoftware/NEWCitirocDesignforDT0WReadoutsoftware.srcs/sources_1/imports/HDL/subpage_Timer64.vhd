library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;



entity SUBPAGE_Timer64 is
    Port (	
		Enable : in std_logic_vector(0 downto 0);
Reset : in std_logic_vector(0 downto 0);
TIME_LSB : out std_logic_vector(31 downto 0);
TIME_MSB : out std_logic_vector(31 downto 0);

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
end SUBPAGE_Timer64;

architecture Behavioral of SUBPAGE_Timer64 is
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
signal U0_counts : std_logic_vector(31 downto 0) := (others => '0');
Component CHRONO_ENABLE Is
   Generic(bitSize : Integer := 1);
   port(        RESET :  IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CE: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CLK: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        ENABLE: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        TIMEMES: OUT STD_LOGIC_VECTOR (31 downto 0);
        AUTORESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        RUNNING: OUT STD_LOGIC_VECTOR (0 DOWNTO 0);
        OVERFLOW: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
End component;
signal U1_overflow : std_logic_vector(0 downto 0) := (others => '0');
signal U1_time : std_logic_vector(31 downto 0) := (others => '0');
signal U2_Enable : std_logic_vector(0 downto 0);
signal U3_Reset : std_logic_vector(0 downto 0);

begin
U0 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U3_Reset, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U1_overflow,
        ENABLE => "1",
        COUNTER => U0_counts,
        OVERFLOW => open
    );
U1 : CHRONO_ENABLE
    Generic map(bitSize => 32 )
    port map( 
        RESET => U3_Reset, 
        CE => "1",
        CLK => async_clk,
        ENABLE => U2_Enable,
        TIMEMES => U1_time,
        AUTORESET => "0",
        RUNNING => open,
        OVERFLOW => U1_overflow
    );
U2_Enable <= Enable;
U3_Reset <= Reset;
TIME_LSB <= U1_time;
TIME_MSB <= U0_counts;

end Behavioral;
