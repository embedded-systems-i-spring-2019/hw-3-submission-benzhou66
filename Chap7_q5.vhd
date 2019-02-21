----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 10:10:00 PM
-- Design Name: 
-- Module Name: Chap7_q5 - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Chap7_q5 is
--  Port ( );
port(
A,B,C : in std_logic_vector(7 downto 0);
RAX,RBX :out std_logic_vector( 7 downto 0);
SL1, SL2,CLK : in std_logic

);
end Chap7_q5;

architecture Behavioral of Chap7_q5 is
signal dec_out:std_logic;
signal MUX_out,REGA_out,REGB_out: std_logic_vector(7 downto 0);
begin
MUX: process(CLK)
    begin
    if(CLK'event and CLK='1') then
    if SL1='1' then
    REGA_out<=A;
    else
    if (SL2='1') then
    MUX_out<=B;
    else
    MUX_out<=C;
    
    REGB_out<=MUX_out;
    end if;
    end if;
    end if;
    
    RAX<=REGA_out;
    RBX<=MUX_out;
    
    end process;

end Behavioral;
