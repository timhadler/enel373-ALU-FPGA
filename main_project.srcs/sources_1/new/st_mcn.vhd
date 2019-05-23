----------------------------------------------------------------------------------
-- Author: Tim Hadler
-- 
-- 
-- Create Date: 10.04.2019 11:09:58
-- Module Name: st_mcn - Behavioral
-- Project Name: ALU Design Project
-- Target Devices: Nexys 4 DDR
-- Tool Versions: Xilinx Vivado
-- Description: This is the state machine module for the ALU.
-- It uses a debounced button signal and 100hz clock signal
-- to iterate through states. 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity st_mcn is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;   -- Debounced button signal
           state : out STD_LOGIC_VECTOR (2 downto 0));
end st_mcn;

architecture Behavioral of st_mcn is

signal state_tmp : std_logic_vector (2 downto 0) := "001";

begin
process (clk, en)
    begin
    if (clk'event and clk = '1' and en = '1') then
        if (state_tmp = "001") then
            state_tmp <= "010";
        elsif (state_tmp = "010") then
            state_tmp <= "100";
        elsif (state_tmp = "100") then
            state_tmp <= "111";
        elsif (state_tmp = "111") then
            state_tmp <= "001";
        end if;
    end if;
    
end process;

state <= state_tmp;

end Behavioral;
