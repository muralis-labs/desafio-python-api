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

### Response body

Independente da função executada (listagem ou cadastro) o JSON de retorno deve possuir o seguinte formato:

```json
{
    "data": null,
    "success": true
}
```

O valor do atributo `data` deve ser o resultado da request executada. Para a função "Listar" deve conter a lista de despesas cadastradas no banco de dados. Para a função "Cadastrar" deve conter o ID da despesa recém inserida no banco de dados.

O atributo `success` será um booleano indicando o êxito, ou não, da função executada.

## Estrutura inicial

Neste repositório está a base inicial do desafio, uma aplicação Flask pronta para ser executada, após fazer o clone do projeto siga as instruções de Setup abaixo que preferir.

### Setup com Docker

No diretório raiz do projeto execute:

```sh
> docker-compose up
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

Os principais diretórios do projeto são `api/` e `data/`, o primeiro é onde devem estar os arquivos com sua solução, atualmente ele possui apenas o código responsável por criar a aplicação Flask e definir uma rota de _Status_. Você pode adicionar quaisquer outros arquivos que achar necessário para melhor organizar sua solução. A pasta `data/` é onde está o banco de dados (SQLite) com as tabelas para o projeto já criadas.
