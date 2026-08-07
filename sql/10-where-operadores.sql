use AdventureWorksDW2025

/*
WHERE – Filtra os dados de uma tabela a partir de uma condição definida por operadores lógicos;
O principais operadores são: 
| = (Igual a)
| < (menor que)
| > (maior que)
| <= (menor ou igual a)
| >= (maior ou igual a)
| <> (diferente de)
| AND (Operador Lógico E) 
| OR (Operador Lógico OU)
*/

-- WHERE COM '='
SELECT *
FROM DimCustomer
WHERE FirstName = 'Jon'; -- WHERE + (Coluna) + (Operador) + (Fator de Comparação)

/* 
Mostrar quais itens da tabela DimCustomer tem o “FirstName” igual (=) a 'Jon'
*/

-- WHERE COM '<'
SELECT *
FROM DimCustomer
WHERE BirthDate < '1980-01-01';

/* 
Mostrar quais itens da tabela DimCustomer tem a “BirthDate” menor que (<) '1980-01-01'
*/

-- WHERE COM '>'
SELECT *
FROM DimCustomer
WHERE BirthDate > '1980-01-01';

/* 
Mostrar quais itens da tabela DimCustomer tem a “BirthDate” maior que (>) '1980-01-01'
*/

-- WHERE COM '<='

SELECT *
FROM DimCustomer
WHERE TotalChildren <= 2;

/* 
Mostrar quais itens da tabela DimCustomer tem a “TotalChildren” menor ou igual a (<=) 2
*/


-- WHERE COM '>='

SELECT *
FROM DimCustomer
WHERE TotalChildren >= 2;

/* 
Mostrar quais itens da tabela DimCustomer tem a “TotalChildren” menor ou igual a (>=) 2
*/

-- WHERE COM '<>'

SELECT *
FROM DimCustomer
WHERE Gender <> 'M';

/* 
Mostrar quais itens da tabela DimCustomer tem a “Gender” diferente de (<>) 'M'
*/

-- WHERE COM 'AND'
SELECT *
FROM DimCustomer
WHERE FirstName = 'Jon' AND LastName = 'Sun';

/* 
Mostrar quais itens da tabela DimCustomer tem o “FirstName” igual (=) a 'Jon' e (AND) “LastName” igual (=) a 'Sun'
*/

-- WHERE COM 'AND'
SELECT *
FROM DimCustomer
WHERE FirstName = 'Jon' OR FirstName = 'Amy';

/* 
Mostrar quais itens da tabela DimCustomer tem o “FirstName” igual (=) a 'Jon' ou (OR) “FirstName” igual (=) a 'Amy'
*/