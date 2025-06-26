--------------------------------------------------
--	Author:      Ismael Seidel (entity)
--	Created:     May 1, 2025
--
--	Project:     ExercÃ­cio 6 de INE5406
--	Description: Este pacote contÃ©m definiÃ§Ãµes de tipos e funÃ§Ãµes auxiliares que
--               podem ser utilizadas no circuito para cÃ¡lculo da soma das diferenÃ§as
--               absolutas (SAD - Sum of Absolute Differences). 
--               AtenÃ§Ã£o: VocÃª pode incluir novos tipos e funÃ§Ãµes neste arquivo.
--                        PorÃ©m, nÃ£o altere os tipos e funÃ§Ãµes jÃ¡ existentes, pois
--                        alguns testes podem ser utilizados na avaliaÃ§Ã£o (tesbenches).
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package sad_pack is
    -- DeclaraÃ§Ã£o do tipo parallel_samples_vector. 
    -- Note que Ã© um array que nÃ£o tem tamanho especificado de unsigned, que por sua vez tambÃ©m
    -- Ã© um array sem tamanho especificado. Assim, na declaraÃ§Ã£o de um parallel_samples_vector Ã©
    -- necessÃ¡rio especificar duas dimensÃµes, uma para o nÃºmero de elementos unsigned em paralelo 
    -- e outra para o nÃºmero de elementos em unsigned. Por exemplo:
    -- signal oito_de_dez_bits_em_paralelo : parallel_samples_vector(0 to 7)(9 downto 0);
    type parallel_samples_vector_t is array (natural range <>) of unsigned;

    -- FunÃ§Ã£o para conversÃ£o de std_logic_vector para parallel_samples_vector.
    -- Essa funÃ§Ã£o auxiliar divide um std_logic_vector de comprimento PxN em P amostras de N 
    -- bits. Cada amostra Ã© representada como um unsigned (veja a definiÃ§Ã£o do tipo 
    -- parallel_samples_vector).
    function to_parallel_samples_vector(param : std_logic_vector; N : positive; P : positive) return parallel_samples_vector_t;

    -- FunÃ§Ã£o para conversÃ£o de parallel_samples_vector para std_logic_vector.
    -- Essa funÃ§Ã£o realiza a operaÃ§Ã£o inversa da funÃ§Ã£o anterior. A partir de um vetor de P
    -- amostras (cada uma com N bits), obtÃ©m um vetor de 1 dimensÃ£o concatenado contendo todas
    -- as amostras de forma sequencial.
    function to_std_logic_vector(param : parallel_samples_vector_t; N : positive; P : positive)
    return std_logic_vector;

    -- Tipo que armazena parÃ¢metros de configuraÃ§Ã£o do datapath.
    -- bits_per_sample: nÃºmero de bits por amostra.
    -- samples_per_block: total de amostras por bloco a serem processadas.
    -- parallel_samples: grau de paralelismo (quantas amostras sÃ£o processadas simultaneamente).
    type datapath_configuration_t is record
        bits_per_sample   : positive;
        samples_per_block : positive;
        parallel_samples  : positive;
    end record;

    -- Calcula o nÃºmero de bits necessÃ¡rios para representar a soma de um nÃºmero arbitrÃ¡rio
    -- de valores (number_of_values), cada um com um determinado nÃºmero de bits (bits_per_value).
    -- O resultado Ã©: bits_per_value + ceil(log2(number_of_values))
    function sum_of_values_length(bits_per_value : positive; number_of_values : positive)
    return positive;

    -- Calcula a largura total (nÃºmero de bits) necessÃ¡ria para armazenar o resultado da SAD
    -- completa, ou seja, a soma de todas as diferenÃ§as absolutas das amostras de um par de blocos.
    function sad_length(bits_per_sample : positive; samples_per_block : positive)
    return positive;

    -- Calcula a largura necessÃ¡ria para armazenar uma SAD parcial, considerando apenas as
    -- diferenÃ§as de um subconjunto de amostras processadas em paralelo.
    function partial_sad_length(bits_per_sample : positive; parallel_samples : positive)
    return positive;

    -- Calcula o nÃºmero de bits necessÃ¡rios para indexar todos os grupos parciais de amostras
    -- dentro de um bloco completo. O nÃºmero de grupos Ã© (samples_per_block / parallel_samples),
    -- e o resultado Ã© o menor inteiro maior ou igual a log2 desse valor.
    function address_length(samples_per_block : positive; parallel_samples : positive)
    return positive;

