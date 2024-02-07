#Python #AirFlow
# Apache Airflow: Conceitos Iniciais

O **Apache Airflow** é uma ferramenta open-source que foi criada no Airbnb em 2014 e, desde 2019, faz parte da **Apache Software Foundation**. Ele é amplamente utilizado para criar, agendar e monitorar pipelines de dados de forma programática. Vamos explorar os principais conceitos:

## 1. DAG (Directed Acyclic Graph)

- **DAG** (ou **Directed Acyclic Graph**) é o coração do Airflow. É um grafo acíclico dirigido composto por nós e arestas.
- As arestas são “setas” unidirecionais, e o grafo não permite loops, garantindo que não entremos em caminhos infinitos.
- O Airflow utiliza DAGs para desenhar pipelines de dados, conectando tarefas de forma lógica.

## 2. Princípios do Airflow

O Airflow se baseia em quatro princípios diretos:

1. **Dinâmico**: Utiliza o conceito de **configuration-as-code**, permitindo criar pipelines dinamicamente de forma programática.
2. **Extensível**: Oferece uma variedade de operadores, executores e bibliotecas para criar ambientes adequados ao nível de abstração desejado.
3. **Elegante**: Os pipelines são enxutos e diretos, com suporte ao **Jinja templating engine**.
4. **Escalável**: Sua arquitetura modular permite a orquestração de workers usando sistemas de mensageria.

## 3. Linguagem Python

- O Airflow é totalmente escrito em **Python**, uma das linguagens mais populares na área de dados atualmente.

## 4. Interface Gráfica

- A interface do Airflow é enxuta e contém informações úteis para a execução e monitoramento das DAGs.