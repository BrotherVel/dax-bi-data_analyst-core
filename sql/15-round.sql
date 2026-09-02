use AdventureWorksDW2025

SELECT ROUND(SalesAmount, 1) AS Coluna_Arredondada -- define a coluna e a quantidade de casa decimais para ser arrendodado
	,SalesAmount
FROM dbo.FactInternetSales;

SELECT ROUND(SalesAmount, 0) AS Coluna_Arredondada
	,SalesAmount
FROM dbo.FactInternetSales;