----------------------------------------------------------------------------------
-- Author: Tim Hadler
-- 
-- 
-- Create Date: 10.04.2019 11:09:58
-- Module Name: tristate_8_buf - Behavioral
-- Project Name: ALU Design Project
-- Target Devices: Nexys 4 DDR
-- Tool Versions: Xilinx Vivado
-- Description: This is a 8-bit tristate buffer module. 
-- The enable signal comes from the control unit
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tristate_8_buf is
    Port ( Input : in STD_LOGIC_VECTOR (7 downto 0);
           En : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (7 downto 0));
end tristate_8_buf;

architecture Behavioral of tristate_8_buf is

begin
    Output <= (others => 'Z') when En = '0' else Input;
    
end Behavioral;
