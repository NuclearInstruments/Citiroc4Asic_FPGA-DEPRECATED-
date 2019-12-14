----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:54:57 11/19/2012 
-- Design Name: 
-- Module Name:    init_clock_gen - Behavioral 
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity init_clock_gen is
	Generic (ComponentBaseAddress : std_logic_vector(15 downto 0));
    Port ( clk : in  STD_LOGIC;
           CK_SPI_LE : out  STD_LOGIC;
           CK_SPI_CLK : out  STD_LOGIC;
           CK_SPI_MOSI : out  STD_LOGIC;
			  CK_PD : out  STD_LOGIC;
			  CK_LOCK : in  STD_LOGIC;
			  CK_CONFIG_DONE : OUT  STD_LOGIC:='0';
           reset : in  STD_LOGIC;
			  reset_out : out  STD_LOGIC;
			  REG_addr : in STD_LOGIC_VECTOR (15 downto 0);
			  REG_din : in STD_LOGIC_VECTOR (31 downto 0);
			  REG_wrint : in STD_LOGIC
			  );
end init_clock_gen;

architecture Behavioral of init_clock_gen is


	COMPONENT spi32bit_master_write
	Generic (SPISLAVEBits : integer := 32);
	PORT(
		clock_in : IN std_logic;
		reset : IN std_logic;
		data : IN std_logic_vector(31 downto 0);
		ce : IN std_logic;          
		serial_clk : OUT std_logic;
		serial_out : OUT std_logic;
		serial_ce : OUT std_logic;
		ack : OUT std_logic
		);
	END COMPONENT;

	signal 	contatore : integer := 0;

	type CFG_STATE is (	ATTESAPROG,
								ATTESAINIZIALE,
								TRASMISSIONE_R0,
								ATTESA_R0,
								TRASMISSIONE_R1,
								ATTESA_R1,
								TRASMISSIONE_R2,
								ATTESA_R2,
								TRASMISSIONE_R3,
								ATTESA_R3,
								TRASMISSIONE_R4,
								ATTESA_R4,
								TRASMISSIONE_R5,
								ATTESA_R5,
								TRASMISSIONE_R6,
								ATTESA_R6,
								TRASMISSIONE_R7,
								ATTESA_R7,
								TRASMISSIONE_R8,
                                ATTESA_R8,								
								TRASMISSIONE_R9,
                                ATTESA_R9,								
                                TRASMISSIONE_R10,								
								WAIT_LOCK1,
								IDLE
								);
	signal cfg_state_machine : CFG_STATE := ATTESAPROG;

	signal phy_ack : std_logic := '0';
	signal phy_start : std_logic := '0';
	signal phy_data : std_logic_vector(31 downto 0) := (others => '0');
	signal gate_SPI_CLK : std_logic := '0';
	signal nongate_SPI_CLK : std_logic := '1';
	
	signal REG0 : std_logic_vector(31 downto 0) := x"EB0A0320";--(others => '0'); --EB0A0320
	signal REG1 : std_logic_vector(31 downto 0) := x"EB140301";--(others => '0');
	signal REG2 : std_logic_vector(31 downto 0) := x"EB020302";--(others => '0');
	signal REG3 : std_logic_vector(31 downto 0) := x"EB020303";--(others => '0');
	signal REG4 : std_logic_vector(31 downto 0) := x"68860314";--(others => '0');
	signal REG5 : std_logic_vector(31 downto 0) := x"10100BE5";----(others => '0');
	signal REG6 : std_logic_vector(31 downto 0) := x"84CE1B66";--(others => '0');
	signal REG7 : std_logic_vector(31 downto 0) := x"BD92BDE7";--(others => '0');
	signal REG8 : std_logic_vector(31 downto 0) := x"20009D98";--(others => '0');
	signal REG9 : std_logic_vector(31 downto 0) := x"80CE1B66";--(others => '0');
	signal REG10 : std_logic_vector(31 downto 0) := x"84CE1B66";--(others => '0');
	signal oSTARSTROBE : std_logic := '0';
	signal STARSTROBE : std_logic := '0';
	signal lockCounter : integer;
	signal first : std_logic := '1';
