------------------------------------------------------------------
--						Nuclear Instruments						--
--																--
--							SciCompiler							--
--																--
--	Module:				EDGE DETECTOR (POSITIVE)				--
--	Version:			1.0										--
--	Creation Data:		13-07-2017								--
--																--
--																--
------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
--Library UNISIM;
--use UNISIM.vcomponents.all;


entity EDGE_DETECTOR_RE is
  Generic (bitSize : integer := 1);
  port (
	RESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CLK : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	PORT_IN: IN STD_LOGIC_VECTOR(bitSize-1 DOWNTO 0);
	PULSE_WIDTH: IN INTEGER;
	PORT_OUT: OUT STD_LOGIC_VECTOR(bitSize-1 DOWNTO 0)
	);
end;


architecture Behavioral of EDGE_DETECTOR_RE is
	signal I_PORT_IN :  STD_LOGIC_VECTOR(bitSize-1 DOWNTO 0) := (others => '0');
	signal O_PORT_IN : STD_LOGIC_VECTOR(bitSize-1 DOWNTO 0) := (others => '0');
	signal iPULSEWIDTH : INTEGER := 0;
	signal oPULSEWIDTH : INTEGER := 0;
	type INT_ARRAY is array (integer range <>) of integer;
	signal COUNTERS: INT_ARRAY(0 to bitSize-1) := (others => 0);
    signal int_reset : std_logic := '0';
begin

CDC : process(CLK,RESET)
begin
    if rising_edge(CLK(0)) then
	   iPULSEWIDTH <= PULSE_WIDTH-1;
	   oPULSEWIDTH <= iPULSEWIDTH;
	   if iPULSEWIDTH /= oPULSEWIDTH then
	       int_reset <= '1';
	   else
    	   int_reset <= '0';
       end if;
	end if;
end process;

GEN_EDGE: for I in 0 to bitSize-1 generate
	edge_process: process(CLK,RESET)
	begin
        if RESET(0) = '1' or int_reset ='1' then
            COUNTERS(I) <= 0;
            PORT_OUT(I) <= '0'; 
        else
            if rising_edge(CLK(0)) and CE="1" then
                I_PORT_IN(I) <= PORT_IN(I);
                O_PORT_IN(I) <= I_PORT_IN(I);
                if (I_PORT_IN(I) = '1' and O_PORT_IN(I) = '0') then
                    COUNTERS(I) <= iPULSEWIDTH;
                    PORT_OUT(I) <= '1'; 
                else
                    if COUNTERS(I) = 0 then
                        PORT_OUT(I) <= '0'; 
                    else
                        COUNTERS(I) <= COUNTERS(I) -1;
                    end if;
                end if;
            end if;
        end if;
    end process;
end generate GEN_EDGE;	
end Behavioral; 