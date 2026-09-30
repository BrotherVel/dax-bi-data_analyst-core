USE AdventureWorksDW2025

-- OUTHER JOIN's --

/*
Os diferentes JOIN's interagem de forma diferente entre as duas tabelas juntadas.
As suas caracteristicas se tratam basicamente sobre quais dados serão trazidos na consulta.
São eles: 
*/

-- INNER JOIN -- Traz somente os dados em cumum entre as duas tabelas

SELECT FS.OrderDateKey
	,DD.DateKey
FROM FactInternetSales as FS 
INNER JOIN DimDate as DD
ON FS.OrderDateKey = DD.DateKey;

-- Vejamos que a quantidade de resultados desta consulta é de 60.398 linhas

-- Verificação se há resultados divergentes:

SELECT FS.OrderDateKey
	,DD.DateKey
FROM FactInternetSales as FS 
INNER JOIN DimDate as DD
ON FS.OrderDateKey = DD.DateKey 
WHERE FS.OrderDateKey IS NULL
OR DD.DateKey IS NULL;

-- RIGHT JOIN -- Traz todos dados da tabela da 'direita' (tabela selecionada no JOIN), retornando NULL para os dados que não há na tabela da 'esquerda' (tabela selecionada no JOIN)

SELECT FS.OrderDateKey
	,DD.DateKey
FROM FactInternetSales as FS 
RIGHT JOIN DimDate as DD
ON FS.OrderDateKey = DD.DateKey;

-- Vejamos que a quantidade de resultados desta consulta é de 62.926 linhas

-- Verificação se há resultados divergentes:

SELECT FS.OrderDateKey
	,DD.DateKey
FROM FactInternetSales as FS 
RIGHT JOIN DimDate as DD
ON FS.OrderDateKey = DD.DateKey  
WHERE FS.OrderDateKey IS NULL
OR DD.DateKey IS NULL;

/*
Esta demontração mostra a linhas da coluna chave (DD.DateKey) da tabela 'dimDate' que não existem na tabela 'FactInternetSales'.
Isto acontece porque a consulta traz todos os itens da tabela 'dimDate', mas nem todos eles possuem correspondentes nas conexão.
O resultados NULL's na 'FactInternetSales' representam justamente os resultados faltante em comparação com a 'DimDate'
*/

-- LEFT JOIN -- Traz todos dados da tabela da 'esquerda' (tabela selecionada no FROM), retornando NULL para os dados que não há na tabela da 'direita' (tabela selecionada no JOIN)

SELECT FS.OrderDateKey
	,DD.DateKey
FROM FactInternetSales as FS 
LEFT JOIN DimDate as DD
ON FS.OrderDateKey = DD.DateKey;

-- Vejamos que a quantidade de resultados desta consulta é de 60.398 linhas

-- Verificação se há resultados divergentes:

SELECT FS.OrderDateKey
	,DD.DateKey
FROM FactInternetSales as FS 
LEFT JOIN DimDate as DD
ON FS.OrderDateKey = DD.DateKey  
WHERE FS.OrderDateKey IS NULL
OR DD.DateKey IS NULL;

/*
Neste caso não há itens na coluna chave (FS.OrderDateKey) que existem na 'FactInternetSales' que não existem na 'DimDate'
*/

-- FULL JOIN -- Traz completamente as duas tabelas conectadas

SELECT FS.OrderDateKey
	,DD.DateKey
FROM FactInternetSales as FS 
FULL JOIN DimDate as DD
ON FS.OrderDateKey = DD.DateKey 

-- Vejamos que a quantidade de resultados desta consulta é de 62.926 linhas

-- Verificação se há resultados divergentes:

SELECT FS.OrderDateKey
	,DD.DateKey
FROM FactInternetSales as FS 
FULL JOIN DimDate as DD
ON FS.OrderDateKey = DD.DateKey  
WHERE FS.OrderDateKey IS NULL
OR DD.DateKey IS NULL;

/*
Aqui o resultado será semelhante ao LEFT JOIN pois a 'DimDate' é a única com resultados divergentes a mais sobre a 'FactInternetSales'
Entretanto, caso a 'FactInternetSales' possuisse resultados que não houvessem na 'DimDate', eles também apareceriam como resultado da consulta.
*/
