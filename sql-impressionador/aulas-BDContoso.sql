/* USE ContosoRetailDW

-- 4. [SQL Server] Introdu��o ao SQL


/* Comando SELECT

Serve para selecionar dados de uma determinada tabela

Sintaxe:

	SELECT * FROM DimCustomer

Legenda: 
	          * = caracter coringa, neste caso trar� todas as colunas da tabela
	DimCustomer = nome da tabela, neste caso
*/
SELECT 
	* 
FROM 
	DimStore

SELECT 
	StoreKey, 
	StoreName,
	StorePhone 
FROM 
	DimStore


/* Comando TOP

Serve para selecionar os primeiros dados de acordo com a quantidade
de linhas definidas entre () - par�nteses

Sintaxe:

	SELECT TOP(10) PERCENT * FROM DimProduct


Legenda: 
           * = caracter coringa, neste caso trar� todas as colunas da tabela
	      (10) = quantidade de linhas que deseja que a query retorne
				PERCENT = retornar� N por cento das linhas da tabela
	DimProduct = nome da tabela, neste caso
*/
SELECT 
	TOP(10) 
	* 
FROM 
	DimProduct

SELECT 
	TOP(10) 
	PERCENT * 
FROM 
	DimCustomer

SELECT 
	* 
FROM 
	FactSales


/* Comando DISCTINCT

Serve para retornar dados distintos de uma tabela,
elimina os registros duplicados

Sintaxe:

	SELECT DISTINCT ColorName FROM DimProduct


Legenda: 
	 ColorName = nome da coluna que deseja distinguir
	  DISTINCT = comando para distinguir as linhas
	DimProduct = nome da tabela, neste caso
*/
SELECT 
	DISTINCT ColorName 
FROM 
	DimProduct

SELECT 
	DISTINCT DepartmentName
FROM 
	DimEmployee


/* Comando AS

Serve para apelidar as colunas caso necess�rio,
deixando o nome das colunas mais intuitivos

Sintaxe:

	SELECT ColorName AS Cor FROM DimProduct

	SELECT ColorName AS 'Nome da Cor' FROM DimProduct


Legenda: 
	 ColorName = nome original da coluna
	        AS = comando para apelidar a coluna
		     Cor = apelido da coluna
				  '' = permite inseri um nome composto
	DimProduct = nome da tabela, neste caso
*/
SELECT 
	ProductName AS 'Nome do Produto',
	BrandName AS 'Nome da Marca',
	ColorName AS 'Nome da Cor'
FROM
	DimProduct




-- 5. [SQL Server] Ordenando e Filtrando Dados

/* Comando ORDER BY

Retorna os registros ordenados de forma crescente 
ou decrescente de uma determinada coluna

Sintaxe:

	SELECT TOP(100) * FROM DimStore
	ORDER BY EmployeeCount DESC

Legenda: 
	       TOP(100) = retorna as 100 primeiras colunas
		     ORDER BY = comando para ordenar registros
		EmployeeCount = nome da coluna com registros ordenados
		     DimStore = nome da tabela, neste caso
			       DESC = ordena os registros de forma decrescente
*/
SELECT TOP(100) * FROM DimStore
ORDER BY EmployeeCount DESC

-- Exemplo 1: selecione as 10 primeiras linhas da tabela DimProduct e ordene de acordo com a UnitCost

SELECT
	TOP(10) ProductName AS 'Nome do Produto',
	UnitCost AS 'Custo Unit�rio',
	Weight AS 'Peso'
FROM 
	DimProduct
ORDER BY
	UnitCost DESC, Weight DESC


/* Comando WHERE

Permite a aplica��o de filtros retornando 
registros de acordo com a filtragem

Sintaxe:
	SELECT 
		* 
	FROM 
		DimProduct 
	WHERE UnitPrice > 1000 
	ORDER BY UnitPrice
	

Legenda: 
	       
		    WHERE = permite a aplica��o de filtros
		UnitPrice = nome da coluna com registros ordenados
	 DimProduct = nome da tabela, neste caso
		 ORDER BY = comando para ordenar registros
		     DESC = ordena os registros de forma decrescente
*/
SELECT * FROM DimProduct

SELECT 
	ProductName AS 'Nome do Produto',
	UnitPrice AS 'Pre�o Unit�rio'
FROM 
	DimProduct 
WHERE UnitPrice >= 2000 
ORDER BY UnitPrice

SELECT * FROM DimProduct WHERE BrandName = 'Fabrikam'

SELECT * FROM DimProduct WHERE ColorName = 'Black'

SELECT * FROM DimCustomer WHERE BirthDate >= '1970-12-31' ORDER BY BirthDate DESC



/* Comando OR

Permite a aplica��o de filtros retornando 
um ou outro registro. � mais comum utilizarmos
OR para uma mesma coluna.

Sintaxe:
	SELECT * FROM DimProduct
	WHERE BrandName = 'Contoso' 
	OR ColorName = 'White'
	

Legenda: 
	  OR = define o registro que ser� retornado
*/
SELECT 
	* 
FROM 
	DimProduct
WHERE 
	BrandName = 'Contoso'
OR 
	ColorName = 'White'

SELECT * FROM DimProduct
WHERE BrandName = 'Contoso'
OR BrandName = 'Fabrikam'
OR BrandName = 'Litware'



/* Comando OR

Retorna registros que diferentes da condi��o informada. Neste caso, retorna todos os departamentos diferentes do Marketing.

Sintaxe:
	SELECT * FROM DimEmployee
	WHERE DepartamentName = 'Marketing'
	

Legenda: 
	  NOT = nega o retorno dos registros
*/
SELECT * FROM DimEmployee
	WHERE NOT DepartmentName = 'Marketing'



-- 1. Selecione todas as linhas da tabela DimEmployee de funcion�rios do sexo feminino E do departamento de finan�as.
SELECT * FROM DimEmployee WHERE Gender = 'F' AND DepartmentName = 'Finance'

-- 2. Selecione todas as linhas da tabela DimProduct de produtos Contoso E da cor vermelha E que tenham um UnitPrice maior ou igual a $100.
SELECT * FROM DimProduct WHERE BrandName = 'Contoso' AND ColorName = 'Red' AND UnitPrice >= 100

-- 3. Selecione todas as linhas da tabela DimProduct com produtos da marca Litware OU da marca Fabrikam OU da cor Preta.
SELECT * FROM DimProduct WHERE BrandName = 'Litware' OR BrandName = 'Fabrikam' OR ColorName = 'Black'

-- 4. Selecione todas as linhas da tabela DimSalesTerritory onde o continente � a Europa mas o pa�s N�O � a It�lia.
SELECT * FROM DimSalesTerritory WHERE SalesTerritoryGroup = 'Europe' AND NOT SalesTerritoryCountry = 'Italy'


-- Cuidados ao utilizar	o AND em conjunto com o OR

-- Exemplo: selecione todas as linhas da tabela DiProduct onde a cor do produto pode ser igual a preto ou vermelho, mas a marca deve ser obrigat�riamente Fabrikam.
SELECT * FROM DimProduct WHERE (ColorName = 'Black' OR ColorName = 'Red') AND BrandName =	'Fabrikam'



/* Comando IN

Retorna registros todos os registros que forem iguais 
ao que estiver entre ().

Sintaxe:
	SELECT * FROM DimEmployee
	WHERE DepartamentName = 'Marketing'
	

Legenda: 
	  IN = uma alternativa ao OR
*/
SELECT * FROM DimProduct WHERE	ColorName	IN ('Silver', 'Blue',	'White', 'Red', 'Black')

SELECT * FROM DimEmployee WHERE DepartmentName IN ('Production', 'Marketing', 'Engineering')

/* Comando LIKE

Retorna o registro que contiver parte do texto.
Ele, %, pode ser utilizado no texto em seu in�cio, 
no fim ou ambos.


Sintaxe:
	SELECT * FROM DimProdutc
	WHERE ProductName LIKE '%MP3 Player%'
	

Legenda: 
	  LIKE = permite a pesquisa por parte da string
		   % = caracter coringa
*/
SELECT * FROM DimProduct WHERE ProductName LIKE '%MP3 Player%'

SELECT * FROM DimProduct WHERE ProductDescription LIKE 'Type%'


/* Comando BETWEEN

Retorna registros que est�o em um intervalo 
de valores ou n�meros.


Sintaxe:
	
	SELECT * FROM DimProduct
	WHERE UnitePrice BETWEEN 50 AND 100

Legenda: 
	  BETWEEN = configura o intervalo dos valores
*/
SELECT * FROM DimProduct WHERE UnitPrice BETWEEN 50 AND 100

SELECT * FROM DimProduct WHERE UnitPrice NOT BETWEEN 50 AND 100

SELECT * FROM DimEmployee WHERE HireDate BETWEEN '2000-01-01' AND '2000-12-31'


/* Comando IS NULL e IS NOT NULL

IS NULL     = retorna registros nulos
IS NOT NULL = n�o retorna registros nulos


Sintaxe:
	SELECT * FROM DimCustomer WHERE CompanyName IS NULL
	SELECT * FROM DimCustomer WHERE CompanyName IS NOT NULL
	

Legenda: 
	  IS NULL     = retorna registros nulos
		IS NOT NULL = n�o retorna registros nulos
*/
SELECT * FROM DimCustomer WHERE CompanyName IS NULL

SELECT * FROM DimCustomer WHERE CompanyName IS NOT NULL



-- 6. [SQL Server] Fun��es de Agrega��o

