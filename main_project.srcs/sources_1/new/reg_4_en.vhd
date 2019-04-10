----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2019 12:10:59
-- Design Name: 
-- Module Name: reg_4_en - Behavioral
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

entity reg_4_en is
    port(D : in std_logic_vector(3 downto 0);
        Clk, En, clr : in std_logic;
        Q : out std_logic_vector(3 downto 0));
end reg_4_en;

architecture behaviour of reg_4_en is
begin
    process(Clk, clr)
    begin
        if clr = '1' then
            Q <= (others => '0');
        elsif Clk'event and Clk = '1' then
            if En = '1' then
                Q <= D;
            end if;
        end if;
    end process;
end behaviour;

