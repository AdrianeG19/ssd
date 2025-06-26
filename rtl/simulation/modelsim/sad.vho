-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "06/26/2025 00:28:47"

-- 
-- Device: Altera EP2C5AF256A7 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	sad IS
    PORT (
	clk : IN std_logic;
	rst_a : IN std_logic;
	enable : IN std_logic;
	sample_ori : IN std_logic_vector(7 DOWNTO 0);
	sample_can : IN std_logic_vector(7 DOWNTO 0);
	read_mem : OUT std_logic;
	address : OUT std_logic_vector(5 DOWNTO 0);
	sad_value : OUT std_logic_vector(13 DOWNTO 0);
	done : OUT std_logic
	);
END sad;

-- Design Ports Information
-- read_mem	=>  Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- address[0]	=>  Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- address[1]	=>  Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- address[2]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- address[3]	=>  Location: PIN_F9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- address[4]	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- address[5]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[0]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[1]	=>  Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[2]	=>  Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[3]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[4]	=>  Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[5]	=>  Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[6]	=>  Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[7]	=>  Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[8]	=>  Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[9]	=>  Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[10]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[11]	=>  Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[12]	=>  Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- sad_value[13]	=>  Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- done	=>  Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- rst_a	=>  Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- enable	=>  Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_can[0]	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_ori[0]	=>  Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_can[7]	=>  Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_ori[7]	=>  Location: PIN_E16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_can[6]	=>  Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_ori[6]	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_can[5]	=>  Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_ori[5]	=>  Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_can[4]	=>  Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_ori[4]	=>  Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_can[3]	=>  Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_ori[3]	=>  Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_can[2]	=>  Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_ori[2]	=>  Location: PIN_C14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_can[1]	=>  Location: PIN_J16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- sample_ori[1]	=>  Location: PIN_J15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF sad IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst_a : std_logic;
SIGNAL ww_enable : std_logic;
SIGNAL ww_sample_ori : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_sample_can : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_read_mem : std_logic;
SIGNAL ww_address : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_sad_value : std_logic_vector(13 DOWNTO 0);
SIGNAL ww_done : std_logic;
SIGNAL \rst_a~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \blocooperador|absoluteDifference|diff_ab[1]~2_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ba[1]~2_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ba[2]~4_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ab[3]~6_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ab[4]~8_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ba[4]~8_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ab[5]~10_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ba[5]~11\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ab[6]~13\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ba[6]~12_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ba[6]~13\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ab[7]~14_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ba[7]~14_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|Add1~1_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|Add1~4_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|Add1~7_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \blocooperador|regEndereco|q[0]~7_combout\ : std_logic;
SIGNAL \blocooperador|regEndereco|q[0]~8\ : std_logic;
SIGNAL \blocooperador|regEndereco|q[1]~9_combout\ : std_logic;
SIGNAL \blocooperador|regEndereco|q[1]~10\ : std_logic;
SIGNAL \blocooperador|regEndereco|q[2]~11_combout\ : std_logic;
SIGNAL \blocooperador|regEndereco|q[2]~12\ : std_logic;
SIGNAL \blocooperador|regEndereco|q[3]~14\ : std_logic;
SIGNAL \blocooperador|regEndereco|q[4]~15_combout\ : std_logic;
SIGNAL \blocooperador|regEndereco|q[4]~16\ : std_logic;
SIGNAL \blocooperador|regEndereco|q[5]~18\ : std_logic;
SIGNAL \blocooperador|regEndereco|q[6]~19_combout\ : std_logic;
SIGNAL \blococontrole|next_state.S5~0_combout\ : std_logic;
SIGNAL \rst_a~combout\ : std_logic;
SIGNAL \rst_a~clkctrl_outclk\ : std_logic;
SIGNAL \blococontrole|current_state.S5~regout\ : std_logic;
SIGNAL \enable~combout\ : std_logic;
SIGNAL \blococontrole|Selector0~0_combout\ : std_logic;
SIGNAL \blococontrole|current_state.S0~regout\ : std_logic;
SIGNAL \blococontrole|next_state.S1~0_combout\ : std_logic;
SIGNAL \blococontrole|current_state.S1~regout\ : std_logic;
SIGNAL \blococontrole|current_state.S4~feeder_combout\ : std_logic;
SIGNAL \blococontrole|current_state.S4~regout\ : std_logic;
SIGNAL \blococontrole|next_state.S2~combout\ : std_logic;
SIGNAL \blococontrole|current_state.S2~feeder_combout\ : std_logic;
SIGNAL \blococontrole|current_state.S2~regout\ : std_logic;
SIGNAL \blococontrole|next_state.S3~0_combout\ : std_logic;
SIGNAL \blococontrole|current_state.S3~regout\ : std_logic;
SIGNAL \blocooperador|regEndereco|q[3]~13_combout\ : std_logic;
SIGNAL \blocooperador|regEndereco|q[5]~17_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ab[0]~0_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ba[0]~0_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|LessThan0~1_cout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|LessThan0~3_cout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|LessThan0~5_cout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|LessThan0~7_cout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|LessThan0~9_cout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|LessThan0~11_cout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|LessThan0~13_cout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|LessThan0~14_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|Add1~0_combout\ : std_logic;
SIGNAL \blocooperador|regSoma|q[0]~14_combout\ : std_logic;
SIGNAL \blocooperador|regSoma|q[0]~15\ : std_logic;
SIGNAL \blocooperador|regSoma|q[1]~16_combout\ : std_logic;
SIGNAL \blocooperador|regSAD|q[1]~feeder_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ab[0]~1\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ab[1]~3\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ab[2]~4_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|Add1~2_combout\ : std_logic;
SIGNAL \blocooperador|regSoma|q[1]~17\ : std_logic;
SIGNAL \blocooperador|regSoma|q[2]~18_combout\ : std_logic;
SIGNAL \blocooperador|regSAD|q[2]~feeder_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ba[0]~1\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ba[1]~3\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ba[2]~5\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ba[3]~6_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|Add1~3_combout\ : std_logic;
SIGNAL \blocooperador|regSoma|q[2]~19\ : std_logic;
SIGNAL \blocooperador|regSoma|q[3]~20_combout\ : std_logic;
SIGNAL \blocooperador|regSAD|q[3]~feeder_combout\ : std_logic;
SIGNAL \blocooperador|regSoma|q[3]~21\ : std_logic;
SIGNAL \blocooperador|regSoma|q[4]~22_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ba[3]~7\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ba[4]~9\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ba[5]~10_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|Add1~5_combout\ : std_logic;
SIGNAL \blocooperador|regSoma|q[4]~23\ : std_logic;
SIGNAL \blocooperador|regSoma|q[5]~24_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ab[2]~5\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ab[3]~7\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ab[4]~9\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ab[5]~11\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|diff_ab[6]~12_combout\ : std_logic;
SIGNAL \blocooperador|absoluteDifference|Add1~6_combout\ : std_logic;
SIGNAL \blocooperador|regSoma|q[5]~25\ : std_logic;
SIGNAL \blocooperador|regSoma|q[6]~26_combout\ : std_logic;
SIGNAL \blocooperador|regSoma|q[6]~27\ : std_logic;
SIGNAL \blocooperador|regSoma|q[7]~28_combout\ : std_logic;
SIGNAL \blocooperador|regSoma|q[7]~29\ : std_logic;
SIGNAL \blocooperador|regSoma|q[8]~30_combout\ : std_logic;
SIGNAL \blocooperador|regSoma|q[8]~31\ : std_logic;
SIGNAL \blocooperador|regSoma|q[9]~32_combout\ : std_logic;
SIGNAL \blocooperador|regSAD|q[9]~feeder_combout\ : std_logic;
SIGNAL \blocooperador|regSoma|q[9]~33\ : std_logic;
SIGNAL \blocooperador|regSoma|q[10]~34_combout\ : std_logic;
SIGNAL \blocooperador|regSAD|q[10]~feeder_combout\ : std_logic;
SIGNAL \blocooperador|regSoma|q[10]~35\ : std_logic;
SIGNAL \blocooperador|regSoma|q[11]~36_combout\ : std_logic;
SIGNAL \blocooperador|regSAD|q[11]~feeder_combout\ : std_logic;
SIGNAL \blocooperador|regSoma|q[11]~37\ : std_logic;
SIGNAL \blocooperador|regSoma|q[12]~38_combout\ : std_logic;
SIGNAL \blocooperador|regSAD|q[12]~feeder_combout\ : std_logic;
SIGNAL \blocooperador|regSoma|q[12]~39\ : std_logic;
SIGNAL \blocooperador|regSoma|q[13]~40_combout\ : std_logic;
SIGNAL \blocooperador|regB|q\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \blocooperador|regSAD|q\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \blocooperador|regA|q\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \blocooperador|regSoma|q\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \blocooperador|regEndereco|q\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \sample_ori~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \sample_can~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \blococontrole|ALT_INV_current_state.S0~regout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst_a <= rst_a;
ww_enable <= enable;
ww_sample_ori <= sample_ori;
ww_sample_can <= sample_can;
read_mem <= ww_read_mem;
address <= ww_address;
sad_value <= ww_sad_value;
done <= ww_done;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\rst_a~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \rst_a~combout\);

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);
\blococontrole|ALT_INV_current_state.S0~regout\ <= NOT \blococontrole|current_state.S0~regout\;

