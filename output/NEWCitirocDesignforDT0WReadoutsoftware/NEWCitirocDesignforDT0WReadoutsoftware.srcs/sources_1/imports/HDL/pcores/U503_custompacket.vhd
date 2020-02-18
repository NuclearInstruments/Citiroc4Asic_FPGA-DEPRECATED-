
    library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.STD_LOGIC_ARITH.ALL;
    use IEEE.STD_LOGIC_UNSIGNED.ALL;
    use IEEE.STD_LOGIC_MISC.ALL;

    use ieee.math_real.all;
    Library xpm;
    use xpm.vcomponents.all;

entity U503_custompacket is
  Generic (	wordWidth : integer := 32;
			memLength : integer := 4096);
  port (
	RESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
    
	CLK_WRITE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CLK_READ : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
    	IN_1 : STD_LOGIC_VECTOR(31 downto 0);
	IN_2 : STD_LOGIC_VECTOR(31 downto 0);
	IN_3 : STD_LOGIC_VECTOR(31 downto 0);
	IN_4 : STD_LOGIC_VECTOR(31 downto 0);
	IN_5 : STD_LOGIC_VECTOR(31 downto 0);
	IN_6 : STD_LOGIC_VECTOR(31 downto 0);
	IN_7 : STD_LOGIC_VECTOR(31 downto 0);
	IN_8 : STD_LOGIC_VECTOR(31 downto 0);
	IN_9 : STD_LOGIC_VECTOR(31 downto 0);
	IN_10 : STD_LOGIC_VECTOR(31 downto 0);
	IN_11 : STD_LOGIC_VECTOR(31 downto 0);
	IN_12 : STD_LOGIC_VECTOR(31 downto 0);
	IN_13 : STD_LOGIC_VECTOR(31 downto 0);
	IN_14 : STD_LOGIC_VECTOR(31 downto 0);
	IN_15 : STD_LOGIC_VECTOR(31 downto 0);
	IN_16 : STD_LOGIC_VECTOR(31 downto 0);
	IN_17 : STD_LOGIC_VECTOR(31 downto 0);
	IN_18 : STD_LOGIC_VECTOR(31 downto 0);
	IN_19 : STD_LOGIC_VECTOR(31 downto 0);
	IN_20 : STD_LOGIC_VECTOR(31 downto 0);
	IN_21 : STD_LOGIC_VECTOR(31 downto 0);
	IN_22 : STD_LOGIC_VECTOR(31 downto 0);
	IN_23 : STD_LOGIC_VECTOR(31 downto 0);
	IN_24 : STD_LOGIC_VECTOR(31 downto 0);
	IN_25 : STD_LOGIC_VECTOR(31 downto 0);
	IN_26 : STD_LOGIC_VECTOR(31 downto 0);
	IN_27 : STD_LOGIC_VECTOR(31 downto 0);
	IN_28 : STD_LOGIC_VECTOR(31 downto 0);
	IN_29 : STD_LOGIC_VECTOR(31 downto 0);
	IN_30 : STD_LOGIC_VECTOR(31 downto 0);
	IN_31 : STD_LOGIC_VECTOR(31 downto 0);
	IN_32 : STD_LOGIC_VECTOR(31 downto 0);
	IN_33 : STD_LOGIC_VECTOR(31 downto 0);
	IN_34 : STD_LOGIC_VECTOR(31 downto 0);
	IN_35 : STD_LOGIC_VECTOR(31 downto 0);
	IN_36 : STD_LOGIC_VECTOR(31 downto 0);
	IN_37 : STD_LOGIC_VECTOR(31 downto 0);
	IN_38 : STD_LOGIC_VECTOR(31 downto 0);
	IN_39 : STD_LOGIC_VECTOR(31 downto 0);
	IN_40 : STD_LOGIC_VECTOR(31 downto 0);
	IN_41 : STD_LOGIC_VECTOR(31 downto 0);
	IN_42 : STD_LOGIC_VECTOR(31 downto 0);
	IN_43 : STD_LOGIC_VECTOR(31 downto 0);
	IN_44 : STD_LOGIC_VECTOR(31 downto 0);
	IN_45 : STD_LOGIC_VECTOR(31 downto 0);
	IN_46 : STD_LOGIC_VECTOR(31 downto 0);
	IN_47 : STD_LOGIC_VECTOR(31 downto 0);
	IN_48 : STD_LOGIC_VECTOR(31 downto 0);
	IN_49 : STD_LOGIC_VECTOR(31 downto 0);
	IN_50 : STD_LOGIC_VECTOR(31 downto 0);
	IN_51 : STD_LOGIC_VECTOR(31 downto 0);
	IN_52 : STD_LOGIC_VECTOR(31 downto 0);
	IN_53 : STD_LOGIC_VECTOR(31 downto 0);
	IN_54 : STD_LOGIC_VECTOR(31 downto 0);
	IN_55 : STD_LOGIC_VECTOR(31 downto 0);
	IN_56 : STD_LOGIC_VECTOR(31 downto 0);
	IN_57 : STD_LOGIC_VECTOR(31 downto 0);
	IN_58 : STD_LOGIC_VECTOR(31 downto 0);
	IN_59 : STD_LOGIC_VECTOR(31 downto 0);
	IN_60 : STD_LOGIC_VECTOR(31 downto 0);
	IN_61 : STD_LOGIC_VECTOR(31 downto 0);
	IN_62 : STD_LOGIC_VECTOR(31 downto 0);
	IN_63 : STD_LOGIC_VECTOR(31 downto 0);
	IN_64 : STD_LOGIC_VECTOR(31 downto 0);
	IN_65 : STD_LOGIC_VECTOR(31 downto 0);
	IN_66 : STD_LOGIC_VECTOR(31 downto 0);
	IN_67 : STD_LOGIC_VECTOR(31 downto 0);
	IN_68 : STD_LOGIC_VECTOR(31 downto 0);
	IN_69 : STD_LOGIC_VECTOR(31 downto 0);
	IN_70 : STD_LOGIC_VECTOR(31 downto 0);
	IN_71 : STD_LOGIC_VECTOR(31 downto 0);
	IN_72 : STD_LOGIC_VECTOR(31 downto 0);
	IN_73 : STD_LOGIC_VECTOR(31 downto 0);
	IN_74 : STD_LOGIC_VECTOR(31 downto 0);
	IN_75 : STD_LOGIC_VECTOR(31 downto 0);
	IN_76 : STD_LOGIC_VECTOR(31 downto 0);
	IN_77 : STD_LOGIC_VECTOR(31 downto 0);
	IN_78 : STD_LOGIC_VECTOR(31 downto 0);
	IN_79 : STD_LOGIC_VECTOR(31 downto 0);
	IN_80 : STD_LOGIC_VECTOR(31 downto 0);
	IN_81 : STD_LOGIC_VECTOR(31 downto 0);
	IN_82 : STD_LOGIC_VECTOR(31 downto 0);
	IN_83 : STD_LOGIC_VECTOR(31 downto 0);
	IN_84 : STD_LOGIC_VECTOR(31 downto 0);
	IN_85 : STD_LOGIC_VECTOR(31 downto 0);
	IN_86 : STD_LOGIC_VECTOR(31 downto 0);
	IN_87 : STD_LOGIC_VECTOR(31 downto 0);
	IN_88 : STD_LOGIC_VECTOR(31 downto 0);
	IN_89 : STD_LOGIC_VECTOR(31 downto 0);
	IN_90 : STD_LOGIC_VECTOR(31 downto 0);
	IN_91 : STD_LOGIC_VECTOR(31 downto 0);
	IN_92 : STD_LOGIC_VECTOR(31 downto 0);
	IN_93 : STD_LOGIC_VECTOR(31 downto 0);
	IN_94 : STD_LOGIC_VECTOR(31 downto 0);
	IN_95 : STD_LOGIC_VECTOR(31 downto 0);
	IN_96 : STD_LOGIC_VECTOR(31 downto 0);
	IN_97 : STD_LOGIC_VECTOR(31 downto 0);
	IN_98 : STD_LOGIC_VECTOR(31 downto 0);
	IN_99 : STD_LOGIC_VECTOR(31 downto 0);
	IN_100 : STD_LOGIC_VECTOR(31 downto 0);
	IN_101 : STD_LOGIC_VECTOR(31 downto 0);
	IN_102 : STD_LOGIC_VECTOR(31 downto 0);
	IN_103 : STD_LOGIC_VECTOR(31 downto 0);
	IN_104 : STD_LOGIC_VECTOR(31 downto 0);
	IN_105 : STD_LOGIC_VECTOR(31 downto 0);
	IN_106 : STD_LOGIC_VECTOR(31 downto 0);
	IN_107 : STD_LOGIC_VECTOR(31 downto 0);
	IN_108 : STD_LOGIC_VECTOR(31 downto 0);
	IN_109 : STD_LOGIC_VECTOR(31 downto 0);
	IN_110 : STD_LOGIC_VECTOR(31 downto 0);
	IN_111 : STD_LOGIC_VECTOR(31 downto 0);
	IN_112 : STD_LOGIC_VECTOR(31 downto 0);
	IN_113 : STD_LOGIC_VECTOR(31 downto 0);
	IN_114 : STD_LOGIC_VECTOR(31 downto 0);
	IN_115 : STD_LOGIC_VECTOR(31 downto 0);
	IN_116 : STD_LOGIC_VECTOR(31 downto 0);
	IN_117 : STD_LOGIC_VECTOR(31 downto 0);
	IN_118 : STD_LOGIC_VECTOR(31 downto 0);
	IN_119 : STD_LOGIC_VECTOR(31 downto 0);
	IN_120 : STD_LOGIC_VECTOR(31 downto 0);
	IN_121 : STD_LOGIC_VECTOR(31 downto 0);
	IN_122 : STD_LOGIC_VECTOR(31 downto 0);
	IN_123 : STD_LOGIC_VECTOR(31 downto 0);
	IN_124 : STD_LOGIC_VECTOR(31 downto 0);
	IN_125 : STD_LOGIC_VECTOR(31 downto 0);
	IN_126 : STD_LOGIC_VECTOR(31 downto 0);
	IN_127 : STD_LOGIC_VECTOR(31 downto 0);
	IN_128 : STD_LOGIC_VECTOR(31 downto 0);
	IN_129 : STD_LOGIC_VECTOR(63 downto 0);
	IN_130 : STD_LOGIC_VECTOR(31 downto 0);
	IN_131 : STD_LOGIC_VECTOR(31 downto 0);

	
	TRIG : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	
	SYNC_TRIG : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	SYNC_RESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	SYNC_CLK : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	
	READ_DATA: OUT STD_LOGIC_VECTOR (31 downto 0);
	READ_DATAVALID: OUT STD_LOGIC_VECTOR (0 downto 0);
	READ_RD_INT: IN STD_LOGIC_VECTOR (0 downto 0);
	READ_STATUS : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	
	READ_VALID_WORDS : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	
	CONFIG : IN STD_LOGIC_VECTOR (31 DOWNTO 0);                                              
	BUSY: OUT STD_LOGIC_VECTOR (0 downto 0);
	FIFO_FULL: OUT STD_LOGIC_VECTOR (0 downto 0)
	);
