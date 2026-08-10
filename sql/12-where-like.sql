use AdventureWorksDW2025

/* 
LIKE – Filtra a pesquisa por uma parte de contúdo. 
*/

SELECT *
FROM DimCustomer
WHERE FirstName LIKE 'J%';  -- pesquisa por resultados onde o 'firstName' começa com 'J'

/*
O uso do LIKE consiste basicamente definir fragmentos que devem aparecer nos resultados.
O % é responsavel por representar tudo que deve ser completado nos resultados.
Portanto, no exemplo acima nada deve ser complementado antes do 'J', apenas a partir da representação do '%'
*/

SELECT *
FROM DimCustomer
WHERE FirstName LIKE '%n';  -- pesquisa por resultados onde o 'firstName' termina com 'n'

/*
Neste caso, nada deve ser complementado depois do 'n', apenas a antes da representação do '%'
*/

SELECT *
FROM DimCustomer
WHERE FirstName LIKE '%th%';  -- pesquisa por resultados onde o 'firstName' tenha em sua composição o 'th'

/*
Agora pode ser complementado tanto antes como depois do 'th' da representação do '%'
*/


SELECT *
FROM DimCustomer
WHERE FirstName LIKE 'Ro_'; -- pesquisa por resultados onde falta apenas um caractere para encontrar após a palavra 'Ro'

/*
Para definir que falta encontrar apenas um caractere usa-se o '_'.
Esse filtro funciona para quantas letras forem desejadas, ou para qualquer direção ou parte da composição.
Basta inserir o '_' no lugar da letra a ser complementada nos resultados da query
*/



/* 
Para pesquisar quando há dúvida entre letras.
Ex: [sz] -> s ou z
*/

SELECT *
FROM DimCustomer
WHERE LastName LIKE 'Gon[sz]ale[sz]'; -- pesquisa pelo LastName 'Gonzalez' em diferentes possibilidades de composição com s ou z