USE ContosoRetailDW
/*
/* 1. Voc� � respons�vel por controlar os dados de clientes e de produtos da sua empresa.
O que voc� precisar� fazer � confirmar se:

a. Existem 2.517 produtos cadastrados na base e, se n�o tiver, voc� dever� reportar ao seu
gestor para saber se existe alguma defasagem no controle dos produtos.

b. At� o m�s passado, a empresa tinha um total de 19.500 clientes na base de controle.
Verifique se esse n�mero aumentou ou reduziu.
*/

-- a. Existem 2.517 produtos cadastrados na base e, se n�o tiver, voc� dever� reportar ao seu gestor para saber se existe alguma defasagem no controle dos produtos.
SELECT 
	* 
FROM 
	DimProduct

-- b. At� o m�s passado, a empresa tinha um total de 19.500 clientes na base de controle. Verifique se esse n�mero aumentou ou reduziu.
SELECT 
	* 
FROM 
	DimCustomer


/* 2. Voc� trabalha no setor de marketing da empresa Contoso e acaba de ter uma ideia de oferecer
descontos especiais para os clientes no dia de seus anivers�rios. Para isso, voc� vai precisar
listar todos os clientes e as suas respectivas datas de nascimento, al�m de um contato.

a) Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela
dimCustomer.

b) Renomeie as colunas dessa tabela usando o alias (comando AS).
*/

-- a) Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela dimCustomer.
-- b) Renomeie as colunas dessa tabela usando o alias (comando AS).
SELECT 
	CustomerKey AS 'Chave do Cliente',
	FirstName AS 'Primeiro Nome',
	EmailAddress AS 'Endere�o de Email',
	BirthDate AS 'Data de Nascimento'
FROM 
	DimCustomer


/* 3. A Contoso est� comemorando anivers�rio de inaugura��o de 10 anos e pretende fazer uma
a��o de premia��o para os clientes. A empresa quer presentear os primeiros clientes desde
a inaugura��o. 

Voc� foi alocado para levar adiante essa a��o. Para isso, voc� ter� que fazer o seguinte:

a) A Contoso decidiu presentear os primeiros 100 clientes da hist�ria com um vale compras
de R$ 10.000. Utilize um comando em SQL para retornar uma tabela com os primeiros
100 primeiros clientes da tabela dimCustomer (selecione todas as colunas).

b) A Contoso decidiu presentear os primeiros 20% de clientes da hist�ria com um vale
compras de R$ 2.000. Utilize um comando em SQL para retornar 10% das linhas da sua
tabela dimCustomer (selecione todas as colunas).

c) Adapte o c�digo do item a) para retornar apenas as 100 primeiras linhas, mas apenas as
colunas FirstName, EmailAddress, BirthDate.

d) Renomeie as colunas anteriores para nomes em portugu�s

*/

-- a) A Contoso decidiu presentear os primeiros 100 clientes da hist�ria com um vale compras de R$ 10.000. Utilize um comando em SQL para retornar uma tabela com os primeiros 100 primeiros clientes da tabela dimCustomer (selecione todas as colunas).
SELECT 
	TOP(100) * 
FROM
	DimCustomer


/* b) A Contoso decidiu presentear os primeiros 20% de clientes da hist�ria com um vale
compras de R$ 2.000. Utilize um comando em SQL para retornar 10% das linhas da sua
tabela dimCustomer (selecione todas as colunas).

*/
SELECT 
	TOP(20) PERCENT 
	* 
FROM 
	DimCustomer

-- c) Adapte o c�digo do item a) para retornar apenas as 100 primeiras linhas, mas apenas as colunas FirstName, EmailAddress, BirthDate.
-- d) Renomeie as colunas anteriores para nomes em portugu�s
SELECT 
	TOP(100) 
	FirstName AS 'Primeiro Nome', 
	EmailAddress AS 'Endere�o de E-mail',
	BirthDate AS 'Data de Nascimento'
FROM
	DimCustomer

/* 4. A empresa Contoso precisa fazer contato com os fornecedores de produtos para repor o
estoque. 

Voc� � da �rea de compras e precisa descobrir quem s�o esses fornecedores.

Utilize um comando em SQL para retornar apenas os nomes dos fornecedores na tabela
dimProduct e renomeie essa nova coluna da tabela

*/
SELECT 
	DISTINCT Manufacturer AS 'Nome do Fornecedor'
FROM 
	DimProduct


/* 5. O seu trabalho de investiga��o n�o para. 

Voc� precisa descobrir se existe algum produto registrado na base de produtos que ainda n�o tenha sido vendido. Tente chegar nessa informa��o.

Obs: caso tenha algum produto que ainda n�o tenha sido vendido, voc� n�o precisa descobrir
qual �, � suficiente saber se teve ou n�o algum produto que ainda n�o foi vendido.

*/
SELECT 
	*
FROM 
	DimProduct

SELECT 
	DISTINCT ProductKey 
FROM 
	FactSales



-- 5. [SQL Server] Ordenando e Filtrando Dados

/* 1. Voc� � o gerente da �rea de compras e precisa criar um relat�rio 
com as TOP 100 vendas, de acordo com a quantidade vendida. 

Voc� precisa fazer isso em 10min pois o diretor de compras solicitou
essa informa��o para apresentar em uma reuni�o.

Utilize seu conhecimento em SQL para buscar essas TOP 100 vendas, 
de acordo com o total vendido (SalesAmount).
*/
SELECT 
	TOP(100) * 
FROM 
	FactSales 
ORDER BY 
	SalesQuantity DESC


/* 2. Os TOP 10 produtos com maior UnitPrice possuem exatamente o mesmo pre�o. 
Por�m, a empresa quer diferenciar esses pre�os de acordo com o peso (Weight) de cada um.

O que voc� precisar� fazer � ordenar esses top 10 produtos, de acordo com a coluna
de UnitPrice e, al�m disso, estabelecer um crit�rio de desempate, para que seja 
mostrado na ordem, do maior para o menor.

Caso ainda assim haja um empate entre 2 ou mais produtos, pense em uma forma de criar um segundo crit�rio de desempate (al�m do peso).
*/
SELECT 
	DISTINCT TOP(10) *
FROM 
	DimProduct 
ORDER BY 
	UnitPrice DESC, 
	Weight DESC,
	AvailableForSaleDate ASC


/* 3. Voc� � respons�vel pelo setor de log�stica da empresa Contoso e precisa dimensionar o transporte de todos os produtos em categorias, de acordo com o peso.

Os produtos da categoria A, com peso igual ou acima de 100kg, dever�o ser transportados na primeira leva.

Fa�a uma consulta no banco de dados para descobrir quais s�o estes produtos que est�o na categoria A.

a) Voc� dever� retornar apenas 2 colunas nessa consulta: Nome do Produto e Peso.

b) Renomeie essas colunas com nomes mais intuitivos.

c) Ordene esses produtos do mais pesado para o mais leve.
*/

SELECT 
	ProductName AS 'Nome do Produto',
	Weight AS 'Peso do Produto'
FROM 
	DimProduct
WHERE 
	Weight >= 100
ORDER BY 
	Weight DESC



/* 4. Voc� foi alocado para criar um relat�rio das lojas registradas atualmente na Contoso.

a) Descubra quantas lojas a empresa tem no total. Na consulta que voc� dever� fazer � tabela DimStore, retorne as seguintes informa��es: StoreName, OpenDate, EmployeeCount

b) Renomeeie as colunas anteriores para deixar a sua consulta mais intuitiva.

c) Dessas lojas, descubra quantas (e quais) lojas ainda est�o ativas.
*/
SELECT 
	StoreName AS 'Nome da Loja', 
	OpenDate AS 'Data de Abertura', 
	EmployeeCount AS 'Total de Funcion�rios' 
FROM 
	DimStore
WHERE
	StoreType = 'Store'
AND
	Status = 'On'


/* 5. O gerente da �rea de controle de qualidade notificou � Contoso que todos
os produtos Home Theater da marca Litware, disponibilizados para venda 
no dia 15 de mar�o de 2009, foram identificados com defeitos de f�brica.

O que voc� dever� fazer � identificar os ID�s desses produtos e repassar 
ao gerente para que ele possa notificar as lojas e consequentemente solicitar 
a suspens�o das vendas desses produtos.
*/
SELECT * FROM DimProduct

SELECT 
	ProductKey AS 'C�digo do Produto', 
	ProductName AS 'Nome do Produto' 
FROM 
	DimProduct 
WHERE ProductName 
LIKE 
	'%Home Theater%' 
AND 
	BrandName = 'Litware' 
AND
	AvailableForSaleDate = '2009-15-03'


/* 6. Imagine que voc� precise extrair um relat�rio da tabela DimStore, com informa��es de lojas. Mas voc� precisa apenas das lojas que n�o est�o mais funcionando atualmente.

a) Utilize a coluna de Status para filtrar a tabela e trazer apenas as lojas que n�o est�o mais funcionando.

b) Agora imagine que essa coluna de Status n�o existe na sua tabela. Qual seria a outra forma que voc� teria de descobrir quais s�o as lojas que n�o est�o mais funcionando?
*/

-- a)
SELECT * FROM DimStore WHERE Status = 'Off'
 
--b) 
SELECT * FROM DimStore WHERE CloseDate IS NOT NULL


/* 7. De acordo com a quantidade de funcion�rios, cada loja receber� uma determinada quantidade de m�quinas de caf�. 

As lojas ser�o divididas em 3 categorias:

CATEGORIA 1: De 1 a 20 funcion�rios -> 1 m�quina de caf�
CATEGORIA 2: De 21 a 50 funcion�rios -> 2 m�quinas de caf�
CATEGORIA 3: Acima de 51 funcion�rios -> 3 m�quinas de caf�

Identifique, para cada caso, quais s�o as lojas de cada uma das 3 categorias acima (basta fazer
uma verifica��o).
*/
SELECT 
	StoreKey AS 'C�digo da Loja', 
	StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Total de Funcion�rios' 
FROM 
	DimStore 
WHERE 
	EmployeeCount 
BETWEEN 1 AND 20 AND Status = 'On'

SELECT
	StoreKey AS 'C�digo da Loja', 
	StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Total de Funcion�rios' 
FROM 
	DimStore 
WHERE 
	EmployeeCount 
BETWEEN 21 AND 50 AND Status = 'On'

SELECT
	StoreKey AS 'C�digo da Loja', 
	StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Total de Funcion�rios' 
FROM 
	DimStore 
WHERE 
	EmployeeCount >= 51 AND Status = 'On'


/* 8. A empresa decidiu que todas as televis�es de 
LCD receber�o um super desconto no pr�ximo m�s. 

O seu trabalho � fazer uma consulta � tabela DimProduct
e retornar os ID�s, Nomes e Pre�os de todos os 
produtos LCD existentes.
*/
SELECT
	ProductKey AS 'C�digo do Produto', 
	ProductName AS 'Nome do Produto', 
	UnitPrice AS 'Pre�o do Produto'
FROM 
	DimProduct
WHERE
	ProductDescription 
LIKE
	'%LCD%'


/* 9. Fa�a uma lista com todos os produtos das cores: Green, Orange, Black, Silver e Pink. 
Estes produtos devem ser exclusivamente das marcas: Contoso, Litware e Fabrikam.
*/
SELECT 
	* 
FROM 
	DimProduct 
WHERE 
	ColorName 
IN 
	('Green', 'Orange', 'Black', 'Silver', 'Pink') 
AND 
	BrandName 
IN 
	('Contoso', 'Litware', 'Fabrikam') 
ORDER BY 
	ColorName



/* 10. A empresa possui 16 produtos da marca Contoso, 
da cor Silver e com um UnitPrice entre 10 e 30. 

Descubra quais s�o esses produtos e ordene o resultado 
em ordem decrescente de acordo com o pre�o (UnitPrice).
*/
SELECT 
	* 
FROM 
	DimProduct 
WHERE 
	BrandName = 'Contoso' 
AND 
	ColorName = 'Silver' 
AND 
	UnitPrice 
BETWEEN 
	10 AND 30 
ORDER BY 
	UnitPrice DESC



-- 6. [SQL Server] Fun��es de Agrega��o

/*
1. O gerente comercial pediu a voc� uma an�lise da Quantidade Vendida e Quantidade
Devolvida para o canal de venda mais importante da empresa: Store.

Utilize uma fun��o SQL para fazer essas consultas no seu banco de dados. Obs: Fa�a essa
an�lise considerando a tabela FactSales.
*/
SELECT 
	SUM(SalesQuantity) AS 'Canal Store: Produtos Vendidos', 
	SUM(ReturnQuantity) AS 'Canal Store: Produtos Retornados' 
FROM 
	FactSales 
WHERE 
	channelKey = 1

/*
2. Uma nova a��o no setor de Marketing precisar� avaliar a m�dia salarial de todos os clientes da empresa, mas apenas de ocupa��o Professional. 

Utilize um comando SQL para atingir esse resultado.
*/
SELECT 
	AVG(YearlyIncome) AS 'M�dia Salarial dos Clientes' 
FROM 
	DimCustomer 
WHERE 
	Occupation = 'Professional'

/*
3. Voc� precisar� fazer uma an�lise da quantidade de funcion�rios das lojas registradas na empresa. 

O seu gerente te pediu os seguintes n�meros e informa��es:

a) Quantos funcion�rios tem a loja com mais funcion�rios?
b) Qual � o nome dessa loja?
c) Quantos funcion�rios tem a loja com menos funcion�rios?
d) Qual � o nome dessa loja?
*/
-- a) Quantos funcion�rios tem a loja com mais funcion�rios?
SELECT 
	MAX(EmployeeCount) AS 'Total de Funcion�rios' 
FROM 
	DimStore

-- b) Qual � o nome dessa loja?
SELECT 
	TOP(1) StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Quantidade de Funcion�rios' 
FROM 
	DimStore 
ORDER BY 
	EmployeeCount DESC

-- c) Quantos funcion�rios tem a loja com menos funcion�rios?
SELECT 
	MIN(EmployeeCount) AS 'Total de Funcion�rios' 
FROM 
	DimStore

-- d) Qual � o nome dessa loja?
SELECT 
	TOP(1) StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Quantidade de Funcion�rios'
FROM 
	DimStore 
WHERE 
	EmployeeCount IS NOT NULL 
ORDER BY 
	EmployeeCount ASC


