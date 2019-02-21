----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 09:30:35 PM
-- Design Name: 
-- Module Name: Chap7_q4 - Behavioral
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

entity Chap7_q4 is
    Port ( X : in STD_LOGIC_VECTOR (7 downto 0);
           Y : in STD_LOGIC_VECTOR (7 downto 0);
           S1 : in STD_LOGIC;
           LDA : in STD_LOGIC;
           RD : in STD_LOGIC;
           S0 : in STD_LOGIC;
           CLK : in STD_LOGIC;
           LDB : in std_logic;
           RB : out STD_LOGIC_VECTOR (7 downto 0);
           RA : out STD_LOGIC_VECTOR (7 downto 0));
end Chap7_q4;

architecture Behavioral of Chap7_q4 is
signal AND1_out: std_logic;
signal AND2_out: std_logic;
signal MUX1_out: std_logic_vector(7 downto 0);
signal MUX2_out: std_logic_vector(7 downto 0);
signal REGB_out: std_logic_vector(7 downto 0);
signal REGA_out: std_logic_vector(7 downto 0);
signal temp1:std_logic;
begin
    with S1 select
        MUX1_out<=X when '1',
                  Y when '0';
    with S0 select
        MUX2_out<=REGB_out when '1',
                  Y when '0';
REGB : process(CLK)
    begin
    temp1<=LDB AND (not RD);
    if (CLK'event and CLK='0') then
    if ((LDB and (not RD))='1') then
    
    RB<=MUX1_out;
    end if;
    end if;
    end process;
REGA: process(CLK)
    begin
    if (CLK'event and CLK='0') then
    if ((LDA AND RD) = '1') then
    RA<=MUX2_out;
    end if;
    end if;
    
        

    end process;

end Behavioral;