/* Comando SUM()

Faz um somat�rio de determinada coluna e retorna 
um �nico valor total desta coluna como resultado.


Sintaxe:
	SELECT SUM() FROM FactSales
	

Legenda: 
	  SUM() = fun��o que realiza o c�lculo dos valores da coluna
*/
SELECT 
	SUM(SalesQuantity) AS 'Total de Vendas' ,
	SUM(ReturnQuantity) AS 'Quantidade Devolvida'
FROM 
	FactSales


/* Comando COUNT()

Realiza a contagem total de linhas de uma
determinada coluna ou tabela.

CUIDADO! No caso da coluna, a fun��o retorna
a quantidade de linhas que possuem registro


Sintaxe:
	SELECT COUNT(*) FROM DimProduct
	SELECT COUNT(ProductName) FROM DimProduct

Legenda: 
	  COUNT() = fun��o que realiza a contagem de linhas totais da coluna ou tabela
*/
SELECT COUNT(*) AS 'Total de Linhas da Tabela' FROM DimProduct

SELECT COUNT(ProductName) AS 'Total de Linhas da Coluna' FROM DimProduct


/* Comando COUNT(DISTINCT ColorName) 

Retorna o total de linhas eliminando registros repetidos dos resultados


Sintaxe:
	SELECT COUNT(DISTINCT ColorName) FROM DimProduct


Legenda: 
	  COUNT(DISTINCT) = Retorna o total de linhas eliminando registros repetidos dos resultados
*/
SELECT COUNT(DISTINCT ColorName) AS 'Total de Cores Distintas' FROM DimProduct


/* Comando MIN() & MAX()

MIN() = retorna o registro de menor valor da coluna
MAX() = retorna o registro de maior valor da coluna


Sintaxe:
	SELECT MIN(UnitCost) FROM DimProduct
	SELECT MAX(UnitPrice) FROM DimProduct


Legenda: 
	MIN() = retorna o registro de menor valor da coluna
	MAX() = retorna o registro de maior valor da coluna
*/
SELECT 
	MIN(UnitCost) 
	AS 
		'Produto de Menor Custo', 
	MAX(UnitPrice) 
	AS 
		'Produto de Maior Pre�o'
FROM 
	DimProduct


/* Comando AVG()

Retorna o valor m�dio entre os valores de uma coluna

Sintaxe:
	SELECT AVG(UnitCost) FROM DimProduct


Legenda: 
	AVG(UnitCost) = Retorna o valor m�dio entre os valores de uma coluna
*/
SELECT AVG(YearlyIncome) AS 'Sal�rio M�dio Anual' FROM DimCustomer


-- 7. [SQL Server] Criando agrupamentos no SQL

/* Comando GROUP BY

Retorna os resultados de uma coluna de forma agrupada

Sintaxe:
	SELECT 
	nome_da_coluna AS 'apelido_da_coluna', 
	COUNT(*) AS 'apelido_da_coluna' 
FROM 
	nome_da_tabela 
GROUP BY 
	nome_da_coluna

Legenda: 
	GROUP BY = permite agrupar resultados de uma coluna
*/
SELECT 
	BrandName AS 'Nome da Marca', 
	COUNT(*) AS 'Quantidade de Produtos' 
FROM 
	DimProduct 
GROUP BY 
	BrandName


SELECT 
	StoreType AS 'Tipo de Loja', 
	SUM(EmployeeCount) AS 'Total de Funcion�rios'
FROM 
	DimStore 
GROUP BY 
	StoreType


SELECT 
	BrandName AS 'Nome da Marca', 
	AVG(UnitCost) AS 'Custo Unit�rio' 
FROM 
	DimProduct 
GROUP BY 
	BrandName

SELECT 
	ClassName AS 'Nome da Classe', 
	MAX(UnitPrice) AS 'M�ximo Pre�o' 
FROM 
	DimProduct 
GROUP BY 
	ClassName


/* Comando GROUP BY com ORDER BY

Retorna os resultados de uma coluna de forma agrupada
e ordenados de forma crescente ou decrescente

Sintaxe:
	SELECT 
		nome_da_coluna AS 'apelido_da_coluna', 
		SUM(nome_da_coluna) AS 'apelido_da_coluna'
	FROM 
		nome_da_tabela 
	GROUP BY 
		nome_da_coluna
	ORDER BY
		SUM(nome_da_coluna) DESC

Legenda: 
	GROUP BY = permite agrupar resultados de uma coluna
	ORDER BY = permite ordenar resultados de uma ou mais colunas
*/
SELECT 
	StoreType AS 'Tipo de Loja', 
	SUM(EmployeeCount) AS 'Total de Funcion�rios'
FROM 
	DimStore 
GROUP BY 
	StoreType
ORDER BY
	SUM(EmployeeCount) DESC


/* Comando WHERE com GROUP BY

Permite realizarmos filtros antes de agruparmos os registros

Sintaxe:
	SELECT 
		ColorName AS 'Nome da Cor', 
		COUNT(*) AS 'Total de Produtos' 
	FROM 
		DimProduct 
	WHERE 
		BrandName = 'Contoso' 
	GROUP BY 
		ColorName

Legenda: 
	   WHERE = permite realizarmos um filtro antes do agrupamento
	GROUP BY = permite agrupar resultados de uma coluna
*/
SELECT 
	ColorName AS 'Nome da Cor', 
	COUNT(*) AS 'Total de Produtos' 
FROM 
	DimProduct 
WHERE 
	BrandName = 'Contoso' 
GROUP BY 
	ColorName


/* Comando HAVING

Permite realizarmos filtros ap�s o agrupamento dos registros

Sintaxe:
	SELECT 
		BrandName AS 'Nome da Marca', 
		COUNT(BrandName) AS 'Total por Marca' 
	FROM 
		DimProduct 
	GROUP BY 
		BrandName 
	HAVING 
		COUNT(BrandName) >= 200

Legenda: 
	   HAVING = permite filtras os registros ap�s serem agrupados
*/
SELECT 
	BrandName AS 'Nome da Marca', 
	COUNT(BrandName) AS 'Total por Marca' 
FROM 
	DimProduct 
GROUP BY 
	BrandName 
HAVING 
	COUNT(BrandName) >= 200


/* Comando HAVING com WHERE

Permite realizarmos filtros ap�s o agrupamento dos registros

Sintaxe:
	SELECT 
		BrandName AS 'Nome da Marca', 
		COUNT(BrandName) AS 'Total por Marca' 
	FROM 
		DimProduct 
	GROUP BY 
		BrandName 
	HAVING 
		COUNT(BrandName) >= 200

Legenda: 
	 WHERE = permite filtrar os registros ANTES de serem agrupados
	HAVING = permite filtrar os registros AP�S serem agrupados
*/
SELECT 
	BrandName AS 'Nome da Marca', 
	COUNT(BrandName) AS 'Total por Marca' 
FROM 
	DimProduct 
WHERE                       -- filtra a tabela original, antes do agrupamento
	ClassName = 'Economy'
GROUP BY 
	BrandName 
HAVING                      -- filtra a tabela ap�s o agrupamento
	COUNT(BrandName) >= 200


-- 8. [SQL Server] JOINs no SQL

/* Comando LEFT (OUTER) JOIN

Tabelas A e B

Retorna os registros da tabela comum entre duas tabelas
e os registros da tabela da esquerda que neste caso �
a tabela A, no mesmo sentido da escrita e leitura

Sintaxe:
	SELECT 
		nome_da_tabela.nome_da_coluna,
		nome_da_tabela.nome_da_coluna
	FROM 
		nome_da_tabela
	LEFT JOIN	
		nome_da_tabela
	ON 
		nome_da_tabela.id_subcategoria = nome_da_tabela_id.nome_da_coluna

Legenda: 
	 LEFT JOIN = Retorna os registros da tabela comum entre duas tabelas
e os registros da tabela da direita que neste caso �
a tabela B. Sentido inverso da escrita e leitura
*/

SELECT 
	produtos.id_produto,
	produtos.nome_produto,
	produtos.id_subcategoria,
	subcategoria.nome_subcategoria
FROM 
	produtos
RIGHT JOIN	
	subcategoria
ON 
	produtos.id_subcategoria = subcategoria.id_subcategoria





/* Comando RIGHT (OUTER) JOIN

Tabelas A e B

Retorna os registros da tabela comum entre duas tabelas
e os registros da tabela da direita que neste caso �
a tabela B

Sintaxe:
	SELECT 
		nome_da_tabela.nome_da_coluna,
		nome_da_tabela.nome_da_coluna
	FROM 
		nome_da_tabela
	RIGHT JOIN	
		nome_da_tabela
	ON 
		nome_da_tabela.id_subcategoria = nome_da_tabela_id.nome_da_coluna

Legenda: 
	 RIGHT JOIN = Retorna os registros da tabela comum entre duas tabelas
e os registros da tabela da direita que neste caso �
a tabela B
*/

SELECT 
	produtos.id_produto,
	produtos.nome_produto,
	produtos.id_subcategoria,
	subcategoria.nome_subcategoria
FROM 
	produtos
LEFT JOIN	
	subcategoria
ON 
	produtos.id_subcategoria = subcategoria.id_subcategoria


/* Comando INNER (OUTER) JOIN

Tabelas A e B

Retorna somente os registros que existem nas duas tabelas

Sintaxe:
	SELECT 
		nome_da_tabela.nome_da_coluna,
		nome_da_tabela.nome_da_coluna
	FROM 
		nome_da_tabela
	INNER JOIN	
		nome_da_tabela
	ON 
		nome_da_tabela.id_subcategoria = nome_da_tabela_id.nome_da_coluna

Legenda: 
	 INNER JOIN = Retorna somente os registros existentes nas duas tabelas
*/

