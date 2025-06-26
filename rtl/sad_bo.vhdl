--------------------------------------------------
--	Author:      Ismael Seidel (entidade)
--	Created:     May 1, 2025
--
--	Project:     Exercício 6 de INE5406
--	Description: Contém a descrição da entidade `sad_bo`, que representa o
--               bloco operativo (BO) do circuito para cálculo da soma das
--               diferenças absolutas (SAD - Sum of Absolute Differences).
--               Este bloco implementa o *datapath* principal do circuito e
--               realiza operações como subtração, valor absoluto e acumulação
--               dos valores calculados. Além disso, também será feito aqui o
--               calculo de endereçamento e do sinal de controle do laço de
--               execução (menor), que deve ser enviado ao bloco de controle (i.e.,
--               menor será um sinal de status gerado no BO).
--               A parametrização é feita por meio do tipo
--               `datapath_configuration_t` definido no pacote `sad_pack`.
--               Os parâmetros incluem:
--               - `bits_per_sample`: número de bits por amostra; (uso obrigatório)
--               - `samples_per_block`: número total de amostras por bloco; (uso 
--                  opcional, útil para definição do número de bits da sad e    
--                  endereço, conforme feito no top-level, i.e., no arquivo sad.vhdl)
--               - `parallel_samples`: número de amostras processadas em paralelo.
--                  (uso opcional)
--               A arquitetura estrutural instanciará os componentes necessários
--               à implementação completa do bloco operativo.
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.sad_pack.all;

-- Bloco Operativo (BO) do circuito SAD.
-- Responsável pelo processamento aritmético dos dados de entrada, incluindo
-- subtração, cálculo de valor absoluto e soma acumulada.
-- Totalmente parametrizável por meio do tipo `datapath_configuration_t`.
entity sad_bo is

	generic(
		CFG : datapath_configuration_t := (
			bits_per_sample   => 8,  -- número de bits por amostra
			samples_per_block => 64, -- número total de amostras por bloco
			parallel_samples  => 1   -- paralelismo no processamento
        )
        
        -- : positive := partial_sad_length (CFG.bits_per_sample, CFG.samples_per_block) -- calcula o número de bits necessário para armazenar a SAD sem ocorrer overflow
	);

	port(
	
		clk : in std_logic;

        -- entradas e saídas SAD
        amostraA : in unsigned (CFG.bits_per_sample - 1 downto 0);
        amostraB : in unsigned (CFG.bits_per_sample - 1 downto 0);
        SAD : out std_logic_vector (partial_sad_length (CFG.bits_per_sample, CFG.samples_per_block) - 1 downto 0);
        
        --entradas e saídas endereço
        address: out std_logic_vector(5 downto 0);

        -- sinais de controle
        cpA : in std_logic;
        cpB : in std_logic;
        zsoma : in std_logic;
        csoma : in std_logic;
        csad_reg : in std_logic;
        
        zi : in std_logic;
        ci : in std_logic;
        menor : out std_logic
        
	);
end entity;
-- Não altere o nome da entidade! Como você quem irá instanciar, neste caso podes
-- mudar o nome da arquitetura, embora isso não seja necessário. 
-- A arquitetura será estrutural, composta por instâncias de componentes auxiliares.

architecture structure OF sad_bo is
    -- signals SAD
    signal saidaRegA, saidaRegB : unsigned(CFG.bits_per_sample - 1 downto 0); -- registradores que armazenam os valores de entrada A e B e a diferença absoluta
    --signal saidaAbs com "CFG.bits_per_sample * 2 + 1" pois é necessario que o array tenha 18 bits para evitar overflow na subtração e no cálculo do quadrado da diferença.
    signal saidaAbs : unsigned(CFG.bits_per_sample * 2 + 1 downto 0); -- registrador que armazena a diferença absoluta, com o dobro de bits para evitar overflow
    signal entradaSomaAcumulativa, saidaRegSoma, sadUnsigned : unsigned(partial_sad_length (CFG.bits_per_sample, CFG.samples_per_block) - 1 downto 0); -- registrador que armazena a soma acumulativa e o valor final da SAD
    signal saidaSoma : unsigned(partial_sad_length (CFG.bits_per_sample, CFG.samples_per_block) downto 0); -- registrador que armazena a soma temporária
    signal saidaMuxSoma, saidaSomareduzida : std_logic_vector (partial_sad_length (CFG.bits_per_sample, CFG.samples_per_block) - 1 downto 0); -- saída do mux que seleciona entre '0' e o valor resultante do somador, e a saída reduzida para o tamanho correto

    -- signals endereço
    signal saidaMuxEnd : std_logic_vector(6 downto 0); -- saída do mux que seleciona entre '0' e o último valor registrado + 1
    signal saidaRegEnd, soma : unsigned(6 downto 0);-- registrador que armazena o endereço atual e o resultado da soma do endereço atual com 1
    signal saidaRegreduzida : unsigned (5 downto 0); -- registrador que armazena o endereço reduzido para 6 bits, pois o endereço máximo é 64 (2^6 = 64)

