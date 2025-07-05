library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ssd_pack.all;
use std.textio.all;

entity testbench2 is
end entity testbench2;

architecture behavioral of testbench2 is
    -- Configurações do SSD
    constant bits_per_sample   : positive := 20;
    constant samples_per_block : positive := 64;
    constant parallel_samples  : positive := 1;
    constant clk_period       : time := 10 ns;
    
    -- Nome do arquivo .dat com os vetores de teste
    constant banana : string := "estimulos8bits.dat";
    
    -- Sinais da UUT
    signal clk        : std_logic := '0';
    signal rst_a      : std_logic := '0';
    signal enable     : std_logic := '0';
    signal sample_ori : std_logic_vector(bits_per_sample * parallel_samples -1 downto 0) := (others => '0');
    signal sample_can : std_logic_vector(bits_per_sample * parallel_samples -1 downto 0) := (others => '0');
    signal read_mem   : std_logic;
    signal address    : std_logic_vector(address_length(samples_per_block, parallel_samples) - 1 downto 0);
    signal ssd_value  : std_logic_vector(ssd_length(bits_per_sample, samples_per_block) - 1 downto 0);
    signal done       : std_logic;
    
    -- Controle de simulação
    signal sim_end : boolean := false;
    signal error_count : natural := 0;
    
begin
    -- Instância do SSD
    uut: entity work.ssd(structure)
    generic map(
        bits_per_sample => bits_per_sample,
        samples_per_block => samples_per_block,
        parallel_samples => parallel_samples
    )
    port map(
        clk => clk,
        rst_a => rst_a,
        enable => enable,
        sample_ori => sample_ori,
        sample_can => sample_can,
        read_mem => read_mem,
        address => address,
        ssd_value => ssd_value,
        done => done
    );
    
    -- Geração de clock
    clk_process: process
    begin
        while not sim_end loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
        wait;
    end process;
    
    -- Processo principal de teste
    main_test: process
        file test_file : text;
        variable file_line : line;
        variable str_ori_amostra, str_can_amostra : string(1 to bits_per_sample*parallel_samples);
        variable str_ssd_esperado : string(1 to ssd_value'length);
        variable sample_ori_bin, sample_can_bin : std_logic_vector(bits_per_sample*parallel_samples-1 downto 0);
        variable expected_ssd_bin : std_logic_vector(ssd_value'range);
        variable samples_processed : natural := 0;
    begin
        -- Inicialização
        wait for clk_period;
        rst_a <= '1';
        wait for clk_period;
        rst_a <= '0';
        wait for clk_period;

        file_open(test_file, banana, read_mode);
        report "Iniciando testes com arquivo: " & banana;

        enable <= '1';

        while not endfile(test_file) loop
            -- Para cada bloco de amostras
            for i in 1 to samples_per_block loop
                exit when endfile(test_file); -- Protege contra fim inesperado
                readline(test_file, file_line);
                read(file_line, str_ori_amostra);
                read(file_line, str_can_amostra);

                -- Converte string para std_logic_vector
                for j in 1 to bits_per_sample*parallel_samples loop
                    sample_ori_bin(j-1) := str_ori_amostra(j);
                    sample_can_bin(j-1) := str_can_amostra(j);
                end loop;

                -- Envia para o SSD
                wait until rising_edge(clk) and read_mem = '1';
                sample_ori <= sample_ori_bin;
                sample_can <= sample_can_bin;
            end loop;

            -- Agora lê o valor esperado da SSD
            exit when endfile(test_file); -- Protege contra fim inesperado
            readline(test_file, file_line);
            read(file_line, str_ssd_esperado);

            for j in 1 to ssd_value'length loop
                expected_ssd_bin(j-1) := str_ssd_esperado(j);
            end loop;

            -- Aguarda cálculo ser completado
            wait until rising_edge(done);
            wait for clk_period/4;

            -- Verifica o resultado
            if ssd_value /= expected_ssd_bin then
                error_count <= error_count + 1;
                report "Erro no bloco. Esperado: " & to_string(expected_ssd_bin) &
                       ", Obtido: " & to_string(ssd_value)
                severity error;
            end if;
        end loop;

        file_close(test_file);
        enable <= '0';
        report "Testes concluídos. Total de erros: " & integer'image(error_count);
        sim_end <= true;
        wait;
    end process;
end architecture behavioral;