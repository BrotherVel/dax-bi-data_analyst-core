USE REPRESENTATIVE_DB

ALTER TABLE DimProducts -- Alterar a tabela DimProducts
ALTER COLUMN Nome VARCHAR(90); -- Faz alteração do tipo da coluna 'nome'

/* Essa alteração deve ser válida com os dados presentes na coluna */