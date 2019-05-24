----------------------------------------------------------------------------------
-- Author: Tim Hadler
-- 
-- 
-- Create Date: 10.04.2019 11:09:58
-- Module Name: my_dicider - Behavioral
-- Project Name: ALU Design Project
-- Target Devices: Nexys 4 DDR
-- Tool Versions: Xilinx Vivado
-- Description: This module was taken from Steve Weddels my_divider module
-- and modified to output 3 clock signals at different frequencies
-- Takes 100MHz clock and outputs 5, 50, and 100 Hz clock signals
-- 
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity my_divider is
    Port ( Clk_in : in  STD_LOGIC;
           Clk_out_1, Clk_out_2, Clk_out_3 : out  STD_LOGIC);
   
end my_divider;

architecture Behavioral of my_divider is
--
    constant clk_limit_1 : std_logic_vector(27 downto 0) := X"0989680";    --5 hz
    constant clk_limit_2 : std_logic_vector(27 downto 0) := X"007a120";    --100 hz
    constant clk_limit_3 : std_logic_vector(27 downto 0) := X"00f4240";    --50 hz

    signal clk_ctr_1 : std_logic_vector(27 downto 0);
    signal temp_clk_1 : std_logic;
    
    signal clk_ctr_2 : std_logic_vector(27 downto 0);
    signal temp_clk_2 : std_logic;
    
    signal clk_ctr_3 : std_logic_vector(27 downto 0);
    signal temp_clk_3 : std_logic;

begin

    clock: process (Clk_in)

        begin
        if Clk_in = '1' and Clk_in'Event then
        
          if clk_ctr_1 = clk_limit_1 then               
             temp_clk_1 <= not temp_clk_1;              --toggles clock
             clk_ctr_1 <= X"0000000";                   -- clr counter
          else                                          
             clk_ctr_1 <= clk_ctr_1 + X"0000001";  
          end if;
          
          if clk_ctr_2 = clk_limit_2 then               
               temp_clk_2 <= not temp_clk_2;            
             clk_ctr_2 <= X"0000000";                   
          else                                          
               clk_ctr_2 <= clk_ctr_2 + X"0000001";    
          end if;
          
          if clk_ctr_3 = clk_limit_3 then              
               temp_clk_3 <= not temp_clk_3;           
             clk_ctr_3 <= X"0000000";                  
          else                                         
               clk_ctr_3 <= clk_ctr_3 + X"0000001";    
          end if;
          
        end if;

    end process clock;

    Clk_out_1 <= temp_clk_1;    
    Clk_out_2 <= temp_clk_2;
    Clk_out_3 <= temp_clk_3;

end Behavioral;