/*
4. A �rea de RH est� com uma nova a��o para a empresa, e para isso precisa saber a quantidade total de funcion�rios do sexo Masculino e do sexo Feminino.

a) Descubra essas duas informa��es utilizando o SQL.
b) O funcion�rio e a funcion�ria mais antigos receber�o uma homenagem.

Descubra as seguintes informa��es de cada um deles: Nome, E-mail, Data de Contrata��o.
*/
SELECT 
	MIN(HireDate) AS 'Data de Contrata��o' 
FROM 
DimEmployee 
WHERE 
	Gender = 'M' 
AND 
	FirstName IS NOT NULL
SELECT 
	FirstName AS 'Nome do Funcion�rio',
	EmailAddress AS 'E-mail', 
	HireDate AS 'Data de Contrata��o' 
FROM 
	DimEmployee 
WHERE 
	HireDate = '1996-07-31' 
AND 
	EndDate IS NULL


SELECT 
	MIN(HireDate) AS 'Data de Contrata��o' 
FROM 
DimEmployee 
WHERE 
	Gender = 'F' 
AND 
	FirstName IS NOT NULL
SELECT 
	FirstName AS 'Nome do Funcion�rio',
	EmailAddress AS 'E-mail', 
	HireDate AS 'Data de Contrata��o' 
FROM 
	DimEmployee 
WHERE 
	HireDate = '1998-01-26' 
AND 
	EndDate IS NULL


/*
5. Agora voc� precisa fazer uma an�lise dos produtos. 

Ser� necess�rio descobrir as seguintes informa��es:

a) Quantidade distinta de cores de produtos.
b) Quantidade distinta de marcas
c) Quantidade distinta de classes de produto

Para simplificar, voc� pode fazer isso em uma mesma consulta.
*/
SELECT 
	COUNT(DISTINCT ColorName) AS 'Quantidade Destinta de Cores', 
	COUNT(DISTINCT BrandName) AS 'Quantidade Destinta de Marcar', 
	COUNT(DISTINCT ClassName) AS 'Quantidade Destinta de Nomes de Classes' 
FROM 
	DimProduct


-- 7. [SQL Server] Criando agrupamentos no SQL


-- TABELA FACTSALES

/*	1. a) Fa�a um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas
(channelkey).

b) Fa�a um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade
total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).

c) Fa�a um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas
para o ano de 2007.
*/

-- a) Fa�a um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas (channelkey).
SELECT 
	channelKey AS 'Canal de Vendas', 
	SUM(SalesQuantity) AS 'Quantidade Vendida' 
FROM 
	FactSales 
GROUP BY 
	channelKey

-- b) Fa�a um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).

SELECT 
	StoreKey AS 'C�digo da Loja', 
	SUM(SalesQuantity) 'Quantidade Vendida', 
	SUM(ReturnQuantity) as 'Quantidade Retornada' 
FROM 
	FactSales 
GROUP BY 
	StoreKey
ORDER BY
	StoreKey

-- c) Fa�a um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas para o ano de 2007.
SELECT 
	channelKey AS 'Canal de Venda', 
	COUNT(SalesAmount) AS 'Quantidade de Vendas' 
FROM 
	FactSales 
WHERE 
	DateKey 
BETWEEN 
	'20070101' 
AND 
	'20071231' 
GROUP BY 
	channelKey

/*	2. Voc� precisa fazer uma an�lise de vendas por produtos. O objetivo final � descobrir o valor
total vendido (SalesAmount) por produto (ProductKey).

a) A tabela final dever� estar ordenada de acordo com a quantidade vendida e, al�m disso,
mostrar apenas os produtos que tiveram um resultado final de vendas maior do que
$5.000.000.

b) Fa�a uma adapta��o no exerc�cio anterior e mostre os Top 10 produtos com mais vendas.
Desconsidere o filtro de $5.000.000 aplicado.
*/
SELECT * FROM FactSales

-- a) A tabela final dever� estar ordenada de acordo com a quantidade vendida e, al�m disso, mostrar apenas os produtos que tiveram um resultado final de vendas maior do que $5.000.000.
SELECT 
	ProductKey 'C�digo do Produto', 
	SUM(SalesAmount) AS 'Total de Vendas' 
FROM 
	FactSales 
GROUP BY 
	ProductKey 
HAVING
	SUM(SalesAmount) >= 5000000
ORDER BY 
	SUM(SalesAmount)
	
-- b) Fa�a uma adapta��o no exerc�cio anterior e mostre os Top 10 produtos com mais vendas. Desconsidere o filtro de $5.000.000 aplicado.
SELECT TOP(10)
	ProductKey 'C�digo do Produto', 
	SUM(SalesAmount) AS 'Total de Vendas' 
FROM 
	FactSales 
GROUP BY 
	ProductKey
ORDER BY 
	SUM(SalesAmount) DESC


--	FACTONLINESALES

/*	3. a) Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir qual � o ID (CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).

b) Feito isso, fa�a um agrupamento de total vendido (SalesQuantity) por ID do produto e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).
*/
SELECT * FROM FactOnlineSales

-- a) Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir qual � o ID (CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).
SELECT 
	CustomerKey, 
	SUM(SalesQuantity) AS 'Total de Compras'
FROM 
	FactOnlineSales 
GROUP BY 
	CustomerKey 
ORDER BY 
	SUM(SalesQuantity) DESC

-- CustomerKey: 19037
-- Total de Vendas para o Cliente: 66284

-- b) Feito isso, fa�a um agrupamento de total vendido (SalesQuantity) por ID do produto e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).
SELECT 
	TOP(3) ProductKey AS 'C�digo do Produto', 
	SUM(SalesQuantity) AS 'Total Vendido' 
FROM 
	FactOnlineSales
WHERE CustomerKey = 19037
GROUP BY 
	ProductKey


-- DIMPRODUCT

/*	4. a) Fa�a um agrupamento e descubra a quantidade total de produtos por marca.
		   b) Determine a m�dia do pre�o unit�rio (UnitPrice) para cada ClassName.
			 c) Fa�a um agrupamento de cores e descubra o peso total que cada cor de produto possui.
*/

-- a) Fa�a um agrupamento e descubra a quantidade total de produtos por marca.
SELECT 
	BrandName AS 'Nome da Marca', 
	COUNT(ProductKey) AS 'Total de Produtos' 
FROM 
	DimProduct 
GROUP BY 
	BrandName 
ORDER BY 
	BrandName

-- b) Determine a m�dia do pre�o unit�rio (UnitPrice) para cada ClassName.
SELECT 
	AVG(UnitPrice) AS 'M�dia de Pre�o', 
	ClassName AS 'Classe do Produto' 
FROM 
	DimProduct 
GROUP BY 
	ClassName
ORDER BY
	ClassName

-- c) Fa�a um agrupamento de cores e descubra o peso total que cada cor de produto possui.
SELECT 
	ColorName, 
	SUM(Weight) AS 'Peso Total da Cor' 
FROM 
	DimProduct 
GROUP BY 
	ColorName 
ORDER BY 
	ColorName


/*	5. Voc� dever� descobrir o peso total para cada tipo de produto (StockTypeName).

A tabela final deve considerar apenas a marca �Contoso� e ter os seus valores classificados em ordem decrescente.
*/
--SELECT DISTINCT StockTypeName AS 'Tipo do Nome de Estoque', SUM(Weight) AS 'Peso Total Tipo de Estoque' FROM DimProduct WHERE BrandName = 'Contoso' AND Weight IS NOT NULL GROUP BY StockTypeName, Weight ORDER BY SUM(Weight) DESC
SELECT 
	StockTypeName AS 'Classifica��o de Estoque', 
	SUM(Weight) AS 'Peso Total Tipo de Estoque' 
FROM 
	DimProduct
WHERE
	BrandName = 'Contoso'
GROUP BY 
	StockTypeName 
ORDER BY 
	SUM(Weight) DESC


/*	6. Voc� seria capaz de confirmar se todas as marcas dos produtos possuem � disposi��o todas as 16 op��es de cores?	*/
SELECT 
	BrandName AS 'Marca', 
	COUNT(DISTINCT ColorName) AS 'Qtd. de Cores por Marca'
FROM 
	DimProduct 
GROUP BY 
	BrandName


-- TABELA DIMCUSTOMER

/*	7. Fa�a um agrupamento para saber o total de clientes de acordo com o Sexo e tamb�m a m�dia salarial de acordo com o Sexo. 

Corrija qualquer resultado �inesperado� com os seus conhecimentos em SQL.
*/
--SELECT COUNT(*) AS 'Total de Clientes',	AVG(YearlyIncome) AS 'M�dia Salarial Anual', Gender AS 'Sexo' FROM DimCustomer WHERE Gender IS NOT NULL GROUP BY Gender
SELECT 
	Gender AS 'Sexo', 
	COUNT(*) AS 'Total de Clientes', 
	AVG(YearlyIncome) AS 'M�dia Salarial Anual' 
FROM 
	DimCustomer
WHERE 
	Gender IS NOT NULL
GROUP BY 
	Gender


/*	8. Fa�a um agrupamento para descobrir a quantidade total de clientes e a m�dia salarial de acordo com o seu n�vel escolar. 

Utilize a coluna Education da tabela DimCustomer para fazer esse agrupamento.
*/
SELECT 
	Education AS 'N�vel Escolar', 
	COUNT(*) AS 'Total de Clientes', 
	AVG(YearlyIncome) AS 'M�dia Salarial Anual' 
FROM 
	DimCustomer
WHERE
	Education IS NOT NULL
GROUP BY 
	Education 
ORDER BY Education


-- DIMEMPLOYEE

/*	9. Fa�a uma tabela resumo mostrando a quantidade total de funcion�rios de acordo com o Departamento (DepartmentName). 

Importante: Voc� dever� considerar apenas os funcion�rios ativos.
*/
SELECT 
	DepartmentName AS 'Departamento',	
	COUNT(DepartmentName) AS 'Total de Funcionarios por Departamento' 
FROM 
	DimEmployee 
WHERE
	Status = 'Current'
AND
	EndDate IS NULL 
GROUP BY 
	DepartmentName 
ORDER BY 
	[Total de Funcionarios por Departamento]

/*	10. Fa�a uma tabela resumo mostrando o total de VacationHours para cada cargo (Title).

Voc� deve considerar apenas as mulheres, dos departamentos de Production, Marketing, Engineering e Finance, para os funcion�rios contratados entre os anos de 1999 e 2000.
*/
SELECT 
	Title AS 'Cargo', 
	SUM(VacationHours) AS 'Total de Horas de F�rias' 
FROM 
	DimEmployee 
WHERE 
	Gender = 'F' 
AND 
	DepartmentName IN(
		'Production', 
		'Marketing', 
		'Engineering', 
		'Finance'
	) 
AND 
	HireDate 
BETWEEN 
	'1999-01-01' 
AND 
	'2000-12-31' 
GROUP BY  
	Title


-- 8. [SQL Server] JOINs no SQL

/*	1. Utilize o INNER JOIN para trazer os nomes das subcategorias dos produtos, da tabela
DimProductSubcategory para a tabela DimProduct.
*/
SELECT 
	DP.ProductKey AS 'Chave do Produto',
	DP.ProductName AS 'Nome do Produto',
	DPS.ProductSubcategoryName AS 'Nome das Subcategorias'
FROM 
	DimProduct AS DP
INNER JOIN
	DimProductSubcategory AS DPS
ON 
	DPS.ProductSubcategoryKey = DP.ProductSubcategoryKey


/*	2. Identifique uma coluna em comum entre as tabelas DimProductSubcategory e DimProductCategory. 

Utilize essa coluna para complementar informa��es na tabela DimProductSubcategory a partir da DimProductCategory. Utilize o LEFT JOIN.
*/
SELECT 
	DPC.ProductCategoryKey AS 'ID Subcategoria',
	DPC.ProductSubcategoryName AS 'Nome da Subcategoria',
	DPS.ProductCategoryName AS 'Nome da Categoria'
FROM 
	DimProductCategory AS DPS
LEFT JOIN 
	DimProductSubcategory AS DPC
ON 
	DPS.ProductCategoryKey = DPC.ProductCategoryKey

/*	3. Para cada loja da tabela DimStore, descubra qual o Continente e o Nome do Pa�s associados
(de acordo com DimGeography). 

Seu SELECT final deve conter apenas as seguintes colunas:
StoreKey, StoreName, EmployeeCount, ContinentName e RegionCountryName.

Utilize o LEFT JOIN neste exerc�cio.
*/
SELECT 
	DS.StoreKey	AS 'C�digo da Loja', 
	DS.StoreName AS 'Nome da Loja', 
	DS.EmployeeCount AS 'Total de Funcion�rios por Loja', 
	DG.ContinentName AS 'Nome do Continente', 
	DG.RegionCountryName AS 'Nome da Regi�o do Pa�s'
FROM 
	DimStore AS DS
LEFT JOIN 
	DimGeography AS DG
ON 
	DS.GeographyKey = DG.GeographyKey


/*	4. Complementa a tabela DimProduct com a informa��o de ProductCategoryDescription.
Utilize o LEFT JOIN e retorne em seu SELECT apenas as 5 colunas que considerar mais relevantes.
*/
SELECT 
	DP.ProductName AS 'Nome do Produto',
	DPC.ProductCategoryDescription AS 'Descri��o da Categoria do Produto'
FROM 
	DimProduct AS DP
INNER JOIN 
	DimProductSubcategory AS DPS
ON 
	DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey
LEFT JOIN 
	DimProductCategory AS dpc
ON 
	dps.ProductCategoryKey = dpc.ProductCategoryKey

/*	5. A tabela FactStrategyPlan resume o planejamento estrat�gico da empresa. Cada linha representa um montante destinado a uma determinada AccountKey.

a) Fa�a um SELECT das 100 primeiras linhas de FactStrategyPlan para reconhecer a tabela.

b) Fa�a um INNER JOIN para criar uma tabela contendo o AccountName para cada
AccountKey da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:
� StrategyPlanKey
� DateKey
� AccountName
� Amount
*/

-- a) Fa�a um SELECT das 100 primeiras linhas de FactStrategyPlan para reconhecer a tabela.
SELECT TOP(100) * FROM FactStrategyPlan

-- b) Fa�a um INNER JOIN para criar uma tabela contendo o AccountName para cada AccountKey da tabela FactStrategyPlan.