begin

	CK_PD <= '1';

	SPI_MASTER_CLKGEN: spi32bit_master_write 
	Generic MAP (SPISLAVEBits => 32)
	PORT MAP(
		clock_in => clk,
		reset => reset,
		data => phy_data,
		ce => phy_start,
		serial_clk => nongate_SPI_CLK,
		serial_out => CK_SPI_MOSI,
		serial_ce => CK_SPI_LE,
		ack => phy_ack
	);

	CK_SPI_CLK <= nongate_SPI_CLK or (not gate_SPI_CLK);


	regfile : process (clk, reset)
	begin 
		if reset = '1' then

		elsif rising_edge (clk) then
--			if REG_wrint = '1' then
--				if REG_addr=ComponentBaseAddress + x"0000" then
--					REG0 <= REG_din;
--				end if;
				
--				if REG_addr=ComponentBaseAddress + x"0001" then
--					REG1 <= REG_din;
--				end if;
				
--				if REG_addr=ComponentBaseAddress + x"0002" then
--					REG2 <= REG_din;
--				end if;
				
--				if REG_addr=ComponentBaseAddress + x"0003" then
--					REG3 <= REG_din;
--				end if;
				
--				if REG_addr=ComponentBaseAddress + x"0004" then
--					REG4 <= REG_din;
--				end if;
				 
--				if REG_addr=ComponentBaseAddress + x"0005" then
--					REG5 <= REG_din;
--				end if;
				
--				if REG_addr=ComponentBaseAddress + x"0006" then
--					REG6 <= REG_din;
--				end if;
				
--				if REG_addr=ComponentBaseAddress + x"0007" then
--					REG7 <= REG_din;
--				end if;
				
--				if REG_addr=ComponentBaseAddress + x"0008" then
--					REG8 <= REG_din;
--				end if;
				
