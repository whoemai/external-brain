#AirFlow #Python 

1. **DAGs (Directed Acyclic Graphs)**:
    - Um DAG é um conjunto de tarefas interconectadas, onde cada tarefa representa uma etapa específica do fluxo de trabalho.
    - As tarefas são executadas sequencialmente ou em paralelo, dependendo das dependências definidas.
    - O Airflow permite criar DAGs de maneira programática usando Python.
      
2. **Operadores (Operators)**:
    - Os operadores são elementos essenciais em um DAG. Eles representam as tarefas individuais.
    - Existem vários tipos de operadores, como `PythonOperator`, `BashOperator`, `HttpSensor`, etc.
    - Cada operador executa uma ação específica, como executar um script Python, chamar uma API HTTP ou executar um comando shell.
      
3. **DummyOperator**:
    - É um operador simples usado para marcar transições entre tarefas.
    - Geralmente usado para marcar o início e o fim de um DAG.
      
4. **PythonOperator**:
    - Executa um script Python como parte de uma tarefa.
    - Pode usar o argumento especial `provide_context` para acessar informações relevantes, como datas e variáveis de contexto.
      
5. **HttpSensor**:
    - Verifica o status de um serviço HTTP antes de executar tarefas dependentes.
    - Útil para garantir que um serviço esteja disponível antes de prosseguir.
      
6. **XComs**:
    - Elementos de transferência de valores entre tarefas.
    - Use com cautela, pois eles usam metadados do Airflow.

## Exemplo de código

Aqui está um exemplo simples de um DAG que obtém o nome da criptomoeda com a maior variação diária de valor em reais:

```python
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator
from airflow.sensors.http_sensor import HttpSensor
from datetime import datetime

def obter_nome_criptomoeda(**kwargs):
    # Lógica para obter o nome da criptomoeda
    # (substitua por sua própria implementação)
    return "Bitcoin"

default_args = {
    'owner': 'aluno',
    'start_date': datetime(2024, 2, 8),
    'retries': 1,
}

dag = DAG('meu_primeiro_dag',
          default_args=default_args,
          schedule_interval=None)

inicio = DummyOperator(task_id='inicio', dag=dag)

obter_criptomoeda = PythonOperator(
    task_id='obter_criptomoeda',
    python_callable=obter_nome_criptomoeda,
    provide_context=True,
    dag=dag
)

verificar_api = HttpSensor(
    task_id='verificar_api',
    http_conn_id='minha_api_http',
    endpoint='/status',
    timeout=10,
    dag=dag
)

fim = DummyOperator(task_id='fim', dag=dag)

inicio >> obter_criptomoeda >> verificar_api >> fim
```

