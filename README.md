# Auth-microservice

Este é um projeto de microserviço de autenticação. Ele fornece endpoints para registrar, autenticar e validar tokens de usuários.

## Requisitos

- **Ruby** 3.2.2
- **Rails** 7.1.4.1
- **MySQL** 8.0+
- **Docker** (opcional, para rodar via Docker)

## Instalação

1. Clone o repositório para o seu computador:
   > git clone https://github.com/vanessasouza142/auth-microservice.git
2. Navegue até o diretório do projeto: 
   > cd auth-microservice
3. Instale as dependências:
   > bundle install
5. Crie e migre o banco de dados MySQL:
   > rails db:create
   > rails db:migrate

## Executando o Servidor

1. Inicie o servidor Rails:
   > rails server -p 3001

## Documentação

A documentação da API desse projeto foi desenvolvida e pode ser acessada através do Postman.

1. Acesse a documentação no link abaixo:
   > https://documenter.getpostman.com/view/23291260/2sAXxY3oEk