--				if REG_addr=ComponentBaseAddress + x"0009" then
--					STARSTROBE <= REG_din(0);
--				end if;
	
								
				
				
				
				
--			end if;
		end if;
	end process;
	

	cfg_machine : process (clk, reset)
	begin 
		if reset = '1' then
			cfg_state_machine <= ATTESAPROG;
			contatore <= 0;
		elsif rising_edge (clk) then
			phy_start <= '0';
			oSTARSTROBE <= STARSTROBE;
			case cfg_state_machine is
				when ATTESAPROG =>
					gate_SPI_CLK <='0';
					if (STARSTROBE = '1' and oSTARSTROBE = '0') or first='1' then
					                        lockCounter <=0;                   
						cfg_state_machine <= ATTESAINIZIALE;
						CK_CONFIG_DONE<='0';
						contatore <= 0;
						first<='0';
					end if;
				when ATTESAINIZIALE =>
					CK_CONFIG_DONE<='0';
					gate_SPI_CLK <='1';
					reset_out <= '1';
					if contatore = 1000000 then
						contatore <= 0;
						--PAROLA DI CONFIGURAZIONE 0
						phy_data <= REG0;--x"710800A0" REGISTRO 0 (INPUT AUX 25M, OUT1 LVPECL 250M, OUT2 LVDS 250M) 
						phy_start <= '1';
						cfg_state_machine <= TRASMISSIONE_R0;
					else
						contatore <= contatore +1;
					end if;
				
				when TRASMISSIONE_R0 =>
					if phy_ack ='1' then
						contatore <= 0;	
						cfg_state_machine <= ATTESA_R0;						
					end if;
					
				when ATTESA_R0 =>
					if contatore = 100000 then
						phy_data <= REG1;--x"8383E001" REGISTRO 1
						phy_start <= '1';		
						cfg_state_machine <= TRASMISSIONE_R1;						
					else
						contatore <= contatore +1;
					end if;
					
				when TRASMISSIONE_R1 =>
					if phy_ack ='1' then
						contatore <= 0;	
						cfg_state_machine <= ATTESA_R1;						
					end if;
					
				when ATTESA_R1 =>
					if contatore = 100000 then
						phy_data <= REG2;
						phy_start <= '1';		
						cfg_state_machine <= TRASMISSIONE_R2;						
					else
						contatore <= contatore +1;
					end if;
				
				when TRASMISSIONE_R2 =>
					if phy_ack ='1' then
						contatore <= 0;	
						cfg_state_machine <= ATTESA_R2;						
					end if;
					
				when ATTESA_R2 =>
					if contatore = 100000 then
						phy_data <= REG3;
						phy_start <= '1';		
						cfg_state_machine <= TRASMISSIONE_R3;						
					else
						contatore <= contatore +1;
					end if;
				
				when TRASMISSIONE_R3 =>
					if phy_ack ='1' then
						contatore <= 0;	
						cfg_state_machine <= ATTESA_R3;						
					end if;
					
				when ATTESA_R3 =>
					if contatore = 100000 then
						phy_data <= REG4;
						phy_start <= '1';		
						cfg_state_machine <= TRASMISSIONE_R4;						
					else
						contatore <= contatore +1;
					end if;
				
				when TRASMISSIONE_R4 =>
					if phy_ack ='1' then
						contatore <= 0;	
						cfg_state_machine <= ATTESA_R4;						
					end if;
					
				when ATTESA_R4 =>
					if contatore = 100000 then
						phy_data <= REG5;
						phy_start <= '1';		
						cfg_state_machine <= TRASMISSIONE_R5;						
					else
						contatore <= contatore +1;
					end if;
				
				when TRASMISSIONE_R5 =>
					if phy_ack ='1' then
						contatore <= 0;	
						cfg_state_machine <= ATTESA_R5;						
					end if;
					
				when ATTESA_R5 =>
					if contatore = 100000 then
						phy_data <= REG6;
						phy_start <= '1';		
						cfg_state_machine <= TRASMISSIONE_R6;						
					else
						contatore <= contatore +1;
					end if;
				
				when TRASMISSIONE_R6 =>
					if phy_ack ='1' then
						contatore <= 0;	
						cfg_state_machine <= ATTESA_R6;						
					end if;
					
				when ATTESA_R6 =>
					if contatore = 100000 then
						phy_data <= REG7;
						phy_start <= '1';		
						cfg_state_machine <= TRASMISSIONE_R7;						
					else
						contatore <= contatore +1;
					end if;
				
				when TRASMISSIONE_R7 =>
					if phy_ack ='1' then
						contatore <= 0;	
						cfg_state_machine <= ATTESA_R7;						
					end if;
					
				when ATTESA_R7 =>
					if contatore = 100000 then
						phy_data <= REG8;
						phy_start <= '1';		
						cfg_state_machine <= TRASMISSIONE_R8;						
					else
						contatore <= contatore +1;
					end if;
					
                when TRASMISSIONE_R8 =>
                    if phy_ack ='1' then
                        contatore <= 0;    
                        cfg_state_machine <= ATTESA_R8;     
                    end if;
                    
                when ATTESA_R8 =>
                    if contatore = 10000 then
                        phy_data <= REG9;
                        phy_start <= '1';        
                        cfg_state_machine <= TRASMISSIONE_R9;                        
                    else
                        contatore <= contatore +1;
                    end if;	
                    
                when TRASMISSIONE_R9 =>
                        if phy_ack ='1' then
                            contatore <= 0;    
                            cfg_state_machine <= ATTESA_R9;                        
                        end if;
                        
                when ATTESA_R9 =>
                    if contatore = 1000 then
                        phy_data <= REG10;
                        phy_start <= '1';        
                        cfg_state_machine <= TRASMISSIONE_R10;                        
                    else
                        contatore <= contatore +1;
                    end if;                        				
				
				when TRASMISSIONE_R10 =>
					if phy_ack ='1' then
						contatore <= 0;	
						if lockCounter = 5 then
						  cfg_state_machine <= WAIT_LOCK1;
						else
						  lockCounter <= lockCounter +1;
						 cfg_state_machine <= ATTESAINIZIALE;
						end if;
												
					end if;
					
				
				when WAIT_LOCK1 =>
					if CK_LOCK = '1' then
						if contatore = 100000 then
							reset_out <= '0';
							cfg_state_machine <= IDLE;						
						else
							contatore <= contatore +1;
						end if;
					else
						contatore <= 0;
					end if;
					
				when IDLE =>				
					gate_SPI_CLK <='0';
					CK_CONFIG_DONE<='1';
					cfg_state_machine <= ATTESAPROG;	
				when others =>
					cfg_state_machine <= ATTESAPROG;	
					contatore <= 0;					
					
			end case;				
		end if;
		
	end process;



