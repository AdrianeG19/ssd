# Atividade Prática 2

Este projeto VHDL implementa um somador de diferença quadrática (SSD - Sum of Squared Differences). O desenvolvimento, simulação e análise de temporização foram realizados utilizando **Quartus II** para síntese e **GTKWave** para visualização das formas de onda.

## Grupo AP3-02208A-Grupo-D

- Gustavo Adriane de Almeida Guimarães e Silva (Matrícula 24208994)
- Vinicius de Campos Pereira (Matrícula 20103807)
- Miguel Estivalet Pinto (Matrícula 24204068)
- Luiz Felipe Machado Athayde (Matrícula 24206765)
- Elisa Belquis de Assumpcao (Matrícula 24202220)

## Descrição

Este projeto consiste na implementação em VHDL de um somador de diferença quadrática (SSD - Sum of Squared Differences). O circuito calcula a soma dos quadrados das diferenças entre duas sequências de amostras, operação fundamental em aplicações como compressão de vídeo, reconhecimento de padrões e processamento de imagens, onde o SSD é utilizado para medir similaridade entre blocos de dados.

A arquitetura do design é totalmente parametrizável, permitindo a configuração de diversos aspectos do circuito através de generics. O código top-level (`ssd.vhd`) encapsula a funcionalidade principal do somador SSD e é definido pela seguinte entidade:

```
entity ssd_bo is

    generic(
        CFG : datapath_configuration_t := (
            bits_per_sample   => 8,
            samples_per_block => 64,
            parallel_samples  => 1
        )
    );

    port(
        clk : in std_logic;
        amostraA : in unsigned (CFG.bits_per_sample - 1 downto 0);
        amostraB : in unsigned (CFG.bits_per_sample - 1 downto 0);
        SSD : out std_logic_vector (CFG.bits_per_sample + clogb2(CFG.samples_per_block) - 1 downto 0);
        address: out std_logic_vector(5 downto 0);
        cpA : in std_logic;
        cpB : in std_logic;
        zssd : in std_logic;
        cssd : in std_logic;
        cssd_reg : in std_logic;
        zi : in std_logic;
        ci : in std_logic;
        menor : out std_logic
    );
end entity;
```

### Funcionamento

O circuito é composto por dois blocos principais:

* **Bloco Operativo (BO):** Responsável pelas operações aritméticas do datapath, incluindo subtração, cálculo do quadrado da diferença e acumulação da soma dos quadrados. Também gerencia o endereçamento de memória e o sinal de controle de laço (`menor`). O cálculo do SSD é feito de forma sequencial ou paralela, dependendo do parâmetro `parallel_samples`.

* **Bloco de Controle (BC):** Implementa uma máquina de estados finitos (FSM) que sequencia as operações do BO, gerando os sinais de controle necessários para cada etapa do cálculo SSD. O controle garante o correto fluxo de dados, inicialização dos acumuladores, controle de leitura das amostras e armazenamento do resultado final.

### Parametrização

O projeto permite ajustar:
- **bits_per_sample:** Número de bits de cada amostra.
- **samples_per_block:** Número total de amostras por bloco.
- **parallel_samples:** Número de amostras processadas em paralelo, permitindo otimização de desempenho para diferentes aplicações.

### Simulação

A simulação e validação do circuito foram realizadas utilizando o **Quartus II** para síntese e geração do netlist, e o **GTKWave** para análise das formas de onda resultantes da simulação funcional. O fluxo de trabalho envolveu a criação de testbenches em VHDL, execução da simulação no ambiente do Quartus (ModelSim integrado ou equivalente), exportação dos arquivos de waveform (`.vcd` ou `.ghw`) e análise detalhada dos sinais no GTKWave.

### Relatório de Tempos de Setup

Este relatório apresenta os tempos de setup para os principais sinais de dados em relação ao clock `clk`, conforme gerado pelo Quartus II.  
**Observação:** O tempo de clock foi alterado para 10 ns (100 MHz) utilizando a seguinte constraint no arquivo SDC:

```
set_clock_frequency -period 10 [get_clocks clk]
```