-- O seu SELECT final deve conter as colunas:
-- � StrategyPlanKey
-- � DateKey
-- � AccountName
-- � Amount
SELECT 
	FSP.StrategyPlanKey AS 'C�digo Plano Estrat�gia',
	DA.AccountName AS 'Nome da Conta',
	FSP.Datekey AS 'C�digo da Data',
	FSP.Amount AS 'Quantia'
FROM 
	FactStrategyPlan AS FSP
INNER JOIN 
	DimAccount AS	DA
ON
	FSP.AccountKey = DA.AccountKey

/*	6. Vamos continuar analisando a tabela FactStrategyPlan. Al�m da coluna AccountKey que identifica o tipo de conta, h� tamb�m uma outra coluna chamada ScenarioKey. Essa coluna possui a numera��o que identifica o tipo de cen�rio: Real, Or�ado e Previs�o.

Fa�a um INNER JOIN para criar uma tabela contendo o ScenarioName para cada ScenarioKey da tabela FactStrategyPlan. 

O seu SELECT final deve conter as colunas:
� StrategyPlanKey
� DateKey
� ScenarioName
� Amount
*/
SELECT 
	FSP.StrategyPlanKey AS 'C�digo Plano Estrat�gico',
	DS.ScenarioName 'Nome do Cen�rio',
	FSP.Datekey AS 'C�digo da Data',
	FSP.Amount AS 'Quantia'
FROM 
	FactStrategyPlan AS FSP
INNER JOIN 
	DimAccount AS DA
ON 
	FSP.AccountKey = DA.AccountKey
INNER JOIN 
	DimScenario DS
ON 
	FSP.ScenarioKey = DS.ScenarioKey

/*	7. Algumas subcategorias n�o possuem nenhum exemplar de produto. Identifique que subcategorias s�o essas. */

SELECT 
	DP.ProductName AS 'Nome do Produto', 
	DPS.ProductSubcategoryName AS 'Nome da Subcategoria' 
FROM 
	DimProduct AS DP
RIGHT JOIN 
	DimProductSubcategory AS DPS
ON 
	DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey
WHERE 
	DP.ProductName IS NULL



/*	8. A tabela abaixo mostra a combina��o entre Marca e Canal de Venda, para as marcas Contoso, Fabrikam e Litware. 

Crie um c�digo SQL para chegar no mesmo resultado.
*/

SELECT 
	DISTINCT 
		BrandName AS 'Marca do Produto', 
		ChannelName AS 'Nome do Canal' 
FROM 
	DimProduct 
CROSS JOIN 
	DimChannel 
WHERE 
	BrandName 
IN 
	('Contoso', 'Fabrikam', 'Litware')

/*	OU

SELECT 
	DISTINCT dp.BrandName AS 'Marca do Produto',
	dc.ChannelName AS 'Nome do Canal de Venda'
FROM 
	DimProduct AS dp
INNER JOIN 
	FactSales AS fs
ON
	fs.ProductKey = dp.ProductKey
INNER JOIN
	DimChannel AS dc
ON
	fs.channelKey = dc.ChannelKey
WHERE
	dp.BrandName in ('Contoso', 'Fabrikam', 'Litware')
*/



/*	9. Neste exerc�cio, voc� dever� relacionar as tabelas FactOnlineSales com DimPromotion.

Identifique a coluna que as duas tabelas t�m em comum e utilize-a para criar esse relacionamento.

Retorne uma tabela contendo as seguintes colunas:
� OnlineSalesKey
� DateKey
� PromotionName
� SalesAmount

A sua consulta deve considerar apenas as linhas de vendas referentes a produtos com desconto (PromotionName <> �No Discount�). 

Al�m disso, voc� dever� ordenar essa tabela de acordo com a coluna DateKey, em ordem crescente.
*/
SELECT
	TOP(1000) FOS.OnlineSalesKey AS 'ID do Canal de Vendas Online',
	FOS.DateKey AS 'Data Chave',
	DP.PromotionName AS 'Nome da Promo��o',
	FOS.SalesAmount AS 'Quantidade de Vendas'
FROM 
	FactOnlineSales AS FOS
INNER JOIN
	DimPromotion DP
ON
	FOS.PromotionKey = DP.PromotionKey
WHERE
	DP.PromotionName <> 'No Discount'
ORDER BY
	FOS.DateKey ASC

/*	10. A tabela abaixo � resultado de um Join entre a tabela FactSales e as tabelas: DimChannel, DimStore e DimProduct.

Recrie esta consulta e classifique em ordem decrescente de acordo com SalesAmount.

Colunas Retornadas:
	SalesKey,
	ChannelName,
	StoreName,
	ProductName,
	SalesAmount
*/
SELECT 
	TOP(1000) FS.SalesKey AS 'ID das Vendas',
	DC.ChannelName AS 'Nome do Canal',
	DS.StoreName AS 'Nome da Loja',
	DP.ProductName AS 'Nome do Produto',
	FS.SalesAmount AS 'Quantidade de Vendas'
FROM 
	FactSales AS FS
INNER JOIN
	DimChannel AS DC
ON
	FS.channelKey = DC.ChannelKey
INNER JOIN
	DimStore AS DS
ON
	FS.StoreKey = DS.StoreKey
INNER JOIN
	DimProduct AS DP
ON
	FS.ProductKey = DP.ProductKey
ORDER BY
	FS.SalesAmount DESC


-- 9. [SQL Server] Group By + Joins - Aplica��es


-- TABELA FACTSALES
--	1. a) Fa�a um resumo da quantidade vendida (Sales Quantity) de acordo com o nome do canal de vendas (ChannelName). Voc� deve ordenar a tabela final de acordo com SalesQuantity, em ordem decrescente.
SELECT 
		DC.ChannelName AS 'Nome do Canal',
		SUM(FS.SalesQuantity) AS 'Total de Vendas'
FROM 
	FactSales AS FS
INNER JOIN
	DimChannel AS DC
ON
	FS.channelKey = DC.ChannelKey
GROUP BY
	DC.ChannelName
ORDER BY
	SUM(FS.SalesQuantity) DESC

-- b) Fa�a um agrupamento mostrando a quantidade total vendida (Sales Quantity) e quantidade total devolvida (Return Quantity) de acordo com o nome das lojas (StoreName).
SELECT 
	DS.StoreName AS 'Nome da Loja',
	SUM(FS.SalesQuantity) AS 'Total Vendido', 
	SUM(FS.ReturnQuantity) AS 'Total Devolvido' 
FROM 
	FactSales FS
INNER JOIN 
	DimStore DS
ON
	FS.StoreKey = DS.StoreKey
GROUP BY 
	DS.StoreName
ORDER BY
	DS.StoreName

-- c) Fa�a um resumo do valor total vendido (Sales Amount) para cada m�s (CalendarMonthLabel) e ano (CalendarYear).
SELECT
	DD.CalendarYear AS 'Ano', 
	DD.CalendarMonthLabel AS 'M�s', 
	SUM(fs.SalesAmount) AS 'Total Vendido' 
FROM 
	FactSales AS FS 
INNER JOIN 
	DimDate as DD 
ON 
	FS.DateKey = DD.Datekey
GROUP BY
	DD.CalendarMonthLabel,
	DD.CalendarYear,
	DD.CalendarMonth
ORDER BY 
	DD.CalendarMonth ASC


-- 2. Voc� precisa fazer uma an�lise de vendas por produtos. O objetivo final � descobrir o valor total vendido (SalesQuantity) por produto.

SELECT 
	DP.ProductName AS 'Nome do Produto',
	DP.ColorName AS 'Cor do Produto',
	SUM(FS.SalesQuantity) AS 'Total Vendido' 
FROM 
	FactSales AS FS 
INNER JOIN 
	DimProduct DP 
ON 
	FS.ProductKey = DP.ProductKey 
GROUP BY 
	FS.SalesKey, 
	DP.ColorName,
	DP.ProductName, 
	FS.SalesQuantity 
ORDER BY 
	SUM(FS.SalesQuantity) DESC

-- a) Descubra qual � a cor de produto que mais � vendida (de acordo com SalesQuantity).
SELECT 
	DP.ColorName AS 'Nome da Cor', 
	SUM(FS.SalesQuantity) AS 'Cores mais Vendidas' 
FROM 
	FactSales AS FS 
INNER JOIN 
	DimProduct AS DP 
ON 
	FS.ProductKey = DP.ProductKey 
GROUP BY 
	DP.ColorName
ORDER BY 
	SUM(FS.SalesQuantity) DESC

-- b) Quantas cores tiveram uma quantidade vendida acima de 3.000.000
SELECT 
	DP.ColorName AS 'Cor', 
	SUM(FS.SalesQuantity) AS 'Cores com Vendas Acima de 3.000.000' 
FROM 
	FactSales AS FS 
INNER JOIN 
	DimProduct AS DP 
ON 
	FS.ProductKey = DP.ProductKey
GROUP BY 
	DP.ColorName
HAVING
	SUM(FS.SalesQuantity) > 3000000
ORDER BY 
	SUM(FS.SalesQuantity) DESC


/*	3. Crie um agrupamento de quantidade vendida (SalesQuantity) por categoria do produto
(ProductCategoryName).

Obs: Voc� precisar� fazer mais de 1 INNER JOIN, dado que a rela��o
entre FactSales e DimProductCategory n�o � direta.
*/

SELECT 
	DPC.ProductCategoryName AS 'Nome da Categoria do Produto', 
	SUM(FS.SalesQuantity) AS 'Total Vendido' 
FROM 
	FactSales AS FS 
INNER JOIN 
	DimProduct AS DP 
ON 
	FS.ProductKey = DP.ProductKey
INNER JOIN 
	DimProductSubcategory AS DPS 
ON 
	DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey
INNER JOIN 
	DimProductCategory AS DPC 
ON 
	DPS.ProductCategoryKey = DPC.ProductCategoryKey
GROUP BY 
	DPC.ProductCategoryName



--SELECT TOP(5) * FROM FactSales
--SELECT TOP(5) * FROM DimProduct
--SELECT TOP(5) * FROM DimProductSubcategory
--SELECT TOP(5) * FROM DimProductCategory

--FactSales RELACIONA COM DimProduct
--DimProduct RELACIONA COM DimProductSubcategory
--DimProductSubcategory RELACIONA COM DimProductCategory


-- TABELA FACTONLINESALES
-- 4. a) Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir qual � o nome completo do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).

SELECT 
	DC.CustomerKey AS 'ID do Cliente', 
	DC.FirstName + ' ' + DC.MiddleName + ' ' + DC.LastName AS 'Nome do Cliente', 
	SUM(FOS.SalesQuantity) AS 'Total de Compras' 
FROM 
	FactOnlineSales AS FOS 
INNER JOIN 
	DimCustomer AS DC 
ON 
	FOS.CustomerKey = DC.CustomerKey 
WHERE 
--	DC.FirstName IS NOT NULL 
--AND
--	DC.MiddleName IS NOT NULL 
--AND
--	DC.LastName IS NOT NULL
--AND
--	FOS.SalesQuantity > 0
--AND
	CustomerType = 'Person'
GROUP BY 
	DC.CustomerKey, 
	DC.FirstName, 
	DC.MiddleName, 
	DC.LastName
ORDER BY
	SUM(FOS.SalesQuantity) DESC


-- ID do Cliente = 7665
-- Total de Compras: 376

-- b) Feito isso, fa�a um agrupamento de produtos e descubra quais foram os top 10 produtos mais comprados pelo cliente da letra a, considerando o nome do produto.
SELECT 
	TOP(10) 
	DP.ProductName AS 'Nome do Produto', 
	DC.FirstName + ' ' + 
	DC.MiddleName + ' ' + 
	DC.LastName AS 'Nome do Cliente',
	SUM(SalesQuantity) AS 'Qtd. Vendido'
FROM 
	DimProduct AS DP 
INNER JOIN 
	FactOnlineSales AS FOS 
ON 
	DP.ProductKey = FOS.ProductKey 
INNER JOIN 
	DimCustomer AS DC 
ON 
	FOS.CustomerKey = DC.CustomerKey 
WHERE 
	DC.CustomerKey = 7665
GROUP BY 
	DP.ProductName, 
	DC.FirstName, 
	DC.MiddleName, 
	DC.LastName
ORDER BY 
	SUM(SalesQuantity) DESC

--SELECT TOP(100)* FROM FactOnlineSales
--SELECT * FROM DimCustomer
--SELECT * FROM DimProduct

/*	5. Fa�a um resumo mostrando o total de produtos comprados (Sales Quantity) de acordo com o sexo dos clientes. */

SELECT 
	DC.Gender AS 'G�nero', 
	SUM(FOS.SalesQuantity) AS 'Total de Produtos'
FROM 
	FactOnlineSales AS FOS 
INNER JOIN 
	DimCustomer AS DC 
ON 
	FOS.CustomerKey = DC.CustomerKey 
WHERE 
	FOS.SalesAmount > 0 
AND 
	DC.Gender IS NOT NULL 
GROUP BY 
	FOS.SalesQuantity, 
	DC.Gender

--SELECT TOP(5) * FROM FactOnlineSales
--SELECT * FROM DimCustomer


-- TABELA FACTEXCHANGERATE
/*	6. Fa�a uma tabela resumo mostrando a taxa de c�mbio m�dia de acordo com cada CurrencyDescription. 
A tabela final deve conter apenas taxas entre 10 e 100. */

SELECT 
	DCY.CurrencyDescription AS 'Descri��o da Moeda', 
	AVG(FER.AverageRate) AS 'Taxa M�dia' 
FROM 
	FactExchangeRate AS FER 
INNER JOIN 
	DimCurrency AS DCY 
ON 
	FER.CurrencyKey = DCY.CurrencyKey 
GROUP BY 
	DCY.CurrencyDescription 
HAVING 
	AVG(FER.AverageRate) 
BETWEEN 
	10 
AND 
	100 
ORDER BY 
	AVG(FER.AverageRate) DESC

SELECT * FROM FactExchangeRate ORDER BY AverageRate DESC
SELECT * FROM DimCurrency

-- FACTSTRATEGYPLAN

/*	7. Calcule a SOMA TOTAL de AMOUNT referente � tabela FactStrategyPlan destinado aos
cen�rios: Actual e Budget.

Dica: A tabela DimScenario ser� importante para esse exerc�cio.
*/

