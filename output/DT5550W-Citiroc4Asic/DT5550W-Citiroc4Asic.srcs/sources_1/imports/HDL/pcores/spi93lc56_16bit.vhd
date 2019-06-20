----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:12:31 09/01/2014 
-- Design Name: 
-- Module Name:    spi93lc56_16bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



library UNISIM;
use UNISIM.VComponents.all;

entity spi93lc56_16bit is
    Port ( clk : in  STD_LOGIC;
           eADDR : in  STD_LOGIC_VECTOR (7 downto 0);
           eDATAWR : in  STD_LOGIC_VECTOR (15 downto 0);
           eDATARD : out  STD_LOGIC_VECTOR (15 downto 0);
			  eERASE : in STD_LOGIC;
           eWR : in  STD_LOGIC;
           eRD : in  STD_LOGIC;
           eEWR : in  STD_LOGIC;
           eDONE : out  STD_LOGIC;
			  
			  SPI_CS : out STD_LOGIC;
			  SPI_MOSI : out STD_LOGIC;
			  SPI_CLK : out STD_LOGIC;
			  SPI_MISO : in STD_LOGIC
			  );
end spi93lc56_16bit;

architecture Behavioral of spi93lc56_16bit is
	type EEPROM_states is (sIDLE, sSTART, sSTART1, sWRITE, sEND);
	signal EEPROM_SM : EEPROM_states := sIDLE;
	signal EEPROM_AFTER : EEPROM_states := sIDLE;
	signal WRITEWORD : std_logic_vector (26 downto 0) := (others => '0');
	signal bits : integer := 0;
	signal waittime : integer := 100;
	signal dummytime : integer := 100;
	signal iECLK : std_logic := '0';
	signal edge : std_logic := '0';
begin
	
	clockgen : process(clk)
	begin
		if rising_edge(CLK) then
			edge <= '0';
			if waittime = 0 then
				waittime <= 100;
				iECLK <= not iECLK;
				if iECLK = '1' then 
					edge <= '1';
				end if;
			else
				waittime <= waittime - 1;
			end if;
		end if;
	end process;
	
	SPI_CLK <= iECLK;
	
CONFIGEEPROM : PROCESS(CLK)
begin
	if rising_edge(CLK) then
			case EEPROM_SM is
				when sIDLE =>
					
					eDONE <= '0';
					if eEWR = '1' then
						WRITEWORD <= x"0000" & "100" & "11000000";
						bits <= 10;
						EEPROM_SM <= sSTART;
					end if;
					
					if eWR = '1' then
						WRITEWORD <= "101" & eADDR & eDATAWR;
						bits <= 26;
						EEPROM_SM <= sSTART;					
					end if;

					if eRD = '1' then
						WRITEWORD <= "110" & eADDR & x"0000";
						bits <= 26;
						EEPROM_SM <= sSTART;					
					end if;

					if eERASE = '1' then
						WRITEWORD <= x"0000" & "111" & eADDR;
						bits <= 10;
						EEPROM_SM <= sSTART;
					end if;
					
					
				when sSTART =>
					if edge = '1' then
						dummytime <= 20;
						SPI_MOSI <= WRITEWORD(bits);
						bits <= bits - 1;						
						EEPROM_SM <= sSTART1;
					end if;
					
				when sSTART1 => 
						if dummytime = 0 then
							SPI_CS <= '1';
							EEPROM_SM <= sWRITE;
						else 
							dummytime <= dummytime - 1;
						end if;

				when sWRITE =>
					
					if edge = '1' then
						SPI_MOSI <= WRITEWORD(bits);
						bits <= bits - 1;
						if bits = 0 then
							EEPROM_SM <= sEND;
						end if;
						
						if bits < 15 then
							eDATARD(bits+1) <= SPI_MISO;
						end if;
					end if;
					
				when sEND =>
					if edge = '1' then
						eDATARD(0) <= SPI_MISO;
						SPI_CS <= '0';
						eDONE <= '1';
						EEPROM_SM <= sIDLE;
					end if;
					
				when others =>	
			end case;
	end if;
end process;
end Behavioral;

