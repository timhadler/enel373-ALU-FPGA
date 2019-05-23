----------------------------------------------------------------------------------
-- Author: Tim Hadler
-- 
-- 
-- Create Date: 10.04.2019 11:09:58
-- Module Name: Button_Debounce - Behavioural
-- Project Name: ALU Design Project
-- Target Devices: Nexys 4 DDR
-- Tool Versions: Xilinx Vivado
-- Description: Debounces the input button via polling
-- 
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Input clock runs at 5Hz


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