end;
    architecture Behavioral of  U503_custompacket  is
    constant MaxPacketSize : integer := 134;
	constant TotalWords : integer := memLength;
	
	constant busWidthWrite : integer := 32;
	constant busWidthRead : integer := 32;
	constant wBits : integer := integer(ceil(log2(real(TotalWords))));
	constant rBits : integer := integer(ceil(log2(real(TotalWords * busWidthWrite/busWidthRead))));

	constant MemLogLen : integer := integer(ceil(log2(real(memLength))));
	
    	signal lIN_1 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_2 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_3 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_4 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_5 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_6 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_7 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_8 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_9 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_10 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_11 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_12 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_13 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_14 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_15 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_16 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_17 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_18 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_19 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_20 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_21 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_22 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_23 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_24 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_25 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_26 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_27 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_28 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_29 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_30 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_31 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_32 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_33 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_34 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_35 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_36 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_37 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_38 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_39 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_40 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_41 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_42 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_43 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_44 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_45 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_46 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_47 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_48 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_49 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_50 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_51 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_52 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_53 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_54 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_55 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_56 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_57 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_58 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_59 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_60 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_61 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_62 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_63 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_64 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_65 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_66 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_67 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_68 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_69 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_70 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_71 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_72 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_73 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_74 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_75 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_76 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_77 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_78 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_79 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_80 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_81 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_82 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_83 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_84 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_85 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_86 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_87 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_88 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_89 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_90 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_91 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_92 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_93 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_94 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_95 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_96 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_97 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_98 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_99 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_100 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_101 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_102 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_103 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_104 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_105 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_106 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_107 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_108 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_109 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_110 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_111 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_112 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_113 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_114 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_115 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_116 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_117 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_118 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_119 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_120 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_121 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_122 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_123 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_124 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_125 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_126 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_127 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_128 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_129 : STD_LOGIC_VECTOR(63 downto 0);
	signal lIN_130 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_131 : STD_LOGIC_VECTOR(31 downto 0);


	signal FIFO_PORT_IN : STD_LOGIC_VECTOR (31 DOWNTO 0); 
	signal FIFO_FULL_IN : STD_LOGIC := '0';
	signal FIFO_EMPTY  : STD_LOGIC := '0';
	signal FIFO_RD  : STD_LOGIC := '0';
	signal FIFO_WE  : STD_LOGIC := '0';
	signal FIFO_PORT_OUT : STD_LOGIC_VECTOR (31 DOWNTO 0); 
	signal FIFO_FLUSH : STD_LOGIC := '0';
	
	signal SMSI : integer range 0 to 134 + 10 := 0;
	signal COUNTER_IN : std_logic_vector (31 downto 0);
	signal COUNTER_IN_GLOBAL : std_logic_vector (31 downto 0);
	signal TIMESTAMP : std_logic_vector (31 downto 0);
	signal COUNTER_IN_GLOBALs : std_logic_vector (31 downto 0);
	signal TIMESTAMPs : std_logic_vector (31 downto 0);

	signal oExtSignal : std_logic;
	signal iExtSignal : std_logic;

	signal iTrig : std_logic;
	signal oTrig : std_logic;

    signal AVAL_WORD : std_logic_vector (rBits-1 downto 0) := (others => '0');
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
	    PROG_EMPTY_THRESH => 3, --positive integer
	    DOUT_RESET_VALUE => "0", --string
	    CDC_SYNC_STAGES => 2, --positive integer
	    WAKEUP_TIME => 0 --positive integer; 0 or 2;
    )
    port map (
	    sleep => '0',
	    rst => FIFO_FLUSH,
	    wr_clk => CLK_WRITE(0),
	    wr_en => FIFO_WE,
	    din => FIFO_PORT_IN,
	    full => open,
	    overflow => open,
	    wr_rst_busy => open,
	    rd_clk => CLK_READ(0),
	    rd_en => FIFO_RD,
	    dout => FIFO_PORT_OUT,
	    empty => open,
	    underflow => open,
	    rd_rst_busy => open,
	    prog_full => FIFO_FULL_IN,
	    wr_data_count => open,
	    prog_empty => FIFO_EMPTY,
	    rd_data_count => AVAL_WORD,
	    injectsbiterr => '0',
	    injectdbiterr => '0',
	    sbiterr => open,
	    dbiterr => open
    );

    READ_VALID_WORDS <= ext(AVAL_WORD,32);

	READ_STATUS(1) <= CONFIG (0);
	READ_STATUS(0) <= FIFO_EMPTY;
	READ_STATUS(2) <= FIFO_FULL_IN;
    READ_STATUS(31 downto 8) <= ext(AVAL_WORD,24);

	READ_DATAVALID(0) <= not FIFO_EMPTY;
	READ_DATA <= FIFO_PORT_OUT;
	FIFO_RD <= READ_RD_INT(0);
	FIFO_FULL(0) <= FIFO_FULL_IN;
	
	timeStampProc : process(SYNC_CLK(0))
	begin
		if RESET="1" or CONFIG (1) = '1' or SYNC_RESET(0) ='1' then	
			COUNTER_IN_GLOBAL <= (others => '0');
			TIMESTAMP <= (others => '0');
		elsif rising_edge(SYNC_CLK(0)) then
			TIMESTAMP <= TIMESTAMP+1;
			iExtSignal <= SYNC_TRIG(0);
			oExtSignal <= iExtSignal;
			if iExtSignal = '1' and oExtSignal = '0' then
				COUNTER_IN_GLOBAL <= COUNTER_IN_GLOBAL +1;
			end if;
			
		end if;
	end process;
	
		
	xpm_RunTimer: xpm_cdc_array_single
	  generic map (

		-- Common module generics
		DEST_SYNC_FF   => 4, -- integer; range: 2-10
		INIT_SYNC_FF   => 0, -- integer; 0=disable simulation init values, 1=enable simulation init values
		SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
		SRC_INPUT_REG  => 1, -- integer; 0=do not register input, 1=register input
		WIDTH          => 32  -- integer; range: 1-1024

	  )
	  port map (

		src_clk  => SYNC_CLK(0),  -- optional; required when SRC_INPUT_REG = 1
		src_in   => TIMESTAMP,
		dest_clk => CLK_WRITE(0),
		dest_out => TIMESTAMPs
	  );

	xpm_GlobalCounter: xpm_cdc_array_single
	  generic map (

		-- Common module generics
		DEST_SYNC_FF   => 4, -- integer; range: 2-10
		INIT_SYNC_FF   => 0, -- integer; 0=disable simulation init values, 1=enable simulation init values
		SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
		SRC_INPUT_REG  => 1, -- integer; 0=do not register input, 1=register input
		WIDTH          => 32  -- integer; range: 1-1024

	  )
	  port map (

		src_clk  => SYNC_CLK(0),  -- optional; required when SRC_INPUT_REG = 1
		src_in   => COUNTER_IN_GLOBAL,
		dest_clk => CLK_WRITE(0),
		dest_out => COUNTER_IN_GLOBALs
	  );

	  
	
	TransferProcess : process(CLK_WRITE(0))
	begin
		if RESET="1" or CONFIG (1) = '1' or SYNC_RESET(0) ='1' then	
			COUNTER_IN <= (others => '0');
			FIFO_FLUSH <= '1';
			FIFO_WE <= '0';
            BUSY(0) <= '1';
		elsif rising_edge(CLK_WRITE(0)) then
			FIFO_FLUSH <= CONFIG (2);
			FIFO_WE <= '0';
			iTrig <= TRIG(0);
			oTrig <= iTrig;
            
    

			case SMSI is
				when 0 =>
					BUSY(0) <= (not CONFIG (0)) or  FIFO_FULL_IN ;
					if iTrig = '1' and oTrig = '0' and CONFIG (0) = '1' and FIFO_FULL_IN = '0' then
						SMSI <= 1;
						COUNTER_IN <= COUNTER_IN +1;
						BUSY <= "1";
