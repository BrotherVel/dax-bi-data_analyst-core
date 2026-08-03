USE REPRESENTATIVE_DB

DELETE FROM DimProducts -- Deletar itens da tabela DimProducts.
WHERE ProdutoId = 2; -- Especifica qual deve ser o critério para a exclusão.

-- Sem o 'WHERE' todos os produtos seriam deletados.