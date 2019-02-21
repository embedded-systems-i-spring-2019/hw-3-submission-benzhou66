----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 07:15:28 PM
-- Design Name: 
-- Module Name: Chap_7_q1 - Behavioral
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

entity Chap_7_q1 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           LDA : in STD_LOGIC;
           
           SEL :in STD_LOGIC;
           F : out STD_LOGIC_VECTOR (7 downto 0));
end Chap_7_q1;

architecture Behavioral of Chap_7_q1 is

signal s_mux_result:std_logic_vector(7 downto 0);

begin

    ra:process(CLK)
    begin
    
    if(rising_edge(CLK)) then 
    if(LDA='1') then
        F<=s_mux_result;
    end if;
    end if;
    end process;
        
        
      with SEL select
      s_mux_result<= A  when'1',
                     B  when'0',
                  (others=>'0') when others;
        
end Behavioral;