lIN_1 <= IN_1;
lIN_2 <= IN_2;
lIN_3 <= IN_3;
lIN_4 <= IN_4;
lIN_5 <= IN_5;
lIN_6 <= IN_6;
lIN_7 <= IN_7;
lIN_8 <= IN_8;
lIN_9 <= IN_9;
lIN_10 <= IN_10;
lIN_11 <= IN_11;
lIN_12 <= IN_12;
lIN_13 <= IN_13;
lIN_14 <= IN_14;
lIN_15 <= IN_15;
lIN_16 <= IN_16;
lIN_17 <= IN_17;
lIN_18 <= IN_18;
lIN_19 <= IN_19;
lIN_20 <= IN_20;
lIN_21 <= IN_21;
lIN_22 <= IN_22;
lIN_23 <= IN_23;
lIN_24 <= IN_24;
lIN_25 <= IN_25;
lIN_26 <= IN_26;
lIN_27 <= IN_27;
lIN_28 <= IN_28;
lIN_29 <= IN_29;
lIN_30 <= IN_30;
lIN_31 <= IN_31;
lIN_32 <= IN_32;
lIN_33 <= IN_33;
lIN_34 <= IN_34;
lIN_35 <= IN_35;
lIN_36 <= IN_36;
lIN_37 <= IN_37;
lIN_38 <= IN_38;
lIN_39 <= IN_39;
lIN_40 <= IN_40;
lIN_41 <= IN_41;
lIN_42 <= IN_42;
lIN_43 <= IN_43;
lIN_44 <= IN_44;
lIN_45 <= IN_45;
lIN_46 <= IN_46;
lIN_47 <= IN_47;
lIN_48 <= IN_48;
lIN_49 <= IN_49;
lIN_50 <= IN_50;
lIN_51 <= IN_51;
lIN_52 <= IN_52;
lIN_53 <= IN_53;
lIN_54 <= IN_54;
lIN_55 <= IN_55;
lIN_56 <= IN_56;
lIN_57 <= IN_57;
lIN_58 <= IN_58;
lIN_59 <= IN_59;
lIN_60 <= IN_60;
lIN_61 <= IN_61;
lIN_62 <= IN_62;
lIN_63 <= IN_63;
lIN_64 <= IN_64;
lIN_65 <= IN_65;
lIN_66 <= IN_66;
lIN_67 <= IN_67;
lIN_68 <= IN_68;
lIN_69 <= IN_69;
lIN_70 <= IN_70;
lIN_71 <= IN_71;
lIN_72 <= IN_72;
lIN_73 <= IN_73;
lIN_74 <= IN_74;
lIN_75 <= IN_75;
lIN_76 <= IN_76;
lIN_77 <= IN_77;
lIN_78 <= IN_78;
lIN_79 <= IN_79;
lIN_80 <= IN_80;
lIN_81 <= IN_81;
lIN_82 <= IN_82;
lIN_83 <= IN_83;
lIN_84 <= IN_84;
lIN_85 <= IN_85;
lIN_86 <= IN_86;
lIN_87 <= IN_87;
lIN_88 <= IN_88;
lIN_89 <= IN_89;
lIN_90 <= IN_90;
lIN_91 <= IN_91;
lIN_92 <= IN_92;
lIN_93 <= IN_93;
lIN_94 <= IN_94;
lIN_95 <= IN_95;
lIN_96 <= IN_96;
lIN_97 <= IN_97;
lIN_98 <= IN_98;
lIN_99 <= IN_99;
lIN_100 <= IN_100;
lIN_101 <= IN_101;
lIN_102 <= IN_102;
lIN_103 <= IN_103;
lIN_104 <= IN_104;
lIN_105 <= IN_105;
lIN_106 <= IN_106;
lIN_107 <= IN_107;
lIN_108 <= IN_108;
lIN_109 <= IN_109;
lIN_110 <= IN_110;
lIN_111 <= IN_111;
lIN_112 <= IN_112;
lIN_113 <= IN_113;
lIN_114 <= IN_114;
lIN_115 <= IN_115;
lIN_116 <= IN_116;
lIN_117 <= IN_117;
lIN_118 <= IN_118;
lIN_119 <= IN_119;
lIN_120 <= IN_120;
lIN_121 <= IN_121;
lIN_122 <= IN_122;
lIN_123 <= IN_123;
lIN_124 <= IN_124;
lIN_125 <= IN_125;
lIN_126 <= IN_126;
lIN_127 <= IN_127;
lIN_128 <= IN_128;
lIN_129 <= IN_129;
lIN_130 <= IN_130;
lIN_131 <= IN_131;

					end if;
						 when 1 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= x"FFFFFFFF";
