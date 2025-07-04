library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use IEEE.std_logic_textio.all;

entity testbench is
end testbench;

architecture tb of testbench is

signal clk : std_logic := '0';
signal enable : std_logic := '1';
signal rst_a : std_logic := '0';

signal sample_ori, sample_can: std_logic_vector(15 downto 0); -- 16 bits, ajuste conforme seu .dat
signal ssd_value: std_logic_vector(19 downto 0);
signal read_mem, done: std_logic;
signal address: std_logic_vector(5 downto 0);
signal finished: std_logic := '0';

constant period : time := 10 ns;

begin

DUV: entity work.ssd
port map(clk, enable, rst_a, sample_ori, sample_can, read_mem, address, ssd_value, done);

clk <= not clk after period/2 when finished /= '1' else '0';
enable <= '0' after period;

stim_proc: process
    file stim_file : text open read_mode is "estimulos8bits.dat";
    variable line_in : line;
    variable str_ori, str_can : string(1 to 16);
    variable vec_ori, vec_can : std_logic_vector(15 downto 0);
    variable i : integer := 0;
begin
    wait for period;
    while not endfile(stim_file) loop
        readline(stim_file, line_in);
        -- Lê os dois campos da linha
        read(line_in, str_ori);
        read(line_in, str_can);
        -- Converte string para std_logic_vector
        hread(str_ori, vec_ori);
        hread(str_can, vec_can);
        -- Aplica estímulos
        sample_ori <= vec_ori;
        sample_can <= vec_can;
        wait for period;
        i := i + 1;
    end loop;
    finished <= '1';
    wait;
end process;

end tb;