SELECT 
	produtos.id_produto,
	produtos.nome_produto,
	subcategoria.nome_subcategoria
FROM 
	produtos
INNER JOIN
	subcategoria
ON
	produtos.id_subcategoria = subcategoria.id_subcategoria



/* Comando FULL (OUTER) JOIN

Tabelas A e B

Retorna todos os registros que existem nas duas tabelas

Sintaxe:
	SELECT 
		nome_da_tabela.nome_da_coluna,
		nome_da_tabela.nome_da_coluna
	FROM 
		nome_da_tabela
	FULL JOIN	
		nome_da_tabela
	ON 
		nome_da_tabela.id_subcategoria = nome_da_tabela_id.nome_da_coluna

Legenda: 
	 FULL JOIN = Retorna todos os registros das duas tabelas
*/

SELECT 
	produtos.id_produto,
	produtos.nome_produto,
	subcategoria.nome_subcategoria
FROM 
	produtos
FULL JOIN
	subcategoria
ON
	produtos.id_subcategoria = subcategoria.id_subcategoria




/* Comando LEFT (ANT) JOIN

Tabelas A e B

Retorna SOMENTE os registros da tabela A

Sintaxe:
	SELECT 
		nome_da_tabela.nome_da_coluna,
		nome_da_tabela.nome_da_coluna
	FROM 
		nome_da_tabela
	LEFT JOIN	
		nome_da_tabela
	ON 
		nome_da_tabela.id_subcategoria = nome_da_tabela_id.nome_da_coluna
	WHERE nome_da_coluna IS NULL

Legenda: 
	 LEFT JOIN = Retorna os registros da tabela A (esquerda)
	     WHERE = permite filtrar o registro
		 IS NULL = tipo de registro da coluna
*/

SELECT 
	produtos.id_produto,
	produtos.nome_produto,
	subcategoria.nome_subcategoria
FROM 
	produtos
LEFT JOIN
	subcategoria
ON
	produtos.id_subcategoria = subcategoria.id_subcategoria
WHERE nome_subcategoria IS NULL




/* Comando RIGHT (ANT) JOIN

Tabelas A e B

Retorna SOMENTE os registros da tabela A

Sintaxe:
	SELECT 
		nome_da_tabela.nome_da_coluna,
		nome_da_tabela.nome_da_coluna
	FROM 
		nome_da_tabela
	RIGHT JOIN	
		nome_da_tabela
	ON 
		nome_da_tabela.id_subcategoria = nome_da_tabela_id.nome_da_coluna

Legenda: 
	 RIGHT JOIN = Retorna os registros da tabela B (direita)
	     WHERE = permite filtrar o registro
		 IS NULL = tipo de registro da coluna
*/

SELECT 
	produtos.id_produto,
	produtos.nome_produto,
	subcategoria.nome_subcategoria
FROM 
	produtos
RIGHT JOIN
	subcategoria
ON
	produtos.id_subcategoria = subcategoria.id_subcategoria
WHERE id_produto IS NULL


/* Comando RIGHT (ANT) JOIN

Tabelas A e B

Retorna SOMENTE os registros da tabela A

Sintaxe:
	SELECT 
		nome_da_tabela.nome_da_coluna,
		nome_da_tabela.nome_da_coluna
	FROM 
		nome_da_tabela
	RIGHT JOIN	
		nome_da_tabela
	ON 
		nome_da_tabela.id_subcategoria = nome_da_tabela_id.nome_da_coluna

Legenda: 
	 FULL JOIN = Retorna somente os regitstros das pr�prias tabelas
*/

SELECT 
	produtos.id_produto,
	produtos.nome_produto,
	subcategoria.nome_subcategoria
FROM 
	produtos
FULL JOIN
	subcategoria
ON
	produtos.id_subcategoria = subcategoria.id_subcategoria
WHERE 
	id_produto IS NULL
OR
	nome_subcategoria IS NULL
/* Aula 12 de 28: INNER, LEFT e RIGHT JOIN - Exemplos */
SELECT ProductKey, ProductName, ProductSubcategoryKey FROM DimProduct

SELECT ProductSubcategoryKey, ProductSubcategoryName FROM DimProductSubcategory

-- INNER JOIN
SELECT 
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductsubcategoryName
FROM 
	DimProduct
INNER JOIN
	DimProductSubcategory
ON
	DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey


-- LEFT JOIN
SELECT 
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductsubcategoryName
FROM 
	DimProduct
LEFT JOIN
	DimProductSubcategory
ON
	DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey


-- RIGHT JOIN
SELECT 
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductsubcategoryName
FROM 
	DimProduct
RIGHT JOIN
	DimProductSubcategory
ON
	DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey


/* 13. Como definir quem � a LEFT Table e a RIGHT Table */


-- 1. LEFT JOIN para complementar a informa��o da tabela produtos (LEFT) de acordo com a tabela de categoria (RIGHT)
SELECT
	id_produto,
	nome_produto,
	produtos.id_subcategoria,
	nome_subcategoria
FROM 
	produtos 
LEFT JOIN 
	subcategoria 
ON 
	produtos.id_subcategoria = subcategoria.id_subcategoria


-- 2. Obtendo o LEFT JOIN no caso 1 usando um RIGHT JOIN invertendo as tabelas de lado

SELECT
	id_produto,
	nome_produto,
	produtos.id_subcategoria,
	nome_subcategoria
FROM
	subcategoria
RIGHT JOIN
	produtos
ON
	subcategoria.id_subcategoria = produtos.id_subcategoria

/* Comando CROSS JOIN

Retorna SOMENTE os registros da tabela A

Sintaxe:
	
	SELECT 
		nome_da_coluna,
		nome_da_coluna
	FROM
		nome_da_tabela
	CROSS JOIN
		nome_da_coluna

Legenda: 
	 CROSS JOIN = Combina os resultados da coluna de uma tabela com a coluna de outra tabela

create table marcas (
	id_marca int,
	marca varchar(50)
)

insert into marcas (id_marca, marca)
values (1, 'Apple')
insert into marcas (id_marca, marca)
values (2, 'Samsung')
insert into marcas (id_marca, marca)
values (3, 'Motorola')

select * from marcas
select * from subcategoria
*/
SELECT 
	marca,
	nome_subcategoria
FROM
	marcas
CROSS JOIN subcategoria

/* 16. M�ltiplos Joins */
SELECT ProductKey, ProductName, ProductSubcategoryKey FROM DimProduct

SELECT ProductSubcategoryKey, ProductSubcategoryName, ProductCategoryKey FROM DimProductSubcategory

SELECT ProductCategoryKey, ProductCategoryName FROM DimProductCategory


SELECT 
	ProductKey, 
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductCategoryName
FROM 
	DimProduct 
INNER JOIN
	DimProductSubcategory 
ON 
	DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductCategoryKey
INNER JOIN
	DimProductCategory
ON
	DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey



/* Comando UNION & UNION ALL

	UNION: Realiza a uni�o dos registros entre duas tabelas
	eliminando as linhas duplicadas.
	

	UNION ALL: retorna todos os registros das duas tabelas,
	inclusive as linhas duplicadas.

	Estas tabelas precisam ter estruturas identicas
	para ocorrer a uni�o entre elas.


Sintaxe:
	
	SELECT 
		*
	FROM
		nome_da_tabela
	WHERE
		nome_da_coluna
	UNION
	SELECT 
		*
	FROM
		nome_da_tabela
	WHERE
		nome_da_coluna

Legenda: 
	     UNION = faz a uni�o entre duas tabelas
	 UNION ALL = 
*/
SELECT * FROM DimCustomer WHERE Gender = 'F'
UNION
SELECT * FROM DimCustomer WHERE Gender = 'M'

SELECT FirstName, BirthDate FROM DimCustomer WHERE Gender = 'F'
UNION ALL
SELECT FirstName, BirthDate FROM DimCustomer WHERE Gender = 'M'


-- 9. [SQL Server] Group By + Joins - Aplica��es

/* GROUP BY + JOIN */
-- 1.a) Crie um agrupamento mostrando o total de vendas (SalesQuantity) por ano (CalendarYear).
SELECT 
	dd.CalendarYear AS 'Ano',
	SUM(fs.SalesQuantity) AS 'Total Vendido'
FROM
	FactSales AS fs
INNER JOIN
	DimDate AS dd
ON
	fs.DateKey = dd.Datekey
GROUP BY
	dd.CalendarYear


-- 1.b) Considere apenas o m�s (CalendarMonthLabel) de 'January'.
SELECT 
	dd.CalendarYear AS 'Ano', 
	SUM(fs.SalesQuantity) AS 'Total Vendido' 
FROM 
	FactSales AS fs 
INNER JOIN 
	DimDate AS dd 
ON 
	fs.DateKey = dd.Datekey 
WHERE 
	dd.CalendarMonthLabel = 'January'
GROUP BY 
	dd.CalendarYear


-- 1.c) Na tabela resultante, mostre apenas os anos com um total de vendas maior ou igual a de 1200000.
SELECT 
	dd.CalendarYear AS 'Ano',
	SUM(fs.SalesQuantity) AS 'Total Vendido'
FROM 
	FactSales AS fs
INNER JOIN
	DimDate AS dd
ON
	fs.DateKey = dd.Datekey
WHERE
	dd.CalendarMonthLabel = 'January'
GROUP BY
	dd.CalendarYear
HAVING
	SUM(fs.SalesQuantity) >= 1200000



