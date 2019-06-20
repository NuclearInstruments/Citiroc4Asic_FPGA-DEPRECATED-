------------------------------------------------------------------
--						Nuclear Instruments						--
--																--
--							SciCompiler							--
--																--
--	Module:				FREQUNCY METER			   				--
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


entity FREQ_METER is
  Generic (	bitSize : integer := 1);
  port (
	RESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CLK : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
    SIGIN : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	INTTIME : INTEGER;
	ENABLE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	FREQ: OUT STD_LOGIC_VECTOR (bitSize-1 downto 0)
	);
end;


architecture Behavioral of FREQ_METER is
    signal COUNTER_REGISTER : STD_LOGIC_VECTOR (bitSize-1 downto 0) := (others => '0');
    signal LASTBITCOUNTER : std_logic := '0';
    signal iSIGIN : std_logic_vector(0 downto 0) := "0";
    signal oSIGIN : std_logic_vector(0 downto 0) := "0";
	signal TimeCounter : integer := 0;

begin

	freq_process: process(CLK,RESET)
	begin
        if RESET(0) = '1' then
            COUNTER_REGISTER <= (others => '0'); 
            LASTBITCOUNTER <= '0';
            iSIGIN <= "0";
            oSIGIN <= "0";
			TimeCounter <= 0;

        else
            if rising_edge(CLK(0)) then
                iSIGIN <= SIGIN;
                oSIGIN <= ISIGIN;
                
                LASTBITCOUNTER <= COUNTER_REGISTER(bitSize-1);
                                         
                if iSIGIN = "1" and oSIGIN = "0" and ENABLE="1" then
                    COUNTER_REGISTER <= COUNTER_REGISTER +1;
                end if;
                                         
				if TimeCounter = INTTIME then
					TimeCounter <= 0;
					FREQ <= COUNTER_REGISTER;
					COUNTER_REGISTER <= (others => '0');
				else
					TimeCounter <=	TimeCounter +1;
				end if;
            end if;
        end if;
    end process;
    

end Behavioral; 