-- Location: LCCOMB_X26_Y13_N2
\blocooperador|absoluteDifference|diff_ab[1]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|diff_ab[1]~2_combout\ = (\blocooperador|regB|q\(1) & ((\blocooperador|regA|q\(1) & (!\blocooperador|absoluteDifference|diff_ab[0]~1\)) # (!\blocooperador|regA|q\(1) & ((\blocooperador|absoluteDifference|diff_ab[0]~1\) # 
-- (GND))))) # (!\blocooperador|regB|q\(1) & ((\blocooperador|regA|q\(1) & (\blocooperador|absoluteDifference|diff_ab[0]~1\ & VCC)) # (!\blocooperador|regA|q\(1) & (!\blocooperador|absoluteDifference|diff_ab[0]~1\))))
-- \blocooperador|absoluteDifference|diff_ab[1]~3\ = CARRY((\blocooperador|regB|q\(1) & ((!\blocooperador|absoluteDifference|diff_ab[0]~1\) # (!\blocooperador|regA|q\(1)))) # (!\blocooperador|regB|q\(1) & (!\blocooperador|regA|q\(1) & 
-- !\blocooperador|absoluteDifference|diff_ab[0]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regB|q\(1),
	datab => \blocooperador|regA|q\(1),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|diff_ab[0]~1\,
	combout => \blocooperador|absoluteDifference|diff_ab[1]~2_combout\,
	cout => \blocooperador|absoluteDifference|diff_ab[1]~3\);

-- Location: LCCOMB_X27_Y13_N2
\blocooperador|absoluteDifference|diff_ba[1]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|diff_ba[1]~2_combout\ = (\blocooperador|regA|q\(1) & ((\blocooperador|regB|q\(1) & (!\blocooperador|absoluteDifference|diff_ba[0]~1\)) # (!\blocooperador|regB|q\(1) & ((\blocooperador|absoluteDifference|diff_ba[0]~1\) # 
-- (GND))))) # (!\blocooperador|regA|q\(1) & ((\blocooperador|regB|q\(1) & (\blocooperador|absoluteDifference|diff_ba[0]~1\ & VCC)) # (!\blocooperador|regB|q\(1) & (!\blocooperador|absoluteDifference|diff_ba[0]~1\))))
-- \blocooperador|absoluteDifference|diff_ba[1]~3\ = CARRY((\blocooperador|regA|q\(1) & ((!\blocooperador|absoluteDifference|diff_ba[0]~1\) # (!\blocooperador|regB|q\(1)))) # (!\blocooperador|regA|q\(1) & (!\blocooperador|regB|q\(1) & 
-- !\blocooperador|absoluteDifference|diff_ba[0]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regA|q\(1),
	datab => \blocooperador|regB|q\(1),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|diff_ba[0]~1\,
	combout => \blocooperador|absoluteDifference|diff_ba[1]~2_combout\,
	cout => \blocooperador|absoluteDifference|diff_ba[1]~3\);

-- Location: LCCOMB_X27_Y13_N4
\blocooperador|absoluteDifference|diff_ba[2]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|diff_ba[2]~4_combout\ = ((\blocooperador|regA|q\(2) $ (\blocooperador|regB|q\(2) $ (\blocooperador|absoluteDifference|diff_ba[1]~3\)))) # (GND)
-- \blocooperador|absoluteDifference|diff_ba[2]~5\ = CARRY((\blocooperador|regA|q\(2) & (\blocooperador|regB|q\(2) & !\blocooperador|absoluteDifference|diff_ba[1]~3\)) # (!\blocooperador|regA|q\(2) & ((\blocooperador|regB|q\(2)) # 
-- (!\blocooperador|absoluteDifference|diff_ba[1]~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regA|q\(2),
	datab => \blocooperador|regB|q\(2),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|diff_ba[1]~3\,
	combout => \blocooperador|absoluteDifference|diff_ba[2]~4_combout\,
	cout => \blocooperador|absoluteDifference|diff_ba[2]~5\);

-- Location: LCCOMB_X26_Y13_N6
\blocooperador|absoluteDifference|diff_ab[3]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|diff_ab[3]~6_combout\ = (\blocooperador|regB|q\(3) & ((\blocooperador|regA|q\(3) & (!\blocooperador|absoluteDifference|diff_ab[2]~5\)) # (!\blocooperador|regA|q\(3) & ((\blocooperador|absoluteDifference|diff_ab[2]~5\) # 
-- (GND))))) # (!\blocooperador|regB|q\(3) & ((\blocooperador|regA|q\(3) & (\blocooperador|absoluteDifference|diff_ab[2]~5\ & VCC)) # (!\blocooperador|regA|q\(3) & (!\blocooperador|absoluteDifference|diff_ab[2]~5\))))
-- \blocooperador|absoluteDifference|diff_ab[3]~7\ = CARRY((\blocooperador|regB|q\(3) & ((!\blocooperador|absoluteDifference|diff_ab[2]~5\) # (!\blocooperador|regA|q\(3)))) # (!\blocooperador|regB|q\(3) & (!\blocooperador|regA|q\(3) & 
-- !\blocooperador|absoluteDifference|diff_ab[2]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regB|q\(3),
	datab => \blocooperador|regA|q\(3),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|diff_ab[2]~5\,
	combout => \blocooperador|absoluteDifference|diff_ab[3]~6_combout\,
	cout => \blocooperador|absoluteDifference|diff_ab[3]~7\);

-- Location: LCCOMB_X26_Y13_N8
\blocooperador|absoluteDifference|diff_ab[4]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|diff_ab[4]~8_combout\ = ((\blocooperador|regB|q\(4) $ (\blocooperador|regA|q\(4) $ (\blocooperador|absoluteDifference|diff_ab[3]~7\)))) # (GND)
-- \blocooperador|absoluteDifference|diff_ab[4]~9\ = CARRY((\blocooperador|regB|q\(4) & (\blocooperador|regA|q\(4) & !\blocooperador|absoluteDifference|diff_ab[3]~7\)) # (!\blocooperador|regB|q\(4) & ((\blocooperador|regA|q\(4)) # 
-- (!\blocooperador|absoluteDifference|diff_ab[3]~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regB|q\(4),
	datab => \blocooperador|regA|q\(4),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|diff_ab[3]~7\,
	combout => \blocooperador|absoluteDifference|diff_ab[4]~8_combout\,
	cout => \blocooperador|absoluteDifference|diff_ab[4]~9\);

-- Location: LCCOMB_X27_Y13_N8
\blocooperador|absoluteDifference|diff_ba[4]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|diff_ba[4]~8_combout\ = ((\blocooperador|regA|q\(4) $ (\blocooperador|regB|q\(4) $ (\blocooperador|absoluteDifference|diff_ba[3]~7\)))) # (GND)
-- \blocooperador|absoluteDifference|diff_ba[4]~9\ = CARRY((\blocooperador|regA|q\(4) & (\blocooperador|regB|q\(4) & !\blocooperador|absoluteDifference|diff_ba[3]~7\)) # (!\blocooperador|regA|q\(4) & ((\blocooperador|regB|q\(4)) # 
-- (!\blocooperador|absoluteDifference|diff_ba[3]~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regA|q\(4),
	datab => \blocooperador|regB|q\(4),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|diff_ba[3]~7\,
	combout => \blocooperador|absoluteDifference|diff_ba[4]~8_combout\,
	cout => \blocooperador|absoluteDifference|diff_ba[4]~9\);

-- Location: LCCOMB_X26_Y13_N10
\blocooperador|absoluteDifference|diff_ab[5]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|diff_ab[5]~10_combout\ = (\blocooperador|regA|q\(5) & ((\blocooperador|regB|q\(5) & (!\blocooperador|absoluteDifference|diff_ab[4]~9\)) # (!\blocooperador|regB|q\(5) & (\blocooperador|absoluteDifference|diff_ab[4]~9\ & 
-- VCC)))) # (!\blocooperador|regA|q\(5) & ((\blocooperador|regB|q\(5) & ((\blocooperador|absoluteDifference|diff_ab[4]~9\) # (GND))) # (!\blocooperador|regB|q\(5) & (!\blocooperador|absoluteDifference|diff_ab[4]~9\))))
-- \blocooperador|absoluteDifference|diff_ab[5]~11\ = CARRY((\blocooperador|regA|q\(5) & (\blocooperador|regB|q\(5) & !\blocooperador|absoluteDifference|diff_ab[4]~9\)) # (!\blocooperador|regA|q\(5) & ((\blocooperador|regB|q\(5)) # 
-- (!\blocooperador|absoluteDifference|diff_ab[4]~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regA|q\(5),
	datab => \blocooperador|regB|q\(5),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|diff_ab[4]~9\,
	combout => \blocooperador|absoluteDifference|diff_ab[5]~10_combout\,
	cout => \blocooperador|absoluteDifference|diff_ab[5]~11\);

-- Location: LCCOMB_X27_Y13_N10
\blocooperador|absoluteDifference|diff_ba[5]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|diff_ba[5]~10_combout\ = (\blocooperador|regB|q\(5) & ((\blocooperador|regA|q\(5) & (!\blocooperador|absoluteDifference|diff_ba[4]~9\)) # (!\blocooperador|regA|q\(5) & (\blocooperador|absoluteDifference|diff_ba[4]~9\ & 
-- VCC)))) # (!\blocooperador|regB|q\(5) & ((\blocooperador|regA|q\(5) & ((\blocooperador|absoluteDifference|diff_ba[4]~9\) # (GND))) # (!\blocooperador|regA|q\(5) & (!\blocooperador|absoluteDifference|diff_ba[4]~9\))))
-- \blocooperador|absoluteDifference|diff_ba[5]~11\ = CARRY((\blocooperador|regB|q\(5) & (\blocooperador|regA|q\(5) & !\blocooperador|absoluteDifference|diff_ba[4]~9\)) # (!\blocooperador|regB|q\(5) & ((\blocooperador|regA|q\(5)) # 
-- (!\blocooperador|absoluteDifference|diff_ba[4]~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regB|q\(5),
	datab => \blocooperador|regA|q\(5),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|diff_ba[4]~9\,
	combout => \blocooperador|absoluteDifference|diff_ba[5]~10_combout\,
	cout => \blocooperador|absoluteDifference|diff_ba[5]~11\);

-- Location: LCCOMB_X26_Y13_N12
\blocooperador|absoluteDifference|diff_ab[6]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|diff_ab[6]~12_combout\ = ((\blocooperador|regB|q\(6) $ (\blocooperador|regA|q\(6) $ (\blocooperador|absoluteDifference|diff_ab[5]~11\)))) # (GND)
-- \blocooperador|absoluteDifference|diff_ab[6]~13\ = CARRY((\blocooperador|regB|q\(6) & (\blocooperador|regA|q\(6) & !\blocooperador|absoluteDifference|diff_ab[5]~11\)) # (!\blocooperador|regB|q\(6) & ((\blocooperador|regA|q\(6)) # 
-- (!\blocooperador|absoluteDifference|diff_ab[5]~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regB|q\(6),
	datab => \blocooperador|regA|q\(6),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|diff_ab[5]~11\,
	combout => \blocooperador|absoluteDifference|diff_ab[6]~12_combout\,
	cout => \blocooperador|absoluteDifference|diff_ab[6]~13\);

-- Location: LCCOMB_X27_Y13_N12
\blocooperador|absoluteDifference|diff_ba[6]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|diff_ba[6]~12_combout\ = ((\blocooperador|regB|q\(6) $ (\blocooperador|regA|q\(6) $ (\blocooperador|absoluteDifference|diff_ba[5]~11\)))) # (GND)
-- \blocooperador|absoluteDifference|diff_ba[6]~13\ = CARRY((\blocooperador|regB|q\(6) & ((!\blocooperador|absoluteDifference|diff_ba[5]~11\) # (!\blocooperador|regA|q\(6)))) # (!\blocooperador|regB|q\(6) & (!\blocooperador|regA|q\(6) & 
-- !\blocooperador|absoluteDifference|diff_ba[5]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regB|q\(6),
	datab => \blocooperador|regA|q\(6),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|diff_ba[5]~11\,
	combout => \blocooperador|absoluteDifference|diff_ba[6]~12_combout\,
	cout => \blocooperador|absoluteDifference|diff_ba[6]~13\);

-- Location: LCCOMB_X26_Y13_N14
\blocooperador|absoluteDifference|diff_ab[7]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|diff_ab[7]~14_combout\ = \blocooperador|regA|q\(7) $ (\blocooperador|absoluteDifference|diff_ab[6]~13\ $ (!\blocooperador|regB|q\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regA|q\(7),
	datad => \blocooperador|regB|q\(7),
	cin => \blocooperador|absoluteDifference|diff_ab[6]~13\,
	combout => \blocooperador|absoluteDifference|diff_ab[7]~14_combout\);

-- Location: LCCOMB_X27_Y13_N14
\blocooperador|absoluteDifference|diff_ba[7]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|diff_ba[7]~14_combout\ = \blocooperador|regB|q\(7) $ (\blocooperador|absoluteDifference|diff_ba[6]~13\ $ (!\blocooperador|regA|q\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blocooperador|regB|q\(7),
	datad => \blocooperador|regA|q\(7),
	cin => \blocooperador|absoluteDifference|diff_ba[6]~13\,
	combout => \blocooperador|absoluteDifference|diff_ba[7]~14_combout\);

-- Location: LCFF_X27_Y13_N17
\blocooperador|regA|q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_ori~combout\(0),
	sload => VCC,
	ena => \blococontrole|current_state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regA|q\(0));

-- Location: LCFF_X27_Y13_N13
\blocooperador|regB|q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_can~combout\(6),
	sload => VCC,
	ena => \blococontrole|current_state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regB|q\(6));

-- Location: LCFF_X27_Y13_N7
\blocooperador|regB|q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_can~combout\(3),
	sload => VCC,
	ena => \blococontrole|current_state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regB|q\(3));

-- Location: LCCOMB_X26_Y13_N26
\blocooperador|absoluteDifference|Add1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|Add1~1_combout\ = (\blocooperador|absoluteDifference|LessThan0~14_combout\ & (\blocooperador|absoluteDifference|diff_ab[1]~2_combout\)) # (!\blocooperador|absoluteDifference|LessThan0~14_combout\ & 
-- ((\blocooperador|absoluteDifference|diff_ba[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \blocooperador|absoluteDifference|diff_ab[1]~2_combout\,
	datac => \blocooperador|absoluteDifference|diff_ba[1]~2_combout\,
	datad => \blocooperador|absoluteDifference|LessThan0~14_combout\,
	combout => \blocooperador|absoluteDifference|Add1~1_combout\);

-- Location: LCCOMB_X26_Y13_N16
\blocooperador|absoluteDifference|Add1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|Add1~4_combout\ = (\blocooperador|absoluteDifference|LessThan0~14_combout\ & (\blocooperador|absoluteDifference|diff_ab[4]~8_combout\)) # (!\blocooperador|absoluteDifference|LessThan0~14_combout\ & 
-- ((\blocooperador|absoluteDifference|diff_ba[4]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \blocooperador|absoluteDifference|diff_ab[4]~8_combout\,
	datac => \blocooperador|absoluteDifference|diff_ba[4]~8_combout\,
	datad => \blocooperador|absoluteDifference|LessThan0~14_combout\,
	combout => \blocooperador|absoluteDifference|Add1~4_combout\);

-- Location: LCCOMB_X26_Y13_N22
\blocooperador|absoluteDifference|Add1~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|Add1~7_combout\ = (\blocooperador|absoluteDifference|LessThan0~14_combout\ & ((\blocooperador|absoluteDifference|diff_ab[7]~14_combout\))) # (!\blocooperador|absoluteDifference|LessThan0~14_combout\ & 
-- (\blocooperador|absoluteDifference|diff_ba[7]~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \blocooperador|absoluteDifference|diff_ba[7]~14_combout\,
	datac => \blocooperador|absoluteDifference|diff_ab[7]~14_combout\,
	datad => \blocooperador|absoluteDifference|LessThan0~14_combout\,
	combout => \blocooperador|absoluteDifference|Add1~7_combout\);

-- Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_ori[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_ori(0),
	combout => \sample_ori~combout\(0));

-- Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_can[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_can(6),
	combout => \sample_can~combout\(6));

-- Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_can[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_can(3),
	combout => \sample_can~combout\(3));

-- Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G2
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: LCCOMB_X18_Y13_N0
\blocooperador|regEndereco|q[0]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regEndereco|q[0]~7_combout\ = \blocooperador|regEndereco|q\(0) $ (VCC)
-- \blocooperador|regEndereco|q[0]~8\ = CARRY(\blocooperador|regEndereco|q\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \blocooperador|regEndereco|q\(0),
	datad => VCC,
	combout => \blocooperador|regEndereco|q[0]~7_combout\,
	cout => \blocooperador|regEndereco|q[0]~8\);

-- Location: LCFF_X18_Y13_N1
\blocooperador|regEndereco|q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regEndereco|q[0]~7_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regEndereco|q\(0));

-- Location: LCCOMB_X18_Y13_N2
\blocooperador|regEndereco|q[1]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regEndereco|q[1]~9_combout\ = (\blocooperador|regEndereco|q\(1) & (!\blocooperador|regEndereco|q[0]~8\)) # (!\blocooperador|regEndereco|q\(1) & ((\blocooperador|regEndereco|q[0]~8\) # (GND)))
-- \blocooperador|regEndereco|q[1]~10\ = CARRY((!\blocooperador|regEndereco|q[0]~8\) # (!\blocooperador|regEndereco|q\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blocooperador|regEndereco|q\(1),
	datad => VCC,
	cin => \blocooperador|regEndereco|q[0]~8\,
	combout => \blocooperador|regEndereco|q[1]~9_combout\,
	cout => \blocooperador|regEndereco|q[1]~10\);

-- Location: LCFF_X18_Y13_N3
\blocooperador|regEndereco|q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regEndereco|q[1]~9_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regEndereco|q\(1));

-- Location: LCCOMB_X18_Y13_N4
\blocooperador|regEndereco|q[2]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regEndereco|q[2]~11_combout\ = (\blocooperador|regEndereco|q\(2) & (\blocooperador|regEndereco|q[1]~10\ $ (GND))) # (!\blocooperador|regEndereco|q\(2) & (!\blocooperador|regEndereco|q[1]~10\ & VCC))
-- \blocooperador|regEndereco|q[2]~12\ = CARRY((\blocooperador|regEndereco|q\(2) & !\blocooperador|regEndereco|q[1]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blocooperador|regEndereco|q\(2),
	datad => VCC,
	cin => \blocooperador|regEndereco|q[1]~10\,
	combout => \blocooperador|regEndereco|q[2]~11_combout\,
	cout => \blocooperador|regEndereco|q[2]~12\);

-- Location: LCFF_X18_Y13_N5
\blocooperador|regEndereco|q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regEndereco|q[2]~11_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regEndereco|q\(2));

-- Location: LCCOMB_X18_Y13_N6
\blocooperador|regEndereco|q[3]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regEndereco|q[3]~13_combout\ = (\blocooperador|regEndereco|q\(3) & (!\blocooperador|regEndereco|q[2]~12\)) # (!\blocooperador|regEndereco|q\(3) & ((\blocooperador|regEndereco|q[2]~12\) # (GND)))
-- \blocooperador|regEndereco|q[3]~14\ = CARRY((!\blocooperador|regEndereco|q[2]~12\) # (!\blocooperador|regEndereco|q\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regEndereco|q\(3),
	datad => VCC,
	cin => \blocooperador|regEndereco|q[2]~12\,
	combout => \blocooperador|regEndereco|q[3]~13_combout\,
	cout => \blocooperador|regEndereco|q[3]~14\);

-- Location: LCCOMB_X18_Y13_N8
\blocooperador|regEndereco|q[4]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regEndereco|q[4]~15_combout\ = (\blocooperador|regEndereco|q\(4) & (\blocooperador|regEndereco|q[3]~14\ $ (GND))) # (!\blocooperador|regEndereco|q\(4) & (!\blocooperador|regEndereco|q[3]~14\ & VCC))
-- \blocooperador|regEndereco|q[4]~16\ = CARRY((\blocooperador|regEndereco|q\(4) & !\blocooperador|regEndereco|q[3]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blocooperador|regEndereco|q\(4),
	datad => VCC,
	cin => \blocooperador|regEndereco|q[3]~14\,
	combout => \blocooperador|regEndereco|q[4]~15_combout\,
	cout => \blocooperador|regEndereco|q[4]~16\);

-- Location: LCFF_X18_Y13_N9
\blocooperador|regEndereco|q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regEndereco|q[4]~15_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regEndereco|q\(4));

-- Location: LCCOMB_X18_Y13_N10
\blocooperador|regEndereco|q[5]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regEndereco|q[5]~17_combout\ = (\blocooperador|regEndereco|q\(5) & (!\blocooperador|regEndereco|q[4]~16\)) # (!\blocooperador|regEndereco|q\(5) & ((\blocooperador|regEndereco|q[4]~16\) # (GND)))
-- \blocooperador|regEndereco|q[5]~18\ = CARRY((!\blocooperador|regEndereco|q[4]~16\) # (!\blocooperador|regEndereco|q\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regEndereco|q\(5),
	datad => VCC,
	cin => \blocooperador|regEndereco|q[4]~16\,
	combout => \blocooperador|regEndereco|q[5]~17_combout\,
	cout => \blocooperador|regEndereco|q[5]~18\);

-- Location: LCCOMB_X18_Y13_N12
\blocooperador|regEndereco|q[6]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regEndereco|q[6]~19_combout\ = !\blocooperador|regEndereco|q[5]~18\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \blocooperador|regEndereco|q[5]~18\,
	combout => \blocooperador|regEndereco|q[6]~19_combout\);

-- Location: LCFF_X18_Y13_N13
\blocooperador|regEndereco|q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regEndereco|q[6]~19_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regEndereco|q\(6));

-- Location: LCCOMB_X18_Y13_N18
\blococontrole|next_state.S5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \blococontrole|next_state.S5~0_combout\ = (\blococontrole|current_state.S2~regout\ & \blocooperador|regEndereco|q\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \blococontrole|current_state.S2~regout\,
	datad => \blocooperador|regEndereco|q\(6),
	combout => \blococontrole|next_state.S5~0_combout\);

-- Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\rst_a~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_rst_a,
	combout => \rst_a~combout\);

-- Location: CLKCTRL_G1
\rst_a~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst_a~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst_a~clkctrl_outclk\);

-- Location: LCFF_X18_Y13_N19
\blococontrole|current_state.S5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blococontrole|next_state.S5~0_combout\,
	aclr => \rst_a~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blococontrole|current_state.S5~regout\);

-- Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\enable~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_enable,
	combout => \enable~combout\);

