library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;



entity SUBPAGE_frameproc is
    Port (	
		T : in std_logic_vector(0 downto 0);
FR : in std_logic_vector(0 downto 0);
CNT : out std_logic_vector(31 downto 0);

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
end SUBPAGE_frameproc;

architecture Behavioral of SUBPAGE_frameproc is
signal U0_T : std_logic_vector(0 downto 0);
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
signal U1_counts : std_logic_vector(31 downto 0) := (others => '0');
signal U3_OUT : STD_LOGIC_VECTOR (31 DOWNTO 0);
COMPONENT d_latch
  GENERIC( 
	IN_SIZE : INTEGER := 32;
	EDGE : STRING := "rising" );
PORT( 
	a : in STD_LOGIC_VECTOR(IN_SIZE-1 downto 0);
	CE : in STD_LOGIC;
	clk : in STD_LOGIC;
	reset : in STD_LOGIC;
	reset_val : in STD_LOGIC_VECTOR(IN_SIZE-1 downto 0);
	b : out STD_LOGIC_VECTOR(IN_SIZE-1 downto 0) );
END COMPONENT;
signal U4_FR : std_logic_vector(0 downto 0);
signal U7_OUT : STD_LOGIC_VECTOR (0 DOWNTO 0);

begin
U0_T <= T;
U1 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U7_OUT, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U0_T,
        ENABLE => "1",
        COUNTER => U1_counts,
        OVERFLOW => open
    );
U3 : d_latch
  Generic map(
	IN_SIZE => 	32,
	EDGE => 	"rising")
PORT MAP(
	a => U1_counts,
	CE => U4_FR(0),
	clk => GlobalClock(0),
	reset => '0',
	reset_val => "00000000000000000000000000000000",
	b => U3_OUT );
U4_FR <= FR;
CNT <= U3_OUT;
U7 : d_latch
  Generic map(
	IN_SIZE => 	1,
	EDGE => 	"rising")
PORT MAP(
	a => U4_FR,
	CE => '1',
	clk => GlobalClock(0),
	reset => '0',
	reset_val => "0",
	b => U7_OUT );

end Behavioral;