SELECT 
	DS.ScenarioName AS 'Nome Cen�rio', 
	SUM(FSP.Amount) AS 'Qtd. Total por Cen�rio' 
FROM 
	FactStrategyPlan AS FSP 
INNER JOIN 
	DimScenario AS DS 
ON 
	FSP.ScenarioKey = DS.ScenarioKey 
GROUP BY 
	DS.ScenarioName
HAVING 
	DS.ScenarioName 
IN 
	('Actual', 'Budget') 



/*	8. Fa�a uma tabela resumo mostrando o resultado do planejamento estrat�gico por ano. */

SELECT 
	DD.CalendarYear AS 'Ano', 
	SUM(FSP.Amount) AS 'Resultado' 
FROM 
	DimDate AS DD 
INNER JOIN 
	FactStrategyPlan AS FSP 
ON 
	DD.Datekey = FSP.Datekey  
GROUP BY 
	DD.CalendarYear

SELECT TOP(5) * FROM DimDate
SELECT TOP(5) * FROM FactStrategyPlan
SELECT * FROM DimEntity

-- TABEL DIMPRODUCT/DIMPRODUCTSUBCATEGORY

/*	9. Fa�a um agrupamento de quantidade de produtos por ProductSubcategoryName. 

Leve em considera��o em sua an�lise apenas a marca Contoso e a cor Silver. */

SELECT 
	DPS.ProductSubcategoryName AS 'Nome da Subcategoria', 
	COUNT(DPS.ProductSubcategoryKey) AS 'Qtd. Total por Subcategoria' 
FROM 
	DimProduct AS DP 
INNER JOIN
	DimProductSubcategory AS DPS 
ON 
	DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey 
WHERE 
	DP.BrandName = 'Contoso' 
AND 
	DP.ColorName = 'Silver' 
AND 
	DP.Status = 'On' 
GROUP BY 
	DPS.ProductSubcategoryName



/*	10. Fa�a um agrupamento duplo de quantidade de produtos por BrandName e ProductSubcategoryName. 

A tabela final dever� ser ordenada de acordo com a coluna BrandName.*/

SELECT 
	DP.BrandName AS 'Marca',
	DPS.ProductSubcategoryName AS 'Subcategoria',
	COUNT(*) AS 'Qtd. Total' 
FROM 
	DimProduct AS DP 
INNER JOIN 
	DimProductSubcategory AS DPS 
ON 
	DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey 
WHERE 
	DP.Status = 'On' 
GROUP BY 
	DPS.ProductSubcategoryName, 
	DP.BrandName 
ORDER BY 
	DP.BrandName ASC

SELECT * FROM DimProduct
SELECT * FROM DimProductSubcategory



/* 10. [SQL Server] Vari�veis */


-- Exerc�cio 1: crie uma consulta juntando o texto 'O pre�o do produto �: ' com o valor R$ 30.99
SELECT 'O pre�o do pastel �: ' + CAST(30.99 AS VARCHAR(50)) AS 'Valor do Produto'

-- Exerc�cio 2: adicione 1 � data '20/06/2021'
SELECT '20/06/2021' + CAST(1 AS DATETIME) AS 'Dia Seguinte'

-- OU

SELECT CAST('20/06/2021' AS DATETIME) + 3 AS 'Dia Seguinte'


-- Exerc�cio 3: crie uma consulta juntando o texto 'A data de validade do produto �: ' com a data 17/abr/2022. 

-- Obs: voc� dever� usar a fun��o CAST() para garantir que a data � entendida com o tipo DATETIME.
SELECT 'A data de validade do produto �: ' + FORMAT(CAST('17/04/2022' AS DATETIME), 'dd/MMM/yyyy') AS 'Data de Validade'

SELECT 100 * 8.99 AS 'faturamento'

DECLARE @quantidade AS int, @preco AS float
SET @quantidade = 100
SET @preco = 8.99

SELECT @quantidade * @preco AS 'faturamento'

-- Exemplo 1: Declare uma vari�vel chamada 'idade' e armazene o valor 30

DECLARE @idade AS INT

SET @idade = 30

SELECT @idade

-- Exemplo 2: Declare uma vari�vel chamada 'preco' e armazene o valor 10.89

--DECLARE @preco AS float
--SET @preco = 10.89
--SELECT @preco

--DECLARE @preco2 AS decimal(5, 2)
--SET @preco2 = 10.89
--SELECT @preco2



-- Exemplo 3: Declare uma vari�vel chamada 'nome' e armazene o valor 'Mateus'

DECLARE @nome AS varchar(50)
SET @nome = 'Mateus'
SELECT @nome

-- Exemplo 4: Declare uma vari�vel chamada 'data' e armazene a data de hoje.

DECLARE @data AS datetime
SET @data = '2021-10-28'
SELECT @data

SELECT DAY(@data)



-- 8. DECLARE e SET Declarando uma vari�vel

-- Exerc�cio 1: a sua loja fez uma venda de 100 camisas, cada uma custando 89.99. Fa�a uma SELECT para obter o resultado do faturamento (quantidade X pre�o).
SELECT 'Faturamento foi R$ ' + CAST(100.0 * 89.99 AS VARCHAR(10)) AS 'Faturamento'


-- Exerc�cio 2: refa�a o exerc�cio anterior utilizando vari�veis para deixar o c�lculo mais otimizado.
DECLARE 
	@qtdCamisa INT = 500.0, 
	@precoCamisa FLOAT = 89.99, 
	@faturamento FLOAT 
SET 
	@faturamento = @qtdCamisa * @precoCamisa
SELECT 
	CAST(@faturamento AS FLOAT) AS 'Faturamento'



/*	1. Declare 4 vari�veis inteiras. Atribua os seguintes valores a elas:

valor1 = 10
valor2 = 5
valor3 = 34
valor4 = 7

*/
-- DECLARE @varValor1 INT = 10, @varValor2 INT = 5, @varValor3 INT = 34, @varValor4 INT = 7

-- a) Crie uma nova vari�vel para armazenar o resultado da soma entre valor1 e valor2. Chame essa vari�vel de soma.
DECLARE 
	@varValor1 INT = 10, 
	@varValor2 INT = 5, 
	@varSoma INT
SET 
	@varSoma = @varValor1 + @varValor2
SELECT 
	'Soma entre valor 1 e valor 2 � = ' 
	+ CAST(@varSoma AS varchar(10)) AS 'Resultado da Soma'

-- b) Crie uma nova vari�vel para armazenar o resultado da subtra��o entre valor3 e valor 4. Chame essa vari�vel de subtracao.
DECLARE 
	@varValor3 INT = 34, 
	@varValor4 INT = 7, 
	@varSubtracao INT
SET 
	@varSubtracao = @varValor3 - @varValor4
SELECT 
	'Subtra��o entre valor 3 e valor 4 � = ' 
	+ CAST(@varSubtracao AS VARCHAR(10)) AS 'Resultado da Subtra��o'

-- c) Crie uma nova vari�vel para armazenar o resultado da multiplica��o entre o valor 1 e o valor4. Chame essa vari�vel de multiplicacao
DECLARE @varValor1 INT = 10, @varValor4 int = 7, @varMultiplicacao INT
SET @varMultiplicacao = @varValor1 * @varValor4
SELECT 'Multiplica��o entre var 1 e valor 4 � = ' + CAST(@varMultiplicacao AS VARCHAR(10)) AS 'Resutldo da Multiplica��o'


-- d) Crie uma nova vari�vel para armazenar o resultado da divis�o do valor3 pelo valor4. Chame essa vari�vel de divisao. Obs: O resultado dever� estar em decimal, e n�o em inteiro.
DECLARE @varValor3 INT = 34, @varValor4 INT = 7,
@varDivisao INT
SET @varDivisao = @varValor3 / @varValor4
SELECT CAST(@varDivisao AS DECIMAL(15, 10)) AS 'Resultado da Divis�o'


-- e) Arredonde o resultado da letra d) para 2 casas decimais.
DECLARE @varValor3 INT = 34, @varValor4 INT = 7,
@varDivisao INT
SET @varDivisao = @varValor3 / @varValor4
SELECT ROUND(CAST(@varDivisao AS DECIMAL(15, 10)), 2, 1) AS 'Divis�o Arredondada'


/*	2. Para cada declara��o das vari�veis abaixo, aten��o em rela��o ao tipo de dado que dever� ser especificado. */

-- a) Declare uma vari�vel chamada �produto� e atribua o valor de �Celular�.
DECLARE @varProduto VARCHAR(50) = 'Celular'
SELECT @varProduto AS 'Nome do Produto'
















































=======
USE ContosoRetailDW

/* 1. Voc� � respons�vel por controlar os dados de clientes e de produtos da sua empresa.
O que voc� precisar� fazer � confirmar se:

a. Existem 2.517 produtos cadastrados na base e, se n�o tiver, voc� dever� reportar ao seu
gestor para saber se existe alguma defasagem no controle dos produtos.

b. At� o m�s passado, a empresa tinha um total de 19.500 clientes na base de controle.
Verifique se esse n�mero aumentou ou reduziu.
*/

-- a. Existem 2.517 produtos cadastrados na base e, se n�o tiver, voc� dever� reportar ao seu gestor para saber se existe alguma defasagem no controle dos produtos.
SELECT 
	* 
FROM 
	DimProduct

-- b. At� o m�s passado, a empresa tinha um total de 19.500 clientes na base de controle. Verifique se esse n�mero aumentou ou reduziu.
SELECT 
	* 
FROM 
	DimCustomer


/* 2. Voc� trabalha no setor de marketing da empresa Contoso e acaba de ter uma ideia de oferecer
descontos especiais para os clientes no dia de seus anivers�rios. Para isso, voc� vai precisar
listar todos os clientes e as suas respectivas datas de nascimento, al�m de um contato.

a) Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela
dimCustomer.

b) Renomeie as colunas dessa tabela usando o alias (comando AS).
*/

-- a) Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela dimCustomer.
-- b) Renomeie as colunas dessa tabela usando o alias (comando AS).
SELECT 
	CustomerKey AS 'Chave do Cliente',
	FirstName AS 'Primeiro Nome',
	EmailAddress AS 'Endere�o de Email',
	BirthDate AS 'Data de Nascimento'
FROM 
	DimCustomer


/* 3. A Contoso est� comemorando anivers�rio de inaugura��o de 10 anos e pretende fazer uma
a��o de premia��o para os clientes. A empresa quer presentear os primeiros clientes desde
a inaugura��o. 

Voc� foi alocado para levar adiante essa a��o. Para isso, voc� ter� que fazer o seguinte:

a) A Contoso decidiu presentear os primeiros 100 clientes da hist�ria com um vale compras
de R$ 10.000. Utilize um comando em SQL para retornar uma tabela com os primeiros
100 primeiros clientes da tabela dimCustomer (selecione todas as colunas).

b) A Contoso decidiu presentear os primeiros 20% de clientes da hist�ria com um vale
compras de R$ 2.000. Utilize um comando em SQL para retornar 10% das linhas da sua
tabela dimCustomer (selecione todas as colunas).

c) Adapte o c�digo do item a) para retornar apenas as 100 primeiras linhas, mas apenas as
colunas FirstName, EmailAddress, BirthDate.

d) Renomeie as colunas anteriores para nomes em portugu�s

*/

-- a) A Contoso decidiu presentear os primeiros 100 clientes da hist�ria com um vale compras de R$ 10.000. Utilize um comando em SQL para retornar uma tabela com os primeiros 100 primeiros clientes da tabela dimCustomer (selecione todas as colunas).
SELECT 
	TOP(100) * 
FROM
	DimCustomer


/* b) A Contoso decidiu presentear os primeiros 20% de clientes da hist�ria com um vale
compras de R$ 2.000. Utilize um comando em SQL para retornar 10% das linhas da sua
tabela dimCustomer (selecione todas as colunas).

*/
SELECT 
	TOP(20) PERCENT 
	* 
FROM 
	DimCustomer

-- c) Adapte o c�digo do item a) para retornar apenas as 100 primeiras linhas, mas apenas as colunas FirstName, EmailAddress, BirthDate.
-- d) Renomeie as colunas anteriores para nomes em portugu�s
SELECT 
	TOP(100) 
	FirstName AS 'Primeiro Nome', 
	EmailAddress AS 'Endere�o de E-mail',
	BirthDate AS 'Data de Nascimento'
FROM
	DimCustomer

/* 4. A empresa Contoso precisa fazer contato com os fornecedores de produtos para repor o
estoque. 

Voc� � da �rea de compras e precisa descobrir quem s�o esses fornecedores.

Utilize um comando em SQL para retornar apenas os nomes dos fornecedores na tabela
dimProduct e renomeie essa nova coluna da tabela

*/
SELECT 
	DISTINCT Manufacturer AS 'Nome do Fornecedor'
FROM 
	DimProduct


/* 5. O seu trabalho de investiga��o n�o para. 

Voc� precisa descobrir se existe algum produto registrado na base de produtos que ainda n�o tenha sido vendido. Tente chegar nessa informa��o.

Obs: caso tenha algum produto que ainda n�o tenha sido vendido, voc� n�o precisa descobrir
qual �, � suficiente saber se teve ou n�o algum produto que ainda n�o foi vendido.

*/
SELECT 
	*
FROM 
	DimProduct

SELECT 
	DISTINCT ProductKey 
FROM 
	FactSales



-- 5. [SQL Server] Ordenando e Filtrando Dados

/* 1. Voc� � o gerente da �rea de compras e precisa criar um relat�rio 
com as TOP 100 vendas, de acordo com a quantidade vendida. 

Voc� precisa fazer isso em 10min pois o diretor de compras solicitou
essa informa��o para apresentar em uma reuni�o.

Utilize seu conhecimento em SQL para buscar essas TOP 100 vendas, 
de acordo com o total vendido (SalesAmount).
*/
SELECT 
	TOP(100) * 
FROM 
	FactSales 
ORDER BY 
	SalesQuantity DESC


/* 2. Os TOP 10 produtos com maior UnitPrice possuem exatamente o mesmo pre�o. 
Por�m, a empresa quer diferenciar esses pre�os de acordo com o peso (Weight) de cada um.

O que voc� precisar� fazer � ordenar esses top 10 produtos, de acordo com a coluna
de UnitPrice e, al�m disso, estabelecer um crit�rio de desempate, para que seja 
mostrado na ordem, do maior para o menor.

Caso ainda assim haja um empate entre 2 ou mais produtos, pense em uma forma de criar um segundo crit�rio de desempate (al�m do peso).
*/
SELECT 
	DISTINCT TOP(10) *
