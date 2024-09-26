# Desafio Python: API Orçamento Doméstico

Controlar os gastos de acordo com a renda disponível é fator fundamental para organização do Orçamento Doméstico, uma etapa importante nesse processo é manter um histórico detalhado de despesas, principalmente para os pequenos gastos diários. Nesse intuito você deve construir uma API REST que permita armazenar e exibir registros de despesas.

Orientações gerais:

- Uma DESPESA deve possuir os seguintes dados: Valor, Descrição, Data, Tipo de Pagamento e Categoria;
- Os TIPOS DE PAGAMENTO são: Dinheiro, Débito, Crédito, Pix;
- A listagem de DESPESAS deve mostrar apenas os registros do mês vigente;
- Não será permitido a utilização de ORMs;
- Mantenha uma separação adequada de responsabilidades;
- Utilize conceitos Programação Orientada a Objetos quando achar pertinente;

## API REST

### Endpoint

A API deverá disponibilizar um _endpoint_ que permita o cadastro e exibição de despesas:

| Verbo HTTP | Path           | Função            |
| ---------- | -------------- | ----------------- |
| GET        | /api/despesas  | Listar despesas   |
| POST       | /api/despesas  | Cadastrar despesa |

### Request body

O JSON enviado para cadastrar uma despesa deve possuir o seguinte formato:

```json
{
    "valor": float,
    "descricao": string,
    "dataCompra": string,
    "tipoPagamento": int,
    "categoria": int
}
```

### Response body

Independente da função executada (listagem ou cadastro) o JSON de retorno deve possuir o seguinte formato:

```json
{
    "data": ,
    "success": 
}
```

O valor do atributo `data` deve ser o resultado da request executada. Para a função "Listar" deve conter a lista de despesas do mês atual cadastradas no banco de dados. Para a função "Cadastrar" deve conter o ID da despesa recém inserida no banco de dados.

O atributo `success` será um booleano indicando o êxito, ou não, da função executada.

#### Exemplo de response GET /api/despesas

```json
{
    "data": [
        {
            "id": 1,
            "categoria": "alimentação",
            "dataCompra": "2022-09-05",
            "descricao": "lorem ipsum",
            "tipoPagamento": "pix",
            "valor": 89.9
        },
        {
            "id": 2,
            "categoria": "alimentação",
            "dataCompra": "2022-09-05",
            "descricao": "lorem ipsum",
            "tipoPagamento": "pix",
            "valor": 42.0
        }
    ],
    "success": true
}
```

#### Exemplo de response POST /api/despesas

```json
{
    "data": 1,
    "success": true
}
```

## Estrutura inicial

Neste repositório está a base inicial do desafio, uma aplicação Flask pronta para ser executada, após fazer o clone do projeto siga as instruções de Setup abaixo que preferir.

### Setup com Docker

No diretório raiz do projeto execute:

```sh
docker-compose up
```
Após a finalização do comando o _container_ com projeto em execução estará pronto para o uso.

### Setup "local"

Caso não utilize Docker, você precisará instalar o Python, preferencialmente a versão 3.9.7, feito isso execute o seguinte comando na raiz do projeto:

```sh
pip install -r requirements.txt
```
Obs: Talvez seja necessário trocar `pip` por `pip3` caso o comando acima não funcione.

Após instalar as dependências rode o projeto executando o seguinte comando:

```sh
python run.py
```
Obs: Talvez seja necessário trocar `python` por `python3` caso o comando acima não funcione.

### Conferindo o Setup

Independente do Setup escolhido confirme se o projeto está em execução acessando a URL http://localhost:5000/api/status. Você deve ver o seguinte resultado:

```json
{
    "status": "Service Running"
}
```

### Organização do Projeto

Os principais diretórios do projeto são `api/` e `data/`, o primeiro é onde devem estar os arquivos com sua solução, atualmente ele possui apenas o código responsável por criar a aplicação Flask e definir uma rota de _Status_. Você pode adicionar quaisquer outros arquivos que achar necessário para melhor organizar sua solução. 

A pasta `data/` é onde está o banco de dados SQLite (`data/database.db`). A estrutura do banco está pronta com as tabelas para o projeto já criadas, com dados de **categorias** e **tipos_pagamento** já preenchidos. Os demais arquivos do diretório não devem ser alterados.

### Modelo de Dados

O banco de dados foi criado com base no seguinte diagrama:

![Modelo de Dados](/data/modelo-er.png "modelo ER")