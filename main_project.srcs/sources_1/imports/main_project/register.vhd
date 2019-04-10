----------------------------------------------------------------------------------
-- Tertiary Institution: University of Canterbury
-- Engineers: Tim Hadler, Ben Busch and Joe Green
-- 
-- Create Date: 12.03.2019 16:24:51
-- Design Name: Eight bit register
-- Module Name: Register - Behavioral
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
library ieee;
use ieee.std_logic_1164.all;

entity reg_8_en is
    generic (n : integer := 8);
    port(D : in std_logic_vector(n-1 downto 0);
        Clk, En, clr : in std_logic;
        Q : out std_logic_vector(n-1 downto 0));
end reg_8_en;

architecture behaviour of reg_8_en is
begin
    process(Clk)
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