# Desafio Python: API Orçamento Doméstico

Controlar os gastos de acordo com a renda disponível é fator fundamental para organização do Orçamento Doméstico, uma etapa importante nesse processo é manter um histórico detalhado de despesas, principalmente para os pequenos gastos diários. Nesse intuito você deve construir uma API REST que permita armazenar e exibir registros de despesas.

Orientações gerais:

- Uma DESPESA deve possuir os seguintes dados: Valor, Descrição, Data, Tipo de Pagamento e Categoria;
- Os TIPOS DE PAGAMENTO são: Dinheiro, Débito, Crédito, Pix;
- Utilizar banco de dados SQLite;
- Não será permitido a utilização de ORMs;
- Mantenha uma separação adequada de reponsabilidades;
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
    "data": [],
    "success": true
}
```

O valor do atributo `data` deve ser o resultado da request executada. Para a função "Listar" deve conter a lista de despesas cadastradas no banco de dados. Para a função "Cadastrar" deve conter o ID da despesa recém inserida no banco de dados.

O atributo `success` será um booleano indicando o êxito, ou não, da função executada.

## Estrutura inicial

