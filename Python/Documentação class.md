#Python #class #POO

```python
class Conta:

    def __init__(self, numero, titular, saldo, limite):
        print(f"Construindo objeto ... {self}")
        self.__numero = numero
        self.__titular = titular
        self.__saldo = saldo
        self.__limite = limite

    def extrato(self):
        print(f"Saldo de {self.__saldo} do titular {self.__titular}")

    def deposita(self, valor):
        self.__saldo += valor

    def saca(self, valor):
        self.__saldo -= valor

    def transfere(self, valor, destino):
        self.saca(valor)
        destino.deposita(valor)

    @property
    def saldo(self):
        return self.__saldo

    @property
    def titular(self):
        return self.__titular

    @property
    def limite(self):
        return self.__limite

    @limite.setter
    def limite(self, limite):
        self.__limite = limite
```

---

A classe `Conta` representa uma conta bancária e possui métodos para realizar operações básicas, como consultar o saldo, depositar, sacar e transferir dinheiro. Vamos entender cada parte do código passo a passo.

## Construtor `__init__`

O construtor `__init__` é chamado quando um novo objeto da classe `Conta` é criado. Ele inicializa os atributos da conta, como número, titular, saldo e limite.

```python
def __init__(self, numero, titular, saldo, limite):
    self.__numero = numero
    self.__titular = titular
    self.__saldo = saldo
    self.__limite = limite
```

- `self`: O parâmetro `self` é uma referência ao próprio objeto que está sendo criado. Ele é usado para acessar e manipular os atributos do objeto.
- `numero`: Número da conta.
- `titular`: Nome do titular da conta.
- `saldo`: Saldo inicial da conta.
- `limite`: Limite de crédito da conta.

## Propriedades

As propriedades são usadas para acessar os atributos privados da classe.

- `saldo`: Retorna o saldo da conta.

- `titular`: Retorna o nome do titular da conta.

- `limite`: Retorna o limite de crédito da conta.

## Setter da Propriedade `limite`

Este é um setter para atualizar o limite de crédito da conta.

```python
@limite.setter
def limite(self, limite):
    self.__limite = limite
```

Isso permite que você atualize o limite como desejado.

## Propriedades e Decorador `@property`

O decorador `@property` é usado para transformar um método em uma propriedade. No contexto da classe `Conta`, ele é usado para criar propriedades de acesso aos atributos privados, como `saldo`, `titular` e `limite`, de forma que eles possam ser acessados como se fossem atributos públicos.

Por exemplo, o método `saldo` é transformado em uma propriedade `@property`:

```python
@property
def saldo(self):
    return self.__saldo
```

Isso permite que você acesse o saldo da conta usando `conta.saldo` em vez de `conta.saldo()`. O decorador `@property` simplifica o código e torna o acesso aos atributos mais natural.

## Uso de `self` e `__`

- `self`: O parâmetro `self` é usado para referenciar o próprio objeto e acessar seus atributos e métodos.

- `__`: O uso de `__` antes do nome de um atributo, como `__numero`, `__titular`, `__saldo` e `__limite`, indica que esses atributos são privados e não devem ser acessados diretamente fora da classe. Eles são chamados de "atributos dunder" (dunder significa "double underscore", ou seja, dois underscores). A convenção de usar `__` é uma forma de indicar que esses atributos são internos à classe e não devem ser alterados diretamente fora dela.
- Para saber mais leia também a nota [[_ ou __ protect e private]]

O encapsulamento desses atributos privados é uma prática importante para manter a integridade dos dados e evitar possíveis erros ao modificar atributos críticos inadvertidamente.