begin
     --cálculo da SAD
    regA : entity work.unsigned_register(behavior) -- registrador A (registra o valor A)
    generic map (
        N => CFG.bits_per_sample -- 8 
    )
    port map (
        clk => clk,
        enable => cpA,
        d => amostraA,
        q => saidaRegA
    );

    regB: entity work.unsigned_register(behavior) -- registrador B (registra o valor B)
    generic map(
        N => CFG.bits_per_sample 
    )
    port map (
        clk => clk,
        enable => cpB,
        d => amostraB,
        q => saidaRegB
    );

    -- RETIREI O ABS_DIFFERENCE, E COLOQUEI A DIFERENÇA DIRETA, POIS O ABS_DIFFERENCE NÃO É NECESSÁRIO PARA O CÁLCULO DO SSD.
    squareDifference : entity work.square_difference(behavior) 
    generic map (
        N => CFG.bits_per_sample
    )
    port map (
        input_a => saidaRegA,
        input_b => saidaRegB,
        sq_diff => saidaAbs
    );

    entradaSomaAcumulativa <= resize (saidaAbs, partial_sad_length (CFG.bits_per_sample, CFG.samples_per_block)); -- aumenta o vetor pro número de bits necessário pra armazenar toda a SAD sem overflow

    somador : entity work.unsigned_adder(arch) 
    generic map(
        N => partial_sad_length (CFG.bits_per_sample, CFG.samples_per_block) -- 14
    )
    port map (
        input_a => saidaRegSoma,
        input_b => entradaSomaAcumulativa,
        sum => saidaSoma
    );

    saidaSomareduzida <= std_logic_vector(saidaSoma(partial_sad_length (CFG.bits_per_sample, CFG.samples_per_block) - 1 downto 0)); -- diminui a saída e converte seu tipo para ela funcionar para o mux

    mux: entity work.mux_2to1(behavior) -- seleciona entre '0' e o valor resultante do somador
    generic map (
        N => partial_sad_length (CFG.bits_per_sample, CFG.samples_per_block) -- 14
    )
    port map (
        sel => zsoma,
        in_0 => saidaSomareduzida,
        in_1 => (others => '0'), -- preenche o número de bits necessário com 0s
        y => saidaMuxSoma
    );

    regSoma : entity work.unsigned_register(behavior)  -- registra o novo valor da soma
    generic map (
        N => partial_sad_length (CFG.bits_per_sample, CFG.samples_per_block) -- 14
    )
    port map (
        clk => clk,
        enable => csoma,
        d => unsigned(saidaMuxSoma),
        q => saidaRegSoma -- deve ser o mesmo signal da entrada do somador
    );

    regSAD : entity work.unsigned_register(behavior) -- registra o valor final da SAD
    generic map (
        N => partial_sad_length (CFG.bits_per_sample, CFG.samples_per_block) -- 14
    )
    port map (
        clk => clk,
        enable => csad_reg,
        d => saidaRegSoma,
        q => sadUnsigned
    );
    
    SAD <= std_logic_vector(sadUnsigned); -- a saída do registrador é unsigned, então o valor precisa ser convertido para SAD poder recebê-lo
    
    
    
    -- cálculo do endereço

    muxEndereco : entity work.mux_2to1(behavior) -- seleciona entre '0' e o último valor registrado + 1 
    generic map (
        N => 7
    )
    port map(
        sel => zi,
        in_0 => std_logic_vector(soma), -- precisa converter porque as entradas e saídas do mux são do tipo std_logic_vector
        in_1 => (others => '0'), -- gera um vetor de N 0s
        y => saidaMuxEnd
    );

    regEndereco : entity work.unsigned_register(behavior)
    generic map (
        N => 7
    )
    port map (
        clk => clk,
        enable => ci,
        d => unsigned(saidaMuxEnd), -- precisa converter porque registrador tem entradas e saídas unsigned
        q => saidaRegEnd
    );


    menor <= not std_logic(saidaRegEnd(6)); -- verifica se o bit mais significativo do endereço é 0 ou 1, indicando se o endereço atual é menor que o máximo (64)

    saidaRegreduzida <= saidaRegEnd(5 downto 0);  -- reduz o endereço para 6 bits, pois o endereço máximo é 64 (2^6 = 64)
    
    address <= std_logic_vector(saidaRegreduzida); -- converte o endereço reduzido para std_logic_vector, pois a saída do BO é std_logic_vector

    somadorEnd : entity work.unsigned_adder(arch) -- soma o endereço atual com 1, para o próximo endereço
    generic map (
        N => 6
    )

    port map ( -- soma o endereço atual com 1
        input_a => saidaRegreduzida,
        input_b => "000001",
        sum => soma
    );
    
end architecture structure;