end Behavioral;



------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date:    15:54:57 11/19/2012 
---- Design Name: 
---- Module Name:    init_clock_gen - Behavioral 
---- Project Name: 
---- Target Devices: 
---- Tool versions: 
---- Description: 
----
---- Dependencies: 
----
---- Revision: 
---- Revision 0.01 - File Created
---- Additional Comments: 
----
------------------------------------------------------------------------------------
--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;


---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

--entity init_clock_gen is
--	Generic (ComponentBaseAddress : std_logic_vector(15 downto 0));
--    Port ( clk : in  STD_LOGIC;
--           CK_SPI_LE : out  STD_LOGIC;
--           CK_SPI_CLK : out  STD_LOGIC;
--           CK_SPI_MOSI : out  STD_LOGIC;
--			  CK_PD : out  STD_LOGIC;
--			  CK_LOCK : in  STD_LOGIC;
--			  CK_CONFIG_DONE : OUT  STD_LOGIC:='0';
--           reset : in  STD_LOGIC;
--			  reset_out : out  STD_LOGIC;
--			  REG_addr : in STD_LOGIC_VECTOR (15 downto 0);
--			  REG_din : in STD_LOGIC_VECTOR (31 downto 0);
--			  REG_wrint : in STD_LOGIC
--			  );
--end init_clock_gen;

--architecture Behavioral of init_clock_gen is


--	COMPONENT spi32bit_master_write
--	Generic (SPISLAVEBits : integer := 32);
--	PORT(
--		clock_in : IN std_logic;
--		reset : IN std_logic;
--		data : IN std_logic_vector(31 downto 0);
--		ce : IN std_logic;          
--		serial_clk : OUT std_logic;
--		serial_out : OUT std_logic;
--		serial_ce : OUT std_logic;
--		ack : OUT std_logic
--		);
--	END COMPONENT;

--	signal 	contatore : integer range 0 to 100000 := 0;

--	type CFG_STATE is (	ATTESAPROG,
--								ATTESAINIZIALE,
--								TRASMISSIONE_R0,
--								ATTESA_R0,
--								TRASMISSIONE_R1,
--								ATTESA_R1,
--								TRASMISSIONE_R2,
--								ATTESA_R2,
--								TRASMISSIONE_R3,
--								ATTESA_R3,
--								TRASMISSIONE_R4,
--								ATTESA_R4,
--								TRASMISSIONE_R5,
--								ATTESA_R5,
--								TRASMISSIONE_R6,
--								ATTESA_R6,
--								TRASMISSIONE_R7,
--								ATTESA_R7,
--								TRASMISSIONE_R8,
--								WAIT_LOCK1,
--								IDLE
--								);
--	signal cfg_state_machine : CFG_STATE := ATTESAPROG;

--	signal phy_ack : std_logic := '0';
--	signal phy_start : std_logic := '0';
--	signal phy_data : std_logic_vector(31 downto 0) := (others => '0');
--	signal gate_SPI_CLK : std_logic := '0';
--	signal nongate_SPI_CLK : std_logic := '1';
	
--	signal REG0 : std_logic_vector(31 downto 0) := x"EB0A0320";--(others => '0'); --EB0A0320
--	signal REG1 : std_logic_vector(31 downto 0) := x"EB140301";--(others => '0');
--	signal REG2 : std_logic_vector(31 downto 0) := x"EB020302";--(others => '0');
--	signal REG3 : std_logic_vector(31 downto 0) := x"EB020303";--(others => '0');
--	signal REG4 : std_logic_vector(31 downto 0) := x"68860314";--(others => '0');
--	signal REG5 : std_logic_vector(31 downto 0) := x"10100B25";--(others => '0');
--	signal REG6 : std_logic_vector(31 downto 0) := x"80BE1B66";--(others => '0');
--	signal REG7 : std_logic_vector(31 downto 0) := x"950037F7";--(others => '0');
--	signal REG8 : std_logic_vector(31 downto 0) := x"20009D98";--(others => '0');
--	signal oSTARSTROBE : std_logic := '0';
--	signal STARSTROBE : std_logic := '0';
	
