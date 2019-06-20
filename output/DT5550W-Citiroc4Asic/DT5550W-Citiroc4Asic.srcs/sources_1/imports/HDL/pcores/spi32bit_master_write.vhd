library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity spi32bit_master_write is
	Generic (SPISLAVEBits : integer := 32);
    Port ( clock_in : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data : in  STD_LOGIC_VECTOR (31 downto 0);
           dataout : out  STD_LOGIC_VECTOR (31 downto 0);
           ce : in  STD_LOGIC;
			  serial_clk : out  STD_LOGIC;
           serial_out : out  STD_LOGIC;
           serial_in  : in  STD_LOGIC;
			  serial_ce : out  STD_LOGIC;
           ack : out  STD_LOGIC);
end spi32bit_master_write;

architecture Behavioral of spi32bit_master_write is

	signal tx_data : STD_LOGIC_VECTOR (31 downto 0);
	signal tx_enable : STD_LOGIC;


	type TX_STATE is (	PARTENZA,
								TRASMISSIONE,
								STOP
								);
	signal tx_state_machine : TX_STATE := PARTENZA;
	signal bit_count : integer range 0 to 36;
	
	signal lowfreqclk : std_logic;
	
	attribute keep : string; 
	attribute keep of ack : signal is "true"; 
	
	
	COMPONENT spi_timing_module
	PORT(
		clock_in : IN std_logic;
		reset : IN std_logic;          
		clock_out : OUT std_logic
		);
	END COMPONENT;

begin


	Inst_spi_timing_module: spi_timing_module PORT MAP(
		clock_in => clock_in,
		reset => '0',
		clock_out => lowfreqclk
	);

serial_clk <= lowfreqclk;


tx_machine : process (clock_in, reset)
begin 
	if reset = '1' then
		tx_state_machine <= PARTENZA;
		tx_enable <= '0';
		ack <= '0';
	elsif rising_edge (clock_in) then
		case tx_state_machine is
			when PARTENZA =>
				ack <= '0';
				tx_enable <= '0';
				if ce = '1' then
					tx_data <=  data;
					tx_state_machine <= TRASMISSIONE;
				else
					tx_state_machine <= PARTENZA;
				end if;
				
			when TRASMISSIONE =>
				if bit_count = SPISLAVEBits then
					tx_enable <= '0';
					tx_state_machine <= STOP;
				else
					tx_enable <= '1';				
					tx_state_machine <= TRASMISSIONE;
				end if;
				
			when STOP =>
				ack <= '1';
				tx_state_machine <= PARTENZA;
			
			
			when others =>
				tx_state_machine <= PARTENZA;
		end case;
	end if;
			
end process;

bit_output : process (clock_in, reset)
begin
	if reset = '1' then
		serial_ce <= '1';
		serial_out <= '0';
		bit_count <= 0;
	elsif falling_edge (lowfreqclk) then
		
		if tx_enable = '0' then
			serial_ce <= '1';
			bit_count <= 0;
			serial_out <='0';
		else
			serial_ce <= '0';
			serial_out <= tx_data(bit_count);
			bit_count <= bit_count + 1;
		end if;
		
	end if;
end process;	


bit_input : process (clock_in, reset)
begin
	if reset = '1' then
		
	elsif rising_edge (lowfreqclk) then
		
		if tx_enable = '0' then
            
		else
			dataout(bit_count) <= serial_in;
		end if;
		
	end if;
end process;	
end Behavioral;