FIFO_WE <= '1';
SMSI <= 2;
		 when 2 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= COUNTER_IN;
FIFO_WE <= '1';
SMSI <= 3;
		 when 3 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_1(31 downto 0);
FIFO_WE <= '1';
SMSI <= 4;
		 when 4 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_2(31 downto 0);
FIFO_WE <= '1';
SMSI <= 5;
		 when 5 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_3(31 downto 0);
FIFO_WE <= '1';
SMSI <= 6;
		 when 6 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_4(31 downto 0);
FIFO_WE <= '1';
SMSI <= 7;
		 when 7 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_5(31 downto 0);
FIFO_WE <= '1';
SMSI <= 8;
		 when 8 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_6(31 downto 0);
FIFO_WE <= '1';
SMSI <= 9;
		 when 9 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_7(31 downto 0);
FIFO_WE <= '1';
SMSI <= 10;
		 when 10 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_8(31 downto 0);
FIFO_WE <= '1';
SMSI <= 11;
		 when 11 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_9(31 downto 0);
FIFO_WE <= '1';
SMSI <= 12;
		 when 12 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_10(31 downto 0);
FIFO_WE <= '1';
SMSI <= 13;
		 when 13 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_11(31 downto 0);
FIFO_WE <= '1';
SMSI <= 14;
		 when 14 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_12(31 downto 0);
