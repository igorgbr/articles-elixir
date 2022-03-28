Direto ao ponto: O que é CRUD?
==============================

![](https://miro.medium.com/max/1400/1*hT0650uAynINJMeIftDj-g.png)CRUD — Create Read Update Delete

A alguns anos quando eu ainda não tinha ideia do que era criar um sistema  
eu trabalhava no setor de EAD de uma faculdade, e uma colega do setor de TI falou sobre criar um **_CRUD_.**

Ela falou tão naturalmente como se fosse algo tão simples que eu não tive coragem de perguntar o que significava.

Foi somente depois de aprender a programar, aprender linguagem _SQL_ e criar meu primeiro sistema que fui entender definitivamente o que era um _CRUD_.

Então não sinta vergonha se você não souber ainda o que é isso, porque hoje você vai aprender!

Afinal, o que é CRUD?
=====================

_CRUD_ literalmente significa _Create_, _Read_, _Update_ e _Delete_, fim.

Sério é só isso, tão simples quanto parece, é que assim como todas as áreas a nossa também tem suas terminologias que as vezes significam algo muito mais simples do que parece (exemplo: _framework_, ciclo de vida do componente, implantação x implementação, etc…)

Mas apesar de ser simples o _CRUD_ é muito importante, pois ele representa as 4 operações básicas de um sistema.

Por exemplo vamos imaginar um sistema bem básico, de lista telefônica.

![celular com lista telefonica aberta](https://miro.medium.com/max/642/1*09vqKJ8F5HXODo2bRvupiw.png)

O nossos sistema deve dar a opção de **criar** um novo contato. (**_Create_**).

Também deve dar a opção de buscarmos, ou seja **ler** um contato existente (**_Read_**).

Caso queiramos também temos que conseguir **atualizar** um contato existente (**_Update_**).

E também temos que ter a opção de **excluir** qualquer contato (**_Delete_**).

Por ser algo tão usado no dia a dia dos programadores, existem varias bibliotecas que ajudam nessa tarefa, uma delas é o **_Sequelize_**  
uma biblioteca **ORM**, ou seja para bancos relacionais, como mySQL, postgree, MariaDB, etc. , que auxilia a integração do banco de dados com o _backend_.

No meu canal eu dou um curso completo de introdução ao _Sequelize_, com aulas semanais onde criaremos um _CRUD_ usando essa biblioteca com **Node.js** e **MySQL**.