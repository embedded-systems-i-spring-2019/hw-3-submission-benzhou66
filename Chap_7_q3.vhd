----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 09:13:52 PM
-- Design Name: 
-- Module Name: Chap_7_q3 - Behavioral
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

entity Chap_7_q3 is
    Port ( LDA : in STD_LOGIC;
           LDB : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           CLK : in STD_LOGIC;
           X : in STD_LOGIC_VECTOR (7 downto 0);
           Y : in STD_LOGIC_VECTOR (7 downto 0);
           RB : inout STD_LOGIC_VECTOR (7 downto 0));
end Chap_7_q3;

architecture Behavioral of Chap_7_q3 is
signal MUX1_out:std_logic_vector(7 downto 0);
signal MUX2_out:std_logic_vector(7 downto 0);
signal REGA_out:std_logic_vector(7 downto 0);
signal REGB_out:std_logic_vector(7 downto 0);

begin
    with S1 select
        MUX1_out<= X         when'1',
                   REGB_out  when'0';
    with S0 select
        MUX2_out<=REGA_out when '1',
                  Y        when '0';
                  
process(CLK)
    begin
    if (CLK'event and CLK='1') then
    if LDA='1' then
    REGA_out<=MUX1_out;
    end if;
    if LDB='1' then
    REGB_out<=MUX2_out;
    end if;
    end if;
    RB<=REGB_out;
end process;
end Behavioral;
