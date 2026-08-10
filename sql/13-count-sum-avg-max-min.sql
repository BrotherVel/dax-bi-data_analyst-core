use AdventureWorksDW2025

/*
O COUNT retorna a quantidade de ítens de uma coluna coluna da tabela
*/

SELECT COUNT(FirstName) 
FROM DimCustomer; -- Conta a quantidade de nomes na tabela 'DimCostumer'

/*
Para contar a quantidade de valores distintos é possivel combinar o COUNT com o DISTINCT
*/

SELECT COUNT(DISTINCT FirstName) 
FROM DimCustomer; -- Trás uma contagem apenas dos nomes diferentes presentes na tabela 

-- OPERAÇÕES BÁSICAS (SUM, AVG, MIN, MAX):

-- SUM
SELECT SUM(SalesAmount)
FROM FactInternetSales; -- Traz a soma total dos valores da coluna 'SalesAmount'

-- AVG

SELECT AVG(SalesAmount)
FROM FactInternetSales; -- Traz a média dos valores da coluna 'SalesAmount'

-- MAX

SELECT MAX(SalesAmount)
FROM FactInternetSales; -- Traz o maior valor da coluna 'SalesAmount'

-- MIN 

SELECT MIN(SalesAmount)
FROM FactInternetSales; -- Traz o menor valor da coluna 'SalesAmount'
