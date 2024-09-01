USE BDImpressionador
-- 14. [SQL Server] CRUD


-- 3. CREATE e DROP DATABASE

--CREATE DATABASE BDImpressionador
--DROP DATABASE BDImpressionador


-- 6. CREATE TABLE - Criando a primeira tabela

/*	Criando a 1ª tabela.

- Crie uma tabela chamada Produtos
- Essa tabela deve conter 4 colunas: id_produto, nome_produto, data_validade e preco_produto
- Certifique-se de que o tipo deas colunas está correto


CREATE TABLE Produtos(
	id_produto INT, 
	nome_produto VARCHAR(200), 
	data_validade DATE, 
	preco_produto FLOAT
)


-- 7. INSERT SELECT - Adicionando dados de outra tabela

INSERT INTO Produtos(id_produto, nome_produto, data_validade, preco_produto)
SELECT 
	ProductKey, 
	ProductName, 
	AvailableForSaleDate,
	UnitPrice
FROM
	ContosoRetailDW.dbo.DimProduct


-- 8. INSERT INTO - Adicionando novos valores na tabela


INSERT INTO Produtos(id_produto, nome_produto, data_validade, preco_produto)
VALUES
	(1, 'Arroz', '31/12/2021', 22.50), 
	(2, 'Feijão', '20/11/2022',  8.99)


-- 9. Ordem correta para adicionar dados com o INSERT

INSERT INTO Produtos(data_validade, id_produto, preco_produto)
VALUES
	('31/12/2021',3, 22.50)

-- 10. UPDATE - Atualizando o dado de uma tabela

UPDATE Produtos
SET nome_produto = 'Macarrão'
WHERE id_produto = 3

-- 11. DELETE - Deletando dados

DELETE FROM Produtos
WHERE id_produto = 3


-- 12. DROP TABLE - Excluindo uma tabela

DROP TABLE Produtos

-- 13. Código da tabela utilizada nos próximos exemplos

USE BDImpressionador

CREATE TABLE Funcionarios(
	id_funcionario int,
	nome_funcionario varchar(100),
	salario float,
	data_nascimento date
)

INSERT INTO Funcionarios(id_funcionario, nome_funcionario, salario, data_nascimento)
VALUES
	(1, 'Lucas'		, 1500, '20/03/1990'),
	(2, 'Andressa'	, 2300, '07/12/1988'),
	(3, 'Felipe'	, 4000, '13/02/1993'),
	(4, 'Marcelo'	, 7100, '10/04/1993'),
	(5, 'Carla'		, 3200, '02/09/1986'),
	(6, 'Juliana'	, 5500, '21/01/1989'),
	(7, 'Mateus'	, 1900, '02/11/1993'),
	(8, 'Sandra'	, 3900, '09/05/1990'),
	(9, 'André'		, 1000, '13/03/1994'),
	(10, 'Julio'	, 4700, '05/07/1992')

SELECT * FROM Funcionarios

*/


 -- SELECT * FROM Produtos




















