-- Location: LCCOMB_X18_Y13_N28
\blococontrole|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \blococontrole|Selector0~0_combout\ = (!\blococontrole|current_state.S5~regout\ & ((\blococontrole|current_state.S0~regout\) # (\enable~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \blococontrole|current_state.S5~regout\,
	datac => \blococontrole|current_state.S0~regout\,
	datad => \enable~combout\,
	combout => \blococontrole|Selector0~0_combout\);

-- Location: LCFF_X18_Y13_N29
\blococontrole|current_state.S0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blococontrole|Selector0~0_combout\,
	aclr => \rst_a~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blococontrole|current_state.S0~regout\);

-- Location: LCCOMB_X18_Y13_N20
\blococontrole|next_state.S1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \blococontrole|next_state.S1~0_combout\ = (!\blococontrole|current_state.S0~regout\ & \enable~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \blococontrole|current_state.S0~regout\,
	datad => \enable~combout\,
	combout => \blococontrole|next_state.S1~0_combout\);

-- Location: LCFF_X18_Y13_N21
\blococontrole|current_state.S1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blococontrole|next_state.S1~0_combout\,
	aclr => \rst_a~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blococontrole|current_state.S1~regout\);

-- Location: LCCOMB_X18_Y13_N22
\blococontrole|current_state.S4~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \blococontrole|current_state.S4~feeder_combout\ = \blococontrole|current_state.S3~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \blococontrole|current_state.S3~regout\,
	combout => \blococontrole|current_state.S4~feeder_combout\);