end package sad_pack;

package body sad_pack is

    -- ImplementaÃ§Ã£o da funÃ§Ã£o que converte um std_logic_vector para um vetor de amostras sem sinal.
    -- Entrada:
    --   param : vetor de P*N bits.
    --   N     : nÃºmero de bits por amostra.
    --   P     : nÃºmero de amostras.
    -- SaÃ­da:
    --   Vetor com P elementos do tipo unsigned(N-1 downto 0), extraÃ­dos sequencialmente.
    function to_parallel_samples_vector(param : std_logic_vector; N : positive; P : positive)
    return parallel_samples_vector_t is
        variable return_vector : parallel_samples_vector_t(0 to P - 1)(N - 1 downto 0);
    begin
        for i in return_vector'range loop
            -- Cada amostra Ã© extraÃ­da como uma fatia de N bits do std_logic_vector de entrada (param).
            return_vector(i) := unsigned(param(N * (i + 1) - 1 downto N * i));
        end loop;
        return return_vector;
    end function to_parallel_samples_vector;

    -- ImplementaÃ§Ã£o da funÃ§Ã£o que concatena um vetor de amostras em um Ãºnico std_logic_vector.
    -- Entrada:
    --   param : vetor de P amostras, cada uma com N bits.
    --   N     : nÃºmero de bits por amostra.
    --   P     : nÃºmero de amostras.
    -- SaÃ­da:
    --   std_logic_vector de P*N bits, resultado da concatenaÃ§Ã£o de todas as amostras.
    function to_std_logic_vector(param : parallel_samples_vector_t; N : positive; P : positive)
    return std_logic_vector is
        variable return_vector : std_logic_vector(N * P - 1 downto 0);
    begin
        for i in 0 to P - 1 loop
            return_vector(N * (i + 1) - 1 downto N * i) := std_logic_vector(param(i));
        end loop;
        return return_vector;
    end function to_std_logic_vector;

    -- FunÃ§Ã£o que calcula o nÃºmero de bits necessÃ¡rios para representar a soma de N (number_of_values) valores
    -- de 'bits_per_value' bits sem sinal. 
    function sum_of_values_length(bits_per_value : positive; number_of_values : positive)
    return positive is
    begin
        return integer(ceil(log2(real(number_of_values)))) + bits_per_value;
    end function sum_of_values_length;

    -- FunÃ§Ã£o que retorna a largura total da saÃ­da da SAD completa.
    -- Internamente usa a funÃ§Ã£o sum_of_values_length passando o nÃºmero total de amostras.
    function sad_length(bits_per_sample : positive; samples_per_block : positive)
    return positive is
    begin
        return sum_of_values_length(bits_per_value => bits_per_sample, number_of_values => samples_per_block);
    end function sad_length;

    -- FunÃ§Ã£o semelhante Ã  anterior, mas para SAD parciais (paralelismo).
    function partial_sad_length(bits_per_sample : positive; parallel_samples : positive)
    return positive is
    begin
        return sum_of_values_length(bits_per_value => bits_per_sample, number_of_values => parallel_samples);
    end function partial_sad_length;

    -- FunÃ§Ã£o que determina a largura do endereÃ§o (em bits) necessÃ¡rio para indexar os
    -- vetores parciais de P amostras. Calcula log2(samples_per_block / parallel_samples), com arredondamento.
    function address_length(samples_per_block : positive; parallel_samples : positive)
    return positive is
    begin
        return integer(ceil(log2(real(samples_per_block) / real(parallel_samples))));
    end function address_length;

end package body sad_pack;
