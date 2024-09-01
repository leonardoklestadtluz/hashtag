USE Exercicios
-- USE BDImpressionador
/*	14. [SQL Server] CRUD

-- 1. a) Crie um banco de dados chamado BD_Teste.
CREATE DATABASE BD_Teste

-- b) Exclua o banco de dados criado no item anterior.
DROP DATABASE BD_Teste-- c) Crie um banco de dados chamado Exercicios.CREATE DATABASE Exercicios


/*	2. No banco de dados criado no exercício anterior, crie 3 tabelas, cada uma contendo as seguintes colunas:
Tabela 1: dCliente
- ID_Cliente
- Nome_Cliente
- Data_de_Nascimento*/CREATE TABLE dCliente(	ID_Cliente INT,
	Nome_Cliente VARCHAR(100),
	Data_de_Nascimento DATE)/*Tabela 2: dGerente
- ID_Gerente
- Nome_Gerente
- Data_de_Contratacao
- Salario*/CREATE TABLE dGerente(	ID_Gerente INT,
	Nome_Gerente VARCHAR(100),
	Data_de_Contratacao DATE,
	Salario FLOAT)/*Tabela 3: fContratos
- ID_Contrato
- Data_de_Assinatura
- ID_Cliente
- ID_Gerente
- Valor_do_Contrato*/CREATE TABLE fContratos(	ID_Contrato INT,
	Data_de_Assinatura DATE,
	ID_Cliente INT,
	ID_Gerente INT,
	Valor_do_Contrato FLOAT)-- ALTERAÇÃO DE DADOS-- ALTER TABLE dCliente ALTER COLUMN Data_de_Nascimento DATETIME-- ALTER TABLE dGerente ALTER COLUMN Data_de_Contratacao DATETIME-- ALTER TABLE fContratos ALTER COLUMN Data_de_Assinatura DATETIME/*Lembre-se dos seguintes pontos:

a) Garantir que o Banco de Dados Exercicios está selecionado.
b) Definir qual será o tipo de dados mais adequado para cada coluna das tabelas. Lembrando que os tipos de dados mais comuns são: INT, FLOAT, VARCHAR e DATETIME.
Por fim, faça um SELECT para visualizar cada tabela.*/SELECT * FROM dClienteSELECT * FROM dGerente
SELECT * FROM fContratos
*/

-- 3. Em cada uma das 3 tabelas, adicione os seguintes valores:

-- TABELA dCliente
INSERT INTO dCliente(ID_Cliente, Nome_Cliente, Data_de_Nascimento)
VALUES(7, 'Gustavo Barbosa', '1993-06-27')
	(1, 'André Martins', '1989-02-12'),
	(2, 'Bárbara Campos', '1992-05-07'),
	(3, 'Carol Freitas', '1985-04-23'),
	(4, 'Diego Cardoso', '1994-10-11'),
	(5, 'Eduardo Pereira', '1988-11-09'),
	(6, 'Fabiana Silva', '1989-09-02'),
	(7, 'Gustavo Barbosa', '1993-06-27'),
	(8, 'Helen Viana', '1990-02-11')

-- TABELA dGerente
INSERT INTO(ID_Gerente, Nome_Gerente, Data_de_Contratacao, Salario)
VALUES(1, 'Lucas Sampaio', '2015-03-21', 6700)
	(1, 'Lucas Sampaio', '2015-03-21', 6700),
	(2, 'Mariana Padilha', '2011-01-10', 9900),
	(3, 'Nathália Santos', '2018-10-03', 7200),
	(4, 'Otávio Costa', '2017-01-18', 11000)

SELECT * FROM	dCliente



















