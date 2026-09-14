USE AdventureWorksDW2025

SELECT *
FROM FactInternetSales;

/* 
HAVING: É utilizado junto ao group by para adicionar condições e filtros as pesquisas (forma similar a where). 
Atenção que o “having” é aplicado após a junção dos dados feitos pelo group by.
*/

SELECT CustomerKey, SUM(SalesAmount) AS RV_for_Customer
FROM FactInternetSales
GROUP BY CustomerKey
HAVING SUM(SalesAmount) > 1000 -- Age como um filtro posterior ao agrupamento dos dados no Order by.
ORDER BY RV_for_Customer DESC;

-- O HAVING tbm pode ser combinado com o WHERE.

SELECT CustomerKey, SUM(SalesAmount) AS RV_for_Customer
FROM FactInternetSales
WHERE SalesTerritoryKey = 1 -- Traz apenas ítens que pertencem ao teritório 1.
GROUP BY CustomerKey -- Agrupamento das vendas à cada customer.
HAVING SUM(SalesAmount) > 1000 -- Filtro posterior ao agrupamento para vendas maiores que 1000.
ORDER BY RV_for_Customer DESC

/*
A coluna "SalesTerritoryKey” não precisou ser selecionada no 'SELECT' para ser utilizada como parâmetro do WHERE,
coisa impossível para o 'HAVING', que trabalha apenas com os dados que foram agrupados no 'GROUP BY'

A diferença principal entre o 'HAVING' e o 'WHERE' é:
	WHERE - Trata os dados antes de serem ordenados.
	HAVING - Faz a filtragem depois dos dados serem agrupados (GROUP BY).
*/