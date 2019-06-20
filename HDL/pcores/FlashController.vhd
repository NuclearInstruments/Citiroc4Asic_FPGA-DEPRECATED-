----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.05.2018 08:26:12
-- Design Name: 
-- Module Name: FlashController - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
library UNISIM;
use UNISIM.VComponents.all;
entity FlashController is
    Port (
            clk : in STD_LOGIC;
    	    BUS_Flash_0_READ_DATA : OUT STD_LOGIC_VECTOR(31 downto 0);
            BUS_Flash_0_ADDRESS : IN STD_LOGIC_VECTOR(15 downto 0); 
            BUS_Flash_0_WRITE_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
            BUS_Flash_0_W_INT : IN STD_LOGIC_VECTOR(0 downto 0); 
            BUS_Flash_0_R_INT : IN STD_LOGIC_VECTOR(0 downto 0); 
            BUS_Flash_0_VLD : OUT STD_LOGIC_VECTOR(0 downto 0); 
            
            REG_FLASH_CNTR_RD : OUT STD_LOGIC_VECTOR(31 downto 0); 
            REG_FLASH_CNTR_WR : IN STD_LOGIC_VECTOR(31 downto 0); 
            INT_FLASH_CNTR_RD : IN STD_LOGIC_VECTOR(0 downto 0); 
            INT_FLASH_CNTR_WR : IN STD_LOGIC_VECTOR(0 downto 0);  
            
            REG_FLASH_ADDRESS_RD : OUT STD_LOGIC_VECTOR(31 downto 0); 
            REG_FLASH_ADDRESS_WR : IN STD_LOGIC_VECTOR(31 downto 0); 
            INT_FLASH_ADDRESS_RD : IN STD_LOGIC_VECTOR(0 downto 0); 
            INT_FLASH_ADDRESS_WR : IN STD_LOGIC_VECTOR(0 downto 0);                 
            
            SPI_CS : out  STD_LOGIC;
            SPI_DIN : in  STD_LOGIC;
            SPI_DOUT : out  STD_LOGIC;
            SPI_CLK : out  STD_LOGIC 
    );
end FlashController;


