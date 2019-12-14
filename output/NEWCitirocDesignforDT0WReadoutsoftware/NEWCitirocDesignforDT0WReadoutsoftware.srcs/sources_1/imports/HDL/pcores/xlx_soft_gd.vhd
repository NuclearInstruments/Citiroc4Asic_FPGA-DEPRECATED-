------------------------------------------------------------------
--						Nuclear Instruments						--
--																--
--							SciCompiler							--
--																--
--	Module:				GATE AND DELAY SOFTWARE (XILINX)		--
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
use ieee.math_real.all;
Library xpm;
use xpm.vcomponents.all;


entity SW_GATE_AND_DELAY is
  Generic (	maxDelay : integer := 16);
  port (
	RESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CLK : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
    PORT_IN : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	PORT_OUT: OUT STD_LOGIC_VECTOR (0 downto 0);
	GATE : IN INTEGER ;
	DELAY: IN INTEGER
	);
end;


architecture Behavioral of SW_GATE_AND_DELAY is
	constant maxDelayBits : integer := integer(ceil(log2(real(maxDelay))));
	signal RP : std_logic_vector(maxDelayBits-1 downto 0) := (others => '0');
	signal WP : std_logic_vector(maxDelayBits-1 downto 0) := (others => '0');
	signal iGATE : integer range 0 to 65535;
	signal iDELAY : integer range 0 to 65535;
	signal iIN : std_logic_vector(0 downto 0);
	signal oiIN : std_logic_vector(0 downto 0);
	signal memIn : std_logic_vector(0 downto 0);
	signal intReset : std_logic := '0';
	signal cGATE : integer range 0 to 65535;
begin

	timer_process: process(CLK,RESET)
	begin
        if RESET(0) = '1' or intReset = '1' then
			intReset <= '0';
			WP <= (others => '0');
        else
			
            if rising_edge(CLK(0)) then
				RP <= WP - conv_std_logic_vector(iDELAY, maxDelayBits);
				WP <= WP +1;
				if iGATE /= GATE then
					iGATE <= GATE;
					intReset <= '1';
				end if;
				
				if iDELAY /= DELAY then
					iDELAY <= DELAY;
					intReset <= '1';
				end if;
				
				iIN <= PORT_IN;
				oiIN <= iIN;
				if cGATE = 0 then
					memIn <= "0";
					if oiIN = "0" and iIN = "1" then
						cGATE <= iGATE;
						memIn <= "1";
					end if;
				else
					cGATE <= cGATE -1;
				end if;
            end if;
        end if;
    end process;
    
	
	xpm_memory_sdpram_inst : xpm_memory_sdpram
	generic map (
		-- Common module generics
		MEMORY_SIZE => maxDelay, --positive integer
		MEMORY_PRIMITIVE => "auto", --string; "auto", "distributed", "block" or "ultra" ;
		CLOCKING_MODE => "common_clock",--string; "common_clock", "independent_clock"
		MEMORY_INIT_FILE => "none", --string; "none" or "<filename>.mem"
		MEMORY_INIT_PARAM => "", --string;
		USE_MEM_INIT => 1, --integer; 0,1
		WAKEUP_TIME => "disable_sleep",--string; "disable_sleep" or "use_sleep_pin"
		MESSAGE_CONTROL => 0, --integer; 0,1
		-- Port A module generics
		WRITE_DATA_WIDTH_A => 1, --positive integer
		BYTE_WRITE_WIDTH_A => 1, --integer; 8, 9, or WRITE_DATA_WIDTH_A value
		ADDR_WIDTH_A => maxDelayBits, --positive integer
		-- Port B module generics
		READ_DATA_WIDTH_B => 1, --positive integer
		ADDR_WIDTH_B => maxDelayBits, --positive integer
		READ_RESET_VALUE_B => "0", --string
		READ_LATENCY_B => 2, --non-negative integer
		WRITE_MODE_B => "no_change" --string; "write_first", "read_first", "no_change"
		)
		port map (
		-- Common module ports
		sleep => '0',
		-- Port A module ports
		clka => CLK(0),
		ena => '1',
		wea => "1",
		addra => WP,
		dina => memIn,
		injectsbiterra => '0', --do not change
		injectdbiterra => '0', --do not change
		-- Port B module ports
		clkb => CLK(0),
		rstb => RESET(0),
		enb => '1',
		regceb => '1',
		addrb => RP,
		doutb => PORT_OUT,
		sbiterrb => open, --do not change
		dbiterrb => open --do not change
		);



end Behavioral; 