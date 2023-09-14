# README

## DOCUMENTAÇÃO

Comandos recomendados antes de iniciar a aplicação:
bundle install
rails db:create
rails db:migrate
yarn install

Para iniciar o servidor pode ser usado os comandos: ./bin/dev ou rails server

## COMO FOI FEITO:
A criação do projeto se iniciou com o usuário e configuração do devise. Foi feito configuração no mailer do devise para que se pudesse enviar emails para confirmação de cadastro e emails para redefinição/recuperação de senha. Utilizei o mailcatcher para testar os emails.
Na sequência foi definido e model e migration de projetos, assim como o controller e views. Depois foi feito a integração de projetos com o git lab e adicionado uma estilização tailwind nas páginas.
Para tarefas foi seguido o mesmo padrão de projetos. Comecei definindo o model e migration de tarefas, depois foi criado e controller e as views e feito uma estilização com o tailwind.

## POMODORO

Para ultilizar o pomodoro, você deve criar um token no gitlab.
para criar seu token do gitlab voce deve acessar: https://git.raroacademy.com.br/-/profile/personal_access_tokens

em seguida copie o token gerado e cole na pasta .env-example do projeto. Em seguida renomeie o arquivo para ".env".
Feito isso, agora você poderá criar uma conta no pomodoro e após confirmar seu email, o acesso será liberado.

Criar um projeto:
Para criar um projeto é necessário ter o id dele que o gitlab fornece. Para pegar o id de um projeto, é necessario entrar no projeto escolhido no gitlab, ir em settings, depois em general, onde estarão as informações do projeto, incluindo o id.

No pomodoro, para ir para seu projeto no gitlab, basta clicar em cima da url que será redirecionado.

Para criar uma tarefa deve selecionar um dos projetos cadastrados, adicionar um nome e descrição. 
No botão abrir você poderá iniciar o contador de tempo ou pará-lo.
No botão editar, você poderá editar nome, descrição e tempo em segundos.


## GENS
gens adicionadas:
gem "devise"

gem "devise-i18n"

gem "dotenv", "~> 2.7", require: "dotenv/load"

gem "httparty"

gem "will_paginate"