| Data Port      | Clock Port | Rise (ns) | Fall (ns) | Clock Edge | Clock Reference |
|----------------|------------|-----------|-----------|------------|-----------------|
| `enable`       | `clk`      | 3.509     | 3.509     | Rise       | `clk`           |
| `sample_can[*]`| `clk`      | 4.602     | 4.602     | Rise       | `clk`           |
| `sample_can[0]`| `clk`      | 4.205     | 4.205     | Rise       | `clk`           |
| `sample_can[1]`| `clk`      | 4.602     | 4.602     | Rise       | `clk`           |
| `sample_can[2]`| `clk`      | 4.241     | 4.241     | Rise       | `clk`           |
| `sample_can[3]`| `clk`      | 3.963     | 3.963     | Rise       | `clk`           |
| `sample_can[4]`| `clk`      | 4.234     | 4.234     | Rise       | `clk`           |
| `sample_can[5]`| `clk`      | 4.242     | 4.242     | Rise       | `clk`           |
| `sample_can[6]`| `clk`      | 3.909     | 3.909     | Rise       | `clk`           |
| `sample_can[7]`| `clk`      | 0.412     | 0.412     | Rise       | `clk`           |
| `sample_ori[*]`| `clk`      | 4.719     | 4.719     | Rise       | `clk`           |
| `sample_ori[0]`| `clk`      | 4.716     | 4.716     | Rise       | `clk`           |
| `sample_ori[1]`| `clk`      | 4.088     | 4.088     | Rise       | `clk`           |
| `sample_ori[2]`| `clk`      | 4.688     | 4.688     | Rise       | `clk`           |
| `sample_ori[3]`| `clk`      | 4.067     | 4.067     | Rise       | `clk`           |
| `sample_ori[4]`| `clk`      | 4.399     | 4.399     | Rise       | `clk`           |
| `sample_ori[5]`| `clk`      | 4.702     | 4.702     | Rise       | `clk`           |
| `sample_ori[6]`| `clk`      | 4.719     | 4.719     | Rise       | `clk`           |
| `sample_ori[7]`| `clk`      | 0.485     | 0.485     | Rise       | `clk`           |

**Observações:**
* Todos os valores de `Rise` e `Fall` (folga de tempo de setup) são positivos, indicando que os requisitos de temporização de setup são atendidos para a frequência de clock utilizada (100 MHz).
* O caminho mais crítico (menor folga de setup) para as entradas é `sample_can[7]` com 0.412 ns e `sample_ori[7]` com 0.485 ns, indicando que esses sinais estão com folga mínima e devem ser monitorados em frequências mais altas.

### Relatório de Compilação

A compilação do projeto foi realizada com sucesso utilizando o **Quartus II**. Este relatório resume a utilização dos recursos do FPGA para o design `ssd`:

| Item                              | Valor            | Porcentagem |
|------------------------------------|------------------|-------------|
| **Flow Status**                    | Successful       | -           |
| Revision Name                      | ssd              | -           |
| Top-level Entity Name              | ssd              | -           |
| Family                             | Cyclone II       | -           |
| Device                             | EP2C5AF256A7     | -           |
| Timing Models                      | Final            | -           |
| Total logic elements               | 58 / 4,608       | 1 %         |
| Total combinational functions      | 35 / 4,608       | < 1 %       |
| Dedicated logic registers          | 57 / 4,608       | 1 %         |
| Total registers                    | 57               | -           |
| Total pins                         | 41 / 158         | 26 %        |
| Total virtual pins                 | 0                | -           |
| Total memory bits                  | 0 / 119,808      | 0 %         |
| Embedded Multiplier 9-bit elements | 1 / 26           | 4 %         |
| Total PLLs                         | 0 / 2            | 0 %         |

### Fmax (Frequência Máxima)

| Fmax         | Restricted Fmax | Clock Name | Note |
|--------------|-----------------|------------|------|
| 108.96 MHz   | 108.96 MHz      | clk        |      |

### Arquitetura do Design

O design do circuito SSD é composto por dois blocos principais:
* **Bloco Operativo (BO):** Responsável pelas operações de datapath, incluindo subtração, cálculo do quadrado da diferença e acumulação da soma dos quadrados. Também gerencia o endereçamento de memória e o sinal de controle de laço (`menor`).
* **Bloco de Controle (BC):** Implementa a máquina de estados finitos que sequencia as operações do BO, gerando os sinais de controle necessários para cada etapa do cálculo SSD.

## Outras observações

Este projeto proporcionou um aprendizado significativo no design digital com VHDL, sendo integralmente baseado nos diagramas apresentados nas aulas teóricas, incluindo a máquina de estados para o Bloco de Controle (BC) e a arquitetura do Bloco Operativo (BO).

O maior desafio durante o processo foi compreender a implementação e o uso de generics para parametrizar o circuito. A depuração de erros relacionados a esses parâmetros no Quartus II, como a ordem de declaração e a chamada de funções auxiliares, exigiu um entendimento mais aprofundado de como o VHDL lida com a configuração de hardware. A experiência com o GTKWave foi fundamental para a análise detalhada do comportamento do circuito, permitindo a visualização clara das transições de estado, sinais de controle e resultados do SSD.

A modularidade do design, com a separação clara entre o Bloco Operativo (datapath) e o Bloco de Controle (máquina de estados), mostrou-se uma estratégia eficaz para gerenciar a complexidade. A arquitetura parametrizável, especialmente através do `parallel_samples` no generic da entidade top-level, estabelece uma base sólida para futuras otimizações e ampliações do projeto, como o processamento paralelo de múltiplas amostras para ganho de desempenho.

---
