----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2019 11:09:58
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Op_Code : in STD_LOGIC_VECTOR (3 downto 0);
           G : out STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is

constant ADD : std_logic_vector := "0001";
constant SUB : std_logic_vector := "0010";
constant log_AND : std_logic_vector := "0100";
constant log_OR : std_logic_vector := "1000";

begin
process (A, B, Op_Code)
    begin
    
    case Op_Code is
        when ADD => G <= A + B;
        when SUB => G <= A - B;
        when log_AND => G <= A AND B;
        when log_OR => G <= A OR B;
        when others => G <= "00000000";
    end case;
    
end process;
end Behavioral;
