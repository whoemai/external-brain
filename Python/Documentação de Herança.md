#Python #POO #class #Herança

A herança é um princípio fundamental da programação orientada a objetos (OOP) que permite criar uma nova classe que é uma versão modificada de uma classe existente.

## Sintaxe Básica

Em Python, a herança é definida passando a classe pai como um parâmetro para a definição da classe filha.

```python
class ClassePai:
    pass

class ClasseFilha(ClassePai):
    pass
```

Neste exemplo, `ClasseFilha` é a classe que herda de `ClassePai`.

## Exemplo de Uso

Vamos considerar um exemplo onde temos uma classe `Animal` e queremos criar classes `Cachorro` e `Gato` que herdam de `Animal`.

```python
class Animal:
    def __init__(self, nome):
        self.nome = nome

    def falar(self):
        pass

class Cachorro(Animal):
    def falar(self):
        return "Au Au"

class Gato(Animal):
    def falar(self):
        return "Miau"
```

Neste exemplo, tanto `Cachorro` quanto `Gato` herdam de `Animal`. A função `falar` é definida na classe `Animal` e sobrescrita nas classes `Cachorro` e `Gato`.

Agora, podemos criar instâncias de `Cachorro` e `Gato` e chamar a função `falar`.

```python
cachorro = Cachorro("Rex")
print(cachorro.nome)  # Saída: Rex
print(cachorro.falar())  # Saída: Au Au

gato = Gato("Mingau")
print(gato.nome)  # Saída: Mingau
print(gato.falar())  # Saída: Miau
```