FIFO_WE <= '1';
SMSI <= 15;
		 when 15 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_13(31 downto 0);
FIFO_WE <= '1';
SMSI <= 16;
		 when 16 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_14(31 downto 0);
FIFO_WE <= '1';
SMSI <= 17;
		 when 17 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_15(31 downto 0);
FIFO_WE <= '1';
SMSI <= 18;
		 when 18 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_16(31 downto 0);
FIFO_WE <= '1';
SMSI <= 19;
		 when 19 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_17(31 downto 0);
FIFO_WE <= '1';
SMSI <= 20;
		 when 20 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_18(31 downto 0);
FIFO_WE <= '1';
SMSI <= 21;
		 when 21 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_19(31 downto 0);
FIFO_WE <= '1';
SMSI <= 22;
		 when 22 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_20(31 downto 0);
FIFO_WE <= '1';
SMSI <= 23;
		 when 23 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_21(31 downto 0);
FIFO_WE <= '1';
SMSI <= 24;
		 when 24 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_22(31 downto 0);
FIFO_WE <= '1';
SMSI <= 25;
		 when 25 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_23(31 downto 0);
FIFO_WE <= '1';
SMSI <= 26;
		 when 26 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_24(31 downto 0);
FIFO_WE <= '1';
SMSI <= 27;
		 when 27 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_25(31 downto 0);
