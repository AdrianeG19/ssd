library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ssd_pack.all;

-- Bloco Operativo (BO) do circuito SSD.
-- Responsável pelo processamento aritmético dos dados de entrada, incluindo
-- subtração, cálculo do quadrado da diferença e soma acumulada.
-- Totalmente parametrizável por meio do tipo `datapath_configuration_t`.
entity ssd_bo is

    generic(
        CFG : datapath_configuration_t := (
            bits_per_sample   => 8,  -- número de bits por amostra
            samples_per_block => 64, -- número total de amostras por bloco
            parallel_samples  => 1   -- paralelismo no processamento
        )
    );

    port(
        clk : in std_logic;

        -- Entradas das amostras a serem comparadas
        amostraA : in unsigned (CFG.bits_per_sample - 1 downto 0);
        amostraB : in unsigned (CFG.bits_per_sample - 1 downto 0);

        -- Saída do valor final do SSD
        ssd : out std_logic_vector (ssd_length (CFG.bits_per_sample, CFG.samples_per_block) - 1 downto 0);
        
        -- Saída do endereço atual de processamento
        address: out std_logic_vector(address_length(CFG.samples_per_block, CFG.parallel_samples) - 1 downto 0); -- Para qualquer quantidade de amostras

        -- Saída do valor parcial do SSD   
        ssd_partial: out std_logic_vector(2 * CFG.bits_per_sample + 1 downto 0);

        -- Sinais de controle dos registradores e muxes
        cpA : in std_logic;      -- Habilita registro da amostra A
        cpB : in std_logic;      -- Habilita registro da amostra B
        zsoma : in std_logic;    -- Seleciona entre soma acumulada e reset do acumulador
        csoma : in std_logic;    -- Habilita registro da soma acumulada
        cssd_reg : in std_logic; -- Habilita registro do valor final do SSD
        
        zi : in std_logic;       -- Seleciona entre incremento de endereço e reset
        ci : in std_logic;       -- Habilita registro do endereço
        menor : out std_logic    -- Indica se o endereço ainda está dentro do bloco
    );
end entity;

architecture structure OF ssd_bo is
    -- Registradores para armazenar as amostras de entrada
    signal saidaRegA, saidaRegB : unsigned(CFG.bits_per_sample - 1 downto 0);

    -- Registrador para armazenar o quadrado da diferença entre as amostras
    -- O tamanho é dobrado para evitar overflow no cálculo do quadrado
    signal saidaSqDif : unsigned(CFG.bits_per_sample * 2 + 1 downto 0);

    -- Registradores para soma acumulada e valor final do SSD
    signal entradaSomaAcumulativa, saidaRegSoma, ssdUnsigned : unsigned(partial_ssd_length (CFG.bits_per_sample, CFG.samples_per_block) - 1 downto 0);

    -- Registrador para soma temporária (pode ser maior para evitar overflow)
    signal saidaSoma : unsigned(partial_ssd_length (CFG.bits_per_sample, CFG.samples_per_block) downto 0);

    -- Sinais para saída do mux e redução do tamanho da soma para o acumulador
    signal saidaMuxSoma, saidaSomareduzida : std_logic_vector (partial_ssd_length (CFG.bits_per_sample, CFG.samples_per_block) - 1 downto 0);

    -- Sinais para controle de endereço
    -- mudar para paralelismo?
    signal saidaMuxEnd : std_logic_vector(address_length(CFG.samples_per_block, CFG.parallel_samples) downto 0); -- Saída do mux de endereço (+1 bit pra carry)
    signal saidaRegEnd, soma : unsigned(address_length(CFG.samples_per_block, CFG.parallel_samples) downto 0);   -- Registrador de endereço e incremento (+1 bit pra carry)
    signal saidaRegreduzida : unsigned (address_length(CFG.samples_per_block, CFG.parallel_samples) - 1 downto 0);   -- Endereço reduzido

    signal saidaParcial : unsigned(partial_ssd_length(CFG.bits_per_sample, CFG.parallel_samples) - 1 downto 0);

