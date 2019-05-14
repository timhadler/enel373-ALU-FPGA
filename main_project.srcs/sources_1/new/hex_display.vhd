----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2019 11:59:34
-- Design Name: 
-- Module Name: hex_8bit_display - Behavioral
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

entity hex_8bit_display is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           concurr_clk : in std_logic;
           BCD_7seg : out std_logic_vector (6 downto 0);
           digit_7seg : out std_logic_vector (7 downto 0));
end hex_8bit_display;

architecture Behavioral of hex_8bit_display is

signal A : std_logic_vector (3 downto 0) := input(7 downto 4);
signal B : std_logic_vector (3 downto 0) := input(3 downto 0);
signal A_BCD, B_BCD : std_logic_vector (6 downto 0);

component hex_to_7seg port(
    input : in std_logic_vector (3 downto 0);
    bcd_7seg : out std_logic_vector (6 downto 0));
end component;

begin

Digit_A : hex_to_7seg port map(
    input => A, bcd_7seg => A_BCD
    );
   
Digit_B : hex_to_7seg port map(
    input => B, bcd_7seg => B_BCD
    );
    
process (concurr_clk)
    begin
        if (concurr_clk = '1') then
            digit_7seg <= "11111101";
            BCD_7seg <= A_BCD;
        else
            digit_7seg <= "11111110";
            BCD_7seg <= B_BCD;
        end if;
    end process;

end Behavioral;
