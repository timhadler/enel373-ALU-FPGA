----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.03.2019 15:18:43
-- Design Name: 
-- Module Name: st_mcn - Behavioral
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

entity st_mcn is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
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
