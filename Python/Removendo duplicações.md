#Python #POO #class 
Vamos supro que estamos criando dois objetos um para o filme e outro para uma série. Ambos vão ter [nome, ano e likes] o que vai diferenciar um do outro é [duração & temporadas].

Não seria muito inteligente criar duas classes com 3 parâmetros igual e somente 1 parâmetro fazendo a diferenciação. Para resolver isso podemos criar uma classe genérica com os 3 principais parâmetros e aí sim criar as duas classes com os parâmetros que vão diferencia-las. Vamos fazer o que é comumente falado como Abstração.

Sua estrutura ficaria da seguinte forma: 

Programa (nome, ano, likes)
	Filmes (duração)
	Séries (temporadas)

```python
class Programa:
    def __init__(self, titulo, ano):
        self._titulo = titulo
        self.ano = ano

class Filme(Programa):
    def __init__(self, titulo, ano, duracao):
        super().__init__(titulo, ano)
        self.duracao = duracao

class Serie(Programa):
    def __init__(self, titulo, ano, temporadas):
        super().__init__(titulo, ano)
        self.temporadas = temporadas
```

O sublinhado `_` é uma convenção em Python que geralmente é usada para indicar que um atributo ou método é "privado", ou seja, não deve ser acessado diretamente fora da classe em que está definido. No entanto, é importante observar que o Python não impõe o encapsulamento estrito como algumas outras linguagens de programação, como Java, fazem. O uso do sublinhado `_` é mais uma convenção para comunicar a intenção do desenvolvedor.

**Variáveis Privadas**: Quando uma variável de instância começa com um sublinhado, como `_titulo`, isso geralmente indica que ela é considerada "privada" e deve ser acessada apenas internamente na classe. No entanto, ela ainda pode ser acessada fora da classe, mas é uma indicação de que você não deve fazer isso diretamente

**Nome Conflitante**: Às vezes, o sublinhado é usado para evitar conflitos de nomes. Se uma classe possui um método chamado `_privado`, isso pode ser usado para evitar que um método com o mesmo nome em uma subclasse substitua acidentalmente o método da classe pai.