SELECT TOP(100) * FROM FactSales
SELECT * FROM DimDate


/* 10. [SQL Server] Vari�veis */

-- Aula 2: Tipos de Dados

/* 
Tipos de dados

O tipo de dado � a maneira como o SQL consegue diferenciar cada valor dentro de um banco de dados.

a) Inteiro 
Exemplos:
1, 100, 569

Como o SQL entende um n�mero inteiro: INT


b) Decimal
Exemplos:
10.33, 90.91, 410.787

Como o SQL entende um n�mero decimal: FLOAT
Como o SQL entende um n�mero decimal: DECIMAL(N, M)

N � a quantidade de d�gitos que o n�meto pode ter, incluindo casas decimais
M � o n�mero m�ximo de casas decimais


c) Texto/String
Exemplos:
'Carla', 'Motorola', 'Pastel', '44'

Como o SQL entende um texto: VARCHAR(N)

N � o n�mero de caracteres que o texto pode ter


d) Data
Exemplos:
'01/01/2021', '23/03/2021'

Como o SQL entende uma data/hora: DATETIME
Como o SQL entende uma data: DATE

*/


-- 3. Opera��es B�sicas

SELECT 10 AS 'N�MERO'
SELECT 'Marcus' AS 'NOME'
SELECT '21/06/2024' AS 'DATA'

-- Opera��es com n�meros
SELECT 10 + 20 AS 'Adi��o'
SELECT 20 - 5 AS 'Subtra��o'
SELECT 40 * 9 AS 'Multiplica��o'
SELECT 100.0 / 17 AS 'Divis�o'

-- Opera��es com textos
SELECT 'Leonardo' + ' ' + 'Klestadt' + ' ' + 'Luz' AS 'Nome Completo'

-- Opera��es com datas
SELECT '2024-11-11' - '1984-11-11' AS 'Idade' -- DEU ERRO


-- 4. SQL_VARIANT_PROPERTY - Identificando o tipo de um dado
SELECT 10 AS 'N�mero Decimal'
SELECT 49.50 AS 'N�mero Decimal'
SELECT 'Leonardo' AS 'Nome'
SELECT '20/06/2021' AS 'Data'

SELECT SQL_VARIANT_PROPERTY(10, 'BaseType') AS 'Tipo'
SELECT SQL_VARIANT_PROPERTY(49.50, 'BaseType') AS 'Tipo'
SELECT SQL_VARIANT_PROPERTY('Leonardo', 'BaseType') AS 'Tipo'
SELECT SQL_VARIANT_PROPERTY('20/06/2024', 'BaseType') AS 'Tipo' -- uma data entre aspas simples � entendida como VARCHAR pelo SQL

-- 5. CAST - Especificando/ convertendo o tipo de um dado
SELECT CAST(21.45 AS INT) AS 'Convertido em inteiro'
SELECT CAST(21.45 AS FLOAT) AS 'Convertido em float'
SELECT CAST(18.7 AS FLOAT) AS 'Convertido em float'
SELECT CAST('15.6' AS FLOAT) AS 'Convertido em float'
SELECT CAST('20/06/2021' AS DATETIME) AS 'Convertido em data'


-- 6. FORMAT - Formata��o de dados personalizada

-- a) Num�ricos
SELECT FORMAT(1000, 'N') AS 'Formato de N�mero'
SELECT FORMAT(1000, 'G') AS 'Formato Geral'

-- b) Personalizados:
SELECT FORMAT(123456789, '###-##-####') AS 'Formato Personalizado'

-- c) Data:
SELECT FORMAT(CAST('21/03/2021' AS DATETIME), 'dd/MM/yyyy') AS 'Formato de Data'

-- OU

SELECT FORMAT(CAST('21/03/2021' AS DATETIME), 'dd/MMM/yyyy') AS 'Formato de Data'

-- OU

SELECT FORMAT(CAST('21/03/2021' AS DATETIME), 'dd/MMMM/yyyy') AS 'Formato de Data'


-- 7. ROUND, FLOOR e CEILING - Fun��es de Arredondamento

SELECT 10+20 AS 'Adi��o'
SELECT 20-5 AS 'Subtra��o'
SELECT 31*40 AS 'Multiplica��o'
SELECT 431.0/23 AS 'Divis�o'

-- ROUND -> faz o arredondamento dependendo do n�mero posterior, se de 0 at� 5, arredonda para baixo, se de 6 at� 9, arredonda para cima. Sintaxe: SELECT ROUND(n�mero_decimal, posi��o_do_n�mero_a_ser_arredondado)
SELECT ROUND(18.739130, 2) AS 'N�mero Arredondado' 

-- ROUND (Truncar) -- mant�m o n�mero da casa decimal e traz a quantidade de n�meros de casas decimais dependendodo valor informado no 3� par�metro. Sintaxe: SELECT ROUND(n�mero_decimal, posi��o_na_casa_decimal, quantidade_a_ser_retornada) 
SELECT ROUND(18.739130, 3, 1) AS 'Numero Truncado'

-- FLOOR - arredonda para BAIXO retornando somente a parte inteira do n�mero
SELECT FLOOR(18.739130) AS 'Arredondamento para Baixo'

-- CEILING - arredonda para CIMA retornando somente a parte inteira do n�mero
SELECT CEILING(18.739130) AS 'Arredondamento para Cima'


-- 8. DECLARE e SET Declarando uma vari�vel

/* 
Declarando Vari�veis 

1) O que � uma vari�vel?
Uma vari�vel � um objeto que armazena o valor de um dado.

2. Estrutura

DECLARE @var tipo
SET @var = valor


DECLARE @var1 INT, @var2 INT,
	 @texto VARCHAR(MAX),
	 @data DATETIME
	
SET @var1 = 10
SET @var1 = 45
SET @texto = 'Um texto qualquer'
SET @data = '18/02/2021'

*/

-- Exemplo 1: declare uma vari�vel chamada 'idade' e armazene o valor 30
DECLARE @idade INT
SET @idade = 30
SELECT @idade AS 'Idade'


-- Exemplo 2: declare uma vari�vel chamada 'preco' e armazene o valor 10.89
DECLARE @preco FLOAT
SET @preco = 10.89
SELECT @preco AS 'Pre�o Unit�rio'


-- Exemplo 3: declare uma vari�vel chamada 'nome' e armazene o valor 'Mateus'
DECLARE @nome VARCHAR(50)
SET @nome = 'Mateus'
SELECT @nome AS 'Nome'


-- Exemplo 4: declare uma vari�vel chamad 'data' e armazene a data de hoje.
--DECLARE @data DATETIME
--SET @data = '15/06/2024'
--SELECT @data AS 'Data Atual*'


-- 9. DECLARE e SET Declarando mais de uma vari�vel

-- OP��O 1
--DECLARE @var1 INT
--DECLARE @texto VARCHAR(30)
--DECLARE @data DATETIME

--SET @var1  = 10
--SET @texto  = 'Um texto qualquer'
--SET @data  = '18/02/2021'

--SELECT @var1 AS 'Vari�vel', @texto AS 'Texto', @data AS 'Data'

-- OP��O 2
--DECLARE 
--	@var1 INT, 
--	@texto VARCHAR(30), 
--	@data DATETIME

--SET @var1  = 10
--SET @texto  = 'Um texto qualquer'
--SET @data  = '18/02/2021'

--SELECT @var1 AS 'Vari�vel', @texto AS 'Texto', @data AS 'Data'

-- OP��O 3
DECLARE
	@var1 INT = 10, 
	@texto VARCHAR(30) = 'Um texto qualquer',
	--@data DATETIME = '18/02/2021'

SELECT @var1 AS 'Vari�vel', @texto AS 'Texto', @data AS 'Data'


-- 10. Cuidado ao executar o c�digo com vari�veis

-- selecionar o SELECT junto com as vari�veis para obter o resultado


-- 11. Utilizando uma vari�vel em uma consulta (Parte 1)

-- Exemplo 1: aplique um desconto de 10% em todos os pre�os dos produtos. Sua consulta final deve conter as colunas ProductKey, ProductName, UnitePrice e Pre�o com Desconto.
DECLARE @varDesconto FLOAT = 0.45

SELECT 
	ProductKey AS 'ID',
	ProductName AS 'Nome do Produto',
	UnitPrice AS 'Pre�o Unit�rio',
	UnitPrice * (1 - @varDesconto) AS 'Pre�o com Desconto'
FROM 
	DimProduct

-- 12. Utilizando uma vari�vel em uma consulta (Parte 2)
-- crie uma vari�vel de data para otimizar a consulta abaixo.
DECLARE @varData DATETIME 
SET @varData = '02/06/1981'

SELECT 
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	BirthDate AS 'Nascimento',
	'Cliente' AS 'Tipo'
FROM 
	DimCustomer 
WHERE 
	BirthDate >= @varData

UNION

SELECT 
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	BirthDate AS 'Nascimento',
	'Funcion�rio' AS 'Tipo'
FROM 
	DimEmployee 
WHERE 
	BirthDate >= @varData 
ORDER BY 
	Nascimento


-- 13. Armazenando o resultado de um SELECT em uma vari�vel

-- Exemplo 1: crie uma vari�vel para armazenar a quantidade total de funcion�rios da tabela DimEmployee.
DECLARE @varTotalFuncionarios INT
SET @varTotalFuncionarios = (SELECT COUNT(*) FROM DimEmployee)
SELECT @varTotalFuncionarios AS 'Total de Funcion�rios'


