# Elixir - Setup
## Intro

Antes de começarmos é importante trazer que esse artigo faz parte de uma série de outros artigos, nos quais documentarei a minha experiência pessoal com Elixir e meus primeiros passos.

Vim recentemente do Node.js e todo mundo sabe como é simples configurar o seu setup, baixar o NPM, Snippets no VSCode, etc.

No Elixir não é tão difícil porem tive muita dificuldade de encontrar um passo a passo e acabei pulando etapas o que me deu muita dor de cabeça depois para consertar.

Dito isto, resolvi trazer um passo a passo para você configurar seu setup do zero, bora lá!

_P.S. Utilizarei o [Linux Mint](https://linuxmint.com/) e você pode adaptar para o seu SO ok?_


![code pinguim](https://media.giphy.com/media/4Zgy9QqzWU8C3ugvCa/giphy-downsized.gif)

---

## ASDF (What?)
![ASDF](https://media.giphy.com/media/yoJC2qZ23Pb8HQI08g/giphy.gif)

A primeira coisa que nos vamos instalar na nossa maquina é esse bichinho chamado [ASDF](https://asdf-vm.com/) e se você nunca ouviu falar nele faço questão de te apresentar.

ASDF e um gerenciador de máquina virtual que nós vamos utilizar para instalar o Elixir e o Erlang.

Então de um gole no café ☕ e vamos começar!

---

### Instalando ASDF-Vm.

Primeiro acesse o [site oficial](https://asdf-vm.com/).

Clique em _'Get Started'_
![ASDF Homepage](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/471m8at7561g5p7vlz3q.png)
Procure o gerenciador de pacotes para o seu SO, no meu caso como estou usando o Mint vou usar [o Aptitude](https://wiki.debian.org/Aptitude) (o famoso APT).

```Shell
apt install curl git
```
Depois disso vamos clonar o repositório do ASDF na nossa maquina.

```Shell
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
```
⚠️ **Esse passo é muito importante** ⚠️ Vamos combinar a instalação com o Shell, no meu caso como estou usando [Oh-My-ZSH](https://ohmyz.sh/) vou nessa opção:
![ZSH&Git Option](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/uvqhta22skwepm28rnwu.png)

Se você estiver utilizando Oh-My-ZSH basta seguir o passo-a-passo do [repositório do plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf).

Que é basicamente adicionar essa linha de código ao arquivo ./zshrc fechar o terminal e abri-lo novamente.

```Shell
plugins=(git asdf)
```

Caso você esteja utilizando o terminal puro vá à opção _Bash & Git_.
![Bash & Git Option](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/qanlqp9l1c000f456esa.png)
 
Basta adicionar essas duas linhas de código no arquivo ~/.bashrc fechar o terminal e abri-lo novamente.
 
```Shell
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
```

Rode o seguinte comando para testar se deu tudo certo:

```Shell
asdf --version
```

Você devera ver algo parecido com isso:

```Shell
>asdf --version
v0.9.0-9ee24a3
```
---

#### Instalando Plugin Erlang na ASDF.

Beleza 👍, com a ASDF instalada chegou a hora de instalar os plugins, vamos começar pelo Erlang.

Vamos começar rodando o seguinte comando no terminal:

```Shell
asdf plugin-add erlang
```
Após isso, precisaremos instalar algumas dependências que estão aqui [nesse repositório](https://github.com/asdf-vm/asdf-erlang).

No meu caso, como estou rodando no Mint vou buscar para Ubuntu 20:

```Shell
sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk
```
![Ubuntu 20 Erlang Plugin Dependencies](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/byt9yi662dtruhz6c9en.png)

#### Instalando Erlang

Com as dependências baixadas vamos procurar as versões do Erlang com o seguinte comando:

```Shell
asdf list-all erlang
```
Seu terminal deve ter uma lista parecida com essa:
![Erlang versions list](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/r4pt98y2q585rle2c0ce.png)

Vamos instalar a última versão estável que até o momento desse artigo é a 24.2.1:
 
```Shell
asdf install erlang 24.2.1
```

Você vera a instalação do Erlang e não se preocupe, ela demora **e realmente parece que seu computador travou, tenha calma!**
![Erlang Install Screen on Terminal](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/41t4yczfhg2qjw5q5smp.png)

#### Iniciando o Erlang

Agora com o Erlang instalado vamos rodar o comando para iniciar globalmente:

```Shell
asdf global erlang 24.2.1
```

E vamos testar abrindo o Shell do Erlang:

```Shell
erl
```

Você devera ver algo parecido com isso, basta sair dando CTRL + C duas vezes.

![Erlang Shell](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/37tckk8va018abh6r61e.png)

---

#### Instalando Plugin Elixir na ASDF.
Ufa! Cansou? Estamos acabando dá mais um gole no café e roda esse comando no terminal.

Vamos rodar o seguinte comando no terminal:

```Shell
asdf plugin-add elixir
```

Vamos ver todas as versões do Elixir assim como fizemos com Erlang:

```Shell
asdf list-all elixir
```

#### Instalando Elixir
Como instalamos o Erlang 24 temos que instalar o Elixir OTP para versão 24, a versão mais recente até o momento desse artigo é a 1.13.3-otp-24.

Vamos rodar o seguinte comando:

```Shell
asdf install elixir 1.13.3-otp-24
```

Vamos configurar o Elixir globalmente, assim como fizemos com o Erlang:

```Shell
asdf global elixir 1.13.3-otp-24
```

#### Iniciando o Elixir
Vamos testar se deu tudo certo rodando o IEX:

```Shell
iex
```

Você deverá ver algo parecido com isso:
![Elixir Shell Screen](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/el4s1wudkvgpflb8hvla.png)

#### Hello World!
![Hello World Keanu Reves](https://media.giphy.com/media/PnUatAYWMEMvmiwsyx/giphy-downsized.gif)
 
E para começar do jeito certo, não se esqueça de não cair na maldição do Hello World, rodando o seguinte comando no IEX:

```Elixir
IO.puts("Hello World")
```

---

## Be Cool with Livebook
![coding gif](https://media.giphy.com/media/hOzfvZynn9AK4/giphy.gif)
O Livebook é parecido com o [Jupyter Notebook](https://jupyter.org/) do Python, é uma forma de você aplicar, documentar e testar códigos Elixir e salvar seus arquivos MD.

### Instalando Livebook
A primeira coisa que vamos fazer é ir até o [repositório do Livebook](https://github.com/livebook-dev/livebook).

Como já estamos com o Elixir instalado globalmente vamos rodar o seguinte comando.

```Shell
mix escript.install hex livebook # mix é um comando global do Elixir
```
A instalação pode demorar um pouco e pedira algumas confirmações no processo, no final ele perguntara se você quer realmente instalar o livebook, vamos responder Y.

Feito isso, como estamos rodando o ASDF precisamos usar o RESHIM para reconhecer os novos comandos.

```Shell
asdf reshim
```

Por fim podemos iniciar o Livebook com o seguinte comando.

```Shell
livebook server
```

Ele rodara na porta 8080 na sua localhost.
![Livebook local homepage](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/mnppwc34w31d6s68m8zv.png)

---

## Conclusão
Nesse artigo aprendemos a instalar e configurar a ASDF-VM para rodar o Erlang e o Elixir e instalar o Livebook local.

Até a próxima!

![Phoenix GIF](https://media.giphy.com/media/NpXecaHPKbdVm/giphy.gif)

