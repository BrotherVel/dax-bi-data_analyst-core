USE AdventureWorksDW2025

-- JOIN --

/*
O JOIN é responsável por juntar itens de duas tabelas de forma ordenada e organizada com base em uma referência comum entre ambos.
Desta forma é possível conectar tabelas através de suas colunas "chave" (keys).

Info: Essa capacidade é muito poderosa para conectar tabelas fato (que representam a acontecimentos) em tabelas dimensão (informações complementares).
Para otimizar armazenamento de uma banco de dados, uma tabela fato não armazena informações específicas das caracteríscas de cada acontecimento.
ao invés disso, ela armazena apenas um código chave (keys) que pode ser interligado com uma tabela dimenção com as características especificas associadas à aquele código
*/

-- INNER JOIN --

-- O 'INNER JOIN' junta duas tabelas seguindo as colunas de referência, trazendo apenas os ítens em comum em AMBAS colunas.

SELECT FS.ProductKey
	,FS.OrderDate
	,DP.EnglishProductName AS 'Name'
	,FS.OrderQuantity AS 'Quantity'
	,FS.SalesAmount
	,DP.Class
	,DP.EnglishDescription AS 'Description'
	,DP.Color
FROM FactInternetSales as FS -- Tabela fato
INNER JOIN DimProduct as DP -- Tabela dimensão
ON FS.ProductKey = DP.ProductKey -- Conexão de colunas chave (keys)
ORDER BY FS.ProductKey ASC;

/*
Quando as tabelas estão juntas, é necessário identificar a qual tabela pertece cada coluna ser mensionada na query.
Por isso é uma boa prática o uso do Alias (AS) na identificação das respectivas tabelas.
O 'ON' no JOIN define quais são as colunas chave que serão ligadas.
*/

-- Todas as possibilidades de manipulção de query estão disponíveis com o JOIN, incluíndo outros JOINS

SELECT FS.ProductKey
	,FS.OrderDate
	,DP.EnglishProductName AS 'Name'
	,FS.OrderQuantity AS 'Quantity'
	,FS.SalesAmount
	,DP.Class
	,DP.EnglishDescription AS 'Description'
	,DP.Color
	,DP.ProductSubcategoryKey
	,DPSub.EnglishProductSubcategoryName AS 'Subcategory_Name'
FROM FactInternetSales as FS
INNER JOIN DimProduct as DP -- Primeira conexão 
ON FS.ProductKey = DP.ProductKey
INNER JOIN DimProductSubcategory AS DPSub -- Segunda conexão
ON DP.ProductSubcategoryKey = DPSub.ProductSubcategoryKey
WHERE FS.SalesAmount > 1000 -- Filto com WHERE
ORDER BY FS.SalesAmount DESC; -- Ordenação com ORDER BY

-- JOIN com GROUP BY

SELECT DPSub.EnglishProductSubcategoryName AS 'Subcategory_Name'
	,ROUND(SUM(FS.SalesAmount),2) AS 'Total'
FROM FactInternetSales as FS
INNER JOIN DimProduct as DP
ON FS.ProductKey = DP.ProductKey
INNER JOIN DimProductSubcategory AS DPSub
ON DP.ProductSubcategoryKey = DPSub.ProductSubcategoryKey
GROUP BY DPSub.EnglishProductSubcategoryName
ORDER BY total DESC;

-- Subcategoria lider de vendas em produtos abaixo de $500,00

SELECT DPSub.EnglishProductSubcategoryName AS 'Subcategory_Name'
	,ROUND(SUM(FS.SalesAmount),2) AS 'Total'
FROM FactInternetSales as FS
INNER JOIN DimProduct as DP
ON FS.ProductKey = DP.ProductKey
INNER JOIN DimProductSubcategory AS DPSub
ON DP.ProductSubcategoryKey = DPSub.ProductSubcategoryKey
WHERE DP.ListPrice < 500
GROUP BY DPSub.EnglishProductSubcategoryName
ORDER BY total DESC;