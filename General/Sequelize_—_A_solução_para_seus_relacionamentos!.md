Sequelize — A solução para seus relacionamentos!
================================================

![A notebook with datacodes and a cloud representation](https://miro.medium.com/max/1400/1*kTtc79r-fbjbPH-EtNvEYg.jpeg)

1 — Introdução
==============

Se você esta aqui provavelmente você ja conhece essa fácil e dinâmica biblioteca ORM.

Caso não conheça, não se preocupe! [Nesse artigo](https://medium.com/direto-ao-ponto-o-que-é-crud-2c41b48fafee) eu explico de forma bem tranquila o que é um CRUD e [nesse video](https://https//www.youtube.com/watch?v=-FGCjfR9HFk&t=459s) um passo-a-passo de como fazer um CRUD usando Sequelize, se você for mais de artigos do que videos [esse aqui](https://blog.rocketseat.com.br/nodejs-express-sequelize/) é para você!

Nesse artigo vamos focar em como fazer relacionamentos entre tabelas, usando [Node.JS](https://nodejs.org/en/) e [Sequelize](https://sequelize.org/), então bora!

2 — Tipos de relacionamento
===========================

O Sequelize é compatível com as associações padrão:

*   1 para 1
*   1 para N
*   N para N

Os métodos de criação de relacionamentos são:

*   **hasOne** (tem um)
*   **belongsTo** (pertence a)
*   **hasMany** (tem muitos)
*   **belongsToMany** (pertence a muitos)

3 — Relacionamento de 1:1 (Eu tenho um 😍 — eu pertenço a um 😍)
================================================================

Vamos usar as seguintes tabelas de exemplo:

![](https://miro.medium.com/max/1400/0*mZiI8dnRJBJkbXc4.png)

Nesse caso, cada Pessoa pode ter somente um Crusher (um caso comum onde as pessoas preferem ser mais conservadoras em seu relacionamento).

Nesse caso o model de **Persons**, devera ser dessa maneira:

```
module.exports = (sequelize, DataTypes) => {  
  const Person = sequelize.define('Person', {  
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },  
    name: DataTypes.STRING,  
    surname: DataTypes.STRING,  
  },  
  {  
    timestamps: false,  
    tableName: 'Persons',  
  });  
   
  Person.associate = (models) => {  
    Person.hasOne(models.Crusher,  
      { foreignKey: 'person\_id', as: 'crushers' });  
  };  
   
  return Person;  
};
```

A função `Person.associate = () => {}` ira guardar as associações desse model, nesse caso a nossa tabela **_Pessoa_** _possui uma_ **_Crush_**, referenciado pela foreignKey `person_id` e que deve ser chamado de `crushers`.

Agora no model **Crush** fazemos o caminho contrário:

```
module.exports = (sequelize, DataTypes) => {  
  const Crush = sequelize.define('Crush', {  
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },  
    name: DataTypes.STRING,  
    surname: DataTypes.STRING,  
    crusher\_id: {type: DataTypes.INTEGER, foreignKey: true}  
  },  
  {  
    timestamps: false,  
    tableName: 'Crushs',  
  });  
   
  Crush.associate = (models) => {  
    Crush.belongsTo(models.Person,  
      { foreignKey: 'person\_id', as: 'persons' });  
  };  
   
  return Crush;  
};
```

Agora estamos declarando que **_Crush_** _pertence a uma_ **_Pessoa_**!

Podemos testar nosso relacionamento da seguinte forma, com Express e Node.js (caso você não saiba iniciar uma aplicação no Node.js com [Express](https://expressjs.com/pt-br/) veja [este video](https://www.youtube.com/watch?v=-FGCjfR9HFk&t=459s))

No seu arquivo `index.js` insira o seguinte código e rode a aplicação:

```
const express = require('express');  
const { Person, Crusher } = require('./models');  
   
const app = express();  
   
app.get('/persons', async (\_req, res) => {  
  try {  
    const persons = await Person.findAll({  
      include: { model: Crusher, as: 'crushers' },  
    });  
   
    return res.status(200).json(persons);  
  } catch (e) {  
    console.log(e.message);  
    res.status(500).json({ message: 'Ocorreu um erro' });  
  };  
});  
   
const PORT = 3000;  
app.listen(PORT, () => console.log(\`Ouvindo na porta ${PORT}\`));
```

Dessa vez estamos adicionando o campo `include` que dirá ao Sequelize qual a configuração da associação, chamando o Model necessário e o 'as:' assim como declaramos na criação desse Model.

Agora fica fácil!

3 — Relacionamento de 1:N (Eu + os contatinhos 😍😍😍 + eles são só meus! 😠)
=============================================================================

Uma modalidade de relacionamento também conhecida como, modalidade MC Catra (ou para os mais novinhos, modalidade [_‘Oh Juliana o que tu qué de mim?’_](https://www.youtube.com/watch?v=Tun92VU2OkU)), onde no caso **_uma pessoa_** pode ter **_vários crushes_**.

Vamos alterar o Model **Person** para nosso cliente, possessivo.

```
module.exports = (sequelize, DataTypes) => {  
  const Person = sequelize.define('Person', {  
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },  
    name: DataTypes.STRING,  
    surname: DataTypes.STRING,  
  },  
  {  
    timestamps: false,  
    tableName: 'Persons',  
  });  
   
  Person.associate = (models) => {  
    Person.hasMany(models.Crusher,  
      { foreignKey: 'person\_id', as: 'crushers' });  
  };  
   
  return Person;  
};
```

Agora **uma pessoa** pode ter **vários crushs**.

Ei, mas não temos que mudar o Model de Crushs? Nesse caso não! Pois, em um relacionamento de 1:N vários Crushs ainda pertencem a Uma pessoa o que justifica o uso do **belongsTo**.

4 — Relacionamento de N:N (Eu + os contatinhos 😍😍😍 depois da terapia 😌)
===========================================================================

Esse é o momento onde as coisas ficam um pouco mais complicadas mais, calma! Liga [aquela playlist](https://www.youtube.com/watch?v=EogJHhZwBPQ) de Tim Maia Lofi que você [já conhece](http://https//tableless.com.br/ux-ui-skething-nas-rotas-do-design/)!

Nosso cliente assim como Raul Seixas, deu um migué, cantou: _‘Amor só dura em liberdade, o ciúme é só vaidade, sofro, mas eu vou te libertar!’_

E agora os contatinhos também podem ter contatinhos!

Então nossa tabela **Persons**, _pode possuir vários_ **Crushs** E **Crushs** _podem pertencer a várias_ **Persons**.

Como a gente faz isso, na prática? Bora!

Agora temos que ter mais uma tabela de ligação para fazer esse relacionamento, na prática, um relacionamento de N:N são dois relacionamentos de 1:N em uma tabela de ligação.

Como você pode ver na imagem:

![](https://miro.medium.com/max/1400/0*5Q9MyBITo-sO5BVS.png)

Agora temos 3 tabelas, **Persons**, **Persons\_crushers**, **Crushers**

A tabela **Persons** guardara as informações de cada Pessoa  
A tabela **Crushers** guardara as informações de cada Crusher  
E a tabela **Persons\_crushers** guardara os relacionamentos entre essas duas tabelas onde uma pessoa poderá ter vários crushes e um crush poderá pertencer a várias pessoas, sendo assim podemos chamar Person\_crushers de **Tabela de Junção**!

Agora vamos para prática (e alterar o destino da felicidade de várias pessoas 😄)!

Primeiro vamos alterar o model de **Person**:

```
module.exports = (sequelize, DataTypes) => {  
  const Person = sequelize.define('Person', {  
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },  
    name: DataTypes.STRING,  
    surname: DataTypes.STRING,  
  },  
  {  
    timestamps: false,  
    tableName: 'Persons',  
  });  
   
  return Person;  
};
```

Depois o model de **Crush**:

```
module.exports = (sequelize, DataTypes) => {  
  const Crush = sequelize.define('Crush', {  
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },  
    name: DataTypes.STRING,  
    surname: DataTypes.STRING,  
    crusher\_id: {type: DataTypes.INTEGER, foreignKey: true}  
  },  
  {  
    timestamps: false,  
    tableName: 'Crushs',  
  });  
   
  return Crush;  
};
```

Até agora nada de novo, nós alteramos as tabelas logo tiramos a função associate. A grande diferença virá aqui!

Vamos criar o model de **PersonCrushs**:

```
module.exports = (sequelize, \_DataTypes) => {  
  const PersonCrush = sequelize.define('PersonCrush',  
    {},  
    { timestamps: false },  
  );  
   
  PersonCrush.associate = (models) => {  
    models.Crush.belongsToMany(models.Person, {  
      as: 'persons',  
      through: PersonCrush,  
      foreignKey: 'crush\_id',  
      otherKey: 'person\_id',  
    });  
    models.Person.belongsToMany(models.Crush, {  
      as: 'crushers',  
      through: PersonCrush,  
      foreignKey: 'person\_id',  
      otherKey: 'crusher\_id',  
    });  
  };  
   
  return PersonCrush;  
};
```

E aqui vemos a mágica do Sequelize acontecendo, não precisamos passar nenhum atributo para o modelo de PersonCrush justamente porque estamos informando que PersonCrush é uma tabela de ligação, na chave `through` estamos informando qual o Model que servira como tabela de associação.  
Chamamos `'as:'` como nome dessa associação e por último os campos que dizem ao Sequelize como faze la `foreignKey` e a `otherKey`.

Agora para testarmos nossa aplicação, vamos ao Node!

```
const { Crush, Person } = require('./models');  
// ...  
app.get('/personcrusher/:id', async (req, res) => {  
  try {  
    const { id } = req.params;  
    const person = await Person.findOne({  
      where: { personId: id },  
      include: \[{ model: Crush, as: 'crush', through: { attributes: \[\] } }\],  
    });  
   
    if (!person)  
      return res.status(404).json({ message: 'Usuário não encontrado' });  
   
    return res.status(200).json(person);  
  } catch (e) {  
    console.log(e.message);  
    res.status(500).json({ message: 'Algo deu errado' });  
  };  
});
```

Para finalizar faça uma requisição do tipo GET para este endpoint passando como parâmetro o ID de um usuário existente.

Faça um teste tirando a opção attributes e veja a diferença!

Conclusão
=========

Assim conseguimos de forma rápida fazer associação entre tabelas o que daria muito trabalho se tivéssemos que fazer na mão.  
A [documentação](https://sequelize.org/master/manual/assocs.html) do Sequelize trata as associações de forma detalhada e é referência obrigatória na hora de criar sua aplicação, no próximo artigo falarei um pouco sobre _Eager Loading_ e _Lazy Loading_, até lá!Sequelize — A solução para seus relacionamentos!
================================================

![A notebook with datacodes and a cloud representation](https://miro.medium.com/max/1400/1*kTtc79r-fbjbPH-EtNvEYg.jpeg)

1 — Introdução
==============

Se você esta aqui provavelmente você ja conhece essa fácil e dinâmica biblioteca ORM.

Caso não conheça, não se preocupe! [Nesse artigo](https://medium.com/direto-ao-ponto-o-que-é-crud-2c41b48fafee) eu explico de forma bem tranquila o que é um CRUD e [nesse video](https://https//www.youtube.com/watch?v=-FGCjfR9HFk&t=459s) um passo-a-passo de como fazer um CRUD usando Sequelize, se você for mais de artigos do que videos [esse aqui](https://blog.rocketseat.com.br/nodejs-express-sequelize/) é para você!

Nesse artigo vamos focar em como fazer relacionamentos entre tabelas, usando [Node.JS](https://nodejs.org/en/) e [Sequelize](https://sequelize.org/), então bora!

2 — Tipos de relacionamento
===========================

O Sequelize é compatível com as associações padrão:

*   1 para 1
*   1 para N
*   N para N

Os métodos de criação de relacionamentos são:

*   **hasOne** (tem um)
*   **belongsTo** (pertence a)
*   **hasMany** (tem muitos)
*   **belongsToMany** (pertence a muitos)

3 — Relacionamento de 1:1 (Eu tenho um 😍 — eu pertenço a um 😍)
================================================================

Vamos usar as seguintes tabelas de exemplo:

![](https://miro.medium.com/max/1400/0*mZiI8dnRJBJkbXc4.png)

Nesse caso, cada Pessoa pode ter somente um Crusher (um caso comum onde as pessoas preferem ser mais conservadoras em seu relacionamento).

Nesse caso o model de **Persons**, devera ser dessa maneira:

```
module.exports = (sequelize, DataTypes) => {  
  const Person = sequelize.define('Person', {  
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },  
    name: DataTypes.STRING,  
    surname: DataTypes.STRING,  
  },  
  {  
    timestamps: false,  
    tableName: 'Persons',  
  });  
   
  Person.associate = (models) => {  
    Person.hasOne(models.Crusher,  
      { foreignKey: 'person\_id', as: 'crushers' });  
  };  
   
  return Person;  
};
```

A função `Person.associate = () => {}` ira guardar as associações desse model, nesse caso a nossa tabela **_Pessoa_** _possui uma_ **_Crush_**, referenciado pela foreignKey `person_id` e que deve ser chamado de `crushers`.

Agora no model **Crush** fazemos o caminho contrário:

```
module.exports = (sequelize, DataTypes) => {  
  const Crush = sequelize.define('Crush', {  
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },  
    name: DataTypes.STRING,  
    surname: DataTypes.STRING,  
    crusher\_id: {type: DataTypes.INTEGER, foreignKey: true}  
  },  
  {  
    timestamps: false,  
    tableName: 'Crushs',  
  });  
   
  Crush.associate = (models) => {  
    Crush.belongsTo(models.Person,  
      { foreignKey: 'person\_id', as: 'persons' });  
  };  
   
  return Crush;  
};
```

Agora estamos declarando que **_Crush_** _pertence a uma_ **_Pessoa_**!

Podemos testar nosso relacionamento da seguinte forma, com Express e Node.js (caso você não saiba iniciar uma aplicação no Node.js com [Express](https://expressjs.com/pt-br/) veja [este video](https://www.youtube.com/watch?v=-FGCjfR9HFk&t=459s))

No seu arquivo `index.js` insira o seguinte código e rode a aplicação:

```
const express = require('express');  
const { Person, Crusher } = require('./models');  
   
const app = express();  
   
app.get('/persons', async (\_req, res) => {  
  try {  
    const persons = await Person.findAll({  
      include: { model: Crusher, as: 'crushers' },  
    });  
   
    return res.status(200).json(persons);  
  } catch (e) {  
    console.log(e.message);  
    res.status(500).json({ message: 'Ocorreu um erro' });  
  };  
});  
   
const PORT = 3000;  
app.listen(PORT, () => console.log(\`Ouvindo na porta ${PORT}\`));
```

Dessa vez estamos adicionando o campo `include` que dirá ao Sequelize qual a configuração da associação, chamando o Model necessário e o 'as:' assim como declaramos na criação desse Model.

Agora fica fácil!

3 — Relacionamento de 1:N (Eu + os contatinhos 😍😍😍 + eles são só meus! 😠)
=============================================================================

Uma modalidade de relacionamento também conhecida como, modalidade MC Catra (ou para os mais novinhos, modalidade [_‘Oh Juliana o que tu qué de mim?’_](https://www.youtube.com/watch?v=Tun92VU2OkU)), onde no caso **_uma pessoa_** pode ter **_vários crushes_**.

Vamos alterar o Model **Person** para nosso cliente, possessivo.

```
module.exports = (sequelize, DataTypes) => {  
  const Person = sequelize.define('Person', {  
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },  
    name: DataTypes.STRING,  
    surname: DataTypes.STRING,  
  },  
  {  
    timestamps: false,  
    tableName: 'Persons',  
  });  
   
  Person.associate = (models) => {  
    Person.hasMany(models.Crusher,  
      { foreignKey: 'person\_id', as: 'crushers' });  
  };  
   
  return Person;  
};
```

Agora **uma pessoa** pode ter **vários crushs**.

Ei, mas não temos que mudar o Model de Crushs? Nesse caso não! Pois, em um relacionamento de 1:N vários Crushs ainda pertencem a Uma pessoa o que justifica o uso do **belongsTo**.

4 — Relacionamento de N:N (Eu + os contatinhos 😍😍😍 depois da terapia 😌)
===========================================================================

Esse é o momento onde as coisas ficam um pouco mais complicadas mais, calma! Liga [aquela playlist](https://www.youtube.com/watch?v=EogJHhZwBPQ) de Tim Maia Lofi que você [já conhece](http://https//tableless.com.br/ux-ui-skething-nas-rotas-do-design/)!

Nosso cliente assim como Raul Seixas, deu um migué, cantou: _‘Amor só dura em liberdade, o ciúme é só vaidade, sofro, mas eu vou te libertar!’_

E agora os contatinhos também podem ter contatinhos!

Então nossa tabela **Persons**, _pode possuir vários_ **Crushs** E **Crushs** _podem pertencer a várias_ **Persons**.

Como a gente faz isso, na prática? Bora!

Agora temos que ter mais uma tabela de ligação para fazer esse relacionamento, na prática, um relacionamento de N:N são dois relacionamentos de 1:N em uma tabela de ligação.

Como você pode ver na imagem:

![](https://miro.medium.com/max/1400/0*5Q9MyBITo-sO5BVS.png)

Agora temos 3 tabelas, **Persons**, **Persons\_crushers**, **Crushers**

A tabela **Persons** guardara as informações de cada Pessoa  
A tabela **Crushers** guardara as informações de cada Crusher  
E a tabela **Persons\_crushers** guardara os relacionamentos entre essas duas tabelas onde uma pessoa poderá ter vários crushes e um crush poderá pertencer a várias pessoas, sendo assim podemos chamar Person\_crushers de **Tabela de Junção**!

Agora vamos para prática (e alterar o destino da felicidade de várias pessoas 😄)!

Primeiro vamos alterar o model de **Person**:

```
module.exports = (sequelize, DataTypes) => {  
  const Person = sequelize.define('Person', {  
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },  
    name: DataTypes.STRING,  
    surname: DataTypes.STRING,  
  },  
  {  
    timestamps: false,  
    tableName: 'Persons',  
  });  
   
  return Person;  
};
```

Depois o model de **Crush**:

```
module.exports = (sequelize, DataTypes) => {  
  const Crush = sequelize.define('Crush', {  
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },  
    name: DataTypes.STRING,  
    surname: DataTypes.STRING,  
    crusher\_id: {type: DataTypes.INTEGER, foreignKey: true}  
  },  
  {  
    timestamps: false,  
    tableName: 'Crushs',  
  });  
   
  return Crush;  
};
```

Até agora nada de novo, nós alteramos as tabelas logo tiramos a função associate. A grande diferença virá aqui!

Vamos criar o model de **PersonCrushs**:

```
module.exports = (sequelize, \_DataTypes) => {  
  const PersonCrush = sequelize.define('PersonCrush',  
    {},  
    { timestamps: false },  
  );  
   
  PersonCrush.associate = (models) => {  
    models.Crush.belongsToMany(models.Person, {  
      as: 'persons',  
      through: PersonCrush,  
      foreignKey: 'crush\_id',  
      otherKey: 'person\_id',  
    });  
    models.Person.belongsToMany(models.Crush, {  
      as: 'crushers',  
      through: PersonCrush,  
      foreignKey: 'person\_id',  
      otherKey: 'crusher\_id',  
    });  
  };  
   
  return PersonCrush;  
};
```

E aqui vemos a mágica do Sequelize acontecendo, não precisamos passar nenhum atributo para o modelo de PersonCrush justamente porque estamos informando que PersonCrush é uma tabela de ligação, na chave `through` estamos informando qual o Model que servira como tabela de associação.  
Chamamos `'as:'` como nome dessa associação e por último os campos que dizem ao Sequelize como faze la `foreignKey` e a `otherKey`.

Agora para testarmos nossa aplicação, vamos ao Node!

```
const { Crush, Person } = require('./models');  
// ...  
app.get('/personcrusher/:id', async (req, res) => {  
  try {  
    const { id } = req.params;  
    const person = await Person.findOne({  
      where: { personId: id },  
      include: \[{ model: Crush, as: 'crush', through: { attributes: \[\] } }\],  
    });  
   
    if (!person)  
      return res.status(404).json({ message: 'Usuário não encontrado' });  
   
    return res.status(200).json(person);  
  } catch (e) {  
    console.log(e.message);  
    res.status(500).json({ message: 'Algo deu errado' });  
  };  
});
```

Para finalizar faça uma requisição do tipo GET para este endpoint passando como parâmetro o ID de um usuário existente.

Faça um teste tirando a opção attributes e veja a diferença!

Conclusão
=========

Assim conseguimos de forma rápida fazer associação entre tabelas o que daria muito trabalho se tivéssemos que fazer na mão.  
A [documentação](https://sequelize.org/master/manual/assocs.html) do Sequelize trata as associações de forma detalhada e é referência obrigatória na hora de criar sua aplicação, no próximo artigo falarei um pouco sobre _Eager Loading_ e _Lazy Loading_, até lá!