FIFO_WE <= '1';
SMSI <= 28;
		 when 28 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_26(31 downto 0);
FIFO_WE <= '1';
SMSI <= 29;
		 when 29 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_27(31 downto 0);
FIFO_WE <= '1';
SMSI <= 30;
		 when 30 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_28(31 downto 0);
FIFO_WE <= '1';
SMSI <= 31;
		 when 31 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_29(31 downto 0);
FIFO_WE <= '1';
SMSI <= 32;
		 when 32 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_30(31 downto 0);
FIFO_WE <= '1';
SMSI <= 33;
		 when 33 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_31(31 downto 0);
FIFO_WE <= '1';
SMSI <= 34;
		 when 34 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_32(31 downto 0);
FIFO_WE <= '1';
SMSI <= 35;
		 when 35 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_33(31 downto 0);
FIFO_WE <= '1';
SMSI <= 36;
		 when 36 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_34(31 downto 0);
FIFO_WE <= '1';
SMSI <= 37;
		 when 37 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_35(31 downto 0);
FIFO_WE <= '1';
SMSI <= 38;
		 when 38 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_36(31 downto 0);
FIFO_WE <= '1';
SMSI <= 39;
		 when 39 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_37(31 downto 0);
FIFO_WE <= '1';
SMSI <= 40;
		 when 40 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_38(31 downto 0);
FIFO_WE <= '1';
SMSI <= 41;
		 when 41 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_39(31 downto 0);
FIFO_WE <= '1';
SMSI <= 42;
		 when 42 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_40(31 downto 0);
FIFO_WE <= '1';
SMSI <= 43;
		 when 43 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_41(31 downto 0);
FIFO_WE <= '1';
SMSI <= 44;
		 when 44 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_42(31 downto 0);