FROM 
	DimProduct 
ORDER BY 
	UnitPrice DESC, 
	Weight DESC,
	AvailableForSaleDate ASC


/* 3. Voc� � respons�vel pelo setor de log�stica da empresa Contoso e precisa dimensionar o transporte de todos os produtos em categorias, de acordo com o peso.

Os produtos da categoria A, com peso igual ou acima de 100kg, dever�o ser transportados na primeira leva.

Fa�a uma consulta no banco de dados para descobrir quais s�o estes produtos que est�o na categoria A.

a) Voc� dever� retornar apenas 2 colunas nessa consulta: Nome do Produto e Peso.

b) Renomeie essas colunas com nomes mais intuitivos.

c) Ordene esses produtos do mais pesado para o mais leve.
*/

SELECT 
	ProductName AS 'Nome do Produto',
	Weight AS 'Peso do Produto'
FROM 
	DimProduct
WHERE 
	Weight >= 100
ORDER BY 
	Weight DESC



/* 4. Voc� foi alocado para criar um relat�rio das lojas registradas atualmente na Contoso.

a) Descubra quantas lojas a empresa tem no total. Na consulta que voc� dever� fazer � tabela DimStore, retorne as seguintes informa��es: StoreName, OpenDate, EmployeeCount

b) Renomeeie as colunas anteriores para deixar a sua consulta mais intuitiva.

c) Dessas lojas, descubra quantas (e quais) lojas ainda est�o ativas.
*/
SELECT 
	StoreName AS 'Nome da Loja', 
	OpenDate AS 'Data de Abertura', 
	EmployeeCount AS 'Total de Funcion�rios' 
FROM 
	DimStore
WHERE
	StoreType = 'Store'
AND
	Status = 'On'


/* 5. O gerente da �rea de controle de qualidade notificou � Contoso que todos
os produtos Home Theater da marca Litware, disponibilizados para venda 
no dia 15 de mar�o de 2009, foram identificados com defeitos de f�brica.

O que voc� dever� fazer � identificar os ID�s desses produtos e repassar 
ao gerente para que ele possa notificar as lojas e consequentemente solicitar 
a suspens�o das vendas desses produtos.
*/
SELECT * FROM DimProduct

SELECT 
	ProductKey AS 'C�digo do Produto', 
	ProductName AS 'Nome do Produto' 
FROM 
	DimProduct 
WHERE ProductName 
LIKE 
	'%Home Theater%' 
AND 
	BrandName = 'Litware' 
AND
	AvailableForSaleDate = '2009-15-03'


/* 6. Imagine que voc� precise extrair um relat�rio da tabela DimStore, com informa��es de lojas. Mas voc� precisa apenas das lojas que n�o est�o mais funcionando atualmente.

a) Utilize a coluna de Status para filtrar a tabela e trazer apenas as lojas que n�o est�o mais funcionando.

b) Agora imagine que essa coluna de Status n�o existe na sua tabela. Qual seria a outra forma que voc� teria de descobrir quais s�o as lojas que n�o est�o mais funcionando?
*/

-- a)
SELECT * FROM DimStore WHERE Status = 'Off'
 
--b) 
SELECT * FROM DimStore WHERE CloseDate IS NOT NULL


/* 7. De acordo com a quantidade de funcion�rios, cada loja receber� uma determinada quantidade de m�quinas de caf�. 

As lojas ser�o divididas em 3 categorias:

CATEGORIA 1: De 1 a 20 funcion�rios -> 1 m�quina de caf�
CATEGORIA 2: De 21 a 50 funcion�rios -> 2 m�quinas de caf�
CATEGORIA 3: Acima de 51 funcion�rios -> 3 m�quinas de caf�

Identifique, para cada caso, quais s�o as lojas de cada uma das 3 categorias acima (basta fazer
uma verifica��o).
*/
SELECT 
	StoreKey AS 'C�digo da Loja', 
	StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Total de Funcion�rios' 
FROM 
	DimStore 
WHERE 
	EmployeeCount 
BETWEEN 1 AND 20 AND Status = 'On'

SELECT
	StoreKey AS 'C�digo da Loja', 
	StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Total de Funcion�rios' 
FROM 
	DimStore 
WHERE 
	EmployeeCount 
BETWEEN 21 AND 50 AND Status = 'On'

SELECT
	StoreKey AS 'C�digo da Loja', 
	StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Total de Funcion�rios' 
FROM 
	DimStore 
WHERE 
	EmployeeCount >= 51 AND Status = 'On'


/* 8. A empresa decidiu que todas as televis�es de 
LCD receber�o um super desconto no pr�ximo m�s. 

O seu trabalho � fazer uma consulta � tabela DimProduct
e retornar os ID�s, Nomes e Pre�os de todos os 
produtos LCD existentes.
*/
SELECT
	ProductKey AS 'C�digo do Produto', 
	ProductName AS 'Nome do Produto', 
	UnitPrice AS 'Pre�o do Produto'
FROM 
	DimProduct
WHERE
	ProductDescription 
LIKE
	'%LCD%'


/* 9. Fa�a uma lista com todos os produtos das cores: Green, Orange, Black, Silver e Pink. 
Estes produtos devem ser exclusivamente das marcas: Contoso, Litware e Fabrikam.
*/
SELECT 
	* 
FROM 
	DimProduct 
WHERE 
	ColorName 
IN 
	('Green', 'Orange', 'Black', 'Silver', 'Pink') 
AND 
	BrandName 
IN 
	('Contoso', 'Litware', 'Fabrikam') 
ORDER BY 
	ColorName



/* 10. A empresa possui 16 produtos da marca Contoso, 
da cor Silver e com um UnitPrice entre 10 e 30. 

Descubra quais s�o esses produtos e ordene o resultado 
em ordem decrescente de acordo com o pre�o (UnitPrice).
*/
SELECT 
	* 
FROM 
	DimProduct 
WHERE 
	BrandName = 'Contoso' 
AND 
	ColorName = 'Silver' 
AND 
	UnitPrice 
BETWEEN 
	10 AND 30 
ORDER BY 
	UnitPrice DESC



-- 6. [SQL Server] Fun��es de Agrega��o

/*
1. O gerente comercial pediu a voc� uma an�lise da Quantidade Vendida e Quantidade
Devolvida para o canal de venda mais importante da empresa: Store.

Utilize uma fun��o SQL para fazer essas consultas no seu banco de dados. Obs: Fa�a essa
an�lise considerando a tabela FactSales.
*/
SELECT 
	SUM(SalesQuantity) AS 'Canal Store: Produtos Vendidos', 
	SUM(ReturnQuantity) AS 'Canal Store: Produtos Retornados' 
FROM 
	FactSales 
WHERE 
	channelKey = 1

/*
2. Uma nova a��o no setor de Marketing precisar� avaliar a m�dia salarial de todos os clientes da empresa, mas apenas de ocupa��o Professional. 

Utilize um comando SQL para atingir esse resultado.
*/
SELECT 
	AVG(YearlyIncome) AS 'M�dia Salarial dos Clientes' 
FROM 
	DimCustomer 
WHERE 
	Occupation = 'Professional'

/*
3. Voc� precisar� fazer uma an�lise da quantidade de funcion�rios das lojas registradas na empresa. 

O seu gerente te pediu os seguintes n�meros e informa��es:

a) Quantos funcion�rios tem a loja com mais funcion�rios?
b) Qual � o nome dessa loja?
c) Quantos funcion�rios tem a loja com menos funcion�rios?
d) Qual � o nome dessa loja?
*/
-- a) Quantos funcion�rios tem a loja com mais funcion�rios?
SELECT 
	MAX(EmployeeCount) AS 'Total de Funcion�rios' 
FROM 
	DimStore

-- b) Qual � o nome dessa loja?
SELECT 
	TOP(1) StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Quantidade de Funcion�rios' 
FROM 
	DimStore 
ORDER BY 
	EmployeeCount DESC

-- c) Quantos funcion�rios tem a loja com menos funcion�rios?
SELECT 
	MIN(EmployeeCount) AS 'Total de Funcion�rios' 
FROM 
	DimStore

-- d) Qual � o nome dessa loja?
SELECT 
	TOP(1) StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Quantidade de Funcion�rios'
FROM 
	DimStore 
WHERE 
	EmployeeCount IS NOT NULL 
ORDER BY 
	EmployeeCount ASC


/*
4. A �rea de RH est� com uma nova a��o para a empresa, e para isso precisa saber a quantidade total de funcion�rios do sexo Masculino e do sexo Feminino.

a) Descubra essas duas informa��es utilizando o SQL.
b) O funcion�rio e a funcion�ria mais antigos receber�o uma homenagem.

Descubra as seguintes informa��es de cada um deles: Nome, E-mail, Data de Contrata��o.
*/
SELECT 
	MIN(HireDate) AS 'Data de Contrata��o' 
FROM 
DimEmployee 
WHERE 
	Gender = 'M' 
AND 
	FirstName IS NOT NULL
SELECT 
	FirstName AS 'Nome do Funcion�rio',
	EmailAddress AS 'E-mail', 
	HireDate AS 'Data de Contrata��o' 
FROM 
	DimEmployee 
WHERE 
	HireDate = '1996-07-31' 
AND 
	EndDate IS NULL


SELECT 
	MIN(HireDate) AS 'Data de Contrata��o' 
FROM 
DimEmployee 
WHERE 
	Gender = 'F' 
AND 
	FirstName IS NOT NULL
SELECT 
	FirstName AS 'Nome do Funcion�rio',
	EmailAddress AS 'E-mail', 
	HireDate AS 'Data de Contrata��o' 
FROM 
	DimEmployee 
WHERE 
	HireDate = '1998-01-26' 
AND 
	EndDate IS NULL


/*
5. Agora voc� precisa fazer uma an�lise dos produtos. 

Ser� necess�rio descobrir as seguintes informa��es:

a) Quantidade distinta de cores de produtos.
b) Quantidade distinta de marcas
c) Quantidade distinta de classes de produto

Para simplificar, voc� pode fazer isso em uma mesma consulta.
*/
SELECT 
	COUNT(DISTINCT ColorName) AS 'Quantidade Destinta de Cores', 
	COUNT(DISTINCT BrandName) AS 'Quantidade Destinta de Marcar', 
	COUNT(DISTINCT ClassName) AS 'Quantidade Destinta de Nomes de Classes' 
FROM 
	DimProduct


-- 7. [SQL Server] Criando agrupamentos no SQL


-- TABELA FACTSALES

/*	1. a) Fa�a um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas
(channelkey).

b) Fa�a um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade
total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).

c) Fa�a um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas
para o ano de 2007.
*/

-- a) Fa�a um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas (channelkey).
SELECT 
	channelKey AS 'Canal de Vendas', 
	SUM(SalesQuantity) AS 'Quantidade Vendida' 
FROM 
	FactSales 
GROUP BY 
	channelKey

-- b) Fa�a um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).

SELECT 
	StoreKey AS 'C�digo da Loja', 
	SUM(SalesQuantity) 'Quantidade Vendida', 
	SUM(ReturnQuantity) as 'Quantidade Retornada' 
FROM 
	FactSales 
GROUP BY 
	StoreKey
ORDER BY
	StoreKey

-- c) Fa�a um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas para o ano de 2007.
SELECT 
	channelKey AS 'Canal de Venda', 
	COUNT(SalesAmount) AS 'Quantidade de Vendas' 
FROM 
	FactSales 
WHERE 
	DateKey 
BETWEEN 
	'20070101' 
AND 
	'20071231' 
GROUP BY 
	channelKey

/*	2. Voc� precisa fazer uma an�lise de vendas por produtos. O objetivo final � descobrir o valor
total vendido (SalesAmount) por produto (ProductKey).

a) A tabela final dever� estar ordenada de acordo com a quantidade vendida e, al�m disso,
mostrar apenas os produtos que tiveram um resultado final de vendas maior do que
$5.000.000.

b) Fa�a uma adapta��o no exerc�cio anterior e mostre os Top 10 produtos com mais vendas.
Desconsidere o filtro de $5.000.000 aplicado.
*/
SELECT * FROM FactSales

-- a) A tabela final dever� estar ordenada de acordo com a quantidade vendida e, al�m disso, mostrar apenas os produtos que tiveram um resultado final de vendas maior do que $5.000.000.
SELECT 
	ProductKey 'C�digo do Produto', 
	SUM(SalesAmount) AS 'Total de Vendas' 
FROM 
	FactSales 
GROUP BY 
	ProductKey 
HAVING
	SUM(SalesAmount) >= 5000000
ORDER BY 
	SUM(SalesAmount)
	
-- b) Fa�a uma adapta��o no exerc�cio anterior e mostre os Top 10 produtos com mais vendas. Desconsidere o filtro de $5.000.000 aplicado.
SELECT TOP(10)
	ProductKey 'C�digo do Produto', 
	SUM(SalesAmount) AS 'Total de Vendas' 
FROM 
	FactSales 
GROUP BY 
	ProductKey
ORDER BY 
	SUM(SalesAmount) DESC


--	FACTONLINESALES

/*	3. a) Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir qual � o ID (CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).

b) Feito isso, fa�a um agrupamento de total vendido (SalesQuantity) por ID do produto e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).
*/
SELECT * FROM FactOnlineSales

-- a) Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir qual � o ID (CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).
SELECT 
	CustomerKey, 
	SUM(SalesQuantity) AS 'Total de Compras'
FROM 
	FactOnlineSales 
GROUP BY 
	CustomerKey 
ORDER BY 
	SUM(SalesQuantity) DESC

-- CustomerKey: 19037
-- Total de Vendas para o Cliente: 66284

-- b) Feito isso, fa�a um agrupamento de total vendido (SalesQuantity) por ID do produto e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).
SELECT 
	TOP(3) ProductKey AS 'C�digo do Produto', 
	SUM(SalesQuantity) AS 'Total Vendido' 
FROM 
	FactOnlineSales
WHERE CustomerKey = 19037
GROUP BY 
	ProductKey


-- DIMPRODUCT