-- Location: LCFF_X18_Y13_N23
\blococontrole|current_state.S4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blococontrole|current_state.S4~feeder_combout\,
	aclr => \rst_a~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blococontrole|current_state.S4~regout\);

-- Location: LCCOMB_X18_Y13_N24
\blococontrole|next_state.S2\ : cycloneii_lcell_comb
-- Equation(s):
-- \blococontrole|next_state.S2~combout\ = (\blococontrole|current_state.S1~regout\) # (\blococontrole|current_state.S4~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \blococontrole|current_state.S1~regout\,
	datad => \blococontrole|current_state.S4~regout\,
	combout => \blococontrole|next_state.S2~combout\);

-- Location: LCCOMB_X18_Y13_N26
\blococontrole|current_state.S2~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \blococontrole|current_state.S2~feeder_combout\ = \blococontrole|next_state.S2~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \blococontrole|next_state.S2~combout\,
	combout => \blococontrole|current_state.S2~feeder_combout\);

-- Location: LCFF_X18_Y13_N27
\blococontrole|current_state.S2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blococontrole|current_state.S2~feeder_combout\,
	aclr => \rst_a~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blococontrole|current_state.S2~regout\);

-- Location: LCCOMB_X18_Y13_N30
\blococontrole|next_state.S3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \blococontrole|next_state.S3~0_combout\ = (\blococontrole|current_state.S2~regout\ & !\blocooperador|regEndereco|q\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \blococontrole|current_state.S2~regout\,
	datad => \blocooperador|regEndereco|q\(6),
	combout => \blococontrole|next_state.S3~0_combout\);

-- Location: LCFF_X18_Y13_N31
\blococontrole|current_state.S3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blococontrole|next_state.S3~0_combout\,
	aclr => \rst_a~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blococontrole|current_state.S3~regout\);

-- Location: LCFF_X18_Y13_N7
\blocooperador|regEndereco|q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regEndereco|q[3]~13_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regEndereco|q\(3));

-- Location: LCFF_X18_Y13_N11
\blocooperador|regEndereco|q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regEndereco|q[5]~17_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regEndereco|q\(5));

-- Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_can[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_can(0),
	combout => \sample_can~combout\(0));

-- Location: LCFF_X27_Y13_N1
\blocooperador|regB|q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_can~combout\(0),
	sload => VCC,
	ena => \blococontrole|current_state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regB|q\(0));

