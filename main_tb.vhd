----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2019 15:36:38
-- Design Name: 
-- Module Name: main_tb - Behavioral
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

entity main_tb is
--  Port ( );
end main_tb;

architecture Behavioral of main_tb is
    component Button_Debounce   
    port (
       Clk, Button : in STD_LOGIC;
       butt_signal : out STD_LOGIC);
    end component;
    signal Clk : STD_LOGIC;
    signal Button : STD_LOGIC;
    signal butt_signal : STD_LOGIC;
    constant ClockPeriod: TIME := 50ns;
begin
    UT1: Button_Debounce port map (Clk => Clk,
                            Button => Button,
                            butt_signal => butt_signal);
    process
        begin
            Clk <= '1';
            Button <= '0';
            wait for 100 ns;
            Clk <= '0';
            Button <= '0';
            wait for 100 ns;
            Clk <= '1';
            Button <= '1';
            wait;
    end process;
end Behavioral;
