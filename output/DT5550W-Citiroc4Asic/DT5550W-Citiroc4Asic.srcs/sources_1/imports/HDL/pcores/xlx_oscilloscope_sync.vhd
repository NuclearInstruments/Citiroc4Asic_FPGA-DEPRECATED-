------------------------------------------------------------------
--						Nuclear Instruments						--
--																--
--							SciCompiler							--
--																--
--	Module:				OSCILLOSCOPE (XILINX)					--
--	Version:			1.1										--
--	Creation Data:		5-02-2019								--
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

entity XLX_OSCILLOSCOPE_SYNC is
  Generic (	wordWidth : integer := 16;
			memLength : integer := 256;
			channels : integer := 2);
  port (
	RESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CLK_WRITE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CLK_READ : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
    ANALOG : IN STD_LOGIC_VECTOR ((wordWidth*channels)-1 DOWNTO 0);
	D0 : IN STD_LOGIC_VECTOR (channels-1 DOWNTO 0);
	D1 : IN STD_LOGIC_VECTOR (channels-1 DOWNTO 0);
	D2 : IN STD_LOGIC_VECTOR (channels-1 DOWNTO 0);
	D3 : IN STD_LOGIC_VECTOR (channels-1 DOWNTO 0);
	TRIG : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	READ_ADDRESS: IN STD_LOGIC_VECTOR (15 downto 0);
	READ_DATA: OUT STD_LOGIC_VECTOR (31 downto 0);
	READ_DATAVALID: OUT STD_LOGIC_VECTOR (0 downto 0);
	READ_STATUS : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	READ_POSITION : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	CONFIG_TRIGGER_MODE : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
	CONFIG_PRETRIGGER : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
	CONFIG_TRIGGER_LEVEL : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
	CONFIG_DECIMATOR : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
	CONFIG_ARM : IN STD_LOGIC_VECTOR (31 DOWNTO 0);                                              
	BUSY: OUT STD_LOGIC_VECTOR (0 downto 0)
	);
end;


architecture Behavioral of XLX_OSCILLOSCOPE_SYNC is
	constant addressBits : integer := integer(ceil(log2(real(memLength))));

	type tMemData is array (0 to channels-1) of std_logic_vector(wordWidth+4-1 downto 0);
	type tTriggerData is array (0 to channels-1) of std_logic_vector(wordWidth-1 downto 0);
	signal MemOutput : tMemData;
	signal MemOutputB : tMemData;
	signal MemInput : tMemData;
	signal TriggerData : tTriggerData;
	signal TriggerDataOld : tTriggerData;

	signal tMemD0 : std_logic_vector(channels-1 downto 0) ;
	signal tMemD1 : std_logic_vector(channels-1 downto 0);
	signal tMemD2 : std_logic_vector(channels-1 downto 0);
	signal tMemD3 : std_logic_vector(channels-1 downto 0);
	signal D0high : std_logic_vector(channels-1 downto 0);
	signal D1high : std_logic_vector(channels-1 downto 0);
	signal D2high : std_logic_vector(channels-1 downto 0);
	signal D3high : std_logic_vector(channels-1 downto 0);


	signal ADDRESS_WRITE : std_logic_vector(addressBits-1 downto 0);
	signal TRIGGER_POS : std_logic_vector(addressBits-1 downto 0);
	
	signal POSTCounter : integer range 0 to 8192;
	signal PRECounter : integer range 0 to 8192;
	signal EnableCounter : std_logic := '0';
	signal RunningPostTrigger : std_logic := '0';
	
	signal WE : std_logic_vector(0 downto 0);
	
	signal sTrig : std_logic_vector(0 downto 0) := "0";
	signal iTrig : std_logic_vector(0 downto 0) := "0";
	signal oTrig : std_logic_vector(0 downto 0) := "0";

	signal szTrig : std_logic_vector(0 downto 0) := "0";
	signal stTrig : std_logic_vector(0 downto 0) := "0";
	
	signal oCONFIG_ARM : STD_LOGIC_VECTOR (31 DOWNTO 0); 
	
	signal CHANNEL_TRIGGER : STD_LOGIC_VECTOR (channels-1 DOWNTO 0); 
	signal counterDecimator : integer := 0;
	signal ceDEC : std_logic:='0';
	
		signal counterDigital : integer := 0;
    attribute keep : string; 
    attribute keep of ADDRESS_WRITE: signal is "true";    
    attribute keep of TRIGGER_POS: signal is "true";
    attribute keep of POSTCounter: signal is "true";
    attribute keep of PRECounter: signal is "true";
    attribute keep of EnableCounter: signal is "true";
    attribute keep of RunningPostTrigger: signal is "true";
    attribute keep of WE: signal is "true";
    attribute keep of sTrig: signal is "true";
    attribute keep of CHANNEL_TRIGGER: signal is "true";
    attribute keep of ceDEC: signal is "true";
    attribute keep of CONFIG_TRIGGER_MODE: signal is "true";
    attribute keep of CONFIG_ARM: signal is "true";
    attribute keep of READ_STATUS: signal is "true";
    attribute keep of CONFIG_TRIGGER_LEVEL: signal is "true";