begin
    -- Registro das amostras de entrada A e B
    regA : entity work.unsigned_register(behavior)
    generic map (
        N => CFG.bits_per_sample
    )
    port map (
        clk => clk,
        enable => cpA,
        d => amostraA,
        q => saidaRegA
    );

    regB: entity work.unsigned_register(behavior)
    generic map(
        N => CFG.bits_per_sample 
    )
    port map (
        clk => clk,
        enable => cpB,
        d => amostraB,
        q => saidaRegB
    );

    -- Cálculo do quadrado da diferença entre as amostras registradas
    -- O componente square_difference calcula (A - B)^2
    squareDifference : entity work.square_difference(behavior) 
    generic map (
        N => CFG.bits_per_sample
    )
    port map (
        input_a => saidaRegA,
        input_b => saidaRegB,
        sq_diff => saidaSqDif
    );
    
    ssd_partial <= std_logic_vector(saidaSqDif);
    -- Ajusta o tamanho do quadrado da diferença para o acumulador, evitando overflow
    entradaSomaAcumulativa <= resize (saidaSqDif, partial_ssd_length (CFG.bits_per_sample, CFG.samples_per_block));

    -- Soma acumulada do SSD: soma o valor anterior com o novo quadrado da diferença
    somador : entity work.unsigned_adder(arch) 
    generic map(
        N => partial_ssd_length (CFG.bits_per_sample, CFG.samples_per_block)
    )
    port map (
        input_a => saidaRegSoma,
        input_b => entradaSomaAcumulativa,
        sum => saidaSoma
    );

    -- Reduz a saída do somador para o tamanho correto e converte para std_logic_vector para o mux
    saidaSomareduzida <= std_logic_vector(saidaSoma(partial_ssd_length (CFG.bits_per_sample, CFG.samples_per_block) - 1 downto 0));

    -- Mux para selecionar entre resetar o acumulador ou continuar acumulando
    mux: entity work.mux_2to1(behavior)
    generic map (
        N => partial_ssd_length (CFG.bits_per_sample, CFG.samples_per_block)
    )
    port map (
        sel => zsoma,
        in_0 => saidaSomareduzida,
        in_1 => (others => '0'),
        y => saidaMuxSoma
    );

    -- Registrador para armazenar a soma acumulada do SSD
    regSoma : entity work.unsigned_register(behavior)
    generic map (
        N => partial_ssd_length (CFG.bits_per_sample, CFG.samples_per_block)
    )
    port map (
        clk => clk,
        enable => csoma,
        d => unsigned(saidaMuxSoma),
        q => saidaRegSoma
    );

    -- Registrador para armazenar o valor final do SSD
    regssd : entity work.unsigned_register(behavior)
    generic map (
        N => partial_ssd_length (CFG.bits_per_sample, CFG.samples_per_block)
    )
    port map (
        clk => clk,
        enable => cssd_reg,
        d => saidaRegSoma,
        q => ssdUnsigned
    );
    
    -- Conversão do valor final do SSD para std_logic_vector para saída
    ssd <= std_logic_vector(ssdUnsigned);

    -- Controle de endereço: Mux para selecionar entre incremento ou reset do endereço
    muxEndereco : entity work.mux_2to1(behavior)
    generic map (
        N => address_length(CFG.samples_per_block, CFG.parallel_samples) + 1
    )
    port map(
        sel => zi,
        in_0 => std_logic_vector(soma),
        in_1 => (others => '0'),
        y => saidaMuxEnd
    );

    -- Registrador para armazenar o endereço atual
    regEndereco : entity work.unsigned_register(behavior)
    generic map (
        N => address_length(CFG.samples_per_block, CFG.parallel_samples) + 1
    )
    port map (
        clk => clk,
        enable => ci,
        d => unsigned(saidaMuxEnd),
        q => saidaRegEnd
    );

    -- Sinal de controle do laço: indica se o endereço ainda está dentro do bloco
    menor <= not std_logic(saidaRegEnd(address_length(CFG.samples_per_block, CFG.parallel_samples)));

    -- Reduz o endereço para o tamanho correto
    saidaRegreduzida <= saidaRegEnd(address_length(CFG.samples_per_block, CFG.parallel_samples) - 1 downto 0);
    address <= std_logic_vector(saidaRegreduzida);

    -- Soma o endereço atual com 1 para obter o próximo endereço
    somadorEnd : entity work.unsigned_adder(arch)
    generic map (
        N => address_length(CFG.samples_per_block, CFG.parallel_samples)
    )
    port map (
        input_a => saidaRegreduzida,
        input_b => to_unsigned(1, address_length(CFG.samples_per_block, CFG.parallel_samples)),
        sum => soma
    );
    
end architecture structure;