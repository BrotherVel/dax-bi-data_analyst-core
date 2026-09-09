USE AdventureWorksDW2025

/*
O GROUP BY permite agrupar uma função de agregação (COUNT, SUM, MAX, MIN, AVG) a uma coluna.
Esta ação coloca o resultado das operações sobre o contexto de uma coluna de dados
*/

SELECT CustomerKey -- Coluna de referência
	,SUM(SalesAmount) AS Receita -- Soma da Receita
FROM FactInternetSales
GROUP BY CustomerKey; -- Define qual coluna será o contexto do agrupamento

/*
O Resultado desta operação é justamente a receita de compras de cada cliente
(lemrando que cada CustumerKey representa um cliente diferente)
*/ 

-- É possivel também combinar o GROUP BY outras funções como, a exemplo, ROUND e GROUP BY

SELECT CustomerKey 
	,ROUND(SUM(SalesAmount),2) AS Receita -- Soma da Receita arredondada para duas casas decimais
FROM FactInternetSales
GROUP BY CustomerKey
ORDER BY Receita DESC; -- Ordena do maior valor para o menor

-- O GROUP BY pode receber mais de uma função para se agrupada

SELECT CustomerKey 
	,ROUND(SUM(SalesAmount),2) AS Valor_Total_Comprado
	,COUNT(SalesAmount) AS Contagem_de_Compras
	,MAX(SalesAmount) AS Maior_Compra
FROM FactInternetSales
GROUP BY CustomerKey
ORDER BY Valor_Total_Comprado DESC;

/*
Outra possibilidade que o GROUP BY permite é usa mais de uma coluna como referência de agrupamento
Desde de que ela esteja inserida também na seleção do GROUP BY.
Basicamente é como se fosse criada mais subcategorias dentro das seleções anteriores
*/

SELECT CustomerKey 
	,ProductKey
	,ROUND(SUM(SalesAmount),2) AS Valor_Total_Comprado
	,COUNT(SalesAmount) AS Contagem_de_Compras
	,MAX(SalesAmount) AS Maior_Compra
FROM FactInternetSales
GROUP BY CustomerKey, ProductKey 
ORDER BY CustomerKey DESC;

/*
No exemplo, para cada cliente vão aparecer os produtos que ele consumiu, 
e para cada produto vão ser exibidos os cáuculos das funções considerando ambos os contextos.
É possivel por exemplo, notar resultados de 'CustomerKey' repetidos para cada 'ProductKey'.
Isso significa que aquele cliente consumiu diferentes produtos totalizando valores diferentes para cada um deles.
*/
