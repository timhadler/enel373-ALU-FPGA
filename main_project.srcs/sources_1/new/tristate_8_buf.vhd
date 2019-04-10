----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2019 14:41:36
-- Design Name: 
-- Module Name: tristate_8_buf - Behavioral
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

entity tristate_8_buf is
    Port ( Input : in STD_LOGIC_VECTOR (7 downto 0);
           En : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (7 downto 0));
end tristate_8_buf;

architecture Behavioral of tristate_8_buf is

begin
    Output <= (others => 'Z') when En = '0' else Input;
    
end Behavioral;
