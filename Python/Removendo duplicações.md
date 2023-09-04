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



