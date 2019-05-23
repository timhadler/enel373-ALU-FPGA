----------------------------------------------------------------------------------
-- Author: Tim Hadler
-- 
-- 
-- Create Date: 10.04.2019 11:09:58
-- Module Name: Control_unit
-- Project Name: ALU Design Project
-- Target Devices: Nexys 4 DDR
-- Tool Versions: Xilinx Vivado
-- Description: Is the control unit for the project ALU
-- Decides when the output signals to control the ALU
-- is HIGH or LOW, based on the current state ofthe ALU. 
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity control_unit is
    Port ( clk : in STD_LOGIC;
           exe : in STD_LOGIC; -- Input button BTNC
           R0_EN, R1_EN, Operand_EN, Operator_EN, RG_EN, SW_EN : out STD_LOGIC;
           R0_out, R1_out, RG_out, clr_all : out STD_LOGIC;
           state : out std_logic_vector (2 downto 0) );
end control_unit;

architecture Behavioral of control_unit is

type state_type is (s0, s1, s2, s3, s4);
signal curr_state, next_state : state_type := s0;

constant HIGH : std_logic := '1';
constant LOW : std_logic := '0';

begin
process (exe)
    begin
    if exe' event and exe = '1' then
        curr_state <= next_state;
    end if;
end process;

process (curr_state)
    begin
    
    case curr_state is
        when s0 => 
        SW_EN <= HIGH;
        R0_EN <= HIGH;
        R1_EN <= LOW;
        Operand_EN <= LOW;
        operator_EN <= LOW;
        RG_EN <= LOW;
        R0_out <= LOW;
        R1_out <= LOW;
        RG_out <= LOW;
        next_state <= s1;
        state <= "001";
        
        when s1 =>
        SW_EN <= HIGH;
        R0_EN <= '0';
        R1_EN <= HIGH;
        Operand_EN <= LOW;
        operator_EN <= LOW;
        RG_EN <= LOW;
        R0_out <= LOW;
        R1_out <= LOW;
        RG_out <= LOW;
        next_state <= s2;
        state <= "010";
        
        when s2 =>
        SW_EN <= HIGH;
        R0_EN <= LOW;
        R1_EN <= LOW;
        Operand_EN <= LOW;
        operator_EN <= HIGH;
        RG_EN <= LOW;
        R0_out <= LOW;
        R1_out <= LOW;
        RG_out <= LOW;
        next_state <= s3;
        state <= "100";
        
        when s3 =>
        SW_EN <= LOW;
        R0_EN <= LOW;
        R1_EN <= LOW;
        Operand_EN <= HIGH;
        operator_EN <= '0';
        RG_EN <= '0';
        R0_out <= HIGH;
        R1_out <= LOW;
        RG_out <= LOW;
        next_state <= s4;
        state <= "111";
        
        when s4 =>
        SW_EN <= LOW;
        R0_EN <= LOW;
        R1_EN <= LOW;
        Operand_EN <= LOW;
        operator_EN <= LOW;
        RG_EN <= HIGH;
        R0_out <= LOW;
        R1_out <= HIGH;
        RG_out <= LOW;
        next_state <= s0;
        state <= "011";
        
    end case;
        
end process;

clr_all <= '0';

end Behavioral;
