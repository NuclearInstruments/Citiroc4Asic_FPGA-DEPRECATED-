library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Library xpm;
use xpm.vcomponents.all;

library UNISIM;
use UNISIM.VComponents.all;
use ieee.math_real.all;

entity CitirocFrameTransfer is

  Generic (	memLength : integer := 8192 );
    Port (  
          clk : in std_logic;
		  reset : in std_logic;
		  
		  DATA_A : in std_logic_vector (32*32 -1 downto 0);
		  TS_T0_A : in std_logic_vector (32 -1 downto 0);
          TS_A : in std_logic_vector (64 -1 downto 0);
		  DV_A : in std_logic;
		  ACK_A : out std_logic;
		  
		  DATA_B : in std_logic_vector (32*32 -1 downto 0);
		  TS_T0_B : in std_logic_vector (32 -1 downto 0);
          TS_B : in std_logic_vector (64 -1 downto 0);
		  DV_B : in std_logic;
		  ACK_B : out std_logic;
		  
		  DATA_C : in std_logic_vector (32*32 -1 downto 0);
		  TS_T0_C : in std_logic_vector (32 -1 downto 0);
          TS_C : in std_logic_vector (64 -1 downto 0);
		  DV_C : in std_logic;
		  ACK_C : out std_logic;		  
		  
		  DATA_D : in std_logic_vector (32*32 -1 downto 0);
		  TS_T0_D : in std_logic_vector (32 -1 downto 0);
          TS_D : in std_logic_vector (64 -1 downto 0);
		  DV_D : in std_logic;
		  ACK_D : out std_logic;

		  
		  BUSY : out std_logic;
		  
          FIFO_FULL : out std_logic;
		  DATA_AVAL : out std_logic;
		  
		  CONTROL_REG : in std_logic_vector(31 downto 0);
		  STATUS_REG : out std_logic_vector(31 downto 0);
		  
		  READ_DATA: OUT STD_LOGIC_VECTOR (31 downto 0);
		  READ_DATAVALID: OUT STD_LOGIC_VECTOR (0 downto 0);
		  READ_RD_INT: IN STD_LOGIC_VECTOR (0 downto 0);
		  
		  READ_RESET: IN STD_LOGIC;
		  
		  READ_CLK: IN STD_LOGIC
		  
		  
);
end CitirocFrameTransfer;

architecture Behavioral of CitirocFrameTransfer is

		constant TotalWords : integer := memLength;

constant MaxPacketSize : integer := 38;
constant busWidthWrite : integer := 32;
constant busWidthRead : integer := 32;
constant wBits : integer := integer(ceil(log2(real(TotalWords))));
constant rBits : integer := integer(ceil(log2(real(TotalWords * busWidthWrite/busWidthRead))));


    COMPONENT RDO_LIST_FIFO IS
      PORT (
        rst : IN STD_LOGIC;
        wr_clk : IN STD_LOGIC;
        rd_clk : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        full : OUT STD_LOGIC;
        empty : OUT STD_LOGIC;
        prog_full : OUT STD_LOGIC;
        prog_empty : OUT STD_LOGIC
      );
    END COMPONENT;
	
	signal TotalEventCounter : std_logic_vector (31 downto 0) := (others => '0');
	
BEGIN
 arbiter : block
        signal SMARBITER : std_logic_vector (3 downto 0) := x"0";
        signal ARBITERID : integer range 0 to 63 := 0;
        signal RDO_FIFO_DIN : std_logic_vector (31 downto 0);
        signal RDO_FIFO_WE : std_logic_vector (0 downto 0) := "0";
        signal RDO_FIFO_FREE : std_logic_vector (0 downto 0) := "0";
        signal FIFODATALATCH : std_logic_vector (38*32-1 downto 0);
        signal IwriteF : integer range 0 to 63 := 0;
        signal FIFODV : std_logic;
        signal FIFOPROGFULL : std_logic;
        signal FIFOPROGEMPTY : std_logic;
		
	   signal FIFO_FLUSH : std_logic := '0';
	
    begin
    
	
	