FIFO_WE <= '1';
SMSI <= 45;
		 when 45 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_43(31 downto 0);
FIFO_WE <= '1';
SMSI <= 46;
		 when 46 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_44(31 downto 0);
FIFO_WE <= '1';
SMSI <= 47;
		 when 47 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_45(31 downto 0);
FIFO_WE <= '1';
SMSI <= 48;
		 when 48 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_46(31 downto 0);
FIFO_WE <= '1';
SMSI <= 49;
		 when 49 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_47(31 downto 0);
FIFO_WE <= '1';
SMSI <= 50;
		 when 50 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_48(31 downto 0);
FIFO_WE <= '1';
SMSI <= 51;
		 when 51 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_49(31 downto 0);
FIFO_WE <= '1';
SMSI <= 52;
		 when 52 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_50(31 downto 0);
FIFO_WE <= '1';
SMSI <= 53;
		 when 53 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_51(31 downto 0);
FIFO_WE <= '1';
SMSI <= 54;
		 when 54 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_52(31 downto 0);
FIFO_WE <= '1';
SMSI <= 55;
		 when 55 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_53(31 downto 0);
FIFO_WE <= '1';
SMSI <= 56;
		 when 56 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_54(31 downto 0);
FIFO_WE <= '1';
SMSI <= 57;
		 when 57 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_55(31 downto 0);
FIFO_WE <= '1';
SMSI <= 58;
		 when 58 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_56(31 downto 0);
FIFO_WE <= '1';
SMSI <= 59;
		 when 59 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_57(31 downto 0);
FIFO_WE <= '1';
SMSI <= 60;
		 when 60 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_58(31 downto 0);
FIFO_WE <= '1';
SMSI <= 61;
		 when 61 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_59(31 downto 0);
FIFO_WE <= '1';
SMSI <= 62;
		 when 62 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_60(31 downto 0);
FIFO_WE <= '1';
SMSI <= 63;
		 when 63 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_61(31 downto 0);
FIFO_WE <= '1';
SMSI <= 64;
		 when 64 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_62(31 downto 0);
FIFO_WE <= '1';
SMSI <= 65;
		 when 65 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_63(31 downto 0);
FIFO_WE <= '1';
SMSI <= 66;
		 when 66 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_64(31 downto 0);
FIFO_WE <= '1';
SMSI <= 67;
		 when 67 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_65(31 downto 0);
FIFO_WE <= '1';
SMSI <= 68;
		 when 68 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_66(31 downto 0);
FIFO_WE <= '1';
SMSI <= 69;
		 when 69 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_67(31 downto 0);
FIFO_WE <= '1';
SMSI <= 70;
		 when 70 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_68(31 downto 0);
FIFO_WE <= '1';
SMSI <= 71;
		 when 71 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_69(31 downto 0);
FIFO_WE <= '1';
SMSI <= 72;
		 when 72 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_70(31 downto 0);
FIFO_WE <= '1';
SMSI <= 73;
		 when 73 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_71(31 downto 0);
FIFO_WE <= '1';
SMSI <= 74;
		 when 74 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_72(31 downto 0);
FIFO_WE <= '1';
SMSI <= 75;
		 when 75 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_73(31 downto 0);
FIFO_WE <= '1';
SMSI <= 76;
		 when 76 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_74(31 downto 0);
FIFO_WE <= '1';
SMSI <= 77;
		 when 77 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_75(31 downto 0);
FIFO_WE <= '1';
SMSI <= 78;
		 when 78 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_76(31 downto 0);
FIFO_WE <= '1';
SMSI <= 79;
		 when 79 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_77(31 downto 0);
FIFO_WE <= '1';
SMSI <= 80;
		 when 80 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_78(31 downto 0);
FIFO_WE <= '1';
SMSI <= 81;
		 when 81 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_79(31 downto 0);
FIFO_WE <= '1';
SMSI <= 82;
		 when 82 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_80(31 downto 0);
FIFO_WE <= '1';
SMSI <= 83;
		 when 83 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_81(31 downto 0);
FIFO_WE <= '1';
SMSI <= 84;
		 when 84 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_82(31 downto 0);
FIFO_WE <= '1';
SMSI <= 85;
		 when 85 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_83(31 downto 0);
FIFO_WE <= '1';
SMSI <= 86;
		 when 86 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_84(31 downto 0);
FIFO_WE <= '1';
SMSI <= 87;
		 when 87 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_85(31 downto 0);
FIFO_WE <= '1';
SMSI <= 88;
		 when 88 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_86(31 downto 0);
FIFO_WE <= '1';
SMSI <= 89;
		 when 89 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_87(31 downto 0);
FIFO_WE <= '1';
SMSI <= 90;
		 when 90 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_88(31 downto 0);
