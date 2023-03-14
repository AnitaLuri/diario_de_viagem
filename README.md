<h1>Projeto - Diário de Viagem</h1> 

<ul>
  <li>Ruby 3.1.3</li>
  <li>Rails 7.0.4</li>
</ul>

* Usuário administrador cadastrado:(email: 'admin@email.com', password: 'password', name: 'Anita')

* Usuário regular cadastrado:(email: 'maria@email.com', password: 'password', name: 'Maria')


<h3>Introdução</h3>
O projeto visa construir uma aplicação para praticar meus conhecimentos de programação onde um administrador poderá compartilhar as experiências e dicas  de viagem e outros usuários cadastrados poderão avaliar os lugares/ comércios e incluir comentários e notas. 

<h3>Objetivos:</h3>
<ul>
  <li>Criar o projeto Dockerizado;</li>
  <li>Ruby on Rails;</li>
  <li>Alta cobertura de testes;</li>
  <li>PostgreSQL como banco de dados; </li>
  <li>Aplicar Bootstrap;</li>
  <li>Popular seeds</li>
</ul>

<h3>Funcionalidades</h3>
  <h4>Usuário Administrador:</h4>
    <p>O usuário administrador é responsável pelas postagens, deve ser capaz de gerenciar o cadastro de Estados, gerenciar categorias de estilos de viagem, criar, editar e deletar uma postagem. </p>

  <h4> Usuário regular cadastrado: </h4>
    <p>O usuário regular cadastrado poderá postar comentários vinculados a uma postagem principal e incluir avaliações. Deve ser capaz de visualizar todas as postagens e filtrar as postagens por Estado ou Estilo.</p>

  <h4>Usuário regular não cadastrado:</h4>
    <p>Deve ser capaz de visualizar todas as postagens e filtrar as postagens por Estado ou Estilo. </p>

<h3>Como rodar a aplicação</h3>

<p align = "justify"> No terminal, clone o projeto: </p>

```
$ git clone git@github.com:AnitaLuri/diario_de_viagem.git
```

<p align = "justify"> Entre na pasta do projeto: </p>

```
$ cd diario_de_viagem-app
```

<p align = "justify"> Criar o container Docker: </p>

```
$ docker-compose build
```

<p align = "justify"> Popule a aplicação: </p>

```
$ docker-compose run --service-ports rails bash
$ rails db:seed
$ exit
```

<p align = "justify"> Visualize os testes: </p>

```
$ docker-compose run --service-ports rails bash
$ rspec
$ exit

```

<p align = "justify"> Visualize no navegador: </p>

```
$ docker-compose up
```

* Acesse http://localhost:3000/