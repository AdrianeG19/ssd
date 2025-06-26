# Atividade Prática 2

Este projeto VHDL implementa um somador de diferença absoluta (SAD). O desenvolvimento e verificação inicial foram feitos via VPL no Moodle, com análise de temporização e uso de recursos de FPGA confirmados pelo ModelSim e Quartus II.

## Dupla X

- Gustavo Adriane de Almeida Guimarães e Silva (Matrícula 24208994)
- Maria Eduarda da Silva Maria (Matrícula 24200387)


## Descrição

Este projeto consiste na implementação em VHDL de um somador de diferença absoluta (SAD - Sum of Absolute Differences). O circuito tem como finalidade calcular a soma das diferenças absolutas entre duas sequências de amostras, uma operação fundamental em diversas aplicações de processamento de sinais, como compressão de vídeo e reconhecimento de padrões.

A arquitetura do design foi pensada para ser parametrizável, permitindo a configuração de diversos aspectos do circuito através de generics. O código top-level (sad.vhd) que encapsula a funcionalidade principal do somador é definido pela seguinte entidade:

```
entity sad_bo is

	generic(
		CFG : datapath_configuration_t := (
			bits_per_sample   => 8,
			samples_per_block => 64,
			parallel_samples  => 1
        )
	);

	port(
	
		clk : in std_logic;

        amostraA : in unsigned (CFG.bits_per_sample - 1 downto 0);
        amostraB : in unsigned (CFG.bits_per_sample - 1 downto 0);
        SAD : out std_logic_vector (CFG.bits_per_sample + clogb2(CFG.samples_per_block) - 1 downto 0);
        
        address: out std_logic_vector(5 downto 0);

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
```

#### Simulação

A verificação inicial do código VHDL foi realizada no ambiente **Virtual Programming Lab (VPL)**, integrado ao Moodle, que permitiu a escrita, compilação e testes preliminares do design.

Para a análise de temporização e a geração de relatórios detalhados de *setup* e *hold times*, o **ModelSim** foi a ferramenta empregada. Os dados de temporização presentes neste README, como a tabela de "Setup Times" abaixo, foram extraídos diretamente dos relatórios de simulação do ModelSim e Quartus II, fornecendo insights críticos sobre o desempenho e a validação temporal do design.

### Relatório de Tempos de Setup

Este relatório apresenta os tempos de setup para os principais sinais de dados em relação ao clock `clk`, conforme gerado pelo ModelSim.

| Data Port      | Clock Port | Rise (ns) | Fall (ns) | Clock Edge | Clock Reference |
|----------------|------------|-----------|-----------|------------|-----------------|
| `enable`       | `clk`      | 3.934     | 3.934     | Rise       | `clk`           |
| `sample_can[*]`| `clk`      | 4.876     | 4.876     | Rise       | `clk`           |
| `sample_can[0]`| `clk`      | 4.288     | 4.288     | Rise       | `clk`           |
| `sample_can[1]`| `clk`      | 0.408     | 0.408     | Rise       | `clk`           |
| `sample_can[2]`| `clk`      | 4.645     | 4.645     | Rise       | `clk`           |
| `sample_can[3]`| `clk`      | 4.049     | 4.049     | Rise       | `clk`           |
| `sample_can[4]`| `clk`      | 3.959     | 3.959     | Rise       | `clk`           |
| `sample_can[5]`| `clk`      | 4.876     | 4.876     | Rise       | `clk`           |
| `sample_can[6]`| `clk`      | 3.930     | 3.930     | Rise       | `clk`           |
| `sample_can[7]`| `clk`      | 4.024     | 4.024     | Rise       | `clk`           |
| `sample_ori[*]`| `clk`      | 4.305     | 4.305     | Rise       | `clk`           |
| `sample_ori[0]`| `clk`      | 4.180     | 4.180     | Rise       | `clk`           |
| `sample_ori[1]`| `clk`      | 0.468     | 0.468     | Rise       | `clk`           |
| `sample_ori[2]`| `clk`      | 3.991     | 3.991     | Rise       | `clk`           |
| `sample_ori[3]`| `clk`      | 4.282     | 4.282     | Rise       | `clk`           |
| `sample_ori[4]`| `clk`      | 4.305     | 4.305     | Rise       | `clk`           |
| `sample_ori[5]`| `clk`      | 4.305     | 4.305     | Rise       | `clk`           |
| `sample_ori[6]`| `clk`      | 3.951     | 3.951     | Rise       | `clk`           |
| `sample_ori[7]`| `clk`      | 3.975     | 3.975     | Rise       | `clk`           |

