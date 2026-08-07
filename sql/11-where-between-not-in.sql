use AdventureWorksDW2025

/*
BETWEEN – Usado para encontrar um valor entre um valor mínio e um valor máximo.
Basicamente simplifica a sentença:
| valor >= mínimo AND valor <= máximo
*/

SELECT OrderDateKey, UnitPrice
FROM FactInternetSales
WHERE UnitPrice BETWEEN 1500 AND 2000; -- Traz todos os valores que estão entre 1500 e 2000

/*
NOT – Inverte a função da condição;
*/

SELECT OrderDateKey, UnitPrice
FROM FactInternetSales
WHERE UnitPrice NOT BETWEEN 1500 AND 2000; -- Traz todos os valores que NÃO estão entre 1500 e 2000

/*
IN – Serve para pesquisar vários valores de uma coluna simultaneamente
Faz o mesmo papel do 'OR' de forma simplificada;
*/

-- Forma ineficaz (sem o 'IN'):

SELECT CustomerKey, FirstName, LastName
FROM DimCustomer
WHERE FirstName = 'Jon' 
OR FirstName = 'Amy'
OR FirstName = 'Rob'
OR FirstName = 'Marco';

-- Utilizando o 'IN':

SELECT CustomerKey, FirstName, LastName
FROM DimCustomer
WHERE FirstName IN ('Jon', 'Amy', 'Rob', 'Marco');