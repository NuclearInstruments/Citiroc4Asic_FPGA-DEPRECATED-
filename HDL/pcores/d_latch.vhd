library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity d_latch is
   Generic (
        IN_SIZE : integer := 16;
        EDGE : STRING := "rising"
        );
    Port ( a : in STD_LOGIC_VECTOR (IN_SIZE-1 downto 0);
           b : out STD_LOGIC_VECTOR (IN_SIZE-1 downto 0);
           ce : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           reset_val : in STD_LOGIC_VECTOR (IN_SIZE-1 downto 0));
end d_latch;

architecture Behavioral of d_latch is

begin


IF_rising:
   if EDGE = "rising" generate
      begin
        latch : process(clk)
        begin
            if reset ='1' then
                b <= reset_val;
            elsif rising_edge(clk) and ce='1' then
                b <= a;
            end if;
        end process;
end generate;



IF_falling:
   if EDGE = "falling" generate
      begin
        latch : process(clk)
        begin
            if reset ='1' then
                b <= reset_val;
            elsif falling_edge(clk) and ce='1' then
                b <= a;
            end if;
        end process;
end generate;
        
end Behavioral;
