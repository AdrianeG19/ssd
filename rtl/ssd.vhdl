library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ssd_pack.all;

entity ssd is
    generic(
        -- obrigatório ---
        -- defina as operações considerando o número de bits por amostra
        bits_per_sample   : positive := 8; -- número de bits por amostra
        -----------------------------------------------------------------------
        -- desejado (i.e., não obrigatório) ---
        -- se você desejar, pode usar os valores abaixo para descrever uma
        -- entidade que funcione tanto para a SSD v1 quanto para a SSD v3.
        samples_per_block : positive := 64; -- número de amostras por bloco
        parallel_samples  : positive := 1 -- número de amostras de cada bloco lidas em paralelo
        -----------------------------------------------------------------------
    );
    port(
        -- Não modifiquem os nomes das portas e nem mesmo a largura de bits.
        -- Procurem entender as funções address_length e ssd_length que são usadas
        -- para a definição do número de bits de endereço (address) e do resultado
        -- final da SSD (ssd_value).
        clk        : in  std_logic;     -- clock
        rst_a      : in  std_logic;     -- reset assíncrono
        enable     : in  std_logic;     -- sinal para iniciar processamento
        sample_ori : in  std_logic_vector(bits_per_sample * parallel_samples - 1 downto 0); -- Mem_A[end]
        sample_can : in  std_logic_vector(bits_per_sample * parallel_samples - 1 downto 0); -- Mem_B[end]
        read_mem   : out std_logic;     -- habilita leitura das memórias externas
        address    : out std_logic_vector(address_length(
            samples_per_block => samples_per_block,
            parallel_samples  => parallel_samples
        ) - 1 downto 0);                -- endereço de leitura das memórias
        ssd_value  : out std_logic_vector(ssd_length(
            bits_per_sample   => bits_per_sample,
            samples_per_block => samples_per_block
        ) - 1 downto 0);                -- resultado final da SSD
        done       : out std_logic      -- indica término do processamento
    );
end entity ssd;

-- Não alterar o nome da arquitetura!
architecture structure of ssd is
    -- Sinais internos para as amostras convertidas para unsigned
    signal amostraA, amostraB : unsigned(bits_per_sample - 1 downto 0);

    -- Sinais de controle entre o bloco de controle (BC) e o bloco operativo (BO)
    signal menor, pronto, read, zi, ci, zsoma, csoma, cpA, cpB, cssd_reg : std_logic;
    
begin
    -- Conversão das entradas de std_logic_vector para unsigned para uso no BO
    amostraA <= unsigned(sample_ori);
    amostraB <= unsigned(sample_can);

    -- Instanciação do Bloco Operativo (BO)
    -- Responsável pelo processamento aritmético: cálculo do quadrado da diferença,
    -- soma acumulada (SSD), controle de endereço e sinalização de status.
    blocooperador : entity work.ssd_bo(structure)
    generic map (
        CFG => (
            bits_per_sample => bits_per_sample,
            samples_per_block => samples_per_block,
            parallel_samples => parallel_samples
        )
    )
    port map (
        clk => clk,
        zi => zi,
        ci => ci,
        zsoma => zsoma,
        csoma => csoma,
        cpA => cpA,
        cpB => cpB,
        cssd_reg => cssd_reg,
        amostraA => amostraA,
        amostraB => amostraB,
        ssd => ssd_value, -- resultado final da SSD
        address => address,
        menor => menor
    );
    
    -- Instanciação do Bloco de Controle (BC)
    -- Responsável pela geração dos sinais de controle para o BO, implementando
    -- a máquina de estados finitos (FSM) que coordena o fluxo do processamento SSD.
    blococontrole : entity work.ssd_bc(behavior)
    port map (
        clk => clk,
        rst_a => rst_a, 
        iniciar => enable, 
        menor => menor, 
        pronto => done,  -- sinaliza término do processamento
        read => read_mem,
        zi => zi,
        ci => ci,
        zsoma => zsoma,
        csoma => csoma,
        cpA => cpA,
        cpB => cpB,
        cssd_reg => cssd_reg
    );

end architecture structure;