-- Location: LCCOMB_X26_Y13_N0
\blocooperador|absoluteDifference|diff_ab[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|diff_ab[0]~0_combout\ = (\blocooperador|regA|q\(0) & ((GND) # (!\blocooperador|regB|q\(0)))) # (!\blocooperador|regA|q\(0) & (\blocooperador|regB|q\(0) $ (GND)))
-- \blocooperador|absoluteDifference|diff_ab[0]~1\ = CARRY((\blocooperador|regA|q\(0)) # (!\blocooperador|regB|q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regA|q\(0),
	datab => \blocooperador|regB|q\(0),
	datad => VCC,
	combout => \blocooperador|absoluteDifference|diff_ab[0]~0_combout\,
	cout => \blocooperador|absoluteDifference|diff_ab[0]~1\);

-- Location: LCCOMB_X27_Y13_N0
\blocooperador|absoluteDifference|diff_ba[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|diff_ba[0]~0_combout\ = (\blocooperador|regA|q\(0) & (\blocooperador|regB|q\(0) $ (VCC))) # (!\blocooperador|regA|q\(0) & ((\blocooperador|regB|q\(0)) # (GND)))
-- \blocooperador|absoluteDifference|diff_ba[0]~1\ = CARRY((\blocooperador|regB|q\(0)) # (!\blocooperador|regA|q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regA|q\(0),
	datab => \blocooperador|regB|q\(0),
	datad => VCC,
	combout => \blocooperador|absoluteDifference|diff_ba[0]~0_combout\,
	cout => \blocooperador|absoluteDifference|diff_ba[0]~1\);

-- Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_can[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_can(7),
	combout => \sample_can~combout\(7));

-- Location: LCFF_X27_Y13_N15
\blocooperador|regB|q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_can~combout\(7),
	sload => VCC,
	ena => \blococontrole|current_state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regB|q\(7));

-- Location: PIN_E16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_ori[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_ori(7),
	combout => \sample_ori~combout\(7));

-- Location: LCFF_X27_Y13_N31
\blocooperador|regA|q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_ori~combout\(7),
	sload => VCC,
	ena => \blococontrole|current_state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regA|q\(7));

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_ori[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_ori(6),
	combout => \sample_ori~combout\(6));

-- Location: LCFF_X27_Y13_N29
\blocooperador|regA|q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_ori~combout\(6),
	sload => VCC,
	ena => \blococontrole|current_state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regA|q\(6));

-- Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_ori[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_ori(5),
	combout => \sample_ori~combout\(5));

-- Location: LCFF_X27_Y13_N27
\blocooperador|regA|q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_ori~combout\(5),
	sload => VCC,
	ena => \blococontrole|current_state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regA|q\(5));

-- Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_can[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_can(4),
	combout => \sample_can~combout\(4));

-- Location: LCFF_X27_Y13_N9
\blocooperador|regB|q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_can~combout\(4),
	sload => VCC,
	ena => \blococontrole|current_state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regB|q\(4));

-- Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_ori[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_ori(3),
	combout => \sample_ori~combout\(3));

-- Location: LCFF_X27_Y13_N23
\blocooperador|regA|q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_ori~combout\(3),
	sload => VCC,
	ena => \blococontrole|current_state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regA|q\(3));

-- Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_can[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_can(2),
	combout => \sample_can~combout\(2));

-- Location: LCFF_X27_Y13_N5
\blocooperador|regB|q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_can~combout\(2),
	sload => VCC,
	ena => \blococontrole|current_state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regB|q\(2));

-- Location: PIN_J16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_can[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_can(1),
	combout => \sample_can~combout\(1));

-- Location: LCFF_X27_Y13_N3
\blocooperador|regB|q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_can~combout\(1),
	sload => VCC,
	ena => \blococontrole|current_state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regB|q\(1));

