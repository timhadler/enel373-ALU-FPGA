----------------------------------------------------------------------------------
-- Author: Tim Hadler
-- 
-- 
-- Create Date: 10.04.2019 11:09:58
-- Module Name: led_mux - Behavioral
-- Project Name: ALU Design Project
-- Target Devices: Nexys 4 DDR
-- Tool Versions: Xilinx Vivado
-- Description: This module decides what values stored in registers
-- is displayed using the LEDs, based on current state
-- 
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


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
