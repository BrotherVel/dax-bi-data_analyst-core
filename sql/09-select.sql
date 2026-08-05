use AdventureWorksDW2025 -- Banco de dados escolhido para exemplificar os estudos

/*
SELECT – Usamos para identificar as colunas presentes nas tabelas pelo nome, que devem ser especificadas logo após o comando;
FROM – Seleciona qual tabela será consultada.
*/

SELECT * -- Selecionar todas as colunas
FROM dbo.FactInternetSales; -- define qual tabela (data set) será consultado

-- Selecionar colunas específicas:

SELECT SalesOrderNumber, CustomerKey, UnitPrice, OrderQuantity, SalesAmount -- colunas específicas
FROM dbo.FactInternetSales;

-- Selecionar valores distintos:

/* DISTINCT – Retira todas as repetições dos itens da coluna selecionada, retornando somente uma lista com um de cada */

SELECT DISTINCT CustomerKey
FROM dbo.FactInternetSales;

/*
Sem o distinct são 60.398 linhas, entretanto com o distinct são apenas 18.484 linhas;
INSIGHT -> Isso significa que as 60 mil incidencias de vendas na tabela fato foram feitas a aproximadamete 18 mil custumers.
*/

-- Operações simples no SELECT:

/* No “SELECT” podemos somar (+), subtrair (-), multiplicar (*) ou até dividir (/) duas colunas selecionadas de forma simples. */

SELECT SalesAmount - TotalProductCost -- Subtrai a receita pelo valor de custo de produção
FROM dbo.FactInternetSales;

/* Assim foi possível obter o valor do lucro sobre cada venda de forma simplificada */

-- TOP:

/* 
TOP – Pode ser adicionado após o 'SELECT' e tem a função de limitar a quantidade de resultados da pesquisa. 
Basta definir a quantidade numérica logo antes da especificação da coluna a ser pesquisada;
*/

SELECT TOP 10 SalesAmount -- traz apenas 10 itens da tabela
FROM dbo.FactInternetSales;

-- TOP WITH TIES:

/*
Faz o mesmo que o “TOP” mas mantem na tabela todas as linhas que possuem dados semelhantes (empatados).
*/

SELECT TOP 10 WITH TIES
	CustomerKey
FROM dbo.FactInternetSales
ORDER BY 1 ASC; -- OBS: o TOP WITH TIES exige obrigatóriamente um ORDER BY

-- Ocorreu de o resultado desta query trazer 19 itens devido a esses "empates".