-- Exemplo 2: crie uma vari�vel para armazenar a quantidade total de lojas com o Status off.
DECLARE @varLojaStatusOff INT
SET @varLojaStatusOff = (SELECT COUNT(*) FROM DimStore WHERE Status = 'Off')
SELECT @varLojaStatusOff AS 'Lojas com Status OFF'


-- 14. PRINT - Printando uma mensagem na tela

-- Utilizando PRINT para mostrar o resultado de uma consulta.
SELECT * FROM DimProduct
SELECT COUNT(*) FROM DimProduct


-- Exemplo 1: printe na tela a quantidade de lojas ON e a quantidade de lojas OFF da tabela DimStore. Utilize vari�veis para isso.
SET NOCOUNT ON

DECLARE @varLojasOn INT, @varLojasOff INT
SET @varLojasOn = (SELECT COUNT(*) FROM DimStore WHERE Status = 'ON')
SET @varLojasOff = (SELECT COUNT(*) FROM DimStore WHERE Status = 'OFF')
SELECT @varLojasOn AS 'Lojas Abertas', @varLojasOff AS 'Lojas Fechadas'

PRINT 'Total de lojas abertas: ' + CAST(@varLojasOn AS VARCHAR(10))
PRINT 'Total de lojas fechadas: ' + CAST(@varLojasOff AS VARCHAR(10))



-- 15. Armazenando em uma vari�vel um registro de uma consulta

-- Armazenando em uma vari�vel um registro de uma consulta

SELECT TOP(100) * FROM FactSales ORDER BY SalesQuantity DESC

-- Exemplo 1: qual � o nome do produto que teve maior quantidade vendida EM UMA �NICA VENDA da tabela FactSales?

DECLARE @varProdutoMaisVendido INT
DECLARE @varTotalMaisVendido INT

SELECT TOP(1) 
	@varProdutoMaisVendido = ProductKey,
	@varTotalMaisVendido= SalesQuantity
FROM FactSales
ORDER BY
	SalesQuantity DESC

PRINT @varProdutoMaisVendido
PRINT @varTotalMaisVendido

SELECT 
	ProductKey, 
	ProductName 
FROM 
	DimProduct 
WHERE 
	ProductKey = @varProdutoMaisVendido



-- 16. Acumulando valores dentro de uma vari�vel

-- Exemplo: print na tela uma lista com os nomes das funcion�rias do departamento de Marketing

SELECT FirstName, DepartmentName FROM DimEmployee WHERE DepartmentName = 'Marketing' AND Gender = 'F'

-- Solu��o
DECLARE @varListaNomes VARCHAR(50)
SET @varListaNomes = ''

SELECT 
	@varListaNomes = @varListaNomes + FirstName + ', ' + CHAR(10)
FROM 
	DimEmployee 
WHERE 
	DepartmentName = 'Marketing' 
AND 
	Gender = 'F'

PRINT LEFT(@varListaNomes, DATALENGTH(@varListaNomes) - 3)


-- 17. Vari�veis Globais

SELECT @@SERVERNAME
SELECT @@VERSION
SELECT @@CONNECTIONS

SELECT * FROM DimProduct
SELECT @@ROWCOUNT



-- LEN e DATALENGTH: retorna a quantidade de caracteres de uma palavra 
-- LEN = retorna somente a quantidade de caracteres
-- DATALENGTH: retorna a quantidade de caracteres incluindo espa�os em branco, caso haja

SELECT 
	LEN('SQL Hashtag    ') AS 'Len',
	DATALENGTH('SQL Hashtag    ') AS 'Datalength'

-- CONCAT: permite juntar mais de um texto em uma �nica palavra

-- fa�a uma consulta � tabela DimCustomer onde seja poss�vel visualizar o nome completo de cada cliente


SELECT 
	FirstName AS 'Nome', 
	LastName AS 'Sobrenome', 
	CONCAT(
		FirstName, 
		' ',
		LastName
	) AS 'Nome Completo',
	EmailAddress AS 'E-mail'
FROM 
	DimCustomer


-- LEFT ---> extrai uma determinada quantidade de caracteres de um texto, da esquerda para a direita
-- RIGHT ---> extrai uma determinada quantidade de caracteres de um texto, da direita para esquerda

-- Fa�a uma consulta � tabela DimProduct e divida a coluna StyleName em duas partes

SELECT * FROM DimProduct

SELECT LEFT('Product0101001', 7)
SELECT RIGHT('Product0101001', 7)


SELECT ProductName AS 'Produto', UnitPrice AS 'Pre�o', LEFT(StyleName, 7) AS 'Cod 1', RIGHT(StyleName, 7) AS 'Cod 2' FROM DimProduct


-- REPLACE: Substitui um determinado texto por outro texto
-- No texto 'O Excel � o melhor', substitua 'Excel' por SQL

SELECT REPLACE('O Excel � o melhor', 'Excel', 'SQL')

-- Crie uma consulta a partir de DimCustomer onde voc� retorna o Nome Completo do Clientes, a coluna de Sexo (Abrev) e uma outra coluna de Sexo substituindo M por Masculino e Fpor Feminino

SELECT * FROM DimCustomer

SELECT
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	Gender AS 'Sexo (Avrev.)',
	REPLACE(
		REPLACE(
			Gender, 
			'M', 
			'Masculino'
		), 
		'F', 
		'Feminino' 
	) AS 'Sexo'
FROM 
	DimCustomer

-- TRANSLATE e STUFF: OUTRAS FUN��ES DE SUBSTITUI��O

-- TRANSLATE: Substitui cada caracter na ordem encontrada no texto

SELECT TRANSLATE('10.241/444.124k23/1', './k', '---')

SELECT TRANSLATE('ABCD-490123', 'ABCD', 'WXYZ')


-- STUFF: Substitui qualquer texto com uma quantidade de caracteres limitados, por outro texto

SELECT STUFF('VBA Impressionador', 1, 3, 'Excel')


SELECT 
	STUFF('MT98-Moto G', 1, 2, 'Cel'), 
	STUFF('AP01-IPhone', 1, 2, 'Cel'), 
	STUFF('SS61-Samsung Galax', 1, 2, 'Cel')

-- UPPER ---> transforma o texto em mai�scula
-- LOWER ---> transforma o texto em min�scula
-- Fa�a uma consulta � tabela DiCustomer e utilize as fun��es UPPER e LOWER na coluna de FirtsName para observar o resultado.
SELECT 
	FirstName AS 'NOME',
	UPPER(FirstName) AS 'TUDO MAI�SCULO',
	LOWER(FirstName) AS 'TUDO MIN�SCULO',
	EmailAddress AS 'E-MAIL'
FROM 
	DimCustomer
-- FORMAT: formata um valor de acordo com uma formata��o

-- 1. formata��o de n�mero

-- 5123

-- geral
SELECT FORMAT(5123, 'G') AS 'Formato geral' -- resultado sem formata��o

-- n�mero
SELECT FORMAT(5123, 'N') AS 'Formato num�rico' -- resultado num�rico

-- moeda
SELECT FORMAT(5123, 'C') AS 'Formato moeda' -- resultado em moeda




-- 2. formata��o de data

-- 23/04/2020

-- dd/MM,yyyy
SELECT FORMAT(CAST('23/04/2020' AS DATETIME),'dd/MMMM/yyyy', 'en-US') AS 'Data'

-- dia
SELECT FORMAT(CAST('23/04/2020' AS DATETIME),'dd') AS 'Dia'

-- m�s
SELECT FORMAT(CAST('23/04/2020' AS DATETIME), 'dddd') AS 'M�s'

-- Ano
SELECT FORMAT(CAST('23/04/2020' AS DATETIME), 'yyyy') AS 'Ano'

-- 3. Formata��o personalizada
-- 1234567 --> 12-34-567
SELECT FORMAT(1234567, '##-##-###') AS 'Formato Personalizado'


-- CHARINDEX: descobre a posi��o de um determinado caracter dentro de um texto
-- SUBSTRING: extrai alguns caracteres de dentro de um texto

SELECT 'Raquel Moreno' AS 'Nome'

-- Descubra a posi��o em que come�a o sobrenome da Raquel utilizando a fun��o CHARINDEX.
SELECT CHARINDEX('M', 'Raquel Moreno') AS 'Posi��o do Caracter'
SELECT CHARINDEX('Moreno', 'Raquel Moreno') AS 'Posi��o Inicial do Sobrenome'
-- 'M' = o que extrair
-- 'Raquel Moreno' = local da pesquisa

-- extraia o sobrenome da Raquel utilizando a fun��o SUBSTRING.
SELECT SUBSTRING('Raquel Moreno', 8, 6) AS 'Sobrenome'
-- 'Raquel Moreno' = local da pesquisa
-- 8 = posi��o onde inicia a pesquisa
-- 6 = quantidade de caracteres desejado a partir da posi��o onde inicia a pesquisa


-- Combine as fun��es CHARINDEX e SUBSTRING para extrair de forma autom�tica qualquer sobrenome
DECLARE 
	@varNome VARCHAR(100) = 'Leonardo Klestadt Luz', 
	@varIncremento INT = + 1

SELECT SUBSTRING(@varNome, CHARINDEX(' ', @varNome) + @varIncremento, 100) AS 'Sobrenome'

-- Fu��es para retirar espa�os adicionais dentro de um texto
-- TRIM: retira espa��as adicionais � esquerda e � direita do texto 
-- LTRIM: retira espa��as adicionais � esquerda do texto 
-- RTRIM: retira espa��as adicionais � direita do texto

-- Utilize as fun��es acima no c�digo '   ABC123   '