begin
	
	
GENCH: for I in 0 to channels-1 generate
  begin  
  
	MemInput(I) <= tMemD3(I) & tMemD2(I) & tMemD1(I) & tMemD0(I) & ANALOG((I+1)*wordWidth-1 downto I*wordWidth);
	xpm_memory_sdpram_inst : xpm_memory_sdpram
	generic map (
		-- Common module generics
		MEMORY_SIZE => memLength*(wordWidth+4), --positive integer
		MEMORY_PRIMITIVE => "auto", --string; "auto", "distributed", "block" or "ultra" ;
		CLOCKING_MODE => "independent_clock",--string; "common_clock", "independent_clock"
		MEMORY_INIT_FILE => "none", --string; "none" or "<filename>.mem"
		MEMORY_INIT_PARAM => "", --string;
		USE_MEM_INIT => 1, --integer; 0,1
		WAKEUP_TIME => "disable_sleep",--string; "disable_sleep" or "use_sleep_pin"
		MESSAGE_CONTROL => 0, --integer; 0,1
		-- Port A module generics
		WRITE_DATA_WIDTH_A => (wordWidth+4), --positive integer
		BYTE_WRITE_WIDTH_A => (wordWidth+4), --integer; 8, 9, or WRITE_DATA_WIDTH_A value
		ADDR_WIDTH_A => addressBits, --positive integer
		-- Port B module generics
		READ_DATA_WIDTH_B => (wordWidth+4), --positive integer
		ADDR_WIDTH_B => addressBits, --positive integer
		READ_RESET_VALUE_B => "0", --string
		READ_LATENCY_B => 1, --non-negative integer
		WRITE_MODE_B => "write_first" --string; "write_first", "read_first", "no_change"
		)
		port map (
		-- Common module ports
		sleep => '0',
		-- Port A module ports
		clka => CLK_WRITE(0),
		ena => '1',
		wea => WE,
		addra => ADDRESS_WRITE,
		dina => MemInput(I),
		injectsbiterra => '0', --do not change
		injectdbiterra => '0', --do not change
		-- Port B module ports
		clkb => CLK_READ(0),
		rstb => RESET(0),
		enb => '1',
		regceb => '1',
		addrb => READ_ADDRESS(addressBits-1 downto 0),
		doutb => MemOutput(I),
		sbiterrb => open, --do not change
		dbiterrb => open --do not change
		);
		
	READ_DATAVALID <= "1";
		
	READ_DATA <= SXT(MemOutput(I),32) when conv_integer(READ_ADDRESS(15 downto addressBits)) = I else (others => 'Z'); 
	
	trigger_process : process (CLK_WRITE)
	BEGIN
		if rising_edge(CLK_WRITE(0)) then
			CHANNEL_TRIGGER(I) <= '0';
			TriggerData(I) <= ANALOG((I+1)*wordWidth-1 downto I*wordWidth);
			TriggerDataOld(I) <= TriggerData(I);
			if CONFIG_TRIGGER_MODE(3) = '0' then
				if TriggerDataOld(I) < CONFIG_TRIGGER_LEVEL(wordWidth-1 downto 0) and TriggerData(I) >= CONFIG_TRIGGER_LEVEL(wordWidth-1 downto 0) then
					CHANNEL_TRIGGER(I) <= '1';
				end if;
			else
				if TriggerDataOld(I) > CONFIG_TRIGGER_LEVEL(wordWidth-1 downto 0) and TriggerData(I) <= CONFIG_TRIGGER_LEVEL(wordWidth-1 downto 0) then
					CHANNEL_TRIGGER(I) <= '1';
				end if;			
			end if;
		end if;
	END PROCESS;
