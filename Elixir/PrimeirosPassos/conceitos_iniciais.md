# Elixir - Conceitos Iniciais

## Intro
No [último artigo](https://dev.to/trybe/meus-primeiro-passos-no-elixir-1n1j), ensinei a configurar a máquina para começarmos a usar o Elixir, agora falaremos um pouco sobre a linguagem.

### Elixir x Erlang

Você deve ter notado no último artigo, que tivemos que instalar o Elixir e o Erlang, mas o que é Erlang?
![Obama](https://media.giphy.com/media/pPhyAv5t9V8djyRFJH/giphy.gif)

O Erlang é uma linguagem de programação criada muitos anos antes do Elixir para solucionar demandas relacionadas a rede de telefonia, é uma linguagem muito poderosa porem com uma sintaxe bastante complexa e é aí que entra o Elixir.

O Elixir traz uma sintaxe mais amigável porem sua estrutura é idêntica a do Erlang sendo assim nosso código pode ser escrito em Elixir e depois transpilado para Erlang e por último compilado pela BEAM.

### BEAM?

BEAM é um acrônimo para *"Bogdan/Björn's Erlang Abstract Machine”* (Sendo *Bogdan* e *Björn's* o nome original dos criadores) e é simplesmente o nome da Virtual Machine (VM) como a Java Virtual Machine (JVM) para quem conhece Java. 

Agora que já falamos bastante, vamos pro código!

---

## Iniciando um Projeto com Mix

Acredito que a melhor forma de se aprender uma linguagem de programação é criando um projeto, então por mais que leiamos a documentação ou vejamos vários vídeos tutoriais, o  aprendizado só é consolidado quando realmente aplicamos a linguagem.

Então vamos aplicar alguns conceitos de Elixir, na prática, para isso iniciaremos um projeto com o Mix!

## Mix o quê?
![Mix it up](https://media.giphy.com/media/JoxvmZFZ224I4kD8qN/giphy.gif)

Chegamos naquele momento em que parece que o sentido foi deixado para trás, acreditem isso é muito comum principalmente se você veio de outra linguagem de programação e está aprendendo Elixir agora, mas calma que as coisas vão começar a se encaixar.

Mix é uma ferramenta de linha de comando que integra o ecossistema Elixir e a utilizamos para gerenciar uma porção de coisas diferentes no nosso código (ex: Gerar e compilar projetos, rodar ‘Tasks’, gerenciar dependências).

Portanto, iniciaremos um projeto usando Mix! 

No seu terminal digite o seguinte comando:

```bash
mix new basics
```

Você vera algo parecido com isso:

```bash
~/projetos 
❯ mix new basics
* creating README.md
* creating .formatter.exs
* creating .gitignore
* creating mix.exs
* creating lib
* creating lib/basics.ex
* creating test
* creating test/test_helper.exs
* creating test/basics_test.exs

Your Mix project was created successfully.
You can use "mix" to compile it, test it, and more:

    cd basics
    mix test

Run "mix help" for more commands.
```

Perceba que ele pede para você entrar no diretório criado para começar, vamos lá:

```bash
cd basics
```

## Módulos e Funções

A primeira coisa que devemos notar é como as funções se comportam, como falamos lá atrás o Elixir usa o paradigma funcional, falaremos disso mais tarde, antes disso quero que você preste atenção na sintaxe.

Lá no diretório *lib*, perceba que foi gerado um arquivo *basics.ex* e dentro dele um módulo *Basics*:

```elixir
defmodule Basics do
end
```

Para definir um módulo no elixir usamos a sintaxe **defmodule** você perceberá que basicamente, 100% dos códigos escritos em Elixir estão dentro de algum módulo.

Um **módulo** é uma coleção de diferentes **métodos** ou **funções.**

Então deixaremos de ser tediosos e escreveremos um pouco de código aqui!

Vamos criar uma função **create_list** que retornara uma lista.

```elixir
defmodule Basics do
  def create_list do
    [1, 2, 3, "little indians"]
  end
end
```

Perceba que usamos a sintaxe **def** para definir uma função **create_list** dentro do nosso método **Basics.**

---

## Rodando nosso projeto
![rolling simpson](https://media.giphy.com/media/4LWEwOMfbVeYU/giphy.gif)

Para rodar nosso projeto, utilizaremos o **IEx** (Interactive Elixir Shell). O IEx é como o Shell do Python ou o IRB do Ruby, podemos escrever qualquer código Elixir dentro dele e executar em Real Time.

Na pasta do projeto em seu terminal digite:

```elixir
iex -S mix
```

Com isso você devera abrir o IEx com seu projeto compilado, para testar digite:

```elixir
Basics.create_list()
```

Você devera receber a seguinte resposta:

```elixir
[1, 2, 3, "little indians"]
```

Um ponto importante que devemos notar é que nossa lista foi retornada automaticamente, isso é chamado **retorno implícito** onde o último valor da função chamada é retornado.

### POO x Programação Funcional

Se você já usou Javascript ou Ruby provavelmente já escreveu algo do tipo:

```jsx
this.myList = [1, 2, 3, "little indians"]
```

Como observamos na sessão anterior não precisamos fazer isso no Elixir, o valor simplesmente foi retornado chamando a função que estava dentro do nosso módulo. Isso é extremamente importante quando estamos falando de **Programação Funcional x** **Programação Orientada a Objeto**.

Na prática na POO você cria classes e estancia essas classes em variáveis sempre que precisa utilizar os seus métodos, na PF você atribui um valor primitivo a um método que retornara algo.

Não é possível na programação funcional criar ou estanciar classes, lembre-se: **um módulo no Elixir é apenas uma coleção de métodos e nada mais**. 

*Para se aprofundar no assunto, estou colocando aqui um link para um curso de* [Programação Funcional com Elixir](https://www.udemy.com/course/programacao-funcional-com-elixir/?utm_source=adwords&utm_medium=udemyads&utm_campaign=Webindex_Catchall_la.PT_cc.BR&utm_term=_._ag_114148736799_._ad_485704569539_._de_c_._dm__._pl__._ti_dsa-525138004927_._li_1001773_._pd__._&gclid=CjwKCAiAjoeRBhAJEiwAYY3nDCBWUhc4qrIKjNm0aOH2A6X8t9z7dIMQK2WNSnlKJTEiQ00zV5YqOhoCWu8QAvD_BwE)

### Aridade

Veja bem eu disse ARIDADE (do inglês, *Arity*) e não RARIDADE ou PARIDADE, mas o que raios é Aridade **[🤔](https://emojipedia.org/thinking-face/)**?

Vamos criar uma nova função abaixo da que criamos anteriormente chamada **shuffle:**

```elixir
def shuffle(list) do    
end
```

Agora com no IEx usaremos a palavra reservada **recompile** para recompilar nossa aplicação, basta escrever:

```elixir
recompile
```

Depois vamos testar a função que acabamos de criar:

```elixir
Basics.shuffle
```

Você verá um erro parecido com esse:

```elixir
** (UndefinedFunctionError) function Basics.shuffle/0 is undefined or private. Did you mean:
      * shuffle/1
    (basics 0.1.0) Basics.shuffle()
```

Perceba o que este log esta nos falando, ele diz que a função *Basics.shuffle* precisa de um argumento *shuffle/1, ou seja*, a função Basics.shuffle possui aridade 1.

Veja esse exemplo:

```elixir
defmodule Basics do
	def hello(), do: "Hello World"                              # hello/0
	def hello(name), do "Hello, #{name}"                        # hello/1
	def hello(name1, name2), do: "Hello, #{name1} and #{name2}" # hello/2
end

iex> Basics.hello()
"Hello World"
iex> Basics.hello("John")
"Hello, John"
iex> Basics.hello("John", "Nicole")
"Hello John and Nicole"
```

No Elixir aridade é um cidadão de [primeira classe](https://en.wikipedia.org/wiki/First-class_citizen#:~:text=In%20programming%20language%20design%2C%20a,generally%20available%20to%20other%20entities.), ou seja, podemos invocar funções sem necessariamente informar os parâmetros.

Com base no nosso exemplo podemos perceber como o Elixir percebe cada função como diferente uma da outra devido a sua aridade, ou seja, **através da aridade sabemos qual função deve ser chamada.**

Isso será muito importante no futuro quando falarmos de Pattern Matching.

Para resumir, **aridade se refere a quantidade de argumentos que uma função deve receber conforme a sua implementação** e por padrão referimos-lhe com / e o número de argumentos do lado direito.

Para se aprofundar no assunto estou colocando [um artigo da Elixir School](https://elixirschool.com/en/lessons/basics/functions/#named-functions-2).

---

## Conclusão

Nesse artigo falamos um pouco sobre Elixir, Erlang e Beam, iniciamos nossa primeira aplicação com MIX, falamos um pouco sobre programação funcional e Aridade.

No próximo artigo vamos dar mais funcionalidades para a nossa aplicação.

Te vejo em breve! ;)