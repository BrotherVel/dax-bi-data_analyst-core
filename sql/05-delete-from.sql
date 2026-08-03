<<<<<<< HEAD
USE REPRESENTATIVE_DB

DELETE FROM DimProducts -- Deletar itens da tabela DimProducts.
WHERE ProdutoId = 2; -- Especifica qual deve ser o critério para a exclusão.

=======
USE REPRESENTATIVE_DB

DELETE FROM DimProducts -- Deletar itens da tabela DimProducts.
WHERE ProdutoId = 2; -- Especifica qual deve ser o critério para a exclusão.

>>>>>>> 1716bff48873750226f3846f16361b70af70c656
-- Sem o 'WHERE' todos os produtos seriam deletados.