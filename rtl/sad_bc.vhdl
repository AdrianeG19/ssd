--------------------------------------------------
--	Author:      Ismael Seidel (entity)
--	Created:     May 1, 2025
--
--	Project:     Exercício 6 de INE5406
--	Description: Contém a descrição da entidade `sad_bc`, que representa o
--               bloco de controle (BC) do circuito para cálculo da soma das
--               diferenças absolutas (SAD - Sum of Absolute Differences).
--               Este bloco é responsável pela geração dos sinais de controle
--               necessários para coordenar o funcionamento do bloco operativo
--               (BO), como enable de registradores, seletores de multiplexadores,
--               sinais de início e término de processamento, etc.
--               A arquitetura é comportamental e deverá descrever uma máquina
--               de estados finitos (FSM) adequada ao controle do datapath.
--               Os sinais adicionais de controle devem ser definidos conforme
--               a necessidade do projeto. PS: já foram definidos nos slides
--               da aula 6T.
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-- Bloco de Controle (BC) do circuito SAD.
-- Responsável por gerar os sinais de controle para o bloco operativo (BO),
-- geralmente por meio de uma FSM.
entity sad_bc is
	port(
		clk   : in std_logic;  -- clock (sinal de relógio)
		rst_a : in std_logic;   -- reset assíncrono ativo em nível alto
		iniciar : in std_logic;
		menor : in std_logic; 
		
		pronto : out std_logic;
		read : out std_logic;
		zi : out std_logic; -- controle mux i
		ci : out std_logic; -- controle registrador i
		zsoma : out std_logic; -- controle mux soma
		csoma : out std_logic; -- controle reg soma
		cpA : out std_logic; -- controle reg pA
		cpB : out std_logic; -- controle reg pB
		csad_reg : out std_logic -- controle SAD_reg
	);
end entity;
-- Não altere o nome da entidade nem da arquitetura!

architecture behavior of sad_bc is
    type Estado is (S0, S1, S2, S3, S4, S5);
    signal current_state, next_state : Estado;
begin

    --Processo de carga e reset do registrador de estado (registrador de estado)
    Parte1 : process (clk, rst_a) 
    begin
    if rst_a = '1' then 
        current_state <= S0;
    elsif rising_edge(clk) then
        current_state <= next_state;
    end if;
    end process;
    
    
    --lógica de próximo estado (LPE)
    Parte2 : process(current_state, iniciar, menor) -- Determina o next_state com base no estado atual e nas entradas
    begin
    case current_state is -- máquina de estados finitos (FSM)
        when S0 => 
            if iniciar = '0' then 
                next_state <= S0;
            else
                next_state <= S1;
            end if;
            
        when S1 =>
            next_state <= S2;

        when S2 =>
            if menor = '1' then -- se a amostra A for menor que a B, vai para o estado de soma
                next_state <= S3; 
            else -- se não, vai para o estado de escrita
                next_state <= S5;
            end if;
            
        when S3 =>
            next_state <= S4;

        when S4 =>
            next_state <= S2;

        when S5 =>
            next_state <= S0;

    end case;
    end process;
    
    --lógica de saída (LS)
    Parte3 : process (current_state) -- só tem estadoatual pois a saída só depende disso
    begin
    case current_state is
        when S0 => -- estado inicial, onde tudo é zerado
            pronto <= '1';
            read <= '0'; 
            zi <= '0';
            ci <= '0';
            zsoma <= '0';
            csoma <= '0';
            cpA <= '0';
            cpB <= '0';
            csad_reg <= '0'; 
       
        when S1 => -- estado de início
            pronto <= '0';
            read <= '0'; 
            zi <= '1';
            ci <= '1';
            zsoma <= '1';
            csoma <= '1';
            cpA <= '0';
            cpB <= '0';
            csad_reg <= '0'; 
        
        when S2 => -- estado de comparação
            pronto <= '0';
            read <= '0'; 
            zi <= '0';
            ci <= '0';
            zsoma <= '0';
            csoma <= '0';
            cpA <= '0';
            cpB <= '0';
            csad_reg <= '0'; 
        
        when S3 => -- estado de soma
            pronto <= '0';
            read <= '1'; 
            zi <= '0';
            ci <= '0';
            zsoma <= '0';
            csoma <= '0';
            cpA <= '1';
            cpB <= '1';
            csad_reg <= '0'; 
        
        when S4 => -- estado de escrita
            pronto <= '0';
            read <= '0'; 
            zi <= '0';
            ci <= '1';
            zsoma <= '0';
            csoma <= '1';
            cpA <= '0';
            cpB <= '0';
            csad_reg <= '0'; 
        
        when S5 => -- estado de finalização, onde csad_reg é 1
            pronto <= '0';
            read <= '0'; 
            zi <= '0';
            ci <= '0';
            zsoma <= '0';
            csoma <= '0';
            cpA <= '0';
            cpB <= '0';
            csad_reg <= '1'; 
    end case;
    end process;

end architecture;
