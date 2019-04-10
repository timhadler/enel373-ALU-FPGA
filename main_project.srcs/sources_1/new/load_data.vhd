----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2019 17:56:17
-- Design Name: 
-- Module Name: load_data - Behavioral
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

entity load_data is
    Port ( clk, btn : in STD_LOGIC;
           input : in std_logic_vector (7 downto 0);
           state : in std_logic_vector (2 downto 0);
           reg1, reg2, sum : out STD_LOGIC_VECTOR (7 downto 0) );
end load_data;

architecture Behavioral of load_data is

signal r1, r2, s : std_logic_vector (7 downto 0);
signal operand : std_logic_vector (4 downto 0);
begin

process (clk, btn)
    begin
    
    
    if (clk'event and clk = '1' and btn = '1') then
        if (state = "001") then
            r1 <= input;
        elsif (state = "010") then
            r2 <= input;
            
        elsif (state = "100") then
        s <= "00000000";
        --operand <= input(15 downto 11);
            case operand is
            when "10000" => s <= r1 + r2;
            when "01000" => s <= r1 - r2;
            when "00100" => s <= r1 AND r2;
            when "00010" => s <= r1 OR r2;
            when "00001" => s <= r1 XNOR r2;
            when others => s <= "00000000";
        end case; 
        end if;
    end if;

reg1 <= r1;
reg2 <= r2;
sum <= s;
end process;


end Behavioral;
