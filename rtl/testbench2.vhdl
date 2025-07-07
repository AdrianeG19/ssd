library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.ssd_pack.all; 

entity testbench2 is
end entity testbench2;

architecture behavioral of testbench2 is
    -- Configurações do DUT (Device Under Test)
    constant bits_per_sample   : positive := 8;  -- 8 bits por amostra
    constant samples_per_block : positive := 64; -- 64 amostras por bloco
    constant parallel_samples  : positive := 1;  -- 1 amostra por ciclo

    -- Sinais para o DUT
    signal clk        : std_logic := '0';
    signal rst_a      : std_logic := '0';
    signal enable     : std_logic := '0';
    signal sample_ori : std_logic_vector(bits_per_sample * parallel_samples - 1 downto 0) := (others => '0');
    signal sample_can : std_logic_vector(bits_per_sample * parallel_samples - 1 downto 0) := (others => '0');
    signal read_mem   : std_logic;
    signal address    : std_logic_vector(address_length(samples_per_block, parallel_samples) - 1 downto 0); -- log2(64) = 6 bits
    signal ssd_value  : std_logic_vector(ssd_length(bits_per_sample, samples_per_block) - 1 downto 0); -- 8 bits * 64 = 16 bits suficientes
    signal ssd_partial: std_logic_vector(2 * bits_per_sample + 1 downto 0); -- valor parcial do DUT
    signal done       : std_logic;

    -- Arquivo de entrada (.dat)
    constant filename : string := "estimulos8bits.dat";
begin
    -- Instância do DUT (seu design da SSD)
    dut: entity work.ssd
        generic map (
            bits_per_sample   => bits_per_sample,
            samples_per_block => samples_per_block,
            parallel_samples  => parallel_samples
        )
        port map (
            clk        => clk,
            rst_a      => rst_a,
            enable     => enable,
            sample_ori => sample_ori,
            sample_can => sample_can,
            read_mem   => read_mem,
            address    => address,
            ssd_value  => ssd_value,
            ssd_partial=> ssd_partial, -- NOVA PORTA
            done       => done
        );

    -- Clock (50 MHz)
    clk <= not clk after 10 ns;

    -- Processo principal de teste
    process
        file input_file     : text open read_mode is filename;
        variable file_line  : line;
        variable val_ori    : integer;
        variable val_can    : integer;
        variable exp_ssd    : integer;
        variable errors     : natural := 0;
        variable parcial_esperado : integer := 0;
    begin
        -- Reset inicial
        rst_a <= '1';
        wait for 20 ns;
        rst_a <= '0';
        wait until falling_edge(clk);

        -- Habilita o DUT
        enable <= '1';
        wait until falling_edge(clk);

        -- Lê exatamente samples_per_block pares de amostras
        for i in 1 to samples_per_block loop
            readline(input_file, file_line);
            read(file_line, val_ori);
            read(file_line, val_can);

            sample_ori <= std_logic_vector(to_unsigned(val_ori, bits_per_sample));
            sample_can <= std_logic_vector(to_unsigned(val_can, bits_per_sample));

            -- Calcula o valor parcial esperado
            parcial_esperado := parcial_esperado + (val_ori - val_can) * (val_ori - val_can);

            -- Espera a leitura da memória (se necessário)
            if read_mem = '1' then
                wait until falling_edge(read_mem);
            end if;
            wait until falling_edge(clk);

            -- Mostra o valor parcial esperado e o obtido a cada ciclo
            report "Ciclo " & integer'image(i) &
                   " | Parcial esperado: " & integer'image(parcial_esperado) &
                   " | Parcial obtido: " & integer'image(to_integer(unsigned(ssd_partial)))
                   severity note;
        end loop;

        -- Espera o cálculo finalizar
        wait until done = '1';
        wait until falling_edge(clk);

        -- Lê o resultado esperado do arquivo (última linha)
        readline(input_file, file_line);
        read(file_line, exp_ssd);

        -- Verifica o resultado
        if to_integer(unsigned(ssd_value)) /= exp_ssd then
            report "ERRO: SSD esperada = " & integer'image(exp_ssd) & 
                   ", SSD obtida = " & integer'image(to_integer(unsigned(ssd_value)))
                   severity error;
            errors := errors + 1;
        else
            report "SUCESSO: SSD = " & integer'image(to_integer(unsigned(ssd_value)))
                   severity note;
        end if;

        -- Finalização
        enable <= '0';
        if errors = 0 then
            report "Teste concluído sem erros!" severity note;
        else
            report "Teste concluído com " & integer'image(errors) & " erro(s)." severity error;
        end if;
        wait;
    end process;
end architecture behavioral;