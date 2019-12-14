------------------------------------------------------------------
--						Nuclear Instruments						--
--																--
--							SciCompiler							--
--																--
--	Module:				TIMER CHRONOMETER ENABLE  				--
--	Version:			1.0										--
--	Creation Data:		21-07-2017								--
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


entity CHRONO_ENABLE is
  Generic (bitSize : integer := 1);
  port (
	RESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CLK : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
    ENABLE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	TIMEMES: OUT STD_LOGIC_VECTOR (bitSize-1 downto 0);
	AUTORESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	OVERFLOW: OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
	RUNNING: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
	);
end;


architecture Behavioral of CHRONO_ENABLE is
    signal COUNTER_REGISTER : STD_LOGIC_VECTOR (bitSize-1 downto 0) := (others => '0');
    signal LASTBITCOUNTER : std_logic := '0';
    signal iENABLE : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
	signal oENABLE : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
begin

    TiMEMES <= COUNTER_REGISTER;
    OVERFLOW(0) <= LASTBITCOUNTER and (not COUNTER_REGISTER(bitSize-1));
    
	timer_process: process(CLK,RESET)
	begin
        if RESET(0) = '1' then
            COUNTER_REGISTER <= (others => '0'); 
            RUNNING <= "0";
	        iENABLE <= "0";
			oENABLE <= "0";
        else
            if rising_edge(CLK(0)) and CE = "1"  then
		        iENABLE <= ENABLE;
				oENABLE <= iENABLE;
		        LASTBITCOUNTER <= COUNTER_REGISTER(bitSize-1);
				
				RUNNING <= "0";
                if iENABLE(0) = '1' then
                   RUNNING <= "1";
                   COUNTER_REGISTER <= COUNTER_REGISTER +1;
                end if;
               
				if iENABLE = "1" and oENABLE = "0" and AUTORESET = "1" then
					COUNTER_REGISTER <= conv_std_logic_vector(1,bitSize);
				end if;
			   
            end if;
        end if;
    end process;
    

end Behavioral; 