**Observações:**
* Todos os valores de `Rise` e `Fall` (que representam a folga de tempo de setup) são positivos, indicando que os requisitos de temporização de setup são atendidos para a frequência de clock utilizada na simulação.
* O caminho mais crítico (menor folga de setup) para as entradas é `sample_can[1]` com 0.408 ns e `sample_ori[1]` com 0.468 ns.

### Relatório de Compilação

A compilação do projeto foi realizada com sucesso utilizando o **Quartus II**. Este relatório resume a utilização dos recursos do FPGA para o design `sad`.

| Item                      | Valor        | Porcentagem |
|---------------------------|--------------|-------------|
| **Flow Status** | Successful   | -           |
| Revision Name             | sad          | -           |
| Top-level Entity Name     | sad          | -           |
| Family                    | Cyclone II   | -           |
| Device                    | EP2C5AF256A7 | -           |
| Timing Models             | Final        | -           |
| Total logic elements      | 74 / 4,608   | 2 %         |
| Total combinational functions | 58 / 4,608 | 1 %         |
| Dedicated logic registers | 57 / 4,608 | 1 %         |
| Total registers           | 57           | -           |
| Total pins                | 41 / 158     | 26 %        |
| Total virtual pins        | 0            | -           |
| Total memory bits         | 0 / 119,808  | 0 %         |
| Embedded Multiplier 9-bit elements | 0 / 26 | 0 %         |
| Total PLLs                | 0 / 2        | 0 %         |

### Arquitetura do Design

O design do circuito SAD é composto por dois blocos principais:
* **Bloco Operativo (BO):** Responsável pelas operações de *datapath*, incluindo a subtração, cálculo de valor absoluto e acumulação da soma das diferenças. Ele também gerencia o endereçamento de memória e o sinal de controle de laço (`menor`).
* **Bloco de Controle (BC):** Implementa a máquina de estados finitos que sequencia as operações do BO, gerando os sinais de controle necessários para cada etapa do cálculo SAD.

## Outras observações

Este projeto proporcionou um aprendizado significativo no design digital com VHDL, sendo integralmente baseado nos diagramas apresentados nas aulas teóricas, incluindo a máquina de estados para o Bloco de Controle (BC) e a arquitetura do Bloco Operativo (BO).

O maior desafio durante o processo foi compreender a implementação e o uso de generics para parametrizar o circuito. A depuração de erros relacionados a esses parâmetros no Quartus II, como a ordem de declaração e a chamada de funções auxiliares, exigiu um entendimento mais aprofundado de como o VHDL lida com a configuração de hardware. A experiência com o VPL foi valiosa para o desenvolvimento inicial, mas a transição para ferramentas como ModelSim e Quartus foi essencial para a análise de temporização e a síntese real do hardware.

A modularidade do design, com a separação clara entre o Bloco Operativo (datapath) e o Bloco de Controle (máquina de estados), mostrou-se uma estratégia eficaz para gerenciar a complexidade. Embora esta atividade tenha focado na implementação da SAD v1, a arquitetura parametrizável, notavelmente através do parallel_samples no generic da entidade top-level, já estabelece uma base sólida para futuras implementações, como a SAD v3, que visa processar múltiplas amostras em paralelo para otimizar o desempenho.