--	signal first : std_logic := '1';
--begin

--	CK_PD <= '1';

--	SPI_MASTER_CLKGEN: spi32bit_master_write 
--	Generic MAP (SPISLAVEBits => 32)
--	PORT MAP(
--		clock_in => clk,
--		reset => reset,
--		data => phy_data,
--		ce => phy_start,
--		serial_clk => nongate_SPI_CLK,
--		serial_out => CK_SPI_MOSI,
--		serial_ce => CK_SPI_LE,
--		ack => phy_ack
--	);

--	CK_SPI_CLK <= nongate_SPI_CLK or (not gate_SPI_CLK);


--	regfile : process (clk, reset)
--	begin 
--		if reset = '1' then

--		elsif rising_edge (clk) then
--			if REG_wrint = '1' then
--				if REG_addr=ComponentBaseAddress + x"0000" then
--					REG0 <= REG_din;
--				end if;
				
--				if REG_addr=ComponentBaseAddress + x"0001" then
--					REG1 <= REG_din;
--				end if;
				
--				if REG_addr=ComponentBaseAddress + x"0002" then
--					REG2 <= REG_din;
--				end if;
				
--				if REG_addr=ComponentBaseAddress + x"0003" then
--					REG3 <= REG_din;
--				end if;
				
--				if REG_addr=ComponentBaseAddress + x"0004" then
--					REG4 <= REG_din;
--				end if;
				 
--				if REG_addr=ComponentBaseAddress + x"0005" then
--					REG5 <= REG_din;
--				end if;
				
--				if REG_addr=ComponentBaseAddress + x"0006" then
--					REG6 <= REG_din;
--				end if;
				
--				if REG_addr=ComponentBaseAddress + x"0007" then
--					REG7 <= REG_din;
--				end if;
				
--				if REG_addr=ComponentBaseAddress + x"0008" then
--					REG8 <= REG_din;
--				end if;
				
--				if REG_addr=ComponentBaseAddress + x"0009" then
--					STARSTROBE <= REG_din(0);
--				end if;
								
				
				
				
				
--			end if;
--		end if;
--	end process;
	

--	cfg_machine : process (clk, reset)
--	begin 
--		if reset = '1' then
--			cfg_state_machine <= ATTESAPROG;
--			contatore <= 0;
--		elsif rising_edge (clk) then
--			phy_start <= '0';
--			oSTARSTROBE <= STARSTROBE;
--			case cfg_state_machine is
--				when ATTESAPROG =>
--					gate_SPI_CLK <='0';
--					if (STARSTROBE = '1' and oSTARSTROBE = '0') or first='1' then
--						cfg_state_machine <= ATTESAINIZIALE;
--						CK_CONFIG_DONE<='0';
--						contatore <= 0;
--						first<='0';
--					end if;
--				when ATTESAINIZIALE =>
--					CK_CONFIG_DONE<='0';
--					gate_SPI_CLK <='1';
--					reset_out <= '1';
--					if contatore = 100000 then
--						contatore <= 0;
--						--PAROLA DI CONFIGURAZIONE 0
--						phy_data <= REG0;--x"710800A0" REGISTRO 0 (INPUT AUX 25M, OUT1 LVPECL 250M, OUT2 LVDS 250M) 
--						phy_start <= '1';
--						cfg_state_machine <= TRASMISSIONE_R0;
--					else
--						contatore <= contatore +1;
--					end if;
				
--				when TRASMISSIONE_R0 =>
--					if phy_ack ='1' then
--						contatore <= 0;	
--						cfg_state_machine <= ATTESA_R0;						
--					end if;
					
--				when ATTESA_R0 =>
--					if contatore = 100000 then
--						phy_data <= REG1;--x"8383E001" REGISTRO 1
--						phy_start <= '1';		
--						cfg_state_machine <= TRASMISSIONE_R1;						
--					else
--						contatore <= contatore +1;
--					end if;
					
