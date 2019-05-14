----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2019 15:15:26
-- Design Name: 
-- Module Name: Button_Debounce - Behavioral
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

entity Button_Debounce is
    Port ( Clk, Button : in STD_LOGIC;
           butt_signal : out STD_LOGIC);
end Button_Debounce;

architecture Behavioral of Button_Debounce is

begin
process (Clk, Button)
begin
    if (clk' event and clk = '1') then
        if (Button = '1') then
            butt_signal <= '1';
        else
            butt_signal <= '0';
        end if;
    end if;
        
end process;

end Behavioral;