end generate;


	control_process : process(CLK_WRITE)
	begin
		if rising_edge(CLK_WRITE(0)) then
			
			if CONFIG_TRIGGER_MODE(2 downto 0) = "000" and sTRIG="0" then
				sTRIG <= TRIG;
			end if;
			
			if CONFIG_TRIGGER_MODE(2 downto 0) = "001" and sTRIG="0" then
				sTRIG(0) <= CHANNEL_TRIGGER(conv_integer(CONFIG_TRIGGER_MODE(15 downto 8)));
			end if;	

			if CONFIG_TRIGGER_MODE(2 downto 0) = "010" and sTRIG="0" then	
				sTRIG(0) <= CONFIG_TRIGGER_MODE(7);
			end if;
			
			if CONFIG_TRIGGER_MODE(2 downto 0) = "100" and sTRIG="0" then
				sTRIG(0) <= D0(conv_integer(CONFIG_TRIGGER_MODE(15 downto 8)));
			end if;			

			if CONFIG_TRIGGER_MODE(2 downto 0) = "101" and sTRIG="0" then
				sTRIG(0) <= D1(conv_integer(CONFIG_TRIGGER_MODE(15 downto 8)));
			end if;			
			
			if CONFIG_TRIGGER_MODE(2 downto 0) = "110" and sTRIG="0" then
				sTRIG(0) <= D2(conv_integer(CONFIG_TRIGGER_MODE(15 downto 8)));
			end if;			
			
			if CONFIG_TRIGGER_MODE(2 downto 0) = "111" and sTRIG="0" then
				sTRIG(0) <= D3(conv_integer(CONFIG_TRIGGER_MODE(15 downto 8)));
			end if;			
			
            WE <= "0";
            if CE = "1" and ceDEC ='1' then
					oTRIG <= szTRIG;
                if EnableCounter = '1' then
                    WE <= "1";
                    ADDRESS_WRITE <= ADDRESS_WRITE + 1;
                end if;
                
                if oTRIG = "0" and szTRIG = "1" and PRECounter = 0 then
                    POSTCounter <= memLength - conv_integer(CONFIG_PRETRIGGER)-4;
                    RunningPostTrigger <='1';
                    READ_POSITION <= EXT(ADDRESS_WRITE,32);
                    BUSY <= "1";
                end if;
                
                if RunningPostTrigger = '1' then
                    
                    if POSTCounter = 0  then
                    RunningPostTrigger <='0';
                        READ_STATUS(0) <= '1';
                        EnableCounter <= '0';
                        BUSY <= "0";
                    else
                        POSTCounter <= POSTCounter -1;
                    end if;                
                end if;
                
                if PRECounter > 0 then
                    PRECounter <= PRECounter -1;
					sTRIG <= "0";
                end if;
            else
                if CONFIG_TRIGGER_MODE(7)='1' then
                    sTRIG<="0";
                end if;
            end if;
            
			oCONFIG_ARM <= CONFIG_ARM;
            if oCONFIG_ARM(0) = '0' and CONFIG_ARM(0) = '1' then
                ADDRESS_WRITE <= (others => '0');
                D0high<= (others => '0');
                D1high<= (others => '0');
                D2high<= (others => '0');
                D3high<= (others => '0');

                EnableCounter <= '1';
                READ_STATUS(0) <= '0';
                PRECounter <= conv_integer(CONFIG_PRETRIGGER);
                WE <= "1";
				sTRIG<="0";
            end if;		
			
 
			if counterDecimator = 0 then
				counterDecimator <= conv_integer(CONFIG_DECIMATOR);
				ceDEC <= '1';

				if CONFIG_DECIMATOR = x"00000000" then
			        tMemD0 <= D0;
                    tMemD1 <= D1; 
					tMemD2 <= D2; 
					tMemD3 <= D3; 
                    szTrig <= sTrig;                
                else
			        tMemD0 <= D0high or D0;
                    tMemD1 <= D1high or D1;  
					tMemD2 <= D2high or D2; 
					tMemD3 <= D3high or D3; 
                    szTrig <= stTrig or sTrig;   
                    stTrig <= "0";
                    D0high <= (others => '0');
                    D1high <= (others => '0');          
                    D2high <= (others => '0');
                    D3high <= (others => '0');          

                end if;

			else
			 for i in 0 to channels-1 loop
                if D0(i) = '1' then 
                    D0high(i)<='1';  
                end if;
                if D1(i) = '1' then 
                    D1high(i)<='1';  
                end if;
                if D2(i) = '1' then 
                    D2high(i)<='1';  
                end if;
                if D3(i) = '1' then 
                    D3high(i)<='1';  
                end if;

             end loop;
             
             if sTrig = "1" then
                 stTrig<="1";
             end if;
				counterDecimator <= counterDecimator -1;
				ceDEC <= '0';
			end if;
			
		end if;
	end process;

			

end Behavioral; 