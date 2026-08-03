USE REPRESENTATIVE_DB

UPDATE DimProducts -- Define que irá fazer alteração na tabela DimProducts
SET Preco = 55.00 -- define em qual campo será a alteração
WHERE Nome = 'Mouse'; -- define em qual linha será a alteração

/* 
	O WHERE é essencial para que não ocorra de todas as linhas da coluna peço não sejam alteradas para o novo valor definido.
	Neste caso, o volor 'Preço' só será alterado nas linhas onde a coluna 'Nome' possui o valor 'Mouse'.
	Isso significa que se houverem mais linhas com o mesmo nome também sofrerão alterações.
	Por isso é importante ser especifico na definição da linha alvo.
*/