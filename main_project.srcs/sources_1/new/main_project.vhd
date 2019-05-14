----------------------------------------------------------------------------------
-- Tertiary Institution: University of Canterbury
-- Engineers: Tim Hadler, Ben Busch and Joe Green
-- 
-- Create Date: 12.03.2019 16:24:51
-- Design Name: CPU "like" realization 
-- Module Name: 
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
library load_data;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
--shift register to determine what register to store inputs into or determine op-code

entity main is
port(
    CLK100MHZ, BTNC : in std_logic;
    SW : in std_logic_vector (7 downto 0);
    seg : out std_logic_vector (0 to 6);
    AN : out std_logic_vector (7 downto 0);
    LED : out std_logic_vector (15 downto 0)
);
end main;

architecture Behav of main is

signal clk_5hz, clk_100hz, concurr_clk : std_logic;
signal databus : std_logic_vector (7 downto 0);
signal regA, regB, regG, operand : std_logic_vector (7 downto 0);
signal bcd : std_logic_vector (7 downto 0);
signal curr_state : std_logic_vector (2 downto 0);
signal ALU_Out : std_logic_vector (7 downto 0);

signal R0_EN, R1_EN, Operator_EN, Operand_EN, RG_EN, SW_EN : STD_LOGIC;
signal R0_out, R1_out, RG_out, clr_all, Button : STD_LOGIC;
signal operator : std_logic_vector (3 downto 0);

component BCD_to_7SEG port(
     bcd_in: in std_logic_vector (3 downto 0);
     leds_out: out std_logic_vector (1 to 7));
end component;

component tristate_8_buf port(
    Input : in std_logic_vector (7 downto 0);
    En : in std_logic;
    Output : out std_logic_vector (7 downto 0) );
end component;

component reg_8_en port(
     D : in std_logic_vector(7 downto 0);
     Clk, En, clr : in std_logic;
     Q : out std_logic_vector(7 downto 0));
end component;

component reg_4_en port(
     D : in std_logic_vector(3 downto 0);
     Clk, En, clr : in std_logic;
     Q : out std_logic_vector(3 downto 0));
end component;

component control_unit port(
    clk : in STD_LOGIC;
    exe : in STD_LOGIC;
    R0_EN, R1_EN, Operator_EN, Operand_EN, RG_EN, SW_EN : out STD_LOGIC;
    R0_out, R1_out, RG_out, clr_all : out STD_LOGIC;
    state : out std_logic_vector (2 downto 0) );
end component;

component ALU port(
    A : in STD_LOGIC_VECTOR (7 downto 0);
    B : in STD_LOGIC_VECTOR (7 downto 0);
    Op_Code : in STD_LOGIC_VECTOR (3 downto 0);
    G : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Button_Debounce port(
    Clk, Button : in std_logic;
    butt_signal : out std_logic );
end component;

component my_divider Port( 
    Clk_in : in  STD_LOGIC;
    Clk_out_1, Clk_out_2, Clk_out_3 : out  STD_LOGIC );
end component;

component hex_8bit_display port(
    input : in STD_LOGIC_VECTOR (7 downto 0);
    concurr_clk : in std_logic;
    BCD_7seg : out std_logic_vector (6 downto 0);
    digit_7seg : out std_logic_vector (7 downto 0));
end component;

component led_mux port(
    state : in std_logic_vector (2 downto 0);
    reg1, reg2, sum, regG : in std_logic_vector (7 downto 0);
    operator : in std_logic_vector (3 downto 0);
    led_out : out std_logic_vector (15 downto 0) );
end component; 

begin

Debounce : Button_Debounce port map(
    Clk => clk_5hz ,Button => BTNC, butt_signal => Button
    );

Display : hex_8bit_display port map(
    input => regG, concurr_clk => concurr_clk, BCD_7seg => seg, digit_7seg => AN
    );

Clock_Divider : my_divider port map(
    clk_in => clk100mhz, clk_out_1 => clk_5hz, clk_out_2 => clk_100hz, Clk_out_3 => concurr_clk
    );
    
A_Register : reg_8_en port map (
    D => databus, clk => clk_100hz, clr => clr_all, en => R0_EN, Q => regA
    );
    
B_Register : reg_8_en port map (
    D => databus, clk => clk_100hz, clr => clr_all, en => R1_EN, Q => regB
    );
    
G_Register : reg_8_en port map (
    D => ALU_Out, clk => clk_100hz, clr => clr_all, en => RG_EN, Q => regG
    );
    
Operator_Register : reg_4_en port map (
    D => databus(3 downto 0), clk => clk_100hz, clr => clr_all, en => Operator_EN, Q => operator
    );
    
OperandA_Register : reg_8_en port map (
    D => databus, clk => clk_100hz, clr => clr_all, en => Operand_EN, Q => operand
    );
        
R0_tristate : tristate_8_buf port map(
    Input => regA, En => R0_out, Output => databus
    );
    
R1_tristate : tristate_8_buf port map(
   Input => regB, En => R1_out, Output => databus
    );
    
RegIn_tristate : tristate_8_buf port map(
    Input => SW, En => SW_EN, Output => databus
    );
    
RG_tristate : tristate_8_buf port map(
    Input => regG, En => RG_out, Output => databus
    );
    
LEDMux : led_mux port map(
    state => curr_state, reg1 => regA, reg2 => regB, sum => operand, operator => operator, regG => regG, led_out => LED
    );
    
Control : control_unit port map (
    clk => clk_100hz, exe => Button, R0_EN => R0_EN, R1_EN => R1_EN, Operator_EN => Operator_EN, Operand_EN => Operand_EN, 
    RG_EN => RG_EN, R0_out => r0_out, R1_out => R1_out, RG_out => RG_out, SW_EN => SW_EN, state => curr_state, clr_all => clr_all
    );
    
Arithmitec_Log : ALU port map (
    A => operand, B => databus, Op_Code => operator, G => ALU_out
    );
    
end Behav;
