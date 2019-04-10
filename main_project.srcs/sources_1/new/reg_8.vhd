----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2019 12:45:10
-- Design Name: 
-- Module Name: reg_8 - Behavioral
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
    port(D : in std_logic_vector(7 downto 0);
        Clk, En, clr : in std_logic;
        Q : out std_logic_vector(7 downto 0));
end reg_8_en;

architecture behaviour of reg_8_en is
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