/*	4. a) Fa�a um agrupamento e descubra a quantidade total de produtos por marca.
		   b) Determine a m�dia do pre�o unit�rio (UnitPrice) para cada ClassName.
			 c) Fa�a um agrupamento de cores e descubra o peso total que cada cor de produto possui.
*/

-- a) Fa�a um agrupamento e descubra a quantidade total de produtos por marca.
SELECT 
	BrandName AS 'Nome da Marca', 
	COUNT(ProductKey) AS 'Total de Produtos' 
FROM 
	DimProduct 
GROUP BY 
	BrandName 
ORDER BY 
	BrandName

-- b) Determine a m�dia do pre�o unit�rio (UnitPrice) para cada ClassName.
SELECT 
	AVG(UnitPrice) AS 'M�dia de Pre�o', 
	ClassName AS 'Classe do Produto' 
FROM 
	DimProduct 
GROUP BY 
	ClassName
ORDER BY
	ClassName

-- c) Fa�a um agrupamento de cores e descubra o peso total que cada cor de produto possui.
SELECT 
	ColorName, 
	SUM(Weight) AS 'Peso Total da Cor' 
FROM 
	DimProduct 
GROUP BY 
	ColorName 
ORDER BY 
	ColorName


/*	5. Voc� dever� descobrir o peso total para cada tipo de produto (StockTypeName).

A tabela final deve considerar apenas a marca �Contoso� e ter os seus valores classificados em ordem decrescente.
*/
--SELECT DISTINCT StockTypeName AS 'Tipo do Nome de Estoque', SUM(Weight) AS 'Peso Total Tipo de Estoque' FROM DimProduct WHERE BrandName = 'Contoso' AND Weight IS NOT NULL GROUP BY StockTypeName, Weight ORDER BY SUM(Weight) DESC
SELECT 
	StockTypeName AS 'Classifica��o de Estoque', 
	SUM(Weight) AS 'Peso Total Tipo de Estoque' 
FROM 
	DimProduct
WHERE
	BrandName = 'Contoso'
GROUP BY 
	StockTypeName 
ORDER BY 
	SUM(Weight) DESC


/*	6. Voc� seria capaz de confirmar se todas as marcas dos produtos possuem � disposi��o todas as 16 op��es de cores?	*/
SELECT 
	BrandName AS 'Marca', 
	COUNT(DISTINCT ColorName) AS 'Qtd. de Cores por Marca'
FROM 
	DimProduct 
GROUP BY 
	BrandName


-- TABELA DIMCUSTOMER

/*	7. Fa�a um agrupamento para saber o total de clientes de acordo com o Sexo e tamb�m a m�dia salarial de acordo com o Sexo. 

Corrija qualquer resultado �inesperado� com os seus conhecimentos em SQL.
*/
--SELECT COUNT(*) AS 'Total de Clientes',	AVG(YearlyIncome) AS 'M�dia Salarial Anual', Gender AS 'Sexo' FROM DimCustomer WHERE Gender IS NOT NULL GROUP BY Gender
SELECT 
	Gender AS 'Sexo', 
	COUNT(*) AS 'Total de Clientes', 
	AVG(YearlyIncome) AS 'M�dia Salarial Anual' 
FROM 
	DimCustomer
WHERE 
	Gender IS NOT NULL
GROUP BY 
	Gender


/*	8. Fa�a um agrupamento para descobrir a quantidade total de clientes e a m�dia salarial de acordo com o seu n�vel escolar. 

Utilize a coluna Education da tabela DimCustomer para fazer esse agrupamento.
*/
SELECT 
	Education AS 'N�vel Escolar', 
	COUNT(*) AS 'Total de Clientes', 
	AVG(YearlyIncome) AS 'M�dia Salarial Anual' 
FROM 
	DimCustomer
WHERE
	Education IS NOT NULL
GROUP BY 
	Education 
ORDER BY Education


-- DIMEMPLOYEE

/*	9. Fa�a uma tabela resumo mostrando a quantidade total de funcion�rios de acordo com o Departamento (DepartmentName). 

Importante: Voc� dever� considerar apenas os funcion�rios ativos.
*/
SELECT 
	DepartmentName AS 'Departamento',	
	COUNT(DepartmentName) AS 'Total de Funcionarios por Departamento' 
FROM 
	DimEmployee 
WHERE
	Status = 'Current'
AND
	EndDate IS NULL 
GROUP BY 
	DepartmentName 
ORDER BY 
	[Total de Funcionarios por Departamento]

/*	10. Fa�a uma tabela resumo mostrando o total de VacationHours para cada cargo (Title).

Voc� deve considerar apenas as mulheres, dos departamentos de Production, Marketing, Engineering e Finance, para os funcion�rios contratados entre os anos de 1999 e 2000.
*/
SELECT 
	Title AS 'Cargo', 
	SUM(VacationHours) AS 'Total de Horas de F�rias' 
FROM 
	DimEmployee 
WHERE 
	Gender = 'F' 
AND 
	DepartmentName IN(
		'Production', 
		'Marketing', 
		'Engineering', 
		'Finance'
	) 
AND 
	HireDate 
BETWEEN 
	'1999-01-01' 
AND 
	'2000-12-31' 
GROUP BY  
	Title


-- 8. [SQL Server] JOINs no SQL

/*	1. Utilize o INNER JOIN para trazer os nomes das subcategorias dos produtos, da tabela
DimProductSubcategory para a tabela DimProduct.
*/
SELECT 
	DP.ProductKey AS 'Chave do Produto',
	DP.ProductName AS 'Nome do Produto',
	DPS.ProductSubcategoryName AS 'Nome das Subcategorias'
FROM 
	DimProduct AS DP
INNER JOIN
	DimProductSubcategory AS DPS
ON 
	DPS.ProductSubcategoryKey = DP.ProductSubcategoryKey


/*	2. Identifique uma coluna em comum entre as tabelas DimProductSubcategory e DimProductCategory. 

Utilize essa coluna para complementar informa��es na tabela DimProductSubcategory a partir da DimProductCategory. Utilize o LEFT JOIN.
*/
SELECT 
	DPC.ProductCategoryKey AS 'ID Subcategoria',
	DPC.ProductSubcategoryName AS 'Nome da Subcategoria',
	DPS.ProductCategoryName AS 'Nome da Categoria'
FROM 
	DimProductCategory AS DPS
LEFT JOIN 
	DimProductSubcategory AS DPC
ON 
	DPS.ProductCategoryKey = DPC.ProductCategoryKey

/*	3. Para cada loja da tabela DimStore, descubra qual o Continente e o Nome do Pa�s associados
(de acordo com DimGeography). 

Seu SELECT final deve conter apenas as seguintes colunas:
StoreKey, StoreName, EmployeeCount, ContinentName e RegionCountryName.

Utilize o LEFT JOIN neste exerc�cio.
*/
SELECT 
	DS.StoreKey	AS 'C�digo da Loja', 
	DS.StoreName AS 'Nome da Loja', 
	DS.EmployeeCount AS 'Total de Funcion�rios por Loja', 
	DG.ContinentName AS 'Nome do Continente', 
	DG.RegionCountryName AS 'Nome da Regi�o do Pa�s'
FROM 
	DimStore AS DS
LEFT JOIN 
	DimGeography AS DG
ON 
	DS.GeographyKey = DG.GeographyKey


/*	4. Complementa a tabela DimProduct com a informa��o de ProductCategoryDescription.
Utilize o LEFT JOIN e retorne em seu SELECT apenas as 5 colunas que considerar mais relevantes.
*/
SELECT 
	DP.ProductName AS 'Nome do Produto',
	DPC.ProductCategoryDescription AS 'Descri��o da Categoria do Produto'
FROM 
	DimProduct AS DP
INNER JOIN 
	DimProductSubcategory AS DPS
ON 
	DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey
LEFT JOIN 
	DimProductCategory AS dpc
ON 
	dps.ProductCategoryKey = dpc.ProductCategoryKey

/*	5. A tabela FactStrategyPlan resume o planejamento estrat�gico da empresa. Cada linha representa um montante destinado a uma determinada AccountKey.

a) Fa�a um SELECT das 100 primeiras linhas de FactStrategyPlan para reconhecer a tabela.

b) Fa�a um INNER JOIN para criar uma tabela contendo o AccountName para cada
AccountKey da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:
� StrategyPlanKey
� DateKey
� AccountName
� Amount
*/

-- a) Fa�a um SELECT das 100 primeiras linhas de FactStrategyPlan para reconhecer a tabela.
SELECT TOP(100) * FROM FactStrategyPlan

-- b) Fa�a um INNER JOIN para criar uma tabela contendo o AccountName para cada AccountKey da tabela FactStrategyPlan.

-- O seu SELECT final deve conter as colunas:
-- � StrategyPlanKey
-- � DateKey
-- � AccountName
-- � Amount
SELECT 
	FSP.StrategyPlanKey AS 'C�digo Plano Estrat�gia',
	DA.AccountName AS 'Nome da Conta',
	FSP.Datekey AS 'C�digo da Data',
	FSP.Amount AS 'Quantia'
FROM 
	FactStrategyPlan AS FSP
INNER JOIN 
	DimAccount AS	DA
ON
	FSP.AccountKey = DA.AccountKey

/*	6. Vamos continuar analisando a tabela FactStrategyPlan. Al�m da coluna AccountKey que identifica o tipo de conta, h� tamb�m uma outra coluna chamada ScenarioKey. Essa coluna possui a numera��o que identifica o tipo de cen�rio: Real, Or�ado e Previs�o.

Fa�a um INNER JOIN para criar uma tabela contendo o ScenarioName para cada ScenarioKey da tabela FactStrategyPlan. 

O seu SELECT final deve conter as colunas:
� StrategyPlanKey
� DateKey
� ScenarioName
� Amount
*/
SELECT 
	FSP.StrategyPlanKey AS 'C�digo Plano Estrat�gico',
	DS.ScenarioName 'Nome do Cen�rio',
	FSP.Datekey AS 'C�digo da Data',
	FSP.Amount AS 'Quantia'
FROM 
	FactStrategyPlan AS FSP
INNER JOIN 
	DimAccount AS DA
ON 
	FSP.AccountKey = DA.AccountKey
INNER JOIN 
	DimScenario DS
ON 
	FSP.ScenarioKey = DS.ScenarioKey

/*	7. Algumas subcategorias n�o possuem nenhum exemplar de produto. Identifique que subcategorias s�o essas. */

SELECT 
	DP.ProductName AS 'Nome do Produto', 
	DPS.ProductSubcategoryName AS 'Nome da Subcategoria' 
FROM 
	DimProduct AS DP
RIGHT JOIN 
	DimProductSubcategory AS DPS
ON 
	DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey
WHERE 
	DP.ProductName IS NULL



/*	8. A tabela abaixo mostra a combina��o entre Marca e Canal de Venda, para as marcas Contoso, Fabrikam e Litware. 

Crie um c�digo SQL para chegar no mesmo resultado.
*/

SELECT 
	DISTINCT 
		BrandName AS 'Marca do Produto', 
		ChannelName AS 'Nome do Canal' 
FROM 
	DimProduct 
CROSS JOIN 
	DimChannel 
WHERE 
	BrandName 
IN 
	('Contoso', 'Fabrikam', 'Litware')

/*	OU

SELECT 
	DISTINCT dp.BrandName AS 'Marca do Produto',
	dc.ChannelName AS 'Nome do Canal de Venda'
FROM 
	DimProduct AS dp
INNER JOIN 
	FactSales AS fs
ON
	fs.ProductKey = dp.ProductKey
INNER JOIN
	DimChannel AS dc
ON
	fs.channelKey = dc.ChannelKey
WHERE
	dp.BrandName in ('Contoso', 'Fabrikam', 'Litware')
*/



/*	9. Neste exerc�cio, voc� dever� relacionar as tabelas FactOnlineSales com DimPromotion.

Identifique a coluna que as duas tabelas t�m em comum e utilize-a para criar esse relacionamento.

Retorne uma tabela contendo as seguintes colunas:
� OnlineSalesKey
� DateKey
� PromotionName
� SalesAmount

A sua consulta deve considerar apenas as linhas de vendas referentes a produtos com desconto (PromotionName <> �No Discount�). 

Al�m disso, voc� dever� ordenar essa tabela de acordo com a coluna DateKey, em ordem crescente.
*/
SELECT
	TOP(1000) FOS.OnlineSalesKey AS 'ID do Canal de Vendas Online',
	FOS.DateKey AS 'Data Chave',
	DP.PromotionName AS 'Nome da Promo��o',
	FOS.SalesAmount AS 'Quantidade de Vendas'
FROM 
	FactOnlineSales AS FOS
INNER JOIN
	DimPromotion DP
ON
	FOS.PromotionKey = DP.PromotionKey
WHERE
	DP.PromotionName <> 'No Discount'
ORDER BY
	FOS.DateKey ASC

/*	10. A tabela abaixo � resultado de um Join entre a tabela FactSales e as tabelas: DimChannel, DimStore e DimProduct.

Recrie esta consulta e classifique em ordem decrescente de acordo com SalesAmount.

Colunas Retornadas:
	SalesKey,
	ChannelName,
	StoreName,
	ProductName,
	SalesAmount
*/
SELECT 
	TOP(1000) FS.SalesKey AS 'ID das Vendas',
	DC.ChannelName AS 'Nome do Canal',
	DS.StoreName AS 'Nome da Loja',
	DP.ProductName AS 'Nome do Produto',
	FS.SalesAmount AS 'Quantidade de Vendas'
FROM 
	FactSales AS FS
INNER JOIN
	DimChannel AS DC
ON
	FS.channelKey = DC.ChannelKey
INNER JOIN
	DimStore AS DS
ON
	FS.StoreKey = DS.StoreKey
INNER JOIN
	DimProduct AS DP
ON
	FS.ProductKey = DP.ProductKey
ORDER BY
	FS.SalesAmount DESC


-- 9. [SQL Server] Group By + Joins - Aplica��es


-- TABELA FACTSALES
--	1. a) Fa�a um resumo da quantidade vendida (Sales Quantity) de acordo com o nome do canal de vendas (ChannelName). Voc� deve ordenar a tabela final de acordo com SalesQuantity, em ordem decrescente.
SELECT 
		DC.ChannelName AS 'Nome do Canal',
		SUM(FS.SalesQuantity) AS 'Total de Vendas'
