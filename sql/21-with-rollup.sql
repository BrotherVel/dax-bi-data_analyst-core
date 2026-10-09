Use AdventureWorksDW2025

-- WITH ROLLUP --

/*
com o 'WITH ROLLUP' é possível fazer um agrupamento ordenado de cada item e em seguida apresentar uma soma total de todos os resultados em comum. 
*/

SELECT DC.EnglishProductCategoryName As 'Category Name'
	,DSC.EnglishProductSubcategoryName As 'SubCategory Name'
	,SUM(FS.SalesAmount) AS 'total'
FROM FactInternetSales AS FS
INNER JOIN DimProduct AS DP
ON FS.ProductKey = DP.ProductKey
INNER JOIN DimProductSubcategory AS DSC
ON DP.ProductSubcategoryKey = DSC.ProductSubcategoryKey
INNER JOIN DimProductCategory AS DC
ON DSC.ProductCategoryKey = DC.ProductCategoryKey
GROUP BY DC.EnglishProductCategoryName, DSC.EnglishProductSubcategoryName
WITH ROLLUP;

/*
Aqui foi estabelecido um agrupamento de duas tabelas com o 'INNER JOIN'.
Há uma ligação entre a tabela de vendas com a tabela de produtos (FactInternetSales - DimProduct), 
que se liga com a tabela de subcategorias (DimProduct - DimProductSubcategory), 
que por sua vez se conecta com a tabela de categorias (DimProductSubcategory - DimProductCategory).

O resultado foi as categorias e o total de cada uma delas somando o valor arrecadado de cada subcategoria.
O total fica evidanete a frente do valor 'NULL' em 'Subcategory Name'
*/