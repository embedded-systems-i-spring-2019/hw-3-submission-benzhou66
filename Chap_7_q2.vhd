----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2019 07:34:49 PM
-- Design Name: 
-- Module Name: Chap_7_q2 - Behavioral
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

entity Chap_7_q2 is
    Port ( X : in STD_LOGIC_VECTOR (7 downto 0);
           Y : in STD_LOGIC_VECTOR (7 downto 0);
           Z : in STD_LOGIC_VECTOR (7 downto 0);
           DS : in STD_LOGIC;
           CLK : in STD_LOGIC;
           MS : in STD_LOGIC_VECTOR (1 downto 0);
           RA :inout STD_LOGIC_VECTOR (7 downto 0);
           RB: out STD_LOGIC_VECTOR (7 downto 0);
           RB_out : inout STD_LOGIC_VECTOR (7 downto 0));
end Chap_7_q2;

architecture Behavioral of Chap_7_q2 is
--MUX
signal s_mux_result:std_logic_vector(7 downto 0);
signal Decoder_out :std_logic;
signal LD : STD_LOGIC;
begin
   
   with DS select
        Decoder_out<= '0' when '0',
                      '1' when '1';
       --when"0"=>Decoder_out<='0';
       --when"1"=>Decoder_out<='1';
    LD<=Decoder_out;
        with MS select
          s_mux_result <= X  when"11",
                          Y  when"10",
                          Z  when"01",
                      RB_out when"00";
    
    RegA:process(CLK)
        begin
        if(CLK'event and CLK='0') then
        if Decoder_out='0' then
        RA<=s_mux_result;
        
        end if;
        end if;
    end process;
    
    RegB:process(CLK)
         begin
         if(CLK'event and CLK='0') then
         if Decoder_out='1' then
                RB<=RA;
         end if;
         end if;
    end process;

end Behavioral;




