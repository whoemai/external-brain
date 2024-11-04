#OpenAI

**LangChain: Introdução e Implementação**

- **Objetivo**: O LangChain facilita a integração de modelos de linguagem (LLMs) em aplicações, permitindo a criação de cadeias de chamadas para tarefas complexas.
- **Estrutura**: Utiliza orientação a objetos para abstrair APIs de LLMs, como OpenAI, permitindo carregar templates de diferentes fontes (strings, arquivos, repositórios).
- **Exemplo Prático**:
    - **Criação de Cadeias**: Implementação de uma cadeia de chamadas que sugere cidades, restaurantes e atividades culturais com base em interesses específicos.
    - **Templates**: Uso de `PromptTemplate` e `ChatPromptTemplate` para criar prompts personalizados.
    - [**Execução Sequencial**: Utilização de `SimpleSequentialChain` para executar múltiplas cadeias de forma sequencial, passando a saída de uma cadeia como entrada para a próxima](https://edgeservices.bing.com/edgesvc/chat?udsframed=1&form=SHORUN&clientscopes=chat,noheader,udsedgeshop,channelstable,ntpquery,devtoolsapi,udsinwin11,udsdlpconsent,udscstart,cspgrd,&shellsig=3ff0021e3dd193c7b2abd1225a528a5f775465cd&setlang=pt-BR&darkschemeovr=1&udsps=0&udspp=0#sjevt%7CDiscover.Chat.SydneyClickPageCitation%7Cadpclick%7C0%7C91b75620-a0d4-4400-9ac9-7cd78278d31c)[1](https://edgeservices.bing.com/edgesvc/chat?udsframed=1&form=SHORUN&clientscopes=chat,noheader,udsedgeshop,channelstable,ntpquery,devtoolsapi,udsinwin11,udsdlpconsent,udscstart,cspgrd,&shellsig=3ff0021e3dd193c7b2abd1225a528a5f775465cd&setlang=pt-BR&darkschemeovr=1&udsps=0&udspp=0#sjevt%7CDiscover.Chat.SydneyClickPageCitation%7Cadpclick%7C0%7C91b75620-a0d4-4400-9ac9-7cd78278d31c).
- **Melhorias**: Engenharia de prompt para otimizar respostas e reduzir o uso de tokens desnecessários.

---

```py
from langchain_openai import ChatOpenAI
from langchain.prompts import PromptTemplate
import os
from dotenv import load_dotenv

load_dotenv()

numero_de_dias = 7
numero_de_criancas = 2
atividade = "praia"

modelo_do_prompt = PromptTemplate.from_template(
    "Crie um roteiro de viagem de {dias} dias, para uma família com {criancas} crianças, que gostam de {atividade}."
)

prompt = modelo_do_prompt.format(dias=numero_de_dias,
                        criancas=numero_de_criancas,
                        atividade=atividade)

print(prompt)

llm = ChatOpenAI(
    model="gpt-3.5-turbo",
    temperature=0.5,
    api_key=os.getenv("OPENAI_API_KEY"))

resposta = llm.invoke(prompt)
print(resposta.content)
```

Para explorar outras formas de trabalhar com `PromptTemplate`, acesse a [documentação do LangChain](https://api.python.langchain.com/en/latest/prompts/langchain_core.prompts.prompt.PromptTemplate.html).