FROM 
	FactSales AS FS
INNER JOIN
	DimChannel AS DC
ON
	FS.channelKey = DC.ChannelKey
GROUP BY
	DC.ChannelName
ORDER BY
	SUM(FS.SalesQuantity) DESC

-- b) Fa�a um agrupamento mostrando a quantidade total vendida (Sales Quantity) e quantidade total devolvida (Return Quantity) de acordo com o nome das lojas (StoreName).
SELECT 
	DS.StoreName AS 'Nome da Loja',
	SUM(FS.SalesQuantity) AS 'Total Vendido', 
	SUM(FS.ReturnQuantity) AS 'Total Devolvido' 
FROM 
	FactSales FS
INNER JOIN 
	DimStore DS
ON
	FS.StoreKey = DS.StoreKey
GROUP BY 
	DS.StoreName
ORDER BY
	DS.StoreName

-- c) Fa�a um resumo do valor total vendido (Sales Amount) para cada m�s (CalendarMonthLabel) e ano (CalendarYear).
SELECT
	DD.CalendarYear AS 'Ano', 
	DD.CalendarMonthLabel AS 'M�s', 
	SUM(fs.SalesAmount) AS 'Total Vendido' 
FROM 
	FactSales AS FS 
INNER JOIN 
	DimDate as DD 
ON 
	FS.DateKey = DD.Datekey
GROUP BY
	DD.CalendarMonthLabel,
	DD.CalendarYear,
	DD.CalendarMonth
ORDER BY 
	DD.CalendarMonth ASC


-- 2. Voc� precisa fazer uma an�lise de vendas por produtos. O objetivo final � descobrir o valor total vendido (SalesQuantity) por produto.

SELECT 
	DP.ProductName AS 'Nome do Produto',
	DP.ColorName AS 'Cor do Produto',
	SUM(FS.SalesQuantity) AS 'Total Vendido' 
FROM 
	FactSales AS FS 
INNER JOIN 
	DimProduct DP 
ON 
	FS.ProductKey = DP.ProductKey 
GROUP BY 
	FS.SalesKey, 
	DP.ColorName,
	DP.ProductName, 
	FS.SalesQuantity 
ORDER BY 
	SUM(FS.SalesQuantity) DESC

-- a) Descubra qual � a cor de produto que mais � vendida (de acordo com SalesQuantity).
SELECT 
	DP.ColorName AS 'Nome da Cor', 
	SUM(FS.SalesQuantity) AS 'Cores mais Vendidas' 
FROM 
	FactSales AS FS 
INNER JOIN 
	DimProduct AS DP 
ON 
	FS.ProductKey = DP.ProductKey 
GROUP BY 
	DP.ColorName
ORDER BY 
	SUM(FS.SalesQuantity) DESC

-- b) Quantas cores tiveram uma quantidade vendida acima de 3.000.000
SELECT 
	DP.ColorName AS 'Cor', 
	SUM(FS.SalesQuantity) AS 'Cores com Vendas Acima de 3.000.000' 
FROM 
	FactSales AS FS 
INNER JOIN 
	DimProduct AS DP 
ON 
	FS.ProductKey = DP.ProductKey
GROUP BY 
	DP.ColorName
HAVING
	SUM(FS.SalesQuantity) > 3000000
ORDER BY 
	SUM(FS.SalesQuantity) DESC


/*	3. Crie um agrupamento de quantidade vendida (SalesQuantity) por categoria do produto
(ProductCategoryName).

Obs: Voc� precisar� fazer mais de 1 INNER JOIN, dado que a rela��o
entre FactSales e DimProductCategory n�o � direta.
*/

SELECT 
	DPC.ProductCategoryName AS 'Nome da Categoria do Produto', 
	SUM(FS.SalesQuantity) AS 'Total Vendido' 
FROM 
	FactSales AS FS 
INNER JOIN 
	DimProduct AS DP 
ON 
	FS.ProductKey = DP.ProductKey
INNER JOIN 
	DimProductSubcategory AS DPS 
ON 
	DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey
INNER JOIN 
	DimProductCategory AS DPC 
ON 
	DPS.ProductCategoryKey = DPC.ProductCategoryKey
GROUP BY 
	DPC.ProductCategoryName



--SELECT TOP(5) * FROM FactSales
--SELECT TOP(5) * FROM DimProduct
--SELECT TOP(5) * FROM DimProductSubcategory
--SELECT TOP(5) * FROM DimProductCategory

--FactSales RELACIONA COM DimProduct
--DimProduct RELACIONA COM DimProductSubcategory
--DimProductSubcategory RELACIONA COM DimProductCategory


-- TABELA FACTONLINESALES
-- 4. a) Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir qual � o nome completo do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).

SELECT 
	DC.CustomerKey AS 'ID do Cliente', 
	DC.FirstName + ' ' + DC.MiddleName + ' ' + DC.LastName AS 'Nome do Cliente', 
	SUM(FOS.SalesQuantity) AS 'Total de Compras' 
FROM 
	FactOnlineSales AS FOS 
INNER JOIN 
	DimCustomer AS DC 
ON 
	FOS.CustomerKey = DC.CustomerKey 
WHERE 
--	DC.FirstName IS NOT NULL 
--AND
--	DC.MiddleName IS NOT NULL 
--AND
--	DC.LastName IS NOT NULL
--AND
--	FOS.SalesQuantity > 0
--AND
	CustomerType = 'Person'
GROUP BY 
	DC.CustomerKey, 
	DC.FirstName, 
	DC.MiddleName, 
	DC.LastName
ORDER BY
	SUM(FOS.SalesQuantity) DESC


-- ID do Cliente = 7665
-- Total de Compras: 376

-- b) Feito isso, fa�a um agrupamento de produtos e descubra quais foram os top 10 produtos mais comprados pelo cliente da letra a, considerando o nome do produto.
SELECT 
	TOP(10) 
	DP.ProductName AS 'Nome do Produto', 
	DC.FirstName + ' ' + 
	DC.MiddleName + ' ' + 
	DC.LastName AS 'Nome do Cliente',
	SUM(SalesQuantity) AS 'Qtd. Vendido'
FROM 
	DimProduct AS DP 
INNER JOIN 
	FactOnlineSales AS FOS 
ON 
	DP.ProductKey = FOS.ProductKey 
INNER JOIN 
	DimCustomer AS DC 
ON 
	FOS.CustomerKey = DC.CustomerKey 
WHERE 
	DC.CustomerKey = 7665
GROUP BY 
	DP.ProductName, 
	DC.FirstName, 
	DC.MiddleName, 
	DC.LastName
ORDER BY 
	SUM(SalesQuantity) DESC

--SELECT TOP(100)* FROM FactOnlineSales
--SELECT * FROM DimCustomer
--SELECT * FROM DimProduct

/*	5. Fa�a um resumo mostrando o total de produtos comprados (Sales Quantity) de acordo com o sexo dos clientes. */

SELECT 
	DC.Gender AS 'G�nero', 
	SUM(FOS.SalesQuantity) AS 'Total de Produtos'
FROM 
	FactOnlineSales AS FOS 
INNER JOIN 
	DimCustomer AS DC 
ON 
	FOS.CustomerKey = DC.CustomerKey 
WHERE 
	FOS.SalesAmount > 0 
AND 
	DC.Gender IS NOT NULL 
GROUP BY 
	FOS.SalesQuantity, 
	DC.Gender

--SELECT TOP(5) * FROM FactOnlineSales
--SELECT * FROM DimCustomer


-- TABELA FACTEXCHANGERATE
/*	6. Fa�a uma tabela resumo mostrando a taxa de c�mbio m�dia de acordo com cada CurrencyDescription. 
A tabela final deve conter apenas taxas entre 10 e 100. */

SELECT 
	DCY.CurrencyDescription AS 'Descri��o da Moeda', 
	AVG(FER.AverageRate) AS 'Taxa M�dia' 
FROM 
	FactExchangeRate AS FER 
INNER JOIN 
	DimCurrency AS DCY 
ON 
	FER.CurrencyKey = DCY.CurrencyKey 
GROUP BY 
	DCY.CurrencyDescription 
HAVING 
	AVG(FER.AverageRate) 
BETWEEN 
	10 
AND 
	100 
ORDER BY 
	AVG(FER.AverageRate) DESC

SELECT * FROM FactExchangeRate ORDER BY AverageRate DESC
SELECT * FROM DimCurrency

-- FACTSTRATEGYPLAN

/*	7. Calcule a SOMA TOTAL de AMOUNT referente � tabela FactStrategyPlan destinado aos
cen�rios: Actual e Budget.

Dica: A tabela DimScenario ser� importante para esse exerc�cio.
*/

SELECT 
	DS.ScenarioName AS 'Nome Cen�rio', 
	SUM(FSP.Amount) AS 'Qtd. Total por Cen�rio' 
FROM 
	FactStrategyPlan AS FSP 
INNER JOIN 
	DimScenario AS DS 
ON 
	FSP.ScenarioKey = DS.ScenarioKey 
GROUP BY 
	DS.ScenarioName
HAVING 
	DS.ScenarioName 
IN 
	('Actual', 'Budget') 



/*	8. Fa�a uma tabela resumo mostrando o resultado do planejamento estrat�gico por ano. */

SELECT 
	DD.CalendarYear AS 'Ano', 
	SUM(FSP.Amount) AS 'Resultado' 
FROM 
	DimDate AS DD 
INNER JOIN 
	FactStrategyPlan AS FSP 
ON 
	DD.Datekey = FSP.Datekey  
GROUP BY 
	DD.CalendarYear

SELECT TOP(5) * FROM DimDate
SELECT TOP(5) * FROM FactStrategyPlan
SELECT * FROM DimEntity

-- TABEL DIMPRODUCT/DIMPRODUCTSUBCATEGORY

/*	9. Fa�a um agrupamento de quantidade de produtos por ProductSubcategoryName. 

Leve em considera��o em sua an�lise apenas a marca Contoso e a cor Silver. */

SELECT 
	DPS.ProductSubcategoryName AS 'Nome da Subcategoria', 
	COUNT(DPS.ProductSubcategoryKey) AS 'Qtd. Total por Subcategoria' 
FROM 
	DimProduct AS DP 
INNER JOIN
	DimProductSubcategory AS DPS 
ON 
	DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey 
WHERE 
	DP.BrandName = 'Contoso' 
AND 
	DP.ColorName = 'Silver' 
AND 
	DP.Status = 'On' 
GROUP BY 
	DPS.ProductSubcategoryName



/*	10. Fa�a um agrupamento duplo de quantidade de produtos por BrandName e ProductSubcategoryName. 

A tabela final dever� ser ordenada de acordo com a coluna BrandName.*/

SELECT 
	DP.BrandName AS 'Marca',
	DPS.ProductSubcategoryName AS 'Subcategoria',
	COUNT(*) AS 'Qtd. Total' 
FROM 
	DimProduct AS DP 
INNER JOIN 
	DimProductSubcategory AS DPS 
ON 
	DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey 
WHERE 
	DP.Status = 'On' 
GROUP BY 
	DPS.ProductSubcategoryName, 
	DP.BrandName 
ORDER BY 
	DP.BrandName ASC

SELECT * FROM DimProduct
SELECT * FROM DimProductSubcategory



/* 10. [SQL Server] Vari�veis */


-- Exerc�cio 1: crie uma consulta juntando o texto 'O pre�o do produto �: ' com o valor R$ 30.99
SELECT 'O pre�o do pastel �: ' + CAST(30.99 AS VARCHAR(50)) AS 'Valor do Produto'

-- Exerc�cio 2: adicione 1 � data '20/06/2021'
SELECT '20/06/2021' + CAST(1 AS DATETIME) AS 'Dia Seguinte'

-- OU

SELECT CAST('20/06/2021' AS DATETIME) + 3 AS 'Dia Seguinte'


-- Exerc�cio 3: crie uma consulta juntando o texto 'A data de validade do produto �: ' com a data 17/abr/2022. 

-- Obs: voc� dever� usar a fun��o CAST() para garantir que a data � entendida com o tipo DATETIME.
SELECT 'A data de validade do produto �: ' + FORMAT(CAST('17/04/2022' AS DATETIME), 'dd/MMM/yyyy') AS 'Data de Validade'

SELECT 100 * 8.99 AS 'faturamento'

DECLARE @quantidade AS int, @preco AS float
SET @quantidade = 100
SET @preco = 8.99

SELECT @quantidade * @preco AS 'faturamento'

-- Exemplo 1: Declare uma vari�vel chamada 'idade' e armazene o valor 30

DECLARE @idade AS INT

SET @idade = 30

SELECT @idade

-- Exemplo 2: Declare uma vari�vel chamada 'preco' e armazene o valor 10.89

--DECLARE @preco AS float
--SET @preco = 10.89
--SELECT @preco

--DECLARE @preco2 AS decimal(5, 2)
--SET @preco2 = 10.89
--SELECT @preco2



-- Exemplo 3: Declare uma vari�vel chamada 'nome' e armazene o valor 'Mateus'

DECLARE @nome AS varchar(50)
SET @nome = 'Mateus'
SELECT @nome

-- Exemplo 4: Declare uma vari�vel chamada 'data' e armazene a data de hoje.

DECLARE @data AS datetime
SET @data = '2021-10-28'
SELECT @data

SELECT DAY(@data)



-- 8. DECLARE e SET Declarando uma vari�vel

-- Exerc�cio 1: a sua loja fez uma venda de 100 camisas, cada uma custando 89.99. Fa�a uma SELECT para obter o resultado do faturamento (quantidade X pre�o).
SELECT 'Faturamento foi R$ ' + CAST(100.0 * 89.99 AS VARCHAR(10)) AS 'Faturamento'


-- Exerc�cio 2: refa�a o exerc�cio anterior utilizando vari�veis para deixar o c�lculo mais otimizado.
DECLARE 
	@qtdCamisa INT = 500.0, 
	@precoCamisa FLOAT = 89.99, 
	@faturamento FLOAT 
SET 
	@faturamento = @qtdCamisa * @precoCamisa
SELECT 
	CAST(@faturamento AS FLOAT) AS 'Faturamento'

/*	1. Declare 4 vari�veis inteiras. Atribua os seguintes valores a elas:

valor1 = 10
valor2 = 5
valor3 = 34
valor4 = 7
*/
DECLARE 
	@varValor1 INT = 10, 
	@varValor2 INT = 5, 
	@varValor3 INT = 34, 
	@varValor4 INT = 7

