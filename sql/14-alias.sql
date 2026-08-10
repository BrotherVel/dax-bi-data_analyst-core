use AdventureWorksDW2025

/*
O ALIAS, utilizado adicionando apenas o 'AS', serve para definir ou renomear o nome das colunas
*/

SELECT SUM(SalesAmount)
	,AVG(SalesAmount)
	,MAX(SalesAmount)
	,MIN(SalesAmount)
FROM FactInternetSales; -- Ao adiconar as opeções a colunas não ficam nomeadas

-- Com o ALIAS é possivel nomear individualmente essas colunas

SELECT SUM(SalesAmount) as SUM
	,AVG(SalesAmount) as AVG
	,MAX(SalesAmount) as MAX
	,MIN(SalesAmount) as MIN
FROM FactInternetSales; 

-- Também é possivel renomear colunas

SELECT FirstName AS [Primeiro Nome] -- colchetes '[ ]' simples para nome compóstos
	,LastName AS Sobrenome
FROM DimCustomer;