DECLARE @varCodigo VARCHAR(50)
SET @varCodigo = '   ABC123   '

SELECT TRIM(@varCodigo) AS 'Trim'
SELECT LTRIM(@varCodigo) AS 'LTrim'
SELECT RTRIM(@varCodigo) AS 'RTrim'


SELECT DATALENGTH(TRIM(@varCodigo)) AS 'Trim'
SELECT DATALENGTH(LTRIM(@varCodigo)) AS 'LTrim'
SELECT DATALENGTH(RTRIM(@varCodigo)) AS 'RTrim'


-- Utilize as fun��es DAY, MONTH e YEAR para descobrir o dia, m�s e ano da data: 18/05/2020

DECLARE @varData DATETIME
SET @varData = '11/11/1984'

SELECT 
	DAY(@varData) AS 'Dia',
	MONTH(@varData) AS 'M�s',
	YEAR(@varData) AS 'Ano'

-- Utilize a fun��o DATEFROMPARTS para obter uma data a partir das informa��es de dia, m�s e ano

DECLARE @varDia INT, @varMes INT, @varAno INT
SET @varDia = 12
SET @varMes = 01
SET @varAno = 1988

SELECT 
	DATEFROMPARTS(@varAno, @varMes, @varDia) AS 'DATA'

-- GETDATE: Retorna a data/hora atual do sistema
-- SYSDATETIME: Retorna a data/hora atual do sistema (mais preciso que a GETDATE)
-- DATENAME e DATEPART: Retornam informa��es (dia, m�s, ano, semana, etc) em uma data.


SELECT GETDATE() AS 'Data e Hora Atuais'
SELECT SYSDATETIME() AS 'Data e Hora Atuais mais Completas'

-- DATENAME: retorna o resultado em forma de texto
DECLARE @varData DATETIME
SET @varData = GETDATE()

SELECT
	DATENAME(DAY, @varData) AS 'Dia da Data',
	DATENAME(MONTH, @varData) AS 'M�s da Data',
	DATENAME(YEAR, @varData) AS 'Ano da Data',
	DATENAME(DAYOFYEAR, @varData) AS 'Dia do Ano',
	DATENAME(WEEKDAY, @varData) AS 'Dia da Semana'


-- DATEPART/**/: retorna o resultado em forma de n�mero
SELECT
	DATEPART(DAY, @varData) AS 'Dia da Data',
	DATEPART(MONTH, @varData) AS 'M�s da Data',
	DATEPART(YEAR, @varData) AS 'Ano da Data',
	DATEPART(DAYOFYEAR, @varData) AS 'Dia do Ano',
	DATEPART(WEEKDAY, @varData) AS 'Dia da Semana'


SELECT
	SQL_VARIANT_PROPERTY(DATENAME(DAY, @varData), 'BaseType') AS 'Tipo de Dado',
	SQL_VARIANT_PROPERTY(DATEPART(DAY, @varData), 'BaseType') AS 'Tipo de Dado'

-- DATEADD: Adiciona ou subtrai uma determinada quantidade de dias, meses e anos a uma data
-- DATEDIFF: Calcula a diferen�a entre duas datas

DECLARE @varData1 DATETIME, @varData2 DATETIME, @varData3 DATETIME
SET @varData1 = '10/07/2020'
SET @varData2 = '05/03/2020'
SET @varData3 = '14/11/2021'

-- DATEADD
SELECT
	DATEADD(MONTH, 1, @varData2) AS 'Somado 1 m�s a partir da data1',
	DATEADD(QUARTER, -1, @varData2) AS 'Subtraido 1 trimestre a partir da data1'


-- DATEDIFF
SELECT
	DATEDIFF(DAY, @varData2, @varData3) AS 'Qtd. de dias entre data2 e data3',
	DATEDIFF(WEEK, @varData1, @varData3) AS 'Qtd. de semanas entre data1 e data3'
*/

-- CASE : A fun��o CASE permite tratar condi��es no SQL

/*	CASE
		WHEN teste_logico THEN 'resultado1'
		ELSE 'resultado2'
	END

-- Dtermine a situa��o do aluno. M�dia >= 6: aprovado. Caso contr�rio: reprovado

DECLARE @varNota FLOAT
SET @varNota = 5.9

SELECT 
	CASE
		WHEN @varNota >= 6 THEN 'Aprovado'
		ELSE 'Reprovado'
	END AS 'Situa��o do Aluno'


-- A data de vencimento de um produto � no dia: 10/03/2022. Fa�a um teste l�gico para verificar se um produto passou da validade ou n�o.

DECLARE @varDataVencimento DATETIME, @varDataAtual DATETIME
SET @varDataVencimento = '10/03/2022'
SET @varDataAtual = GETDATE() --'30/04/2020'

SELECT
	CASE
		WHEN @varDataAtual > @varDataVencimento THEN 'Produto Vencido'
		ELSE 'Na Validade'
	END AS 'Vencimento do Produto'

-- Fa�a um SELECT das colunas CustomeKey, FirstName e Gender na tabela DimCustomer e utilize o CASE para criar uma 4� coluna com a informa��o de 'Masculino' ou 'Feminino'.

SELECT 
	CustomerKey AS 'ID  Cliente', 
	FirstName AS 'Nome', 
	Gender AS 'Sexo',
	CASE
		WHEN Gender = 'M' THEN 'Masculino'
		ELSE 'Feminino'
	END AS 'Sexo (CASE)'
FROM
	DimCustomer
*/

-- CASE: A fun��o CASE permite tratar condi��es no SQL

/*	CASE
		WHEN teste_l�gico2 THEN 'resultado1'
		WHEN teste_l�gico2 THEN 'resultado2'
		ELSE 'resultado3'
	END

Exemplo: 

Crie um c�digo para verificar a nota do aluno e determinar a situa��o:
- Aprovado: nota maior ou igual a 6
- Prova final: nota entre 4 e 6
- Reprovado: nota abaixo de 4

DECLARE @varNota FLOAT
SET @varNota = 5.9

SELECT 
	CASE
		WHEN @varNota >= 6 THEN 'Aprovado'
		ELSE 'Reprovado'
	END AS 'Situa��o do Aluno'

DECLARE @varNota FLOAT
SET @varNota = 9

SELECT 
	CASE
		WHEN @varNota >= 6 THEN 'Aprovado'
		WHEN @varNota BETWEEN 4 AND 6 THEN 'Prova Final'
		ELSE 'Reprovado'
	END AS 'Situa��o do Aluno'


-- Classifique o produto de acordo com seu pre�o:
-- Pre�o >= 40000: luxo
-- Pre�o >= 10000 e Pre�o < 40000: econ�mico
-- Pre�o < 10000: b�sico

DECLARE @varPreco FLOAT
SET @varPreco = 39999

SELECT
	CASE
		WHEN @varPreco >= 40000 THEN 'LUXO'
		WHEN @varPreco >= 10000 THEN 'ECON�MICO'
		ELSE 'B�SICO'
	END AS 'Tipo de Produto'


SELECT 
	CustomerKey AS 'ID  Cliente', 
	FirstName AS 'Nome', 
	Gender AS 'Sexo',
	CASE
		WHEN Gender = 'M' THEN 'Masculino'
		WHEN Gender = 'F' THEN 'Feminino'
		ELSE 'Empresa'
	END AS 'Sexo (CASE)'
FROM
	DimCustomer


-- CASE/AND e CASE/OR
--Fc�a uma consulta � tabela DimProduct, e retorne as colunas ProductName, BrandName, ColorName, UnitePrice e uma coluna de pre�o com desconto.


-- a) Caso o produto seja da marca Contoso E da cor Red, o desconto do produto ser� de 10%. Caso contr�rio n�o ter� nenhum desconto.
SELECT 
	ProductName, 
	BrandName, 
	ColorName, 
	UnitPrice,
	CASE
		WHEN BrandName = 'Contoso' AND ColorName = 'Red' THEN 0.1
		ELSE 0
	END AS 'Pre�o com Desconto'
FROM
	DimProduct



-- Caso produto seja da marca Litware OU Fabrikam, ele receber� um desconto de 5%. Caso contr�rio n�o ter� nenhum desconto.

SELECT 
	ProductName, 
	BrandName, 
	ColorName, 
	UnitPrice,
	CASE
		WHEN BrandName = 'Litware' OR BrandName = 'Fabrikam' THEN 0.05
		ELSE 0
	END AS 'Pre�o com Desconto'
FROM
	DimProduct


-- CASE aninhado
-- DimEmployee
--SELECT * FROM DimEmployee

-- 4 cargor (Title):
-- Sales Group Manager
-- Sales Region Manager
-- Sales State Manager
-- Sales Store Manager


-- Assalariado (SalariedFlag)?
-- SalariedFlag = 0: n�o � assalariado
-- SalariedFlag = 1: � assalariado

-- Situa��o: C�lculo do b�nus
-- Sales Group Manager: Se for assalariado, 30%; Se n�o, 20%
-- Sales Region Manager: 15%
-- Sales State Manager: 7%
-- Sales Store Manager: 2%


SELECT 
	FirstName,
	Title,
	SalariedFlag,
	CASE
		WHEN Title = 'Sales Group Manager' THEN
		CASE 
			WHEN SalariedFlag = 1 THEN 0.3
			ELSE 0.2
		END
		WHEN Title = 'Sales Region Manager' THEN 0.15
		WHEN Title = 'Sales State Manager' THEN 0.07
		ELSE 0.02
	END AS 'B�nus'
FROM 
	DimEmployee
ORDER BY
	FirstName


-- Case Aditivo
-- Os produtos da categoria 'TV and Video' ter�o um desconto de 10%.
-- Se al�m de ser da categoria 'TV and Video', o produto for da subcategoria 'Televisions', receber� mais 5%. Total 15%.

SELECT 
	DP.ProductKey,
	DP.ProductName,
	DPC.ProductCategoryName,
	DPS.ProductSubCategoryName,
	DP.UnitPrice,
	CASE
		WHEN DPC.ProductCategoryName = 'TV and Video' THEN 0.10
		ELSE 0
	END
	+
	CASE
		WHEN DPS.ProductSubcategoryName = 'Televisions' THEN 0.05
		ELSE 0
	END AS 'Desconto'
FROM 
	DimProduct DP
INNER JOIN
	DimProductSubcategory DPS
ON DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey
INNER JOIN
	DimProductCategory DPC
ON
	DPS.ProductCategoryKey = DPC.ProductCategoryKey
	
-- Fun��o IIF: Alternativa ao CASE
-- Exemplo 1: Qual � a categoria de risco do projeto abaixo, de acordo com sua nota:
-- Risco alto: classificado >= 5
-- Risco baixo: classificado < 5

DECLARE @varClassificacao INT
SET @varClassificacao = 3

SELECT 
	IIF(
		@varClassificacao >= 5,
		'Risco Alto',
		'Risco Baixo'
	) AS 'Classifica��o de Risco'




-- Exemplo 2: Crie uma coluna �nica de 'Cliente', contendo o nome do cliente, seja eleuma pessoa ou empresa. Traga tamb�m a coluna de CustomerKey e CustomerType.

-- SELECT * FROM DimCustomer

SELECT 
	CustomerKey,
	CustomerType,
	IIF(
		CustomerType = 'Person',
		FirstName,
		CompanyName
	) AS 'Cliente'
FROM
	DimCustomer

-- IIF Composto
--SELECT * FROM DimProduct


-- Existem 3 tipos de estoque: High, Mid e Low. Fa�a um SELECT contendo as colunas de ProductKey, ProductName, StockTypeName e Nome do respons�vel pelo produto, de acordo com o tipo de estoque. A regra dever� ser a seguinte:

-- Jo�o � respons�vel pelos produtos High
-- Maria � respons�vel pelos produtos Mid
-- Luis � respons�vel pelos produtos Low

SELECT 
	ProductKey,
	ProductName,
	StockTypeName,
	IIF(
		StockTypeName = 'High',
		'Jo�o',
		IIF(
			StockTypeName = 'Mid',
			'Maria',
			'Luis'
		)
	) AS 'Respons�vel'
FROM 
	DimProduct



-- ISNULL: Tratando valores nulos
SELECT * FROM DimGeography

SELECT 
	GeographyKey,
	ContinentName, 
	CityName,
	ISNULL(CityName, 'Local Desconhecido')
FROM
	DimGeography


-- 13. [SQL Server] SQL Views

/* Criando a primeira view

OBSERVA��O: AS INSTRU��ES DE CREATE VIEW DEVEM SER LIMITADAS ENTRE OS COMANDOS GO

Quando falamos de views, existem 3 a��es envovidas:
1. Cria��o de uma View
2. Altera��o de uma View
3. Exclus�o de uma View

Para cada uma dessas a��es, temos um comando associado:
1. CREATE VIEW
2. ALTER VIEW
3. DROP VIEW
*/