architecture Behavioral of FlashController is
signal mem_ce : std_logic := '0';
	signal mem_we : std_logic := '0';
	signal mem_web : std_logic := '0';
	signal mem_addrb : std_logic_vector(7 downto 0) := x"00";
	signal mem_A_Wb : std_logic_vector(7 downto 0) := x"00";
	signal mem_A_Rb : std_logic_vector(7 downto 0) := x"00";
	
	signal mem_reg_data_rd : std_logic_vector (31 downto 0);
	signal int_reg_data_rd : std_logic_vector (31 downto 0);
	signal mem_reg_data_wr : std_logic_vector (31 downto 0);
	
	signal state_machine_status : integer := 0;
	signal SM_enable_write : integer := 0;
	signal SM_read_status_register : integer := 0;
	signal SM_erase_sector : integer := 0;
	signal SM_program_page : integer := 0;
	signal SM_read_page : integer := 0;
	signal SM_NOP : integer := 0;
	
	signal SP_ADDR : std_logic_vector(2 downto 0);
	signal SP_D_RD : std_logic_vector(7 downto 0);
	signal SP_D_WR : std_logic_vector(7 downto 0);
	signal SP_W : std_logic := '0';
	signal SP_CE : std_logic := '0';
	
	signal RG_address : std_logic_vector(23 downto 0);
	signal RG_payload_len : std_logic_vector(7 downto 0);
	
	
	signal SP_status : std_logic_vector(7 downto 0);
	
	signal dummycounter : std_logic_vector(7 downto 0);
	
	signal nextimeexit : std_logic := '0';
	
	attribute keep : string; 
	attribute keep of SP_ADDR: signal is "true";	
	attribute keep of SP_D_RD: signal is "true";	
	attribute keep of SP_D_WR: signal is "true";	
	attribute keep of SP_W: signal is "true";	
	attribute keep of SP_CE: signal is "true";	

	COMPONENT FlashPageMemory
	PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    clkb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	END COMPONENT;

	COMPONENT spi_ctrl
	PORT(
		clk_in : IN std_logic;
		rst : IN std_logic;
		spi_din : IN std_logic;
		sel : IN std_logic;
		wr : IN std_logic;
		addr : IN std_logic_vector(2 downto 0);
		d_in : IN std_logic_vector(7 downto 0);          
		spi_clk : OUT std_logic;
		spi_cs : OUT std_logic;
		spi_dout : OUT std_logic;
		d_out : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
begin
  PAGEMEM : FlashPageMemory
PORT MAP (
  clka => clk,
  wea => BUS_Flash_0_W_INT,
  addra => BUS_Flash_0_ADDRESS(5 downto 0),
  dina => BUS_Flash_0_WRITE_DATA,
  douta => BUS_Flash_0_READ_DATA,
  clkb => clk,
  web(0) => mem_web,
  addrb => mem_addrb,
  dinb => mem_A_Wb,
  doutb => mem_A_Rb
);

BUS_Flash_0_VLD <= "1";

  Inst_spi_ctrl: spi_ctrl PORT MAP(
      clk_in => CLK,
      rst => '0' ,
      spi_clk => SPI_CLK ,
      spi_cs => SPI_CS ,
      spi_din => SPI_DIN  ,
      spi_dout => SPI_DOUT ,
      sel => SP_CE,
      wr => SP_W,
      addr => SP_ADDR,
      d_in => SP_D_WR,
      d_out => SP_D_RD
  );


sm: process(clk)
	begin
		if rising_edge(clk) then
			SP_W <= '0';
			mem_web <= '0';
			case state_machine_status is 
				when 0 =>
					SM_enable_write <= 0;
					SM_read_status_register <= 0;
					nextimeexit <= '0';
				--ABILITA SCRITTURA FLASH
				when 1 =>				
					case SM_enable_write is
						when 0 =>
							SP_D_WR <= x"06"; --COMANDO ABILITA SCRITTURA
							SP_ADDR <= "001"; --INDIRIZZO 1
							SP_CE <= '1';
							SP_W <= '1';
							SM_enable_write <= 1;
						when 1 =>
							
							if SP_D_RD (0) = '1' then	--ATTENDI AVVIO PROCESS
								SM_enable_write <= 2;
							end if;
						when 2 =>
							if SP_D_RD (0) = '1' then	--ATTENDI FINE PROCESSO
								SM_enable_write <= 0;
								state_machine_status <= 0; --RESET MSM IN 0
								SP_CE <= '0';
							end if;						
						when others =>
							SM_enable_write <= 0;
					end case;
				
				--LEGGI REGISTRO DI STATO FLASH		
				when 2 =>
					case SM_read_status_register is
						when 0 =>
							SP_D_WR <= x"05"; --COMANDO LEGGI REGISTRO STATO
							SP_ADDR <= "001"; --INDIRIZZO 1
							SP_CE <= '1';
							SP_W <= '1';
							SM_read_status_register <= 1;
						when 1 =>
							if SP_D_RD (0) = '1' then	--ATTENDI AVVIO PROCESS
								SM_read_status_register <= 2;
							end if;
						when 2 =>
							if SP_D_RD (0) = '0' then	--ATTENDI FINE PROCESS
								SM_read_status_register <= 3;
								SP_CE <= '0';
							end if;							
							
						when 3 =>
							SP_ADDR <= "000"; --INDIRIZZO 0 (LETTURA DATI)
							SP_CE <= '1';
							SM_read_status_register <= 4;
							
						when 4 =>						
							SP_status <= SP_D_RD;
							SM_read_status_register <= 0;
							state_machine_status <= 0; --RESET MSM IN 0
							
						when others =>
							SM_read_status_register <= 0;
							
					end case;
					
				--CENCELLA UN SETTORE
				when 3 =>
					case SM_erase_sector is
						when 0 =>
							SP_D_WR <= RG_address(7 downto 0);
							SP_ADDR <= "010"; --INDIRIZZO 1
							SP_CE <= '1';
							SP_W <= '1';
							SM_erase_sector <= 1;
						when 1 =>
							SP_D_WR <= RG_address(15 downto 8);
							SP_ADDR <= "011"; --INDIRIZZO 2
							SP_CE <= '1';
							SP_W <= '1';
							SM_erase_sector <= 2;
							
						when 2 =>
							SP_D_WR <= RG_address(23 downto 16);
							SP_ADDR <= "100"; --INDIRIZZO 3
							SP_CE <= '1';
							SP_W <= '1';
							SM_erase_sector <= 3;						
							
						when 3 =>
							SP_D_WR <= x"D8";	--SECTOR ERASE;
							SP_ADDR <= "001"; --INDIRIZZO 1
							SP_CE <= '1';
							SP_W <= '1';
							SM_erase_sector <= 4;	
							
						when 4 =>
							if SP_D_RD (0) = '1' then	--ATTENDI AVVIO PROCESS
								SM_erase_sector <= 5;
							end if;
							
						when 5 =>
							if SP_D_RD (0) = '0' then	--ATTENDI FINE PROCESS
								SM_erase_sector <= 0;
								state_machine_status <= 0; 
								SP_CE <= '0';
							end if;		
							
						when others =>
							SM_erase_sector <= 0;
							
					end case;
					
				--SCRIVI UNA PAGINA
				when 4=>
					case SM_program_page is
						when 0 =>
							SP_D_WR <= RG_address(7 downto 0);
							SP_ADDR <= "010"; --INDIRIZZO 1
							SP_CE <= '1';
							SP_W <= '1';
							SM_program_page <= 1;
							mem_addrb <= x"00";	--INIZIALIZZA PRIMO INDIRIZZO RAM
							
						when 1 =>
							SP_D_WR <= RG_address(15 downto 8);
							SP_ADDR <= "011"; --INDIRIZZO 2
							SP_CE <= '1';
							SP_W <= '1';
							SM_program_page <= 2;
							
						when 2 =>
							SP_D_WR <= RG_address(23 downto 16);
							SP_ADDR <= "100"; --INDIRIZZO 3
							SP_CE <= '1';
							SP_W <= '1';
							SM_program_page <= 4;	

						when 3 =>
							SP_D_WR <= mem_A_Rb;	--DATA FROM MEMORY (FIRST BYTE);
							mem_addrb <= mem_addrb +1;
							
							SP_ADDR <= "000"; --INDIRIZZO DATA
							SP_CE <= '1';
							SP_W <= '1';
							SM_program_page <= 4;
							
						when 4 =>
							SP_D_WR <= x"02"; --COMANDO PROGRAM PAGE
							SP_ADDR <= "001"; --INDIRIZZO CMD
							SP_CE <= '1';
							SP_W <= '1';
							SM_program_page <= 5;	
						
						when 5 =>
							if SP_D_RD (0) = '1' then	--ATTENDI AVVIO PROCESS
								SM_program_page <= 6;
							end if;
							
							
						when 6 =>
							if nextimeexit = '1' then
								SM_program_page <= 0;
								state_machine_status <= 15; 
								SP_CE <= '0';							
							elsif SP_D_RD (3) = '1' then	--ATTENDI FINE PROCESS
								if mem_addrb = RG_payload_len then
									--SM_program_page <= 0;
									--state_machine_status <= 15; 
									--SP_CE <= '0';
									nextimeexit <= '1';
								end if;
								--else
									SM_program_page <= 4;
									SP_D_WR <= mem_A_Rb;	--DATA FROM MEMORY (FIRST BYTE);
									mem_addrb <= mem_addrb +1;
									SP_ADDR <= "000"; --INDIRIZZO DATA
									SP_W <= '1';
								--end if;
							end if;		
							
					
						when others => 
							SM_program_page <= 0;
					end case;
					
				--LEGGI UNA PAGINA
				when 5=>
				case SM_read_page is
						when 0 =>
							SP_D_WR <= RG_address(7 downto 0);
							SP_ADDR <= "010"; --INDIRIZZO 1
							SP_CE <= '1';
							SP_W <= '1';
							SM_read_page <= 1;
							mem_addrb <= x"00";	--INIZIALIZZA PRIMO INDIRIZZO RAM
							
						when 1 =>
							SP_D_WR <= RG_address(15 downto 8);
							SP_ADDR <= "011"; --INDIRIZZO 2
							SP_CE <= '1';
							SP_W <= '1';
							SM_read_page <= 2;
							
						when 2 =>
							SP_D_WR <= RG_address(23 downto 16);
							SP_ADDR <= "100"; --INDIRIZZO 3
							SP_CE <= '1';
							SP_W <= '1';
							SM_read_page <= 3;	
							
						when 3 =>
							SP_D_WR <= x"03"; --COMANDO PROGRAM PAGE
							SP_ADDR <= "001"; --INDIRIZZO CMD
							SP_CE <= '1';
							SP_W <= '1';
							SM_read_page <= 4;	
						
						when 4 => 
							SP_CE <= '0';
							SM_read_page <= 5;	
							
						when 5 =>
							SP_CE <= '1';
							if SP_D_RD (0) = '1' then	--ATTENDI AVVIO PROCESS
								SM_read_page <= 6;
								dummycounter <= x"05";
							end if;
							
							
						when 6 =>
							if SP_D_RD (2) = '1' then	--ATTENDI FINE PROCESS
							if dummycounter=x"00" then
								SP_ADDR <= "000"; --INDIRIZZO DATI
								SM_read_page <= 7;
							else
								dummycounter <= dummycounter -1;
							end if;
							end if;
						
						when 7 =>
								mem_A_Wb <= SP_D_RD;
								mem_web <= '1';
								SP_ADDR <= "001"; --INDIRIZZO DATI
								SM_read_page <= 8;
								dummycounter <= x"05";
						when 8 =>
							if dummycounter=x"00" then
								if SP_D_RD (2) = '0' then	--ATTENDI AVVIO PROCESS
									SM_read_page <= 9;								
								end if;
							else
								dummycounter <= dummycounter -1;
							end if;
											
						when 9 =>
							if mem_addrb = RG_payload_len then
								SM_read_page <= 0;
								state_machine_status <= 15; 
								SP_CE <= '0';
							else
								SM_read_page <= 5;
								mem_addrb <= mem_addrb +1;
							end if;
								
							
					
						when others => 
							SM_program_page <= 0;
					end case;
				when 15 =>
					case SM_NOP is
						when 0 =>
							SP_D_WR <= x"FF"; --COMANDO NOP
							SP_ADDR <= "001"; --INDIRIZZO 1
							SP_CE <= '1';
							SP_W <= '1';
							SM_NOP <= 1;
						when 1 =>
							if SP_D_RD (0) = '1' then	--ATTENDI AVVIO PROCESS
								SM_NOP <= 2;
							end if;
						when 2 =>
							if SP_D_RD (0) = '0' then	--ATTENDI FINE PROCESS
								SM_NOP <= 3;
								SP_CE <= '0';
							end if;							
							
						when 3 =>
							SP_ADDR <= "000"; --INDIRIZZO 0 (LETTURA DATI)
							SP_CE <= '1';
							SM_NOP <= 4;
							
						when 4 =>						
							SP_status <= SP_D_RD;
							SM_NOP <= 0;
							state_machine_status <= 0; --RESET MSM IN 0
							
						when others =>
							SM_NOP <= 0;
							
					end case;
					
				when others => 
					state_machine_status	<= 0;
			end case;
			
			if INT_FLASH_CNTR_WR = "1" then
			     state_machine_status <= conv_integer(REG_FLASH_CNTR_WR);
			end if;
			
            
             if INT_FLASH_ADDRESS_WR="1" then
                RG_address <= REG_FLASH_ADDRESS_WR(23 downto 0);
             end if;
             RG_payload_len <= x"FF";
             
             REG_FLASH_ADDRESS_RD <= REG_FLASH_ADDRESS_WR;			
			 REG_FLASH_CNTR_RD <= conv_std_logic_vector(state_machine_status,32);
			end if;
        end process;
        
end Behavioral;
