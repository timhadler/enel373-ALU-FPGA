----------------------------------------------------------------------------------
-- Author: Tim Hadler
-- 
-- 
-- Create Date: 10.04.2019 11:09:58
-- Module Name: hex_to_7seg - Behavioral
-- Project Name: ALU Design Project
-- Target Devices: Nexys 4 DDR
-- Tool Versions: Xilinx Vivado
-- Description: Is a module that converts a 4-bit binary number to its
-- corresponding hex number, for the 7-seg display
-- 
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity hex_to_7seg is
    Port ( input : in STD_LOGIC_VECTOR (3 downto 0);
           bcd_7seg : out STD_LOGIC_VECTOR (6 downto 0));
end hex_to_7seg;

architecture Behavioral of hex_to_7seg is

begin
process (input)
begin
    case input is 
        when "0000"	=> bcd_7seg <= "0000001";	 
        when "0001" => bcd_7seg <= "1001111";      
        when "0010" => bcd_7seg <= "0010010";
        when "0011" => bcd_7seg <= "0000110";
        when "0100" => bcd_7seg <= "1001100";
        when "0101" => bcd_7seg <= "0100100";
        when "0110" => bcd_7seg <= "1100000";
        when "0111" => bcd_7seg <= "0001111";
        when "1000" => bcd_7seg <= "0000000";
        when "1001" => bcd_7seg <= "0001100";
        when "1010" => bcd_7seg <= "0001000";
        when "1011" => bcd_7seg <= "1100000";
        when "1100" => bcd_7seg <= "0110001";
        when "1101" => bcd_7seg <= "1000010";
        when "1110" => bcd_7seg <= "0110000";
        when "1111" => bcd_7seg <= "0111000";
    end case;
end process;

end Behavioral;
