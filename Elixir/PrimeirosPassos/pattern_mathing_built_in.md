# Intro

Ufa, nós aprendemos bastante coisa sobre a linguagem de programação Elixir!

Configuramos o nosso Setup, iniciamos um projeto no Mix, falamos sobre programação funcional e Aridade.

Agora vamos falar sobre mais dois assuntos, o primeiro é considerado um dos ‘cores’ do Elixir, e é o **Pattern Matching** e o segundo é uma lista com exemplos de algumas **funções built in** que mais utilizamos no dia a dia, então vamos lá! 

## Pattern Matching

Vamos começar do início ok? Na maior parte das linguagens de programação o sinal de igual (=) é usado como um operador de atribuição, ou seja, eu atribuo um valor a uma determinada variável, **no Elixir isso não se aplica!**

No elixir o sinal de igual é um operador de correspondência (’Match operator’). 
Vamos dar uma olhada no exemplo abaixo:

```elixir
x = 1    # 1
1 = x    # 1
2 = x    **(MatchError) no match of right hand side value: 1
```

Vamos entender o que esta acontecendo, na linha 1 estamos correspondendo o valor 1 a uma variável x, criando um match!

Na linha 2 estamos correspondendo o valor 1 a uma variável que possui valor 1, deu match!

Na linha 3 estamos correspondendo o valor 2 a variável x que possui valor 1, e isso nitidamente não da match, é justamente isso que o log esta nos informando!

No Pattern Matching o lado direito deve ser correspondente ao lado esquerdo e se você veio do JavaScript deve estar pensando, e com razão, que o Pattern Matching é muito parecido com Destrutcing. Na verdade, são coisas diferentes, mas através do Pattern Matching conseguimos fazer destruturação no Elixir, vamos dar uma olhada no exemplo abaixo:

```elixir
[1, x, 3] = [1, 2, 3]
# [1, x, 3] = [1, 2, 3]

x
# 2
```

No exemplo anterior estamos correspondendo a variável x o segundo valor da lista a direita, também poderíamos fazer o seguinte:

```elixir
[y, x, 3] = [1, 2, 3]
# [y, x, 3] = [1, 2, 3]

y
# 1

x
# 2
```

Lembrando que os dois lados devem ser correspondentes, nos exemplos abaixo temos o mesmo erro:

```elixir
[y, x, 3] = [1, 2, 3, 4]
** (MatchError) no match of right hand side value: [1, 2, 3, 4]

[y, x, 3] = [1, 2]
** (MatchError) no match of right hand side value: [1, 2]
```

## Mais alguns exemplos de Pattern Matching

No caso do map não precisamos referenciar todos os valores dos dois lados justamente porque no map não importa a ordem dos elementos, portanto podemos corresponder somente a chave que precisamos do valor.

```elixir
%{school: school_name} = %{school: "Trybe", country: "BR"}
# %{school: "Trybe", country: "BR"}

school_name
# "Trybe"
```

Para concluir veja no próximo exemplo como usamos Pattern Matching para controle de fluxo em uma função de cláusula múltipla. 

```elixir
control_function = fn
	{:ok, response} -> "Great: #{response}"
	{:error, response} - > "Error: #{response}"
end

control_function.({:ok, "register concluded"})
# "Great: register concluded"

control_function.({:error, "Disconnected"})
# "Error: Disconnected"
```

No exemplo anterior vimos como o Pattern Matching é poderoso o porque ele faz parte do core do Elixir, ao receber o argumento da função o Elixir faz a comparação com a cláusula, caso “dê match” ele envia o retorno esperado, senão envia uma exceção, por exemplo:

```elixir
control_function.(5)

**(FunctionClaseuError) no function clause matching in :erl_eval."-inside-an-interpreted-fun-"/1
```

## Funções Built In

Também conhecidas como **funções internas** são recursos muito uteis encontrados na maioria das linguagens de programação e no Elixir isso não difere,

Nesse capítulo vamos explorar algumas que são bastante uteis para diversas situações.

### String

Vamos começar com algumas bem simples para trabalharmos com string.

```elixir
String.reverse("Trybe")
# "ebyrT"

String.split("Trybe escola de programação")
# ["Trybe", "escola", "de", "programação"]

String.replace("meen", "e", "o")
# "moon"

String.replace("Vamos usar Javascript", "Javascript", "Elixir")
# "Vamos usar Elixir"
```

### Enum

Agora que já deu pra sentir um gostinho, vamos falar do módulo Enum.

O Enum é o módulo que utilizamos no Elixir para trabalhar com dados “enumeráveis”, como Lists, Maps e Ranges.

O Enum.map() por exemplo, é muito parecido com o .map do Python ou do Javascript, o primeiro argumento é uma coleção e o segundo argumento é uma função, que pode ser anonima, que lida com os valores passados e retorna uma nova coleção.

```elixir
Enum.map([10, 20, 30], fn num -> num * 2 end)
# [20, 40, 60]
```