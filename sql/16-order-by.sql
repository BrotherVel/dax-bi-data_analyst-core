USE AdventureWorksDW2025

-- O Order by traz as colunas organizadas de forma ordenada.

SELECT TOP 100 FirstName, BirthDate
FROM DimCustomer
ORDER BY FirstName; -- Ordena em ordem alfabética.

SELECT TOP 100 FirstName, BirthDate
FROM DimCustomer
ORDER BY BirthDate; -- Ordena por data/número em ordem crescente.

-- Também é possível ordenar definindo entre Ascendente ou Descendente.
-- (Caso não haja definição, como nos exemplos anteriores, a ordenção será Ascendente por padrão.

SELECT TOP 100 FirstName, BirthDate
FROM DimCustomer
ORDER BY FirstName ASC; -- Ordena Ascendente (A -> Z)

SELECT TOP 100 FirstName, BirthDate
FROM DimCustomer
ORDER BY FirstName DESC; -- Ordena Descendente (Z -> A)

-- O Order By também pode ordernar por várias colunas, dando prioridade a ordem das coludas definidas.

SELECT TOP 100 FirstName
	,LastName
	,BirthDate
FROM DimCustomer
ORDER BY FirstName ASC, LastName;

/* 
Outra forma de definir as colunas a serem ordenadas é por ídice de ordem no select,
ou por seu apelido ALIAS
*/

SELECT TOP 100 FirstName
	,LastName
	,BirthDate AS DT_ANV -- ALIAS
FROM DimCustomer
ORDER BY 1 ASC, 2 DESC, DT_ANV ASC; --> 1 == First Name, 2 == Last Name e DT_ANV == BirthDate 