-- 1. CREATE VIEW
-- a) Crie uma VIEW contendo as seguintes informa��es da tabela DimCustomer: FirstName, EmailAddress e BirthDate. Chame essa view de vwClientes.
GO
CREATE VIEW vwClientes2 AS
SELECT 
	FirstName AS 'Nome', 
	EmailAddress AS 'E-mail', 
	BirthDate AS 'Data de Nascimento' 
FROM 
	DimCustomer
GO
SELECT * FROM vwClientes


-- b) Crie uma view contendo as seguintes informa��es da tabela DimProduct: ProductKey, ProductName, ProductSubcategoryKey, BrandName e UnitPrice. Chame essa view de vwProdutos
GO
CREATE VIEW vwProdutos2 AS
SELECT 
	ProductKey AS 'C�digo', 
	ProductName AS 'Nome', 
	ProductSubcategoryKey AS 'C�digo Subcategoria', 
	BrandName AS 'Marca', 
	UnitPrice AS 'Pre�o Unit�rio' 
FROM 
	DimProduct 
GO
SELECT * FROM vwProdutos


-- 2. ALTER VIEW
-- a) Altere a view criada no exemplo 1a para incluir apenas os clientes do sexo Feminino.

SELECT * FROM vwClientes

GO
	ALTER VIEW vwClientes AS
	SELECT 
		FirstName AS 'Nome',
		EmailAddress AS 'E-mail',
		BirthDate AS 'Data de Nascimento',
		Gender AS 'Sexo'
	FROM 
		DimCustomer
	WHERE
		Gender = 'F'
GO

-- b) Altere a view criada no exemplo 1b para incluir apenas os produtos da subactegoria 'Televisions'.

SELECT * FROM DimProduct

SELECT * FROM DimProductSubcategory


SELECT * FROM vwProdutos

GO
	SELECT
		ProductKey AS 'C�digo', 
		ProductName AS 'Nome', 
		ProductSubcategoryKey AS 'C�digo Subcategoria', 
		BrandName AS 'Marca', 
		UnitPrice AS 'Pre�o Unit�rio'
	FROM 
		DimProduct
	WHERE 
		ProductSubcategoryKey = 9
GO

-- 3. DROP VIEW
-- Exclua as Views vmClientes e vmProdutos


DROP VIEW vwClientes
DROP VIEW vwProdutos
*/

