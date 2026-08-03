USE	REPRESENTATIVE_DB

ALTER TABLE DimProducts -- Alterar a tabela DimProducts
ADD estoque INT DEFAULT 0; -- Adiciona coluna estoque do tipo int que por padrão virá com 0

/* UPDATE dos valores de estoque para os produtos da tabela */
UPDATE DimProducts SET estoque = 10 WHERE ProdutoId = 1;
UPDATE DimProducts SET estoque = 5 WHERE ProdutoId = 2;
UPDATE DimProducts SET estoque = 2 WHERE ProdutoId = 3;