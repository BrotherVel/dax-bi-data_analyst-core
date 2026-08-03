
USE REPRESENTATIVE_DB

CREATE TABLE FactRequests(
    Id INT IDENTITY(1,1) PRIMARY KEY, -- Definição de chave primária
    ProdutoId INT, -- Campo do tipo int para receber chave estrageira da tabela DimProducts

    FOREIGN KEY (ProdutoId) -- definição da chave estrangeira
        REFERENCES DimProducts(ProdutoId)
);