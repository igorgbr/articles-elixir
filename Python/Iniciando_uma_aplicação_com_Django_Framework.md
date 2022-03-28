Iniciando uma aplicação com Django Framework
============================================

Olá Dev tudo bem, espero que sim, agora e se eu disser que sua empresa decidiu migrar toda sua aplicação web para uma nova framework Python e você é o responsável por esse projeto? 😮

Calma! Nesse artigo eu vou te mostrar como é fácil **criar uma aplicação web do 0 com Django Framework,** borá lá!

Digamos que após anos utilizando [NodeJS no backend](https://medium.com/sequelize-a-solução-para-seus-relacionamentos-7d6756c81c17), um raio de luz [_pythonico_](https://stackoverflow.com/questions/25011078/what-does-pythonic-mean) iluminou a mente do seu líder e agora a empresa decidiu utilizar Django… A primeira coisa a fazer, ̶D̶e̶p̶o̶is̶ ̶d̶o̶ ̶d̶e̶s̶e̶s̶p̶e̶r̶o̶, é começar de algum lugar, então que tal começar com a mão na massa?

Mas antes de codar vamos instalar o **Python 3** na nossa maquina e preparar o nosso **Ambiente de Desenvolvimento.**

Instalando o Python 3
=====================

Instalar o Python é bem simples, basta acessar o [site oficial](https://www.python.org/downloads/) clicar na opção _Downloads_ e depois na opção _Source_, vamos baixar a última versão (atualmente 3.10).

O site devera reconhecer automaticamente o seu sistema operacional e fazer o download do pacote correto.

Preparando o Ambiente de Desenvolvimento e instalando o Django
==============================================================

Antes de começar de fato a levantar uma aplicação, é ideal que criemos um Ambiente de Desenvolvimento Virtual (ou _Virtual Environment_), para guardar as dependências e isolar o nosso projeto.

_(Nesse exemplo usarei um SO baseado em Linux, mas não é muito diferente no Windows ou MAC)._

Vamos criar a pasta raiz do nosso projeto, digite no Shell:

```
**$** mkdir django-project && cd django-project
```

E então vamos Instalar e depois Ativar o nosso Ambiente Virtual digitando os comandos:

```
**$** python3 -m venv env**$** source env/bin/activate
```

O seu Shell deve ficar assim: _(env) $_ indicando que seu Ambiente Virtual esta ativo!

Agora basta instalar o Django nas nossas dependências digitando o comando:

```
**$** python3 -m pip install django==3.2.5
```

Criando nosso primeiro projeto
==============================

Agora sim, estamos bem perto de iniciar nosso projeto, uma coisa que é interessante você saber é que a organização do Django é baseada em projetos que possuem seus respectivos Apps, dito isso, estando na pasta raiz e com o _venv_ ativado, vamos iniciar nosso primeiro projeto:

```
**$** django-admin startproject first-project
```

Isso criará uma estrutura de pastas que a primeira vista pode parecer um pouco confusa, mas a boa notícia é que você pode reorganizá-las da forma que você achar melhor (e muitos devs fazem isso. 😉).

Agora, para finalizar, vamos rodar nosso projeto digitando o seguinte comando:

```
**$** python3 manage.py runserver
```

No seu navegador acesse _localhost:8000_ se tudo der certo você devera ver uma tela assim:

![](https://miro.medium.com/max/1400/0*Z1Gp0-vvGPWh5d6s)

Conclusão
=========

Parabéns! Você iniciou o seu primeiro projeto Django, esse é o primeiro passo para continuarmos a migração do nosso projeto, o Django é uma framework poderosa para desenvolvimento web criada e mantida por uma comunidade extremamente ativa por isso vem sendo largamente utilizada por diversas empresas.

Nesse artigo você aprendeu a _Instalar a última versão do Python_, c_riar um ambiente virtual_ para organizar e isolar nosso projeto e _criar um projeto em Django_, o próximo passo é fazer nosso primeiro App, até breve!Iniciando uma aplicação com Django Framework
============================================

Olá Dev tudo bem, espero que sim, agora e se eu disser que sua empresa decidiu migrar toda sua aplicação web para uma nova framework Python e você é o responsável por esse projeto? 😮

Calma! Nesse artigo eu vou te mostrar como é fácil **criar uma aplicação web do 0 com Django Framework,** borá lá!

Digamos que após anos utilizando [NodeJS no backend](https://medium.com/sequelize-a-solução-para-seus-relacionamentos-7d6756c81c17), um raio de luz [_pythonico_](https://stackoverflow.com/questions/25011078/what-does-pythonic-mean) iluminou a mente do seu líder e agora a empresa decidiu utilizar Django… A primeira coisa a fazer, ̶D̶e̶p̶o̶is̶ ̶d̶o̶ ̶d̶e̶s̶e̶s̶p̶e̶r̶o̶, é começar de algum lugar, então que tal começar com a mão na massa?

Mas antes de codar vamos instalar o **Python 3** na nossa maquina e preparar o nosso **Ambiente de Desenvolvimento.**

Instalando o Python 3
=====================

Instalar o Python é bem simples, basta acessar o [site oficial](https://www.python.org/downloads/) clicar na opção _Downloads_ e depois na opção _Source_, vamos baixar a última versão (atualmente 3.10).

O site devera reconhecer automaticamente o seu sistema operacional e fazer o download do pacote correto.

Preparando o Ambiente de Desenvolvimento e instalando o Django
==============================================================

Antes de começar de fato a levantar uma aplicação, é ideal que criemos um Ambiente de Desenvolvimento Virtual (ou _Virtual Environment_), para guardar as dependências e isolar o nosso projeto.

_(Nesse exemplo usarei um SO baseado em Linux, mas não é muito diferente no Windows ou MAC)._

Vamos criar a pasta raiz do nosso projeto, digite no Shell:

```
**$** mkdir django-project && cd django-project
```

E então vamos Instalar e depois Ativar o nosso Ambiente Virtual digitando os comandos:

```
**$** python3 -m venv env**$** source env/bin/activate
```

O seu Shell deve ficar assim: _(env) $_ indicando que seu Ambiente Virtual esta ativo!

Agora basta instalar o Django nas nossas dependências digitando o comando:

```
**$** python3 -m pip install django==3.2.5
```

Criando nosso primeiro projeto
==============================

Agora sim, estamos bem perto de iniciar nosso projeto, uma coisa que é interessante você saber é que a organização do Django é baseada em projetos que possuem seus respectivos Apps, dito isso, estando na pasta raiz e com o _venv_ ativado, vamos iniciar nosso primeiro projeto:

```
**$** django-admin startproject first-project
```

Isso criará uma estrutura de pastas que a primeira vista pode parecer um pouco confusa, mas a boa notícia é que você pode reorganizá-las da forma que você achar melhor (e muitos devs fazem isso. 😉).

Agora, para finalizar, vamos rodar nosso projeto digitando o seguinte comando:

```
**$** python3 manage.py runserver
```

No seu navegador acesse _localhost:8000_ se tudo der certo você devera ver uma tela assim:

![](https://miro.medium.com/max/1400/0*Z1Gp0-vvGPWh5d6s)

Conclusão
=========

Parabéns! Você iniciou o seu primeiro projeto Django, esse é o primeiro passo para continuarmos a migração do nosso projeto, o Django é uma framework poderosa para desenvolvimento web criada e mantida por uma comunidade extremamente ativa por isso vem sendo largamente utilizada por diversas empresas.

Nesse artigo você aprendeu a _Instalar a última versão do Python_, c_riar um ambiente virtual_ para organizar e isolar nosso projeto e _criar um projeto em Django_, o próximo passo é fazer nosso primeiro App, até breve!