-- Location: LCCOMB_X27_Y13_N16
\blocooperador|absoluteDifference|LessThan0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|LessThan0~1_cout\ = CARRY((\blocooperador|regA|q\(0) & !\blocooperador|regB|q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regA|q\(0),
	datab => \blocooperador|regB|q\(0),
	datad => VCC,
	cout => \blocooperador|absoluteDifference|LessThan0~1_cout\);

-- Location: LCCOMB_X27_Y13_N18
\blocooperador|absoluteDifference|LessThan0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|LessThan0~3_cout\ = CARRY((\blocooperador|regA|q\(1) & (\blocooperador|regB|q\(1) & !\blocooperador|absoluteDifference|LessThan0~1_cout\)) # (!\blocooperador|regA|q\(1) & ((\blocooperador|regB|q\(1)) # 
-- (!\blocooperador|absoluteDifference|LessThan0~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regA|q\(1),
	datab => \blocooperador|regB|q\(1),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|LessThan0~1_cout\,
	cout => \blocooperador|absoluteDifference|LessThan0~3_cout\);

-- Location: LCCOMB_X27_Y13_N20
\blocooperador|absoluteDifference|LessThan0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|LessThan0~5_cout\ = CARRY((\blocooperador|regA|q\(2) & ((!\blocooperador|absoluteDifference|LessThan0~3_cout\) # (!\blocooperador|regB|q\(2)))) # (!\blocooperador|regA|q\(2) & (!\blocooperador|regB|q\(2) & 
-- !\blocooperador|absoluteDifference|LessThan0~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regA|q\(2),
	datab => \blocooperador|regB|q\(2),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|LessThan0~3_cout\,
	cout => \blocooperador|absoluteDifference|LessThan0~5_cout\);

-- Location: LCCOMB_X27_Y13_N22
\blocooperador|absoluteDifference|LessThan0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|LessThan0~7_cout\ = CARRY((\blocooperador|regB|q\(3) & ((!\blocooperador|absoluteDifference|LessThan0~5_cout\) # (!\blocooperador|regA|q\(3)))) # (!\blocooperador|regB|q\(3) & (!\blocooperador|regA|q\(3) & 
-- !\blocooperador|absoluteDifference|LessThan0~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regB|q\(3),
	datab => \blocooperador|regA|q\(3),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|LessThan0~5_cout\,
	cout => \blocooperador|absoluteDifference|LessThan0~7_cout\);

-- Location: LCCOMB_X27_Y13_N24
\blocooperador|absoluteDifference|LessThan0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|LessThan0~9_cout\ = CARRY((\blocooperador|regA|q\(4) & ((!\blocooperador|absoluteDifference|LessThan0~7_cout\) # (!\blocooperador|regB|q\(4)))) # (!\blocooperador|regA|q\(4) & (!\blocooperador|regB|q\(4) & 
-- !\blocooperador|absoluteDifference|LessThan0~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regA|q\(4),
	datab => \blocooperador|regB|q\(4),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|LessThan0~7_cout\,
	cout => \blocooperador|absoluteDifference|LessThan0~9_cout\);

-- Location: LCCOMB_X27_Y13_N26
\blocooperador|absoluteDifference|LessThan0~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|LessThan0~11_cout\ = CARRY((\blocooperador|regB|q\(5) & ((!\blocooperador|absoluteDifference|LessThan0~9_cout\) # (!\blocooperador|regA|q\(5)))) # (!\blocooperador|regB|q\(5) & (!\blocooperador|regA|q\(5) & 
-- !\blocooperador|absoluteDifference|LessThan0~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regB|q\(5),
	datab => \blocooperador|regA|q\(5),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|LessThan0~9_cout\,
	cout => \blocooperador|absoluteDifference|LessThan0~11_cout\);

-- Location: LCCOMB_X27_Y13_N28
\blocooperador|absoluteDifference|LessThan0~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|LessThan0~13_cout\ = CARRY((\blocooperador|regB|q\(6) & (\blocooperador|regA|q\(6) & !\blocooperador|absoluteDifference|LessThan0~11_cout\)) # (!\blocooperador|regB|q\(6) & ((\blocooperador|regA|q\(6)) # 
-- (!\blocooperador|absoluteDifference|LessThan0~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regB|q\(6),
	datab => \blocooperador|regA|q\(6),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|LessThan0~11_cout\,
	cout => \blocooperador|absoluteDifference|LessThan0~13_cout\);

-- Location: LCCOMB_X27_Y13_N30
\blocooperador|absoluteDifference|LessThan0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|LessThan0~14_combout\ = (\blocooperador|regB|q\(7) & (\blocooperador|absoluteDifference|LessThan0~13_cout\ & \blocooperador|regA|q\(7))) # (!\blocooperador|regB|q\(7) & 
-- ((\blocooperador|absoluteDifference|LessThan0~13_cout\) # (\blocooperador|regA|q\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blocooperador|regB|q\(7),
	datad => \blocooperador|regA|q\(7),
	cin => \blocooperador|absoluteDifference|LessThan0~13_cout\,
	combout => \blocooperador|absoluteDifference|LessThan0~14_combout\);

-- Location: LCCOMB_X26_Y13_N20
\blocooperador|absoluteDifference|Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|Add1~0_combout\ = (\blocooperador|absoluteDifference|LessThan0~14_combout\ & (\blocooperador|absoluteDifference|diff_ab[0]~0_combout\)) # (!\blocooperador|absoluteDifference|LessThan0~14_combout\ & 
-- ((\blocooperador|absoluteDifference|diff_ba[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \blocooperador|absoluteDifference|diff_ab[0]~0_combout\,
	datac => \blocooperador|absoluteDifference|diff_ba[0]~0_combout\,
	datad => \blocooperador|absoluteDifference|LessThan0~14_combout\,
	combout => \blocooperador|absoluteDifference|Add1~0_combout\);

-- Location: LCCOMB_X25_Y13_N0
\blocooperador|regSoma|q[0]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSoma|q[0]~14_combout\ = (\blocooperador|regSoma|q\(0) & (\blocooperador|absoluteDifference|Add1~0_combout\ $ (VCC))) # (!\blocooperador|regSoma|q\(0) & (\blocooperador|absoluteDifference|Add1~0_combout\ & VCC))
-- \blocooperador|regSoma|q[0]~15\ = CARRY((\blocooperador|regSoma|q\(0) & \blocooperador|absoluteDifference|Add1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regSoma|q\(0),
	datab => \blocooperador|absoluteDifference|Add1~0_combout\,
	datad => VCC,
	combout => \blocooperador|regSoma|q[0]~14_combout\,
	cout => \blocooperador|regSoma|q[0]~15\);

-- Location: LCFF_X25_Y13_N1
\blocooperador|regSoma|q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSoma|q[0]~14_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSoma|q\(0));

-- Location: LCFF_X24_Y13_N17
\blocooperador|regSAD|q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \blocooperador|regSoma|q\(0),
	sload => VCC,
	ena => \blococontrole|current_state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSAD|q\(0));

-- Location: LCCOMB_X25_Y13_N2
\blocooperador|regSoma|q[1]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSoma|q[1]~16_combout\ = (\blocooperador|absoluteDifference|Add1~1_combout\ & ((\blocooperador|regSoma|q\(1) & (\blocooperador|regSoma|q[0]~15\ & VCC)) # (!\blocooperador|regSoma|q\(1) & (!\blocooperador|regSoma|q[0]~15\)))) # 
-- (!\blocooperador|absoluteDifference|Add1~1_combout\ & ((\blocooperador|regSoma|q\(1) & (!\blocooperador|regSoma|q[0]~15\)) # (!\blocooperador|regSoma|q\(1) & ((\blocooperador|regSoma|q[0]~15\) # (GND)))))
-- \blocooperador|regSoma|q[1]~17\ = CARRY((\blocooperador|absoluteDifference|Add1~1_combout\ & (!\blocooperador|regSoma|q\(1) & !\blocooperador|regSoma|q[0]~15\)) # (!\blocooperador|absoluteDifference|Add1~1_combout\ & ((!\blocooperador|regSoma|q[0]~15\) # 
-- (!\blocooperador|regSoma|q\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|absoluteDifference|Add1~1_combout\,
	datab => \blocooperador|regSoma|q\(1),
	datad => VCC,
	cin => \blocooperador|regSoma|q[0]~15\,
	combout => \blocooperador|regSoma|q[1]~16_combout\,
	cout => \blocooperador|regSoma|q[1]~17\);

-- Location: LCFF_X25_Y13_N3
\blocooperador|regSoma|q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSoma|q[1]~16_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSoma|q\(1));

-- Location: LCCOMB_X24_Y13_N18
\blocooperador|regSAD|q[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSAD|q[1]~feeder_combout\ = \blocooperador|regSoma|q\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \blocooperador|regSoma|q\(1),
	combout => \blocooperador|regSAD|q[1]~feeder_combout\);

-- Location: LCFF_X24_Y13_N19
\blocooperador|regSAD|q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSAD|q[1]~feeder_combout\,
	ena => \blococontrole|current_state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSAD|q\(1));

-- Location: PIN_C14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_ori[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_ori(2),
	combout => \sample_ori~combout\(2));

-- Location: LCFF_X27_Y13_N21
\blocooperador|regA|q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_ori~combout\(2),
	sload => VCC,
	ena => \blococontrole|current_state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regA|q\(2));

-- Location: PIN_J15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_ori[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_ori(1),
	combout => \sample_ori~combout\(1));

-- Location: LCFF_X27_Y13_N19
\blocooperador|regA|q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_ori~combout\(1),
	sload => VCC,
	ena => \blococontrole|current_state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regA|q\(1));

-- Location: LCCOMB_X26_Y13_N4
\blocooperador|absoluteDifference|diff_ab[2]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|diff_ab[2]~4_combout\ = ((\blocooperador|regB|q\(2) $ (\blocooperador|regA|q\(2) $ (\blocooperador|absoluteDifference|diff_ab[1]~3\)))) # (GND)
-- \blocooperador|absoluteDifference|diff_ab[2]~5\ = CARRY((\blocooperador|regB|q\(2) & (\blocooperador|regA|q\(2) & !\blocooperador|absoluteDifference|diff_ab[1]~3\)) # (!\blocooperador|regB|q\(2) & ((\blocooperador|regA|q\(2)) # 
-- (!\blocooperador|absoluteDifference|diff_ab[1]~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regB|q\(2),
	datab => \blocooperador|regA|q\(2),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|diff_ab[1]~3\,
	combout => \blocooperador|absoluteDifference|diff_ab[2]~4_combout\,
	cout => \blocooperador|absoluteDifference|diff_ab[2]~5\);

-- Location: LCCOMB_X26_Y13_N28
\blocooperador|absoluteDifference|Add1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|Add1~2_combout\ = (\blocooperador|absoluteDifference|LessThan0~14_combout\ & ((\blocooperador|absoluteDifference|diff_ab[2]~4_combout\))) # (!\blocooperador|absoluteDifference|LessThan0~14_combout\ & 
-- (\blocooperador|absoluteDifference|diff_ba[2]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|absoluteDifference|diff_ba[2]~4_combout\,
	datac => \blocooperador|absoluteDifference|diff_ab[2]~4_combout\,
	datad => \blocooperador|absoluteDifference|LessThan0~14_combout\,
	combout => \blocooperador|absoluteDifference|Add1~2_combout\);

-- Location: LCCOMB_X25_Y13_N4
\blocooperador|regSoma|q[2]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSoma|q[2]~18_combout\ = ((\blocooperador|regSoma|q\(2) $ (\blocooperador|absoluteDifference|Add1~2_combout\ $ (!\blocooperador|regSoma|q[1]~17\)))) # (GND)
-- \blocooperador|regSoma|q[2]~19\ = CARRY((\blocooperador|regSoma|q\(2) & ((\blocooperador|absoluteDifference|Add1~2_combout\) # (!\blocooperador|regSoma|q[1]~17\))) # (!\blocooperador|regSoma|q\(2) & (\blocooperador|absoluteDifference|Add1~2_combout\ & 
-- !\blocooperador|regSoma|q[1]~17\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regSoma|q\(2),
	datab => \blocooperador|absoluteDifference|Add1~2_combout\,
	datad => VCC,
	cin => \blocooperador|regSoma|q[1]~17\,
	combout => \blocooperador|regSoma|q[2]~18_combout\,
	cout => \blocooperador|regSoma|q[2]~19\);

-- Location: LCFF_X25_Y13_N5
\blocooperador|regSoma|q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSoma|q[2]~18_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSoma|q\(2));

-- Location: LCCOMB_X24_Y13_N8
\blocooperador|regSAD|q[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSAD|q[2]~feeder_combout\ = \blocooperador|regSoma|q\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \blocooperador|regSoma|q\(2),
	combout => \blocooperador|regSAD|q[2]~feeder_combout\);

-- Location: LCFF_X24_Y13_N9
\blocooperador|regSAD|q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSAD|q[2]~feeder_combout\,
	ena => \blococontrole|current_state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSAD|q\(2));

-- Location: LCCOMB_X27_Y13_N6
\blocooperador|absoluteDifference|diff_ba[3]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|diff_ba[3]~6_combout\ = (\blocooperador|regB|q\(3) & ((\blocooperador|regA|q\(3) & (!\blocooperador|absoluteDifference|diff_ba[2]~5\)) # (!\blocooperador|regA|q\(3) & (\blocooperador|absoluteDifference|diff_ba[2]~5\ & 
-- VCC)))) # (!\blocooperador|regB|q\(3) & ((\blocooperador|regA|q\(3) & ((\blocooperador|absoluteDifference|diff_ba[2]~5\) # (GND))) # (!\blocooperador|regA|q\(3) & (!\blocooperador|absoluteDifference|diff_ba[2]~5\))))
-- \blocooperador|absoluteDifference|diff_ba[3]~7\ = CARRY((\blocooperador|regB|q\(3) & (\blocooperador|regA|q\(3) & !\blocooperador|absoluteDifference|diff_ba[2]~5\)) # (!\blocooperador|regB|q\(3) & ((\blocooperador|regA|q\(3)) # 
-- (!\blocooperador|absoluteDifference|diff_ba[2]~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regB|q\(3),
	datab => \blocooperador|regA|q\(3),
	datad => VCC,
	cin => \blocooperador|absoluteDifference|diff_ba[2]~5\,
	combout => \blocooperador|absoluteDifference|diff_ba[3]~6_combout\,
	cout => \blocooperador|absoluteDifference|diff_ba[3]~7\);

-- Location: LCCOMB_X26_Y13_N18
\blocooperador|absoluteDifference|Add1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|Add1~3_combout\ = (\blocooperador|absoluteDifference|LessThan0~14_combout\ & (\blocooperador|absoluteDifference|diff_ab[3]~6_combout\)) # (!\blocooperador|absoluteDifference|LessThan0~14_combout\ & 
-- ((\blocooperador|absoluteDifference|diff_ba[3]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|absoluteDifference|diff_ab[3]~6_combout\,
	datac => \blocooperador|absoluteDifference|diff_ba[3]~6_combout\,
	datad => \blocooperador|absoluteDifference|LessThan0~14_combout\,
	combout => \blocooperador|absoluteDifference|Add1~3_combout\);

-- Location: LCCOMB_X25_Y13_N6
\blocooperador|regSoma|q[3]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSoma|q[3]~20_combout\ = (\blocooperador|regSoma|q\(3) & ((\blocooperador|absoluteDifference|Add1~3_combout\ & (\blocooperador|regSoma|q[2]~19\ & VCC)) # (!\blocooperador|absoluteDifference|Add1~3_combout\ & 
-- (!\blocooperador|regSoma|q[2]~19\)))) # (!\blocooperador|regSoma|q\(3) & ((\blocooperador|absoluteDifference|Add1~3_combout\ & (!\blocooperador|regSoma|q[2]~19\)) # (!\blocooperador|absoluteDifference|Add1~3_combout\ & ((\blocooperador|regSoma|q[2]~19\) # 
-- (GND)))))
-- \blocooperador|regSoma|q[3]~21\ = CARRY((\blocooperador|regSoma|q\(3) & (!\blocooperador|absoluteDifference|Add1~3_combout\ & !\blocooperador|regSoma|q[2]~19\)) # (!\blocooperador|regSoma|q\(3) & ((!\blocooperador|regSoma|q[2]~19\) # 
-- (!\blocooperador|absoluteDifference|Add1~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regSoma|q\(3),
	datab => \blocooperador|absoluteDifference|Add1~3_combout\,
	datad => VCC,
	cin => \blocooperador|regSoma|q[2]~19\,
	combout => \blocooperador|regSoma|q[3]~20_combout\,
	cout => \blocooperador|regSoma|q[3]~21\);

-- Location: LCFF_X25_Y13_N7
\blocooperador|regSoma|q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSoma|q[3]~20_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSoma|q\(3));

-- Location: LCCOMB_X24_Y13_N10
\blocooperador|regSAD|q[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSAD|q[3]~feeder_combout\ = \blocooperador|regSoma|q\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \blocooperador|regSoma|q\(3),
	combout => \blocooperador|regSAD|q[3]~feeder_combout\);

-- Location: LCFF_X24_Y13_N11
\blocooperador|regSAD|q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSAD|q[3]~feeder_combout\,
	ena => \blococontrole|current_state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSAD|q\(3));

-- Location: LCCOMB_X25_Y13_N8
\blocooperador|regSoma|q[4]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSoma|q[4]~22_combout\ = ((\blocooperador|absoluteDifference|Add1~4_combout\ $ (\blocooperador|regSoma|q\(4) $ (!\blocooperador|regSoma|q[3]~21\)))) # (GND)
-- \blocooperador|regSoma|q[4]~23\ = CARRY((\blocooperador|absoluteDifference|Add1~4_combout\ & ((\blocooperador|regSoma|q\(4)) # (!\blocooperador|regSoma|q[3]~21\))) # (!\blocooperador|absoluteDifference|Add1~4_combout\ & (\blocooperador|regSoma|q\(4) & 
-- !\blocooperador|regSoma|q[3]~21\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|absoluteDifference|Add1~4_combout\,
	datab => \blocooperador|regSoma|q\(4),
	datad => VCC,
	cin => \blocooperador|regSoma|q[3]~21\,
	combout => \blocooperador|regSoma|q[4]~22_combout\,
	cout => \blocooperador|regSoma|q[4]~23\);

-- Location: LCFF_X25_Y13_N9
\blocooperador|regSoma|q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSoma|q[4]~22_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSoma|q\(4));

-- Location: LCFF_X24_Y13_N13
\blocooperador|regSAD|q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \blocooperador|regSoma|q\(4),
	sload => VCC,
	ena => \blococontrole|current_state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSAD|q\(4));

-- Location: LCCOMB_X26_Y13_N30
\blocooperador|absoluteDifference|Add1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|Add1~5_combout\ = (\blocooperador|absoluteDifference|LessThan0~14_combout\ & (\blocooperador|absoluteDifference|diff_ab[5]~10_combout\)) # (!\blocooperador|absoluteDifference|LessThan0~14_combout\ & 
-- ((\blocooperador|absoluteDifference|diff_ba[5]~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|absoluteDifference|diff_ab[5]~10_combout\,
	datac => \blocooperador|absoluteDifference|diff_ba[5]~10_combout\,
	datad => \blocooperador|absoluteDifference|LessThan0~14_combout\,
	combout => \blocooperador|absoluteDifference|Add1~5_combout\);

-- Location: LCCOMB_X25_Y13_N10
\blocooperador|regSoma|q[5]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSoma|q[5]~24_combout\ = (\blocooperador|regSoma|q\(5) & ((\blocooperador|absoluteDifference|Add1~5_combout\ & (\blocooperador|regSoma|q[4]~23\ & VCC)) # (!\blocooperador|absoluteDifference|Add1~5_combout\ & 
-- (!\blocooperador|regSoma|q[4]~23\)))) # (!\blocooperador|regSoma|q\(5) & ((\blocooperador|absoluteDifference|Add1~5_combout\ & (!\blocooperador|regSoma|q[4]~23\)) # (!\blocooperador|absoluteDifference|Add1~5_combout\ & ((\blocooperador|regSoma|q[4]~23\) # 
-- (GND)))))
-- \blocooperador|regSoma|q[5]~25\ = CARRY((\blocooperador|regSoma|q\(5) & (!\blocooperador|absoluteDifference|Add1~5_combout\ & !\blocooperador|regSoma|q[4]~23\)) # (!\blocooperador|regSoma|q\(5) & ((!\blocooperador|regSoma|q[4]~23\) # 
-- (!\blocooperador|absoluteDifference|Add1~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regSoma|q\(5),
	datab => \blocooperador|absoluteDifference|Add1~5_combout\,
	datad => VCC,
	cin => \blocooperador|regSoma|q[4]~23\,
	combout => \blocooperador|regSoma|q[5]~24_combout\,
	cout => \blocooperador|regSoma|q[5]~25\);

-- Location: LCFF_X25_Y13_N11
\blocooperador|regSoma|q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSoma|q[5]~24_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSoma|q\(5));

-- Location: LCFF_X24_Y13_N27
\blocooperador|regSAD|q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \blocooperador|regSoma|q\(5),
	sload => VCC,
	ena => \blococontrole|current_state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSAD|q\(5));

-- Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_can[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_can(5),
	combout => \sample_can~combout\(5));

-- Location: LCFF_X27_Y13_N11
\blocooperador|regB|q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_can~combout\(5),
	sload => VCC,
	ena => \blococontrole|current_state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regB|q\(5));

-- Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\sample_ori[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_sample_ori(4),
	combout => \sample_ori~combout\(4));

-- Location: LCFF_X27_Y13_N25
\blocooperador|regA|q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \sample_ori~combout\(4),
	sload => VCC,
	ena => \blococontrole|current_state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regA|q\(4));

-- Location: LCCOMB_X26_Y13_N24
\blocooperador|absoluteDifference|Add1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|absoluteDifference|Add1~6_combout\ = (\blocooperador|absoluteDifference|LessThan0~14_combout\ & ((\blocooperador|absoluteDifference|diff_ab[6]~12_combout\))) # (!\blocooperador|absoluteDifference|LessThan0~14_combout\ & 
-- (\blocooperador|absoluteDifference|diff_ba[6]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|absoluteDifference|diff_ba[6]~12_combout\,
	datab => \blocooperador|absoluteDifference|LessThan0~14_combout\,
	datad => \blocooperador|absoluteDifference|diff_ab[6]~12_combout\,
	combout => \blocooperador|absoluteDifference|Add1~6_combout\);

-- Location: LCCOMB_X25_Y13_N12
\blocooperador|regSoma|q[6]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSoma|q[6]~26_combout\ = ((\blocooperador|regSoma|q\(6) $ (\blocooperador|absoluteDifference|Add1~6_combout\ $ (!\blocooperador|regSoma|q[5]~25\)))) # (GND)
-- \blocooperador|regSoma|q[6]~27\ = CARRY((\blocooperador|regSoma|q\(6) & ((\blocooperador|absoluteDifference|Add1~6_combout\) # (!\blocooperador|regSoma|q[5]~25\))) # (!\blocooperador|regSoma|q\(6) & (\blocooperador|absoluteDifference|Add1~6_combout\ & 
-- !\blocooperador|regSoma|q[5]~25\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regSoma|q\(6),
	datab => \blocooperador|absoluteDifference|Add1~6_combout\,
	datad => VCC,
	cin => \blocooperador|regSoma|q[5]~25\,
	combout => \blocooperador|regSoma|q[6]~26_combout\,
	cout => \blocooperador|regSoma|q[6]~27\);

-- Location: LCFF_X25_Y13_N13
\blocooperador|regSoma|q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSoma|q[6]~26_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSoma|q\(6));

-- Location: LCFF_X24_Y13_N25
\blocooperador|regSAD|q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \blocooperador|regSoma|q\(6),
	sload => VCC,
	ena => \blococontrole|current_state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSAD|q\(6));

-- Location: LCCOMB_X25_Y13_N14
\blocooperador|regSoma|q[7]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSoma|q[7]~28_combout\ = (\blocooperador|absoluteDifference|Add1~7_combout\ & ((\blocooperador|regSoma|q\(7) & (\blocooperador|regSoma|q[6]~27\ & VCC)) # (!\blocooperador|regSoma|q\(7) & (!\blocooperador|regSoma|q[6]~27\)))) # 
-- (!\blocooperador|absoluteDifference|Add1~7_combout\ & ((\blocooperador|regSoma|q\(7) & (!\blocooperador|regSoma|q[6]~27\)) # (!\blocooperador|regSoma|q\(7) & ((\blocooperador|regSoma|q[6]~27\) # (GND)))))
-- \blocooperador|regSoma|q[7]~29\ = CARRY((\blocooperador|absoluteDifference|Add1~7_combout\ & (!\blocooperador|regSoma|q\(7) & !\blocooperador|regSoma|q[6]~27\)) # (!\blocooperador|absoluteDifference|Add1~7_combout\ & ((!\blocooperador|regSoma|q[6]~27\) # 
-- (!\blocooperador|regSoma|q\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|absoluteDifference|Add1~7_combout\,
	datab => \blocooperador|regSoma|q\(7),
	datad => VCC,
	cin => \blocooperador|regSoma|q[6]~27\,
	combout => \blocooperador|regSoma|q[7]~28_combout\,
	cout => \blocooperador|regSoma|q[7]~29\);

-- Location: LCFF_X25_Y13_N15
\blocooperador|regSoma|q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSoma|q[7]~28_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSoma|q\(7));

-- Location: LCFF_X24_Y13_N7
\blocooperador|regSAD|q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \blocooperador|regSoma|q\(7),
	sload => VCC,
	ena => \blococontrole|current_state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSAD|q\(7));

-- Location: LCCOMB_X25_Y13_N16
\blocooperador|regSoma|q[8]~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSoma|q[8]~30_combout\ = (\blocooperador|regSoma|q\(8) & (\blocooperador|regSoma|q[7]~29\ $ (GND))) # (!\blocooperador|regSoma|q\(8) & (!\blocooperador|regSoma|q[7]~29\ & VCC))
-- \blocooperador|regSoma|q[8]~31\ = CARRY((\blocooperador|regSoma|q\(8) & !\blocooperador|regSoma|q[7]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regSoma|q\(8),
	datad => VCC,
	cin => \blocooperador|regSoma|q[7]~29\,
	combout => \blocooperador|regSoma|q[8]~30_combout\,
	cout => \blocooperador|regSoma|q[8]~31\);

-- Location: LCFF_X25_Y13_N17
\blocooperador|regSoma|q[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSoma|q[8]~30_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSoma|q\(8));

-- Location: LCFF_X24_Y13_N1
\blocooperador|regSAD|q[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \blocooperador|regSoma|q\(8),
	sload => VCC,
	ena => \blococontrole|current_state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSAD|q\(8));

-- Location: LCCOMB_X25_Y13_N18
\blocooperador|regSoma|q[9]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSoma|q[9]~32_combout\ = (\blocooperador|regSoma|q\(9) & (!\blocooperador|regSoma|q[8]~31\)) # (!\blocooperador|regSoma|q\(9) & ((\blocooperador|regSoma|q[8]~31\) # (GND)))
-- \blocooperador|regSoma|q[9]~33\ = CARRY((!\blocooperador|regSoma|q[8]~31\) # (!\blocooperador|regSoma|q\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blocooperador|regSoma|q\(9),
	datad => VCC,
	cin => \blocooperador|regSoma|q[8]~31\,
	combout => \blocooperador|regSoma|q[9]~32_combout\,
	cout => \blocooperador|regSoma|q[9]~33\);

-- Location: LCFF_X25_Y13_N19
\blocooperador|regSoma|q[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSoma|q[9]~32_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSoma|q\(9));

-- Location: LCCOMB_X24_Y13_N2
\blocooperador|regSAD|q[9]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSAD|q[9]~feeder_combout\ = \blocooperador|regSoma|q\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \blocooperador|regSoma|q\(9),
	combout => \blocooperador|regSAD|q[9]~feeder_combout\);

-- Location: LCFF_X24_Y13_N3
\blocooperador|regSAD|q[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSAD|q[9]~feeder_combout\,
	ena => \blococontrole|current_state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSAD|q\(9));

-- Location: LCCOMB_X25_Y13_N20
\blocooperador|regSoma|q[10]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSoma|q[10]~34_combout\ = (\blocooperador|regSoma|q\(10) & (\blocooperador|regSoma|q[9]~33\ $ (GND))) # (!\blocooperador|regSoma|q\(10) & (!\blocooperador|regSoma|q[9]~33\ & VCC))
-- \blocooperador|regSoma|q[10]~35\ = CARRY((\blocooperador|regSoma|q\(10) & !\blocooperador|regSoma|q[9]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regSoma|q\(10),
	datad => VCC,
	cin => \blocooperador|regSoma|q[9]~33\,
	combout => \blocooperador|regSoma|q[10]~34_combout\,
	cout => \blocooperador|regSoma|q[10]~35\);

-- Location: LCFF_X25_Y13_N21
\blocooperador|regSoma|q[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSoma|q[10]~34_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSoma|q\(10));

-- Location: LCCOMB_X25_Y13_N28
\blocooperador|regSAD|q[10]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSAD|q[10]~feeder_combout\ = \blocooperador|regSoma|q\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \blocooperador|regSoma|q\(10),
	combout => \blocooperador|regSAD|q[10]~feeder_combout\);

-- Location: LCFF_X25_Y13_N29
\blocooperador|regSAD|q[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSAD|q[10]~feeder_combout\,
	ena => \blococontrole|current_state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSAD|q\(10));

-- Location: LCCOMB_X25_Y13_N22
\blocooperador|regSoma|q[11]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSoma|q[11]~36_combout\ = (\blocooperador|regSoma|q\(11) & (!\blocooperador|regSoma|q[10]~35\)) # (!\blocooperador|regSoma|q\(11) & ((\blocooperador|regSoma|q[10]~35\) # (GND)))
-- \blocooperador|regSoma|q[11]~37\ = CARRY((!\blocooperador|regSoma|q[10]~35\) # (!\blocooperador|regSoma|q\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blocooperador|regSoma|q\(11),
	datad => VCC,
	cin => \blocooperador|regSoma|q[10]~35\,
	combout => \blocooperador|regSoma|q[11]~36_combout\,
	cout => \blocooperador|regSoma|q[11]~37\);

-- Location: LCFF_X25_Y13_N23
\blocooperador|regSoma|q[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSoma|q[11]~36_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSoma|q\(11));

-- Location: LCCOMB_X25_Y13_N30
\blocooperador|regSAD|q[11]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSAD|q[11]~feeder_combout\ = \blocooperador|regSoma|q\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \blocooperador|regSoma|q\(11),
	combout => \blocooperador|regSAD|q[11]~feeder_combout\);

-- Location: LCFF_X25_Y13_N31
\blocooperador|regSAD|q[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSAD|q[11]~feeder_combout\,
	ena => \blococontrole|current_state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSAD|q\(11));

-- Location: LCCOMB_X25_Y13_N24
\blocooperador|regSoma|q[12]~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSoma|q[12]~38_combout\ = (\blocooperador|regSoma|q\(12) & (\blocooperador|regSoma|q[11]~37\ $ (GND))) # (!\blocooperador|regSoma|q\(12) & (!\blocooperador|regSoma|q[11]~37\ & VCC))
-- \blocooperador|regSoma|q[12]~39\ = CARRY((\blocooperador|regSoma|q\(12) & !\blocooperador|regSoma|q[11]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blocooperador|regSoma|q\(12),
	datad => VCC,
	cin => \blocooperador|regSoma|q[11]~37\,
	combout => \blocooperador|regSoma|q[12]~38_combout\,
	cout => \blocooperador|regSoma|q[12]~39\);

-- Location: LCFF_X25_Y13_N25
\blocooperador|regSoma|q[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSoma|q[12]~38_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSoma|q\(12));

-- Location: LCCOMB_X24_Y13_N20
\blocooperador|regSAD|q[12]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSAD|q[12]~feeder_combout\ = \blocooperador|regSoma|q\(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \blocooperador|regSoma|q\(12),
	combout => \blocooperador|regSAD|q[12]~feeder_combout\);

-- Location: LCFF_X24_Y13_N21
\blocooperador|regSAD|q[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSAD|q[12]~feeder_combout\,
	ena => \blococontrole|current_state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSAD|q\(12));

-- Location: LCCOMB_X25_Y13_N26
\blocooperador|regSoma|q[13]~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \blocooperador|regSoma|q[13]~40_combout\ = \blocooperador|regSoma|q[12]~39\ $ (\blocooperador|regSoma|q\(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \blocooperador|regSoma|q\(13),
	cin => \blocooperador|regSoma|q[12]~39\,
	combout => \blocooperador|regSoma|q[13]~40_combout\);

-- Location: LCFF_X25_Y13_N27
\blocooperador|regSoma|q[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \blocooperador|regSoma|q[13]~40_combout\,
	sclr => \blococontrole|current_state.S1~regout\,
	ena => \blococontrole|next_state.S2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSoma|q\(13));

-- Location: LCFF_X24_Y13_N23
\blocooperador|regSAD|q[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \blocooperador|regSoma|q\(13),
	sload => VCC,
	ena => \blococontrole|current_state.S5~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \blocooperador|regSAD|q\(13));

-- Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\read_mem~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blococontrole|current_state.S3~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_read_mem);

-- Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\address[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regEndereco|q\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_address(0));

-- Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\address[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regEndereco|q\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_address(1));

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\address[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regEndereco|q\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_address(2));

-- Location: PIN_F9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\address[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regEndereco|q\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_address(3));

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\address[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regEndereco|q\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_address(4));

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\address[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regEndereco|q\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_address(5));

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regSAD|q\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(0));

-- Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regSAD|q\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(1));

-- Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regSAD|q\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(2));

-- Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regSAD|q\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(3));

-- Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regSAD|q\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(4));

-- Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regSAD|q\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(5));

-- Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regSAD|q\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(6));

-- Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regSAD|q\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(7));

-- Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regSAD|q\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(8));

-- Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regSAD|q\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(9));

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regSAD|q\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(10));

-- Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regSAD|q\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(11));

-- Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regSAD|q\(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(12));

-- Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\sad_value[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blocooperador|regSAD|q\(13),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_sad_value(13));

-- Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\done~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \blococontrole|ALT_INV_current_state.S0~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_done);
END structure;