FIFO_WE <= '1';
SMSI <= 91;
		 when 91 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_89(31 downto 0);
FIFO_WE <= '1';
SMSI <= 92;
		 when 92 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_90(31 downto 0);
FIFO_WE <= '1';
SMSI <= 93;
		 when 93 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_91(31 downto 0);
FIFO_WE <= '1';
SMSI <= 94;
		 when 94 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_92(31 downto 0);
FIFO_WE <= '1';
SMSI <= 95;
		 when 95 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_93(31 downto 0);
FIFO_WE <= '1';
SMSI <= 96;
		 when 96 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_94(31 downto 0);
FIFO_WE <= '1';
SMSI <= 97;
		 when 97 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_95(31 downto 0);
FIFO_WE <= '1';
SMSI <= 98;
		 when 98 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_96(31 downto 0);
FIFO_WE <= '1';
SMSI <= 99;
		 when 99 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_97(31 downto 0);
FIFO_WE <= '1';
SMSI <= 100;
		 when 100 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_98(31 downto 0);
FIFO_WE <= '1';
SMSI <= 101;
		 when 101 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_99(31 downto 0);
FIFO_WE <= '1';
SMSI <= 102;
		 when 102 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_100(31 downto 0);
FIFO_WE <= '1';
SMSI <= 103;
		 when 103 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_101(31 downto 0);
FIFO_WE <= '1';
SMSI <= 104;
		 when 104 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_102(31 downto 0);
FIFO_WE <= '1';
SMSI <= 105;
		 when 105 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_103(31 downto 0);
FIFO_WE <= '1';
SMSI <= 106;
		 when 106 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_104(31 downto 0);
FIFO_WE <= '1';
SMSI <= 107;
		 when 107 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_105(31 downto 0);
FIFO_WE <= '1';
SMSI <= 108;
		 when 108 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_106(31 downto 0);
FIFO_WE <= '1';
SMSI <= 109;
		 when 109 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_107(31 downto 0);
FIFO_WE <= '1';
SMSI <= 110;
		 when 110 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_108(31 downto 0);
FIFO_WE <= '1';
SMSI <= 111;
		 when 111 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_109(31 downto 0);
FIFO_WE <= '1';
SMSI <= 112;
		 when 112 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_110(31 downto 0);
FIFO_WE <= '1';
SMSI <= 113;
		 when 113 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_111(31 downto 0);
FIFO_WE <= '1';
SMSI <= 114;
		 when 114 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_112(31 downto 0);
FIFO_WE <= '1';
SMSI <= 115;
		 when 115 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_113(31 downto 0);
FIFO_WE <= '1';
SMSI <= 116;
		 when 116 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_114(31 downto 0);
FIFO_WE <= '1';
SMSI <= 117;
		 when 117 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_115(31 downto 0);
FIFO_WE <= '1';
SMSI <= 118;
		 when 118 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_116(31 downto 0);
FIFO_WE <= '1';
SMSI <= 119;
		 when 119 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_117(31 downto 0);
FIFO_WE <= '1';
SMSI <= 120;
		 when 120 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_118(31 downto 0);
FIFO_WE <= '1';
SMSI <= 121;
		 when 121 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_119(31 downto 0);
FIFO_WE <= '1';
SMSI <= 122;
		 when 122 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_120(31 downto 0);
FIFO_WE <= '1';
SMSI <= 123;
		 when 123 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_121(31 downto 0);
FIFO_WE <= '1';
SMSI <= 124;
		 when 124 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_122(31 downto 0);
FIFO_WE <= '1';
SMSI <= 125;
		 when 125 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_123(31 downto 0);
FIFO_WE <= '1';
SMSI <= 126;
		 when 126 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_124(31 downto 0);
FIFO_WE <= '1';
SMSI <= 127;
		 when 127 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_125(31 downto 0);
FIFO_WE <= '1';
SMSI <= 128;
		 when 128 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_126(31 downto 0);
FIFO_WE <= '1';
SMSI <= 129;
		 when 129 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_127(31 downto 0);
FIFO_WE <= '1';
SMSI <= 130;
		 when 130 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_128(31 downto 0);
FIFO_WE <= '1';
SMSI <= 131;
		 when 131 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_129(31 downto 0);
FIFO_WE <= '1';
SMSI <= 132;
		 when 132 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_129(63 downto 32);
FIFO_WE <= '1';
SMSI <= 133;
		 when 133 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_130(31 downto 0);
FIFO_WE <= '1';
SMSI <= 134;
		 when 134 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_131(31 downto 0);
FIFO_WE <= '1';
SMSI <= 0;

				
				when others =>
					SMSI <= 0;
			end case;
		end if;
	end process;
	
	

end Behavioral;

	
    