-- a) Crie uma nova vari�vel para armazenar o resultado da soma entre valor1 e valor2. Chame essa vari�vel de soma.
DECLARE
	@varValor1 INT = 10, 
	@varValor2 INT = 5,
	@varSoma INT
SET 
	@varSoma = @varValor1 + @varValor2
SELECT 
	'Soma entre Valor1 e Valor2 �: ' + 
	CAST(
			@varSoma AS VARCHAR(10)
		) AS 'Resultado da Soma'

-- b) Crie uma nova vari�vel para armazenar o resultado da subtra��o entre valor3 e valor 4. Chame essa vari�vel de subtracao.
DECLARE 
	@varValor3 INT = 34, 
	@varValor4 INT = 7,
	@varSubtracao INT
SET 
	@varSubtracao = @varValor3 - @varValor4
SELECT 'Subtra��o entre Valor3 Valor4 �: ' + 
	CAST(
		@varSubtracao AS VARCHAR(10)
	) AS 'Resultado da Subtra��o'

-- c) Crie uma nova vari�vel para armazenar o resultado da multiplica��o entre o Valor1 e o Valor4. Chame essa vari�vel de multiplicacao.
DECLARE 
	@varValor1 INT = 10,
	@varValor4 INT = 7, 
	@varMultiplicacao INT
SET 
	@varMultiplicacao = @varValor1 * @varValor4
SELECT 
	'Munltiplica��o entre Valor1 e Valor4 �: ' + 
	CAST(
		@varMultiplicacao AS VARCHAR(10)
	) AS 'Resultado da Multiplica��o'

-- d) Crie uma nova vari�vel para armazenar o resultado da divis�o do valor3 pelo valor4. Chame essa vari�vel de divisao. Obs: O resultado dever� estar em decimal, e n�o em inteiro.
DECLARE 
	@varValor3 FLOAT = 34, 
	@varValor4 FLOAT = 7, 
	@varDivisao FLOAT
SET 
	@varDivisao = @varValor3 / @varValor4
SELECT 
	'Resultado divis�o entre Valor3 e Valor4 �: ' + 
	CAST(
		ROUND(
			@varDivisao, 2
		) AS VARCHAR(10)
	) AS 'Resultado da Divis�o'


/*	Para cada declara��o das vari�veis abaixo, 
aten��o em rela��o ao tipo de dado que dever� ser especificado. */

-- a) Declare uma vari�vel chamada �produto� e atribua o valor de �Celular�. 
DECLARE 
	@varProduto VARCHAR(50) = 'Celular'
SELECT
	@varProduto AS 'Tipo de Produto'

	
-- b) Declare uma vari�vel chamada �quantidade� e atribua o valor de 12. 
DECLARE 
	@varQuantidade INT = 12
SELECT
	@varQuantidade AS 'Quantidade'


-- c) Declare uma vari�vel chamada �preco� e atribua o valor 9.99.
DECLARE 
	@varPreco FLOAT = 9.99
SELECT
	@varPreco AS 'Pre�o'


-- d) Declare uma vari�vel chamada �faturamento� e atribua o resultado da multiplica��o entre �quantidade� e �preco�. 
DECLARE 
	@varFaturamento FLOAT, 
	@varQuantidade INT = 12, 
	@varPreco FLOAT = 9.99
SET 
	@varFaturamento = @varQuantidade * @varPreco
SELECT 
	@varFaturamento AS 'Faturamento'


-- e) Visualize o resultado dessas 4 vari�veis em uma �nica consulta, por meio do SELECT.

DECLARE 
	@varProduto VARCHAR(50) = 'Celular', 
	@varQuantidade INT = 12, 
	@varPreco FLOAT = 9.99, 
	@varFaturamento FLOAT
SET 
	@varFaturamento = @varQuantidade * @varPreco
SELECT 
	@varProduto AS 'Tipo de Produto', 
	@varQuantidade AS 'Quantidade', 
	@varPreco AS 'Pre�o', 
	@varFaturamento AS 'Faturamento'


/*	3. Voc� � respons�vel por gerenciar um banco de dados onde s�o recebidos dados externos de usu�rios. 

Em resumo, esses dados s�o:

- Nome do usu�rio
- Data de nascimento 
- Quantidade de pets que aquele usu�rio possui

Voc� precisar� criar um c�digo em SQL capaz de juntar as informa��es fornecidas por este usu�rio. 

Para simular estes dados, crie 3 vari�veis, chamadas: nome, data_nascimento e num_pets. 

Voc� dever� armazenar os valores �Andr�, �10/02/1998� e 2, respectivamente.

O resultado final a ser alcan�ado � mostrado no print abaixo: 

(Nenhum nome de coluna)
Meu nome � Andr�, nasci em 10/02/1988 e tenho 2 pets.
*/

DECLARE 
	@varNome VARCHAR(50) = 'Andr�', 
	@varData_nascimento DATETIME = '10/02/1998', 
	@varNum_pets INT = 2
SELECT '
	Meu nome � ' 
	+ @varNome 
	+ ', nasci em ' 
	+ FORMAT(
			@varData_nascimento, 'dd/MM/yyyy'
	  ) 
	+ ' e tenho ' 
	+ CAST(
		@varNum_pets AS VARCHAR(5)
	  ) 
	+ ' pets.'


/*	4. Voc� acabou de ser promovido e o seu papel ser� realizar um controle de qualidade sobre as lojas da empresa.

A primeira informa��o que � passada a voc� � que o ano de 2008 foi bem complicado para a empresa, pois foi quando duas das principais lojas fecharam. 

O seu primeiro desafio � descobrir o nome dessas lojas que fecharam no ano de 2008, para que voc� possa entender o motivo e mapear planos de a��o para evitar que outras lojas importantes tomem o mesmo caminho. 

O seu resultado dever� estar estruturado em uma frase, com a seguinte estrutura: �As lojas fechadas no ano de 2008 foram:  � + nome_das_lojas

Obs: utilize o comando PRINT (e n�o o SELECT!) para mostrar o resultado. */

DECLARE @varListaLojas VARCHAR(50)
SET @varListaLojas = ''

SELECT 
	@varListaLojas = @varListaLojas + StoreName + ', '
FROM
	DimStore
WHERE
	YEAR(CloseDate) = 2008
	-- FORMAT(CloseDate, 'yyyy') = 2008

PRINT
	'As lojas fechadas no ano de 2008 foram: ' + @varListaLojas


/*	5. Voc� precisa criar uma consulta para mostrar a lista 
de produtos da tabela DimProduct para uma subcategoria espec�fica: �Lamps�.  

Utilize o conceito de vari�veis para chegar neste resultado.*/


DECLARE @varIdSubCategoria INT
DECLARE @varNomeSubCategoria VARCHAR(30)

SET 
	@varNomeSubCategoria = 'Lamps'
SET 
	@varIdSubCategoria = 
	(
		SELECT 
			ProductSubcategoryKey 
		FROM 
			DimProductSubcategory 
		WHERE 
			ProductSubcategoryName = @varNomeSubCategoria
	)

SELECT 
	* 
FROM 
	DimProduct 
WHERE 
	ProductSubcategoryKey = @varIdSubCategoria




-- 11. [SQL Server] Manipulando Strings e Datas no SQL

/*	1. Quando estamos manipulando tabelas, � importante pensar em como os dados ser�o 
apresentados em um relat�rio. Imagine os nomes dos produtos da tabela DimProduct. Os 
textos s�o bem grandes e pode ser que mostrar os nomes completos dos produtos n�o seja a 
op��o mais interessante, pois provavelmente n�o v�o caber em um gr�fico e a visualiza��o 
ficar� ruim.
*/

-- a) Seu gestor te pede para listar todos os produtos para que seja criado um gr�fico para ser apresentado na reuni�o di�ria de equipe. Fa�a uma consulta � tabela DimProduct que retorne (1) o nome do produto e (2) a quantidade de caracteres que cada produto tem, e ordene essa tabela do produto com a maior quantidade de caracteres para a menor.

SELECT 
	ProductName AS 'Nome do Produto', 
	LEN(ProductName) AS 'Total de Caracteres' 
FROM 
	DimProduct
ORDER BY
	LEN(ProductName) DESC



-- b) Qual � a m�dia de caracteres dos nomes dos produtos?

SELECT 
	AVG(LEN(ProductName)) AS 'Qtd. M�dia de Caracteres' 
FROM 
	DimProduct



-- c) Analise a estrutura dos nomes dos produtos e verifique se seria poss�vel reduzir o tamanho do nome dos produtos. (Dica: existem informa��es redundantes nos nomes dos produtos? Seria poss�vel substitu�-las?)


SELECT 
	 ProductName AS 'Nome do Produto',
	 REPLACE(REPLACE(ProductName, BrandName, ''), ColorName, '') AS 'Nome Resumido'
	 --REPLACE(ProductName, ColorName, '') AS 'Nome da Cor Resumido'
FROM 
	DimProduct


-- d) Qual � a m�dia de caracteres nesse novo cen�rio?

SELECT 
	AVG(LEN(REPLACE(REPLACE(ProductName, BrandName, ''), ColorName, ''))) AS 'M�dia de Caracteres'
FROM 
	DimProduct
*/




/*	2.  A coluna StyleName da tabela DimProduct possui alguns c�digos identificados por n�meros distintos, que v�o de 0 at� 9, como pode ser visto no exemplo abaixo.

Por�m, o setor de controle decidiu alterar a identifica��o do StyleName, e em vez de usar 
n�meros, a ideia agora � passar a usar letras para substituir os n�meros, conforme exemplo 
abaixo: 

0 -> A, 1 -> B, 2 -> C, 3 -> D, 4 -> E, 5 -> F, 6 -> G, 7 -> H, 8 -> I, 9 - J 

� de sua responsabilidade alterar os n�meros por letras na coluna StyleName da tabela 
DimProduct. Utilize uma fun��o que permita fazer essas substitui��es de forma pr�tica e r�pida. 



SELECT 
	ProductName,
	StyleName,
	TRANSLATE(StyleName, '0123456789', 'ABCDEFGHIJ') AS 'Caracteres Substitu�dos'
FROM 
	DimProduct

*/

/*	3. O setor de TI est� criando um sistema para acompanhamento individual de cada funcion�rio da 
empresa Contoso. Cada funcion�rio receber� um login e senha. O login de cada funcion�rio ser� 
o ID do e-mail, como no exemplo abaixo:

J� a senha ser� o FirtName + o dia do ano em que o funcion�rio nasceu, em MAI�SCULA. Por 
exemplo, o funcion�rio com E-mail: mark0@contoso.com e data de nascimento 15/01/1990 
dever� ter a seguinte senha:

Login: mark0 
Senha: MARK15 

O respons�vel pelo TI pediu a sua ajuda para retornar uma tabela contendo as seguintes colunas 
da tabela DimEmployee: Nome completo (FirstName + LastName), E-mail, ID do e-mail e Senha. 
Portanto, fa�a uma consulta � tabela DimProduct e retorne esse resultado. 


SELECT 
FirstName + '' + LastName AS 'Nome Completo',
EmailAddress AS 'E-mail',
LEFT(EmailAddress, CHARINDEX('@', EmailAddress) - 1) AS 'Login',
UPPER(FirstName + DATENAME(DAYOFYEAR,BirthDate)) AS 'Senha'
FROM 
DimEmployee

*/

/*	4. A tabela DimCustomer possui o primeiro registro de vendas no ano de 2001.

Como forma de reconhecer os clientes que compraram nesse ano, o setor de Marketing solicitou a voc� que retornasse uma tabela com todos os clientes que fizeram a sua primeira compra neste ano para que seja enviado uma encomenda com um presente para cada um. 

Para fazer esse filtro, voc� pode utilizar a coluna DateFirstPurchase, que cont�m a informa��o da data da primeira compra de cada cliente na tabela DimCustomer. 

Voc� dever� retornar as colunas de FirstName, EmailAddress, AddressLine1 e DateFirstPurchase da tabela DimCustomer, considerando apenas os clientes que fizeram a primeira compra no ano de 2001.


SELECT 
	FirstName, 
	EmailAddress, 
	AddressLine1, 
	DateFirstPurchase
FROM 
	DimCustomer
WHERE
	YEAR(DateFirstPurchase) = 2001
ORDER BY 
	DateFirstPurchase



/*	5. A tabela DimEmployee possui uma informa��o de data de contrata��o (HireDate). A �rea de RH, no entanto, precisa das informa��es dessas datas de forma separada em dia, m�s e ano, pois ser� feita uma automatiza��o para cria��o de um relat�rio de RH, e facilitaria muito se essas informa��es estivessem separadas em uma tabela. 

Voc� dever� realizar uma consulta � tabela DimEmployee e retornar uma tabela contendo as seguintes informa��es:
	FirstName,
	EmailAddress, 
	HireDate, 
	al�m das colunas de Dia, M�s e Ano de contrata��o.  

Obs1: A coluna de M�s deve conter o nome do m�s por extenso, e n�o o n�mero do m�s. 

Obs2: Lembre-se de nomear cada uma dessas colunas em sua consulta para garantir que o 
entendimento de cada informa��o ficar� 100% claro.   

*/

-- SELECT * FROM DimEmployee

SELECT 
	FirstName AS 'Nome', 
	EmailAddress AS 'E-mail', 
	HireDate AS 'Data de Contrata��o', 
	DATENAME(DAY, HireDate) AS 'Dia da Contrata��o',
	DATENAME(MONTH, HireDate) AS 'M�s da Contrata��o',
	DATENAME(YEAR, HireDate) AS 'Ano da Contrata��o'
FROM 
	DimEmployee

*/


/*	6. Descubra qual � a loja que possui o maior tempo de atividade (em dias). Voc� dever� fazer essa consulta na tabela DimStore, e considerar a coluna OpenDate como refer�ncia para esse c�lculo. 
*/

SELECT 
	StoreName AS 'Nome da Loja', 
	OpenDate AS 'Data de Abertura', 
	DATEDIFF(DAY, OpenDate, GETDATE()) AS 'Dias em Atividade'
FROM 
	DimStore
WHERE
	CloseDate IS NULL
ORDER BY DATEDIFF(DAY, OpenDate, GETDATE())










