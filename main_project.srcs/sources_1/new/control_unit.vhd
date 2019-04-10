----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2019 13:38:21
-- Design Name: 
-- Module Name: control_unit - Behavioral
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

entity control_unit is
    Port ( clk : in STD_LOGIC;
           exe : in STD_LOGIC;
           R0_EN, R1_EN, Operand_EN, Operator_EN, RG_EN, SW_EN : out STD_LOGIC;
           R0_out, R1_out, RG_out, clr_all : out STD_LOGIC;
           state : out std_logic_vector (2 downto 0) );
end control_unit;

architecture Behavioral of control_unit is

type state_type is (s0, s1, s2, s3, s4, s5);
signal curr_state, next_state : state_type := s0;

begin
process (clk, exe)
    begin
    if (clk' event and clk = '1' and exe = '1') then
        curr_state <= next_state;
    end if;
end process;

process (curr_state)
    begin
    
    case curr_state is
        when s0 => 
        clr_all <= '0';
        SW_EN <= '1';
        R0_EN <= '1';
        R1_EN <= '0';
        Operand_EN <= '0';
        operator_EN <= '0';
        RG_EN <= '0';
        R0_out <= '0';
        R1_out <= '0';
        RG_out <= '0';
        next_state <= s1;
        state <= "001";
        
        when s1 =>
        SW_EN <= '1';
        R0_EN <= '0';
        R1_EN <= '1';
        Operand_EN <= '0';
        operator_EN <= '0';
        RG_EN <= '0';
        R0_out <= '0';
        R1_out <= '0';
        RG_out <= '0';
        next_state <= s2;
        state <= "010";
        
        when s2 =>
        SW_EN <= '1';
        R0_EN <= '0';
        R1_EN <= '0';
        Operand_EN <= '0';
        operator_EN <= '1';
        RG_EN <= '0';
        R0_out <= '0';
        R1_out <= '0';
        RG_out <= '0';
        next_state <= s3;
        state <= "100";
        
        when s3 =>
        SW_EN <= '0';
        R0_EN <= '0';
        R1_EN <= '0';
        Operand_EN <= '1';
        operator_EN <= '0';
        RG_EN <= '0';
        R0_out <= '1';
        R1_out <= '0';
        RG_out <= '0';
        next_state <= s4;
        state <= "111";
        
        when s4 =>
        SW_EN <= '0';
        R0_EN <= '0';
        R1_EN <= '0';
        Operand_EN <= '0';
        operator_EN <= '0';
        RG_EN <= '1';
        R0_out <= '0';
        R1_out <= '1';
        RG_out <= '0';
        next_state <= s5;
        state <= "011";
        
        when s5 =>
        SW_EN <= '0';
        R0_EN <= '0';
        R1_EN <= '0';
        Operand_EN <= '0';
        operator_EN <= '0';
        RG_EN <= '0';
        R0_out <= '0';
        R1_out <= '0';
        RG_out <= '0';
        clr_all <= '1';
        next_state <= s0;
        state <= "000";
        
    end case;
        
end process;

end Behavioral;
