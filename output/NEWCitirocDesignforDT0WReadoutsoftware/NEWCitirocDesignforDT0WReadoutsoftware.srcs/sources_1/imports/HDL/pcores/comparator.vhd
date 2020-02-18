----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2019 17:58:14
-- Design Name: 
-- Module Name: comparator - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator is
    Generic (IN_SIZE : integer := 16;
           OPERATION : STRING := "equal";
           IN_SIGN : STRING := "signed";
           REGISTER_OUT : STRING := "true"
           );
    Port ( in1 : in STD_LOGIC_VECTOR (IN_SIZE-1 downto 0);
           in2 : in STD_LOGIC_VECTOR (IN_SIZE-1 downto 0);
           clk : in STD_LOGIC;
           comp_out : out STD_LOGIC);
end comparator;

architecture Behavioral of comparator is
signal i_out : std_logic := '0';
begin

IF_equal:
   if OPERATION = "equal" generate
      begin
         i_out <= '1' when in1=in2 else '0';   
   end generate;
   

IF_notequal:
   if OPERATION = "not_equal" generate
      begin
         i_out <= '0' when in1=in2 else '1';   
   end generate;


IF_greater_signed:
   if OPERATION = "greater" and IN_SIGN="signed" generate
      begin
         i_out <= '1' when signed(in1)>signed(in2) else '0';   
   end generate;
   

IF_greater_unsigned:
   if OPERATION = "greater" and IN_SIGN="unsigned" generate
      begin
         i_out <= '1' when unsigned(in1)>unsigned(in2) else '0';   
   end generate;

IF_greaterequa_signed:
   if OPERATION = "greater_equal" and IN_SIGN="signed" generate
      begin
         i_out <= '1' when signed(in1)>=signed(in2) else '0';   
   end generate;
   

IF_greaterueqa_unsigned:
   if OPERATION = "greater_equal" and IN_SIGN="unsigned" generate
      begin
         i_out <= '1' when unsigned(in1)>=unsigned(in2) else '0';   
   end generate;      
   
   
IF_smaller_signed:
  if OPERATION = "smaller" and IN_SIGN="signed" generate
     begin
        i_out <= '1' when signed(in1)<signed(in2) else '0';   
  end generate;
  

IF_smaller_unsigned:
  if OPERATION = "smaller" and IN_SIGN="unsigned" generate
     begin
        i_out <= '1' when unsigned(in1)<unsigned(in2) else '0';   
  end generate;

IF_smallerequal_signed:
  if OPERATION = "smaller_equal" and IN_SIGN="signed" generate
     begin
        i_out <= '1' when signed(in1)<=signed(in2) else '0';   
  end generate;
  

IF_smallerequal_unsigned:
  if OPERATION = "smaller_equal" and IN_SIGN="unsigned" generate
     begin
        i_out <= '1' when unsigned(in1)<=unsigned(in2) else '0';   
  end generate;      
     
    
 IF_register:
  if REGISTER_OUT = "true" generate
  begin
   sample_process : process (clk)
   begin
       if rising_edge(clk) then
           comp_out <= i_out;
       end if;
   end process;
end generate;      
 
 IF_not_register:
 if REGISTER_OUT /= "true" generate
 begin 
    comp_out <= i_out;
 end generate;    
     
end Behavioral;
   