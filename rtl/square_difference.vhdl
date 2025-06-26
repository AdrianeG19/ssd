-- filepath: rtl/square_difference.vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity square_difference is
    generic (
        N : positive
    );
    port (
        input_a : in unsigned(N-1 downto 0);
        input_b : in unsigned(N-1 downto 0);
        sq_diff : out unsigned(2*N-1 downto 0)
    );
end entity;

architecture rtl of square_difference is
    signal diff : signed(N downto 0);
begin
    diff <= signed('0' & input_a) - signed('0' & input_b);
    sq_diff <= unsigned(diff * diff);
end architecture;