xpm_fifo_async_inst : xpm_fifo_async
generic map (
	FIFO_MEMORY_TYPE => "auto", --string; "auto", "block", or "distributed";
	ECC_MODE => "no_ecc", --string; "no_ecc" or "en_ecc";
	RELATED_CLOCKS => 0, --positive integer; 0 or 1
	FIFO_WRITE_DEPTH => TotalWords , --positive integer
	WRITE_DATA_WIDTH => busWidthWrite, --positive integer
	WR_DATA_COUNT_WIDTH => wBits, --positive integer
	PROG_FULL_THRESH => TotalWords-MaxPacketSize, --positive integer
	FULL_RESET_VALUE => 0, --positive integer; 0 or 1;
	READ_MODE => "std", --string; "std" or "fwft";
	FIFO_READ_LATENCY => 1, --positive integer;
	READ_DATA_WIDTH => busWidthRead, --positive integer
	RD_DATA_COUNT_WIDTH => rBits, --positive integer
	PROG_EMPTY_THRESH => MaxPacketSize, --positive integer
	DOUT_RESET_VALUE => "0", --string
	CDC_SYNC_STAGES => 2, --positive integer
	WAKEUP_TIME => 0 --positive integer; 0 or 2;
)
port map (
	sleep => '0',
	rst => FIFO_FLUSH,
	wr_clk => CLK,
	wr_en => RDO_FIFO_WE(0),
	din => RDO_FIFO_DIN,
	full => open,
	overflow => open,
	wr_rst_busy => open,
	rd_clk => READ_CLK,
	rd_en => READ_RD_INT(0),
	dout => READ_DATA,
	empty => open,
	underflow => open,
	rd_rst_busy => open,
	prog_full => FIFOPROGFULL,
	wr_data_count => open,
	prog_empty => FIFOPROGEMPTY,
	rd_data_count => STATUS_REG(16+rBits-1 downto 16),
	injectsbiterr => '0',
	injectdbiterr => '0',
	sbiterr => open,
	dbiterr => open
);



    -- instRDO_LIST_FIFO: RDO_LIST_FIFO 
      -- PORT MAP(
        -- rst => READ_RESET,
        -- wr_clk => CLK,
        -- rd_clk => READ_CLK,
        -- din => RDO_FIFO_DIN,
        -- wr_en => RDO_FIFO_WE(0),
        -- rd_en =>  READ_RD_INT(0),
        -- dout => READ_DATA,
        -- full => open, 
        -- empty =>open ,
        -- prog_full => FIFOPROGFULL,
        -- prog_empty => FIFOPROGEMPTY
      -- );
    
    FIFO_FULL <= FIFOPROGFULL;
	DATA_AVAL <= not FIFOPROGEMPTY;
	
    RDO_FIFO_FREE(0) <= not FIFOPROGFULL;
    READ_DATAVALID(0) <= not FIFOPROGEMPTY;
    
	
	STATUS_REG(0) <= not FIFOPROGEMPTY;
    
    READOUT_ARBITER : PROCESS (clk)
    begin
		if READ_RESET = '1' or CONTROL_REG(8) = '1' then
			TotalEventCounter <= (others =>'0');
			SMARBITER <= x"0";
			BUSY <= '0';
			ACK_A <= '0';
            ACK_B <= '0';
            ACK_C <= '0';
            ACK_D <= '0';
            RDO_FIFO_WE <= "0";
			ARBITERID <= 0;
			FIFO_FLUSH <= '1';
        elsif rising_edge(clk) then
            FIFO_FLUSH <= '0';
            ACK_A <= '0';
            ACK_B <= '0';
            ACK_C <= '0';
            ACK_D <= '0';
            RDO_FIFO_WE <= "0";

            
            case SMARBITER is
                when x"0" =>
                    BUSY <= '0';
                    case ARBITERID is
                        when 0 =>
                             if DV_A = '1' and CONTROL_REG(0) = '0' then
                                FIFODATALATCH(32*1-1 downto 32*0) <= x"80000000";
                                FIFODATALATCH(32*2-1 downto 32*1) <= TS_T0_A;
                                FIFODATALATCH(32*3-1 downto 32*2) <= TS_A(31 downto 0);
                                FIFODATALATCH(32*4-1 downto 32*3) <= TS_A(63 downto 32);
                                FIFODATALATCH(32*5-1 downto 32*4) <= TotalEventCounter;
                                FIFODATALATCH(32*37-1 downto 32*5) <= DATA_A;
                                FIFODATALATCH(32*38-1 downto 32*37) <= x"C0000000";
                                if RDO_FIFO_FREE = "1" then
                                    SMARBITER <= x"1";
                                end if; 
                                ACK_A <= '1';
                                IwriteF <= 0;
                                TotalEventCounter <= TotalEventCounter +1;
                             end if;
                             ARBITERID <= 1;
                        when 1 =>
                            if DV_B = '1' and CONTROL_REG(1) = '0' then
                               FIFODATALATCH(32*1-1 downto 32*0) <= x"80000001";
                               FIFODATALATCH(32*2-1 downto 32*1) <= TS_T0_B;
                               FIFODATALATCH(32*3-1 downto 32*2) <= TS_B(31 downto 0);
                               FIFODATALATCH(32*4-1 downto 32*3) <= TS_B(63 downto 32);
                               FIFODATALATCH(32*5-1 downto 32*4) <= TotalEventCounter;
                               FIFODATALATCH(32*37-1 downto 32*5) <= DATA_B;
                               FIFODATALATCH(32*38-1 downto 32*37) <= x"C0000000";
                               if RDO_FIFO_FREE = "1" then
                                    SMARBITER <= x"1";
                               end if; 
                               ACK_B <= '1';
                               IwriteF <= 0;
                               TotalEventCounter <= TotalEventCounter +1;
                            end if;
                            ARBITERID <= 2;                         
                        when 2 =>
                            if DV_C = '1' and CONTROL_REG(2) = '0' then
                               FIFODATALATCH(32*1-1 downto 32*0) <= x"80000002";
                               FIFODATALATCH(32*2-1 downto 32*1) <= TS_T0_C;
                               FIFODATALATCH(32*3-1 downto 32*2) <= TS_C(31 downto 0);
                               FIFODATALATCH(32*4-1 downto 32*3) <= TS_C(63 downto 32);
                               FIFODATALATCH(32*5-1 downto 32*4) <= TotalEventCounter;
                               FIFODATALATCH(32*37-1 downto 32*5) <= DATA_C;
                               FIFODATALATCH(32*38-1 downto 32*37) <= x"C0000000";
                               if RDO_FIFO_FREE = "1" then
                                    SMARBITER <= x"1";
                               end if; 
                               ACK_C <= '1';
                               IwriteF <= 0;
                               TotalEventCounter <= TotalEventCounter +1;
                            end if;
                            ARBITERID <= 3; 
                        when 3 => 
                            if DV_D = '1' and CONTROL_REG(3) = '0' then
                               FIFODATALATCH(32*1-1 downto 32*0) <= x"80000003";
                               FIFODATALATCH(32*2-1 downto 32*1) <= TS_T0_D;
                               FIFODATALATCH(32*3-1 downto 32*2) <= TS_D(31 downto 0);
                               FIFODATALATCH(32*4-1 downto 32*3) <= TS_D(63 downto 32);
                               FIFODATALATCH(32*5-1 downto 32*4) <= TotalEventCounter;
                               FIFODATALATCH(32*37-1 downto 32*5) <= DATA_D;
                               FIFODATALATCH(32*38-1 downto 32*37) <= x"C0000000";
                               if RDO_FIFO_FREE = "1" then
                                    SMARBITER <= x"1";
                               end if; 
                               ACK_D <= '1';
                               IwriteF <= 0;
                               TotalEventCounter <= TotalEventCounter +1;
                            end if;
                            ARBITERID <= 0; 
                        when others =>
                            ARBITERID <= 0;
                    end case;
                when x"1" =>
					BUSY <= '1';
                    RDO_FIFO_DIN <= FIFODATALATCH((IwriteF+1)*32 -1 downto IwriteF*32);
                    RDO_FIFO_WE <= "1";
                    if IwriteF = 37 then
                        SMARBITER <= x"0";
                    else
                        IwriteF <= IwriteF +1;
                    end if;
                when others => 
                    SMARBITER <= x"0";
            end case;
			

        end if;
    end process;
    end block;

end Behavioral;