/*	1. O que � uma subquery?

Uma subquery (subconsulta ou subselect), nada mais � do que uma consulta dentro de outra consulta. Ou seja, com uma subquery conseguimos utilizar o resultado de uma query (consulta ou SELECT) dentro de outra consulta ou SELECT.

Em resumo, uma subquery � um select dentro de outro select.

2. Onde utilizamos uma subquery?

Subquerys podem ser utilizadas em 3 situa��es poss�veis:

1. junto com WHERE, funcionando como um filtro vari�vel.
2. junto com SELECT, como uma nova coluna na tabela.
3. junto com o FROM, como uma nova tabela.


Ex:

Imagina que eu quero selecionar os produtos com pre�o maior do que a m�dia


-- 1� PASSO,DESCOBRIR A M�DIA
SELECT AVG(UnitPrice) FROM DimProduct

-- 2� PASSO, FILTRAR PRE�OS ACIMA DA M�DIA
SELECT * FROM DimProduct WHERE UnitPrice > 356.8301

-- SUBQUERY
SELECT * FROM DimProduct WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM DimProduct)

-- 3. ALGUNS EXEMPLOS...

-- em 4 situa��es poss�veis

-- 1 - subquery junto com WHERE, como um filtro din�mico e escalar (valor �nico)

-- SELECT coluna1, coluna2 FROM tabela WHERE coluna1 = (SELECT)


-- 2 - subquery junto com WHERE, como um filtro din�mico e em lista (v�rios valores)

-- SELECT coluna1, coluna2 FROM tabela WHERE coluna1 IN (SELECT)


-- 3 - subquery junto com SELECT, como uma nova coluna

-- SELECT coluna1, coluna2, (SELECT) FROM tabela

-- 4 - subquery junto com FROM, como uma nova tabela

-- SELECT coluna1, coluna2 FROM (SELECT) AS T

	Para entender aideia por tr�s das subqueries, vamos come�ar fazendo 3 exemplos co a aplica��o WHERE.

No exemplo 1, imagine que voc� queira fazer uma consulta � tabela DimProduct e considerar apenas os produtos com os custos acima da m�dia. Como poder�amos afzer isso?


SELECT AVG(UnitCost) FROM DimProduct

SELECT * FROM DimProduct WHERE UnitCost >= (SELECT AVG(UnitCost) FROM DimProduct)

-- No exemplo 2, queremos filtrar nossa tabela DimProduct e retornar os produtos da categoria Televisions. Por�m, n�o temos a informa��o de nome da subcategoria na tabela Dim Product. Dessa forma, precisaremos criar um select que descubra o ID da subcategoria Televisions, e passar esse resultado como o valor que queremos filtrar dentro do WHERE.

SELECT * FROM DimProduct
WHERE ProductSubcategoryKey = (
                                SELECT ProductSubcategoryKey
							    FROM DimProductSubcategory 
							    WHERE ProductSubcategoryName = 'Televisions'
							  )

-- No exemplo 3, queremos filtrar nossa tabela FactSales e mostrar as vendas referentes �s lojas com 100 ou mais funcion�rios

SELECT * FROM FactSales WHERE StoreKey IN (SELECT StoreKey FROM DimStore WHERE EmployeeCount >= 100)

CREATE TABLE FUNCIONARIOS(
	ID_FUNCIONARIOS INT,
	NOME VARCHAR(50),
	IDADE INT,
	SEXO VARCHAR(50)
)

INSERT INTO FUNCIONARIOS(ID_FUNCIONARIOS, NOME, IDADE, SEXO)
VALUES
	(1, 'JULIA', 20, 'F'),
	(2, 'DANIEL', 21, 'M'),
	(3, 'AMANDA', 22, 'F'),
	(4, 'PEDRO', 23, 'M'),
	(5, 'ANDR�', 24, 'M'),
	(6, 'LUISA', 25, 'F')

SELECT * FROM FUNCIONARIOS

-- ANY, SOME E ALL

-- selecione os funcion�rios do sexo masculino, mas utilizando a coluna de idade

SELECT 
	* 
FROM 
	FUNCIONARIOS 
WHERE 
	IDADE IN (21, 23, 24)

SELECT 
	* 
FROM 
	FUNCIONARIOS 
WHERE 
	IDADE IN (SELECT IDADE FROM FUNCIONARIOS WHERE SEXO = 'M')


-- = ANY(valor1, valor2, valor3): 
-- Equivalente ao IN, retorna as linhas da tabela que sejam iguais ao valor1, valor2 e valor3
SELECT 
	* 
FROM 
	FUNCIONARIOS 
WHERE 
	IDADE = ANY (SELECT IDADE FROM FUNCIONARIOS WHERE SEXO = 'M')


-- > ANY(valor1, valor2, valor3): 
-- Retorna as linhas da tabela com valores maiores que o valor1, OU valor2 e OU valor3. Ou seja, maior que o m�nimo
SELECT 
	* 
FROM 
	FUNCIONARIOS 
WHERE 
	IDADE >= ANY (SELECT IDADE FROM FUNCIONARIOS WHERE SEXO = 'M')


-- < SOME(valor1, valor2, valor3): 
-- Retorna as linhas da tabela com valores maiores que o valor1, OU valor2 e OU valor3. Ou seja, menor que o m�ximo
SELECT 
	* 
FROM 
	FUNCIONARIOS 
WHERE 
	IDADE < SOME (SELECT IDADE FROM FUNCIONARIOS WHERE SEXO = 'M')


-- > ALL(valor1, valor2, valor3): 
-- Retorna as linhas da tabela com valores maiores que o valor1, E valor2 e E valor3. Ou seja, menor que o m�ximo
SELECT 
	* 
FROM 
	FUNCIONARIOS 
WHERE 
	IDADE > ALL (SELECT IDADE FROM FUNCIONARIOS WHERE SEXO = 'M')


-- > ALL(valor1, valor2, valor3): 
-- Retorna as linhas da tabela com valores maiores que o valor1, E valor2 e E valor3. Ou seja, menor que o m�nimo
SELECT 
	* 
FROM 
	FUNCIONARIOS 
WHERE 
	IDADE < ALL (SELECT IDADE FROM FUNCIONARIOS WHERE SEXO = 'M')

-- EXISTS
-- Retornar uma tabela com todos os produtos (id produto, nome produto) que possuem alguma venda no dia 01/01/2007

SELECT COUNT(*) FROM DimProduct --2.517 produtos

SELECT TOP(100) * FROM FactSales

SELECT 
	ProductKey, 
	ProductName 
FROM 
	DimProduct
WHERE EXISTS(
		SELECT 
			ProductKey
		FROM
			FactSales
		WHERE
			DateKey = '01/01/2007'
		AND
			FactSales.ProductKey = DimProduct.ProductKey
      )


-- 9. Subquery na pr�tica - Aplica��o com o SELECT

-- Subqueries: SELECT

-- Retornar uma tabela com todos os produtos (ID Produto e Nome Produto)e tamb�m o total de vendas para cada produto

SELECT 
	ProductKey, 
	ProductName,
	(
		SELECT 
			COUNT(ProductKey) 
		FROM 
			FactSales
		WHERE 
			FactSales.ProductKey = DimProduct.ProductKey
	) AS 'Qtd. Vendas'
FROM 
	DimProduct


-- 10. Subquery na pr�tica - Aplica��o com o FROM

-- Subqueries: FROM
-- Retornar a quantidade total de produtos da marca Contoso

SELECT 
	COUNT(*) 
FROM 
	DimProduct 
WHERE 
	BrandName = 'Contoso'

SELECT 
	COUNT(*) 
FROM 
	(
		SELECT 
			* 
		FROM 
			DimProduct 
		WHERE 
			BrandName = 'Contoso'
	) AS T

-- 11. Plano de Execu��o Estimado

SELECT 
	COUNT(*) 
FROM 
	DimProduct 
WHERE 
	BrandName = 'Contoso'

SELECT 
	COUNT(*) 
FROM 
	(
		SELECT 
			* 
		FROM 
			DimProduct 
		WHERE 
			BrandName = 'Contoso'
	) AS T

-- 12. Subquery aninhada (Parte 1)

-- Subqueries aninhadas
-- Descubra o nome dos clientes que ganham o segundo maior sal�rio

SELECT 
	*
FROM
	DimCustomer
WHERE 
	CustomerType = 'Person'
ORDER BY
	YearlyIncome DESC

SELECT DISTINCT TOP(2) YearlyIncome 
FROM DimCustomer 
WHERE CustomerType = 'Person' 
ORDER BY YearlyIncome DESC

SELECT CustomerKey, FirstName, LastName, YearlyIncome
FROM DimCustomer
WHERE YearlyIncome = 160000

-- ETAPAS

-- 1. Descobrir qual o maior sal�rio
-- 2. Descobrir qual o segundo maior sal�rio
-- 3. Descobrir o nome dos clientes que ganham o segundo maior sal�rio

-- 13. Subquery aninhada (Parte 2)

SELECT CustomerKey, FirstName, LastName, YearlyIncome
FROM DimCustomer
WHERE YearlyIncome = 160000

-- Descubra os nomes dos clientes que ganham o segundo maior sal�rio

SELECT 
	CustomerKey, 
	FirstName, 
	LastName, 
	YearlyIncome
FROM 
	DimCustomer
WHERE 
	YearlyIncome = (
		SELECT 
			MAX(YearlyIncome)
		FROM 
			DimCustomer
		WHERE 
			YearlyIncome < (
				SELECT 
					MAX(YearlyIncome)
				FROM 
					DimCustomer
				WHERE 
					CustomerType = 'Person'
	)
)

-- 14. CTE - O que � e como criar

-- CTE: Common Table Expression
-- Crie uma CTE para armazenar o resultado de uma consulta que contenha: ProductKey, ProductName, BrandName, ColorName e UnitePrice, apenas para a marca Contoso

WITH cte AS (
	SELECT
		ProductKey,
		ProductName,
		BrandName,
		ColorName,
		UnitPrice
	FROM
		DimProduct
	WHERE
		BrandName = 'Contoso'
)

SELECT * FROM cte

-- 15. Calculando agrega��es com CTE

-- CTE: Calculando agrega��es
-- Crie uma CTE que seja o resultado do agrupamento de total de produtos por marca. Fa�a uma m�dia de produtos por marca.

WITH cte AS (
SELECT 
	BrandName,
	COUNT(*) AS 'Total'
FROM
	DimProduct
GROUP BY
	BrandName
)

--SELECT * FROM cte

SELECT AVG(Total) FROM cte

-- 16. Nomeando colunas de uma CTE
WITH CTE(Marca, Total) AS (
SELECT
	BrandName,
	COUNT(*)
FROM
	DimProduct
GROUP BY
	BrandName
)

SELECT Marca, Total FROM CTE

--17. Criando m�ltiplas CTE's

-- CTE: Criando m�ltiplas CTE's

--Crie duas CTE's:
-- 1. A primeira, chamada produtos_contoso, deve conter as seguintews colunas (DimProduct): ProductKey, ProductName, BrandName.
-- 2. A segunda, chamada vendas_top100, deve ser um top 100 vendas masi recentes, considerando as seguintes colunasa (FactSales): SalesKey, ProductKey, DateKey, SalesQuantity

-- Por fim, fa�a um INNER JOIN dessas tabelas

WITH produtos_contoso AS (
SELECT
	ProductKey,
	ProductName,
	BrandName
FROM
	DimProduct
WHERE
	BrandName = 'Contoso'
),
vendas_top100 AS (
SELECT TOP(100)
	SalesKey,
	ProductKey,
	DateKey,
	SalesQuantity
FROM
	FactSales
ORDER BY
	DateKey  DESC
)

SELECT * FROM vendas_top100
INNER JOIN produtos_contoso
ON vendas_top100.ProductKey = produtos_contoso.ProductKey

-- 16. [SQL Server] Loops no SQL


-- 2. WHILE - Estrutura b�sica

-- Loop while
-- Crie um contador que fa�a uma contagem de 1 a 10 utilizando a estrutura de repeti��o WHILE


declare @varContador int
set @varContador = 0

while @varContador <= 10
begin
	print 'O valor do contador �: ' + convert(varchar, @varContador)
	set @varContador = @varContador + 1
end

-- 3. WHILE - Cuidado com loops infinitos

declare @varContador int
set @varContador = 0

while @varContador <= 5
begin
	print 'O valor do contador �: ' + convert(varchar, @varContador)
	set @varContador = @varContador + 1
end

-- Loop While: BREAK
-- Fa�a um contador de 1 a 100. OBS: se o valor do contador for igual a 15, ent�o o loop while deve ser encerrado.

declare @varContador int
set @varContador = 1

while @varContador <= 100
begin
	if @varContador = 15
	break
	print 'O valor do contador �: ' + convert(varchar, @varContador)
	--set @varContador = @varContador + 1
	-- ou
	set @varContador += 1
end
*/


-- 5. CONTINUE - Pulando repeti��es em um loop

-- Loop While: CONTINUE
-- Fa�a um contador de 1 a 10. OBS: os n�meros 3 e 6 n�o podem ser printados

declare @varContador int
set @varContador = 0

while @varContador < 10
begin
	set @varContador += 1
	if @varContador = 3 or @varContador = 6
	continue
	print 'O valor da vari�vel �: ' + convert(varchar, @varContador)
end



