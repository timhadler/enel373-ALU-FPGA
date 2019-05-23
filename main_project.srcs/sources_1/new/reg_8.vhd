----------------------------------------------------------------------------------
-- Author: Joe Green
-- 
-- 
-- Create Date: 10.04.2019 11:09:58
-- Module Name: reg_4_en - Behavioral
-- Project Name: ALU Design Project
-- Target Devices: Nexys 4 DDR
-- Tool Versions: Xilinx Vivado
-- Description: This is a 8-bit register with enable and asynchronous
-- clear inputs
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
