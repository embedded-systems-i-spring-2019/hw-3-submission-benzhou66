----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 10:27:24 PM
-- Design Name: 
-- Module Name: Chap7_q6 - Behavioral
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

entity Chap7_q6 is
--  Port ( );
Port(
A,B,C: in std_logic_vector(7 downto 0);
RAP,RBP : out std_logic_vector(7downto 0);
CLK,SEL1,SEL2: in std_logic


);
end Chap7_q6;

architecture Behavioral of Chap7_q6 is
signal MUX_out,REGA_out,REGB_out : std_logic_vector(7 downto 0);
begin
REG: process(CLK)
    begin
    if(CLK'event and CLK='1') then
    if (SEL2='1') then
    if(SEL1='1') then
    REGA_out<=A;
    else 
    REGA_out<=B;
    end if;
    else 
    REGB_out<=C;
    end if;
    end if;
    RAP<=REGA_out;
    RBP<=REGB_out;
    end process;
        
    
    
    
    
    
    

end Behavioral;
