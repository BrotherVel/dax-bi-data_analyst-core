
USE REPRESENTATIVE_DB -- Boa prática utilizar o 'USE' para definir o banco de dados da Query

CREATE TABLE DimProducts ( -- Cria a tabela com os campos a seguir
    ProdutoId INT IDENTITY(1,1) PRIMARY KEY, -- difine coluna de chave primária que começará em 1 e será acrecida em +1 por INSERT
    Nome VARCHAR(100) NOT NULL, -- cria coluna com campo obrigatório (NOT NULL) de string com tamanho maximo de 100 caracteres
    Preco DECIMAL(10,2) NOT NULL, -- cria coluna com campo obrigatório do tipo float com 2 casas decimais
    Estoque INT NOT NULL DEFAULT 0, -- cria coluna com campo obrigatório, que se não definido começará em 0, do tipo int
    Ativo BIT DEFAULT 1 -- cria uma coluna que recebe apenas um valor. Neste caso o '1' representa 'true' e o '0' representa 'false'
);