--				when TRASMISSIONE_R1 =>
--					if phy_ack ='1' then
--						contatore <= 0;	
--						cfg_state_machine <= ATTESA_R1;						
--					end if;
					
--				when ATTESA_R1 =>
--					if contatore = 100000 then
--						phy_data <= REG2;
--						phy_start <= '1';		
--						cfg_state_machine <= TRASMISSIONE_R2;						
--					else
--						contatore <= contatore +1;
--					end if;
				
--				when TRASMISSIONE_R2 =>
--					if phy_ack ='1' then
--						contatore <= 0;	
--						cfg_state_machine <= ATTESA_R2;						
--					end if;
					
--				when ATTESA_R2 =>
--					if contatore = 100000 then
--						phy_data <= REG3;
--						phy_start <= '1';		
--						cfg_state_machine <= TRASMISSIONE_R3;						
--					else
--						contatore <= contatore +1;
--					end if;
				
--				when TRASMISSIONE_R3 =>
--					if phy_ack ='1' then
--						contatore <= 0;	
--						cfg_state_machine <= ATTESA_R3;						
--					end if;
					
--				when ATTESA_R3 =>
--					if contatore = 100000 then
--						phy_data <= REG4;
--						phy_start <= '1';		
--						cfg_state_machine <= TRASMISSIONE_R4;						
--					else
--						contatore <= contatore +1;
--					end if;
				
--				when TRASMISSIONE_R4 =>
--					if phy_ack ='1' then
--						contatore <= 0;	
--						cfg_state_machine <= ATTESA_R4;						
--					end if;
					
--				when ATTESA_R4 =>
--					if contatore = 100000 then
--						phy_data <= REG5;
--						phy_start <= '1';		
--						cfg_state_machine <= TRASMISSIONE_R5;						
--					else
--						contatore <= contatore +1;
--					end if;
				
--				when TRASMISSIONE_R5 =>
--					if phy_ack ='1' then
--						contatore <= 0;	
--						cfg_state_machine <= ATTESA_R5;						
--					end if;
					
--				when ATTESA_R5 =>
--					if contatore = 100000 then
--						phy_data <= REG6;
--						phy_start <= '1';		
--						cfg_state_machine <= TRASMISSIONE_R6;						
--					else
--						contatore <= contatore +1;
--					end if;
				
--				when TRASMISSIONE_R6 =>
--					if phy_ack ='1' then
--						contatore <= 0;	
--						cfg_state_machine <= ATTESA_R6;						
--					end if;
					
--				when ATTESA_R6 =>
--					if contatore = 100000 then
--						phy_data <= REG7;
--						phy_start <= '1';		
--						cfg_state_machine <= TRASMISSIONE_R7;						
--					else
--						contatore <= contatore +1;
--					end if;
				
--				when TRASMISSIONE_R7 =>
--					if phy_ack ='1' then
--						contatore <= 0;	
--						cfg_state_machine <= ATTESA_R7;						
--					end if;
					
--				when ATTESA_R7 =>
--					if contatore = 100000 then
--						phy_data <= REG8;
--						phy_start <= '1';		
--						cfg_state_machine <= TRASMISSIONE_R8;						
--					else
--						contatore <= contatore +1;
--					end if;
				
--				when TRASMISSIONE_R8 =>
--					if phy_ack ='1' then
--						contatore <= 0;	
--						cfg_state_machine <= WAIT_LOCK1;						
--					end if;
					
				
--				when WAIT_LOCK1 =>
--					if CK_LOCK = '1' then
--						if contatore = 100000 then
--							reset_out <= '0';
--							cfg_state_machine <= IDLE;						
--						else
--							contatore <= contatore +1;
--						end if;
--					else
--						contatore <= 0;
--					end if;
					
--				when IDLE =>				
--					gate_SPI_CLK <='0';
--					CK_CONFIG_DONE<='1';
--					cfg_state_machine <= ATTESAPROG;	
--				when others =>
--					cfg_state_machine <= ATTESAPROG;	
--					contatore <= 0;					
					
--			end case;				
--		end if;
		
--	end process;



--end Behavioral;

