----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.03.2019 16:17:48
-- Design Name: 
-- Module Name: led_mux - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led_mux is
    Port ( state : in STD_LOGIC_VECTOR (2 downto 0);
           reg1, reg2, sum, regG : in STD_LOGIC_VECTOR (7 downto 0);
           operator : in std_logic_vector (3 downto 0);
           led_out : out STD_LOGIC_VECTOR (15 downto 0));
end led_mux;

architecture Behavioral of led_mux is

signal led_tmp : std_logic_vector (15 downto 0); 

begin
process (state)
    begin
    
    case state is
        when "010" => led_tmp(7 downto 0) <= reg1;
        when "100" => led_tmp(7 downto 0) <= reg2;
        when "111" => 
        led_tmp (7 downto 4) <= "0000";
        led_tmp(3 downto 0) <= operator;
        when "011" => led_tmp(7 downto 0) <= regG;
        when others => led_tmp(7 downto 0) <= "00000000";
    end case;

led_tmp(15 downto 13) <= state;
led_out <= led_tmp;

end process;
end Behavioral;
