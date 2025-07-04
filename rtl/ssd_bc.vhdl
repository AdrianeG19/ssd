library ieee;
use ieee.std_logic_1164.all;

-- Bloco de Controle (BC) do circuito SSD.
-- Responsável por gerar os sinais de controle para o bloco operativo (BO),
-- geralmente por meio de uma FSM.
entity ssd_bc is
    port(
        clk   : in std_logic;  -- clock (sinal de relógio)
        rst_a : in std_logic;   -- reset assíncrono ativo em nível alto
        iniciar : in std_logic; -- sinal para iniciar o processamento do bloco SSD
        menor : in std_logic;   -- sinal de status do BO indicando se ainda há amostras a processar
        
        pronto : out std_logic;    -- indica que o processamento do bloco SSD terminou
        read : out std_logic;      -- habilita leitura de novas amostras
        zi : out std_logic;        -- controle do mux de endereço (reset/incremento)
        ci : out std_logic;        -- controle do registrador de endereço
        zsoma : out std_logic;     -- controle do mux do acumulador SSD (reset/acumula)
        csoma : out std_logic;     -- controle do registrador do acumulador SSD
        cpA : out std_logic;       -- controle do registrador da amostra A
        cpB : out std_logic;       -- controle do registrador da amostra B
        cssd_reg : out std_logic   -- controle do registrador do valor final do SSD
    );
end entity;
-- Não altere o nome da entidade nem da arquitetura!

architecture behavior of ssd_bc is
    -- Definição dos estados da FSM para controle do processamento SSD
    type Estado is (S0, S1, S2, S3, S4, S5);
    signal current_state, next_state : Estado;
begin

    -- Processo de carga e reset do registrador de estado (registrador de estado)
    -- Responsável por atualizar o estado atual da FSM a cada ciclo de clock ou reset
    Parte1 : process (clk, rst_a) 
    begin
        if rst_a = '1' then 
            current_state <= S0;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;
    
    
    -- Lógica de próximo estado (LPE)
    -- Determina o próximo estado da FSM com base no estado atual e nas entradas
    Parte2 : process(current_state, iniciar, menor)
    begin
        case current_state is
            when S0 => -- Estado de espera: aguarda sinal de início
                if iniciar = '0' then 
                    next_state <= S0;
                else
                    next_state <= S1;
                end if;
                
            when S1 => -- Estado de inicialização: prepara registradores e acumuladores
                next_state <= S2;

            when S2 => -- Estado de verificação: verifica se ainda há amostras para processar
                if menor = '1' then -- Se ainda há amostras, processa próxima diferença quadrática
                    next_state <= S3; 
                else -- Caso contrário, vai para finalização
                    next_state <= S5;
                end if;
                
            when S3 => -- Estado de leitura: habilita leitura das próximas amostras
                next_state <= S4;

            when S4 => -- Estado de acumulação: acumula o quadrado da diferença no SSD
                next_state <= S2;

            when S5 => -- Estado de finalização: armazena o valor final do SSD e retorna ao início
                next_state <= S0;

        end case;
    end process;
    
    -- Lógica de saída (LS)
    -- Define os sinais de controle para cada estado da FSM
    Parte3 : process (current_state)
    begin
        case current_state is
            when S0 => -- Estado inicial, tudo zerado, pronto para novo processamento
                pronto <= '1';
                read <= '0'; 
                zi <= '0';
                ci <= '0';
                zsoma <= '0';
                csoma <= '0';
                cpA <= '0';
                cpB <= '0';
                cssd_reg <= '0'; 
       
            when S1 => -- Estado de inicialização: reseta acumulador e endereço
                pronto <= '0';
                read <= '0'; 
                zi <= '1';      -- reset endereço
                ci <= '1';      -- carrega endereço resetado
                zsoma <= '1';   -- reset acumulador SSD
                csoma <= '1';   -- carrega acumulador resetado
                cpA <= '0';
                cpB <= '0';
                cssd_reg <= '0'; 
        
            when S2 => -- Estado de verificação: aguarda decisão para processar ou finalizar
                pronto <= '0';
                read <= '0'; 
                zi <= '0';
                ci <= '0';
                zsoma <= '0';
                csoma <= '0';
                cpA <= '0';
                cpB <= '0';
                cssd_reg <= '0'; 
        
            when S3 => -- Estado de leitura: habilita leitura das próximas amostras
                pronto <= '0';
                read <= '1'; 
                zi <= '0';
                ci <= '0';
                zsoma <= '0';
                csoma <= '0';
                cpA <= '1';   -- habilita registro da amostra A
                cpB <= '1';   -- habilita registro da amostra B
                cssd_reg <= '0'; 
        
            when S4 => -- Estado de acumulação: soma o quadrado da diferença ao SSD e incrementa endereço
                pronto <= '0';
                read <= '0'; 
                zi <= '0';
                ci <= '1';      -- incrementa endereço
                zsoma <= '0';   -- mantém acumulador
                csoma <= '1';   -- armazena soma acumulada
                cpA <= '0';
                cpB <= '0';
                cssd_reg <= '0'; 
        
            when S5 => -- Estado de finalização: armazena valor final do SSD
                pronto <= '0';
                read <= '0'; 
                zi <= '0';
                ci <= '0';
                zsoma <= '0';
                csoma <= '0';
                cpA <= '0';
                cpB <= '0';
                cssd_reg <= '1'; -- habilita registro do valor final do SSD
        end case;
    end process;

end architecture;
