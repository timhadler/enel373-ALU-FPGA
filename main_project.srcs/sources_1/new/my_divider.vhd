----------------------------------------------------------------------------------
-- Company:  UC, ECE
-- Lecturer: Steve Weddell
-- 
-- Create Date:    23:24:33 02/07/2011 
-- Design Name: 
-- Module Name:    my_divider - Behavioral 
-- Project Name:    For ENEL353 course on digital logic
-- Target Devices: Any
-- Tool versions:  Any
-- Description:   This clock divider will take a 50MHz clock and divide it down to 1Hz
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_divider is
    Port ( Clk_in : in  STD_LOGIC;
           Clk_out_1, Clk_out_2, Clk_out_3 : out  STD_LOGIC);
              
    --attribute LOC: string;          
    --attribute LOC of Clk_in: signal is "C9"; -- "B8"; -- MCLK
    --attribute LOC of Clk_out_1: signal is "D4";   --"M5"; -- LED0     
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
        
          if clk_ctr_1 = clk_limit_1 then               -- if counter == (1Hz count)/2
             temp_clk_1 <= not temp_clk_1;              --  toggle clock
             clk_ctr_1 <= X"0000000";                   --  reset counter
          else                                          -- else
             clk_ctr_1 <= clk_ctr_1 + X"0000001";   --  counter = counter + 1
          end if;
          
          if clk_ctr_2 = clk_limit_2 then               -- if counter == (1Hz count)/2
               temp_clk_2 <= not temp_clk_2;                --  toggle clock
             clk_ctr_2 <= X"0000000";                    --  reset counter
          else                                            -- else
               clk_ctr_2 <= clk_ctr_2 + X"0000001";    --  counter = counter + 1
          end if;
          
          if clk_ctr_3 = clk_limit_3 then               -- if counter == (1Hz count)/2
               temp_clk_3 <= not temp_clk_3;                --  toggle clock
             clk_ctr_3 <= X"0000000";                    --  reset counter
          else                                            -- else
               clk_ctr_3 <= clk_ctr_3 + X"0000001";    --  counter = counter + 1
          end if;
          
        end if;

    end process clock;

    Clk_out_1 <= temp_clk_1;    
    Clk_out_2 <= temp_clk_2;
    Clk_out_3 <= temp_clk_3;

end Behavioral;
