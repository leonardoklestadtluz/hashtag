USE ContosoRetailDW
/*
/* 1. Você é responsável por controlar os dados de clientes e de produtos da sua empresa.
O que você precisará fazer é confirmar se:

a. Existem 2.517 produtos cadastrados na base e, se não tiver, você deverá reportar ao seu
gestor para saber se existe alguma defasagem no controle dos produtos.

b. Até o mês passado, a empresa tinha um total de 19.500 clientes na base de controle.
Verifique se esse número aumentou ou reduziu.
*/

-- a. Existem 2.517 produtos cadastrados na base e, se não tiver, você deverá reportar ao seu gestor para saber se existe alguma defasagem no controle dos produtos.
SELECT 
	* 
FROM 
	DimProduct

-- b. Até o mês passado, a empresa tinha um total de 19.500 clientes na base de controle. Verifique se esse número aumentou ou reduziu.
SELECT 
	* 
FROM 
	DimCustomer


/* 2. Você trabalha no setor de marketing da empresa Contoso e acaba de ter uma ideia de oferecer
descontos especiais para os clientes no dia de seus aniversários. Para isso, você vai precisar
listar todos os clientes e as suas respectivas datas de nascimento, além de um contato.

a) Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela
dimCustomer.

b) Renomeie as colunas dessa tabela usando o alias (comando AS).
*/

-- a) Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela dimCustomer.
-- b) Renomeie as colunas dessa tabela usando o alias (comando AS).
SELECT 
	CustomerKey AS 'Chave do Cliente',
	FirstName AS 'Primeiro Nome',
	EmailAddress AS 'Endereço de Email',
	BirthDate AS 'Data de Nascimento'
FROM 
	DimCustomer


/* 3. A Contoso está comemorando aniversário de inauguração de 10 anos e pretende fazer uma
ação de premiação para os clientes. A empresa quer presentear os primeiros clientes desde
a inauguração. 

Você foi alocado para levar adiante essa ação. Para isso, você terá que fazer o seguinte:

a) A Contoso decidiu presentear os primeiros 100 clientes da história com um vale compras
de R$ 10.000. Utilize um comando em SQL para retornar uma tabela com os primeiros
100 primeiros clientes da tabela dimCustomer (selecione todas as colunas).

b) A Contoso decidiu presentear os primeiros 20% de clientes da história com um vale
compras de R$ 2.000. Utilize um comando em SQL para retornar 10% das linhas da sua
tabela dimCustomer (selecione todas as colunas).

c) Adapte o código do item a) para retornar apenas as 100 primeiras linhas, mas apenas as
colunas FirstName, EmailAddress, BirthDate.

d) Renomeie as colunas anteriores para nomes em português

*/

-- a) A Contoso decidiu presentear os primeiros 100 clientes da história com um vale compras de R$ 10.000. Utilize um comando em SQL para retornar uma tabela com os primeiros 100 primeiros clientes da tabela dimCustomer (selecione todas as colunas).
SELECT 
	TOP(100) * 
FROM
	DimCustomer


/* b) A Contoso decidiu presentear os primeiros 20% de clientes da história com um vale
compras de R$ 2.000. Utilize um comando em SQL para retornar 10% das linhas da sua
tabela dimCustomer (selecione todas as colunas).

*/
SELECT 
	TOP(20) PERCENT 
	* 
FROM 
	DimCustomer

-- c) Adapte o código do item a) para retornar apenas as 100 primeiras linhas, mas apenas as colunas FirstName, EmailAddress, BirthDate.
-- d) Renomeie as colunas anteriores para nomes em português
SELECT 
	TOP(100) 
	FirstName AS 'Primeiro Nome', 
	EmailAddress AS 'Endereço de E-mail',
	BirthDate AS 'Data de Nascimento'
FROM
	DimCustomer

/* 4. A empresa Contoso precisa fazer contato com os fornecedores de produtos para repor o
estoque. 

Você é da área de compras e precisa descobrir quem são esses fornecedores.

Utilize um comando em SQL para retornar apenas os nomes dos fornecedores na tabela
dimProduct e renomeie essa nova coluna da tabela

*/
SELECT 
	DISTINCT Manufacturer AS 'Nome do Fornecedor'
FROM 
	DimProduct


/* 5. O seu trabalho de investigação não para. 

Você precisa descobrir se existe algum produto registrado na base de produtos que ainda não tenha sido vendido. Tente chegar nessa informação.

Obs: caso tenha algum produto que ainda não tenha sido vendido, você não precisa descobrir
qual é, é suficiente saber se teve ou não algum produto que ainda não foi vendido.

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

/* 1. Você é o gerente da área de compras e precisa criar um relatório 
com as TOP 100 vendas, de acordo com a quantidade vendida. 

Você precisa fazer isso em 10min pois o diretor de compras solicitou
essa informação para apresentar em uma reunião.

Utilize seu conhecimento em SQL para buscar essas TOP 100 vendas, 
de acordo com o total vendido (SalesAmount).
*/
SELECT 
	TOP(100) * 
FROM 
	FactSales 
ORDER BY 
	SalesQuantity DESC


/* 2. Os TOP 10 produtos com maior UnitPrice possuem exatamente o mesmo preço. 
Porém, a empresa quer diferenciar esses preços de acordo com o peso (Weight) de cada um.

O que você precisará fazer é ordenar esses top 10 produtos, de acordo com a coluna
de UnitPrice e, além disso, estabelecer um critério de desempate, para que seja 
mostrado na ordem, do maior para o menor.

Caso ainda assim haja um empate entre 2 ou mais produtos, pense em uma forma de criar um segundo critério de desempate (além do peso).
*/
SELECT 
	DISTINCT TOP(10) *
FROM 
	DimProduct 
ORDER BY 
	UnitPrice DESC, 
	Weight DESC,
	AvailableForSaleDate ASC


/* 3. Você é responsável pelo setor de logística da empresa Contoso e precisa dimensionar o transporte de todos os produtos em categorias, de acordo com o peso.

Os produtos da categoria A, com peso igual ou acima de 100kg, deverão ser transportados na primeira leva.

Faça uma consulta no banco de dados para descobrir quais são estes produtos que estão na categoria A.

a) Você deverá retornar apenas 2 colunas nessa consulta: Nome do Produto e Peso.

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



/* 4. Você foi alocado para criar um relatório das lojas registradas atualmente na Contoso.

a) Descubra quantas lojas a empresa tem no total. Na consulta que você deverá fazer à tabela DimStore, retorne as seguintes informações: StoreName, OpenDate, EmployeeCount

b) Renomeeie as colunas anteriores para deixar a sua consulta mais intuitiva.

c) Dessas lojas, descubra quantas (e quais) lojas ainda estão ativas.
*/
SELECT 
	StoreName AS 'Nome da Loja', 
	OpenDate AS 'Data de Abertura', 
	EmployeeCount AS 'Total de Funcionários' 
FROM 
	DimStore
WHERE
	StoreType = 'Store'
AND
	Status = 'On'


/* 5. O gerente da área de controle de qualidade notificou à Contoso que todos
os produtos Home Theater da marca Litware, disponibilizados para venda 
no dia 15 de março de 2009, foram identificados com defeitos de fábrica.

O que você deverá fazer é identificar os ID’s desses produtos e repassar 
ao gerente para que ele possa notificar as lojas e consequentemente solicitar 
a suspensão das vendas desses produtos.
*/
SELECT * FROM DimProduct

SELECT 
	ProductKey AS 'Código do Produto', 
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


/* 6. Imagine que você precise extrair um relatório da tabela DimStore, com informações de lojas. Mas você precisa apenas das lojas que não estão mais funcionando atualmente.

a) Utilize a coluna de Status para filtrar a tabela e trazer apenas as lojas que não estão mais funcionando.

b) Agora imagine que essa coluna de Status não existe na sua tabela. Qual seria a outra forma que você teria de descobrir quais são as lojas que não estão mais funcionando?
*/

-- a)
SELECT * FROM DimStore WHERE Status = 'Off'
 
--b) 
SELECT * FROM DimStore WHERE CloseDate IS NOT NULL


/* 7. De acordo com a quantidade de funcionários, cada loja receberá uma determinada quantidade de máquinas de café. 

As lojas serão divididas em 3 categorias:

CATEGORIA 1: De 1 a 20 funcionários -> 1 máquina de café
CATEGORIA 2: De 21 a 50 funcionários -> 2 máquinas de café
CATEGORIA 3: Acima de 51 funcionários -> 3 máquinas de café

Identifique, para cada caso, quais são as lojas de cada uma das 3 categorias acima (basta fazer
uma verificação).
*/
SELECT 
	StoreKey AS 'Código da Loja', 
	StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Total de Funcionários' 
FROM 
	DimStore 
WHERE 
	EmployeeCount 
BETWEEN 1 AND 20 AND Status = 'On'

SELECT
	StoreKey AS 'Código da Loja', 
	StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Total de Funcionários' 
FROM 
	DimStore 
WHERE 
	EmployeeCount 
BETWEEN 21 AND 50 AND Status = 'On'

SELECT
	StoreKey AS 'Código da Loja', 
	StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Total de Funcionários' 
FROM 
	DimStore 
WHERE 
	EmployeeCount >= 51 AND Status = 'On'


/* 8. A empresa decidiu que todas as televisões de 
LCD receberão um super desconto no próximo mês. 

O seu trabalho é fazer uma consulta à tabela DimProduct
e retornar os ID’s, Nomes e Preços de todos os 
produtos LCD existentes.
*/
SELECT
	ProductKey AS 'Código do Produto', 
	ProductName AS 'Nome do Produto', 
	UnitPrice AS 'Preço do Produto'
FROM 
	DimProduct
WHERE
	ProductDescription 
LIKE
	'%LCD%'


/* 9. Faça uma lista com todos os produtos das cores: Green, Orange, Black, Silver e Pink. 
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

Descubra quais são esses produtos e ordene o resultado 
em ordem decrescente de acordo com o preço (UnitPrice).
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



-- 6. [SQL Server] Funções de Agregação

/*
1. O gerente comercial pediu a você uma análise da Quantidade Vendida e Quantidade
Devolvida para o canal de venda mais importante da empresa: Store.

Utilize uma função SQL para fazer essas consultas no seu banco de dados. Obs: Faça essa
análise considerando a tabela FactSales.
*/
SELECT 
	SUM(SalesQuantity) AS 'Canal Store: Produtos Vendidos', 
	SUM(ReturnQuantity) AS 'Canal Store: Produtos Retornados' 
FROM 
	FactSales 
WHERE 
	channelKey = 1

/*
2. Uma nova ação no setor de Marketing precisará avaliar a média salarial de todos os clientes da empresa, mas apenas de ocupação Professional. 

Utilize um comando SQL para atingir esse resultado.
*/
SELECT 
	AVG(YearlyIncome) AS 'Média Salarial dos Clientes' 
FROM 
	DimCustomer 
WHERE 
	Occupation = 'Professional'

/*
3. Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na empresa. 

O seu gerente te pediu os seguintes números e informações:

a) Quantos funcionários tem a loja com mais funcionários?
b) Qual é o nome dessa loja?
c) Quantos funcionários tem a loja com menos funcionários?
d) Qual é o nome dessa loja?
*/
-- a) Quantos funcionários tem a loja com mais funcionários?
SELECT 
	MAX(EmployeeCount) AS 'Total de Funcionários' 
FROM 
	DimStore

-- b) Qual é o nome dessa loja?
SELECT 
	TOP(1) StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Quantidade de Funcionários' 
FROM 
	DimStore 
ORDER BY 
	EmployeeCount DESC

-- c) Quantos funcionários tem a loja com menos funcionários?
SELECT 
	MIN(EmployeeCount) AS 'Total de Funcionários' 
FROM 
	DimStore

-- d) Qual é o nome dessa loja?
SELECT 
	TOP(1) StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Quantidade de Funcionários'
FROM 
	DimStore 
WHERE 
	EmployeeCount IS NOT NULL 
ORDER BY 
	EmployeeCount ASC


/*
4. A área de RH está com uma nova ação para a empresa, e para isso precisa saber a quantidade total de funcionários do sexo Masculino e do sexo Feminino.

a) Descubra essas duas informações utilizando o SQL.
b) O funcionário e a funcionária mais antigos receberão uma homenagem.

Descubra as seguintes informações de cada um deles: Nome, E-mail, Data de Contratação.
*/
SELECT 
	MIN(HireDate) AS 'Data de Contratação' 
FROM 
DimEmployee 
WHERE 
	Gender = 'M' 
AND 
	FirstName IS NOT NULL
SELECT 
	FirstName AS 'Nome do Funcionário',
	EmailAddress AS 'E-mail', 
	HireDate AS 'Data de Contratação' 
FROM 
	DimEmployee 
WHERE 
	HireDate = '1996-07-31' 
AND 
	EndDate IS NULL


SELECT 
	MIN(HireDate) AS 'Data de Contratação' 
FROM 
DimEmployee 
WHERE 
	Gender = 'F' 
AND 
	FirstName IS NOT NULL
SELECT 
	FirstName AS 'Nome do Funcionário',
	EmailAddress AS 'E-mail', 
	HireDate AS 'Data de Contratação' 
FROM 
	DimEmployee 
WHERE 
	HireDate = '1998-01-26' 
AND 
	EndDate IS NULL


/*
5. Agora você precisa fazer uma análise dos produtos. 

Será necessário descobrir as seguintes informações:

a) Quantidade distinta de cores de produtos.
b) Quantidade distinta de marcas
c) Quantidade distinta de classes de produto

Para simplificar, você pode fazer isso em uma mesma consulta.
*/
SELECT 
	COUNT(DISTINCT ColorName) AS 'Quantidade Destinta de Cores', 
	COUNT(DISTINCT BrandName) AS 'Quantidade Destinta de Marcar', 
	COUNT(DISTINCT ClassName) AS 'Quantidade Destinta de Nomes de Classes' 
FROM 
	DimProduct


-- 7. [SQL Server] Criando agrupamentos no SQL


-- TABELA FACTSALES

/*	1. a) Faça um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas
(channelkey).

b) Faça um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade
total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).

c) Faça um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas
para o ano de 2007.
*/

-- a) Faça um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas (channelkey).
SELECT 
	channelKey AS 'Canal de Vendas', 
	SUM(SalesQuantity) AS 'Quantidade Vendida' 
FROM 
	FactSales 
GROUP BY 
	channelKey

-- b) Faça um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).

SELECT 
	StoreKey AS 'Código da Loja', 
	SUM(SalesQuantity) 'Quantidade Vendida', 
	SUM(ReturnQuantity) as 'Quantidade Retornada' 
FROM 
	FactSales 
GROUP BY 
	StoreKey
ORDER BY
	StoreKey

-- c) Faça um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas para o ano de 2007.
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

/*	2. Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor
total vendido (SalesAmount) por produto (ProductKey).

a) A tabela final deverá estar ordenada de acordo com a quantidade vendida e, além disso,
mostrar apenas os produtos que tiveram um resultado final de vendas maior do que
$5.000.000.

b) Faça uma adaptação no exercício anterior e mostre os Top 10 produtos com mais vendas.
Desconsidere o filtro de $5.000.000 aplicado.
*/
SELECT * FROM FactSales

-- a) A tabela final deverá estar ordenada de acordo com a quantidade vendida e, além disso, mostrar apenas os produtos que tiveram um resultado final de vendas maior do que $5.000.000.
SELECT 
	ProductKey 'Código do Produto', 
	SUM(SalesAmount) AS 'Total de Vendas' 
FROM 
	FactSales 
GROUP BY 
	ProductKey 
HAVING
	SUM(SalesAmount) >= 5000000
ORDER BY 
	SUM(SalesAmount)
	
-- b) Faça uma adaptação no exercício anterior e mostre os Top 10 produtos com mais vendas. Desconsidere o filtro de $5.000.000 aplicado.
SELECT TOP(10)
	ProductKey 'Código do Produto', 
	SUM(SalesAmount) AS 'Total de Vendas' 
FROM 
	FactSales 
GROUP BY 
	ProductKey
ORDER BY 
	SUM(SalesAmount) DESC


--	FACTONLINESALES

/*	3. a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o ID (CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).

b) Feito isso, faça um agrupamento de total vendido (SalesQuantity) por ID do produto e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).
*/
SELECT * FROM FactOnlineSales

-- a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o ID (CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).
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

-- b) Feito isso, faça um agrupamento de total vendido (SalesQuantity) por ID do produto e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).
SELECT 
	TOP(3) ProductKey AS 'Código do Produto', 
	SUM(SalesQuantity) AS 'Total Vendido' 
FROM 
	FactOnlineSales
WHERE CustomerKey = 19037
GROUP BY 
	ProductKey


-- DIMPRODUCT

/*	4. a) Faça um agrupamento e descubra a quantidade total de produtos por marca.
		   b) Determine a média do preço unitário (UnitPrice) para cada ClassName.
			 c) Faça um agrupamento de cores e descubra o peso total que cada cor de produto possui.
*/

-- a) Faça um agrupamento e descubra a quantidade total de produtos por marca.
SELECT 
	BrandName AS 'Nome da Marca', 
	COUNT(ProductKey) AS 'Total de Produtos' 
FROM 
	DimProduct 
GROUP BY 
	BrandName 
ORDER BY 
	BrandName

-- b) Determine a média do preço unitário (UnitPrice) para cada ClassName.
SELECT 
	AVG(UnitPrice) AS 'Média de Preço', 
	ClassName AS 'Classe do Produto' 
FROM 
	DimProduct 
GROUP BY 
	ClassName
ORDER BY
	ClassName

-- c) Faça um agrupamento de cores e descubra o peso total que cada cor de produto possui.
SELECT 
	ColorName, 
	SUM(Weight) AS 'Peso Total da Cor' 
FROM 
	DimProduct 
GROUP BY 
	ColorName 
ORDER BY 
	ColorName


/*	5. Você deverá descobrir o peso total para cada tipo de produto (StockTypeName).

A tabela final deve considerar apenas a marca ‘Contoso’ e ter os seus valores classificados em ordem decrescente.
*/
--SELECT DISTINCT StockTypeName AS 'Tipo do Nome de Estoque', SUM(Weight) AS 'Peso Total Tipo de Estoque' FROM DimProduct WHERE BrandName = 'Contoso' AND Weight IS NOT NULL GROUP BY StockTypeName, Weight ORDER BY SUM(Weight) DESC
SELECT 
	StockTypeName AS 'Classificação de Estoque', 
	SUM(Weight) AS 'Peso Total Tipo de Estoque' 
FROM 
	DimProduct
WHERE
	BrandName = 'Contoso'
GROUP BY 
	StockTypeName 
ORDER BY 
	SUM(Weight) DESC


/*	6. Você seria capaz de confirmar se todas as marcas dos produtos possuem à disposição todas as 16 opções de cores?	*/
SELECT 
	BrandName AS 'Marca', 
	COUNT(DISTINCT ColorName) AS 'Qtd. de Cores por Marca'
FROM 
	DimProduct 
GROUP BY 
	BrandName


-- TABELA DIMCUSTOMER

/*	7. Faça um agrupamento para saber o total de clientes de acordo com o Sexo e também a média salarial de acordo com o Sexo. 

Corrija qualquer resultado “inesperado” com os seus conhecimentos em SQL.
*/
--SELECT COUNT(*) AS 'Total de Clientes',	AVG(YearlyIncome) AS 'Média Salarial Anual', Gender AS 'Sexo' FROM DimCustomer WHERE Gender IS NOT NULL GROUP BY Gender
SELECT 
	Gender AS 'Sexo', 
	COUNT(*) AS 'Total de Clientes', 
	AVG(YearlyIncome) AS 'Média Salarial Anual' 
FROM 
	DimCustomer
WHERE 
	Gender IS NOT NULL
GROUP BY 
	Gender


/*	8. Faça um agrupamento para descobrir a quantidade total de clientes e a média salarial de acordo com o seu nível escolar. 

Utilize a coluna Education da tabela DimCustomer para fazer esse agrupamento.
*/
SELECT 
	Education AS 'Nível Escolar', 
	COUNT(*) AS 'Total de Clientes', 
	AVG(YearlyIncome) AS 'Média Salarial Anual' 
FROM 
	DimCustomer
WHERE
	Education IS NOT NULL
GROUP BY 
	Education 
ORDER BY Education


-- DIMEMPLOYEE

/*	9. Faça uma tabela resumo mostrando a quantidade total de funcionários de acordo com o Departamento (DepartmentName). 

Importante: Você deverá considerar apenas os funcionários ativos.
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

/*	10. Faça uma tabela resumo mostrando o total de VacationHours para cada cargo (Title).

Você deve considerar apenas as mulheres, dos departamentos de Production, Marketing, Engineering e Finance, para os funcionários contratados entre os anos de 1999 e 2000.
*/
SELECT 
	Title AS 'Cargo', 
	SUM(VacationHours) AS 'Total de Horas de Férias' 
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

Utilize essa coluna para complementar informações na tabela DimProductSubcategory a partir da DimProductCategory. Utilize o LEFT JOIN.
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

/*	3. Para cada loja da tabela DimStore, descubra qual o Continente e o Nome do País associados
(de acordo com DimGeography). 

Seu SELECT final deve conter apenas as seguintes colunas:
StoreKey, StoreName, EmployeeCount, ContinentName e RegionCountryName.

Utilize o LEFT JOIN neste exercício.
*/
SELECT 
	DS.StoreKey	AS 'Código da Loja', 
	DS.StoreName AS 'Nome da Loja', 
	DS.EmployeeCount AS 'Total de Funcionários por Loja', 
	DG.ContinentName AS 'Nome do Continente', 
	DG.RegionCountryName AS 'Nome da Região do País'
FROM 
	DimStore AS DS
LEFT JOIN 
	DimGeography AS DG
ON 
	DS.GeographyKey = DG.GeographyKey


/*	4. Complementa a tabela DimProduct com a informação de ProductCategoryDescription.
Utilize o LEFT JOIN e retorne em seu SELECT apenas as 5 colunas que considerar mais relevantes.
*/
SELECT 
	DP.ProductName AS 'Nome do Produto',
	DPC.ProductCategoryDescription AS 'Descrição da Categoria do Produto'
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

/*	5. A tabela FactStrategyPlan resume o planejamento estratégico da empresa. Cada linha representa um montante destinado a uma determinada AccountKey.

a) Faça um SELECT das 100 primeiras linhas de FactStrategyPlan para reconhecer a tabela.

b) Faça um INNER JOIN para criar uma tabela contendo o AccountName para cada
AccountKey da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:
• StrategyPlanKey
• DateKey
• AccountName
• Amount
*/

-- a) Faça um SELECT das 100 primeiras linhas de FactStrategyPlan para reconhecer a tabela.
SELECT TOP(100) * FROM FactStrategyPlan

-- b) Faça um INNER JOIN para criar uma tabela contendo o AccountName para cada AccountKey da tabela FactStrategyPlan.

-- O seu SELECT final deve conter as colunas:
-- • StrategyPlanKey
-- • DateKey
-- • AccountName
-- • Amount
SELECT 
	FSP.StrategyPlanKey AS 'Código Plano Estratégia',
	DA.AccountName AS 'Nome da Conta',
	FSP.Datekey AS 'Código da Data',
	FSP.Amount AS 'Quantia'
FROM 
	FactStrategyPlan AS FSP
INNER JOIN 
	DimAccount AS	DA
ON
	FSP.AccountKey = DA.AccountKey

/*	6. Vamos continuar analisando a tabela FactStrategyPlan. Além da coluna AccountKey que identifica o tipo de conta, há também uma outra coluna chamada ScenarioKey. Essa coluna possui a numeração que identifica o tipo de cenário: Real, Orçado e Previsão.

Faça um INNER JOIN para criar uma tabela contendo o ScenarioName para cada ScenarioKey da tabela FactStrategyPlan. 

O seu SELECT final deve conter as colunas:
• StrategyPlanKey
• DateKey
• ScenarioName
• Amount
*/
SELECT 
	FSP.StrategyPlanKey AS 'Código Plano Estratégico',
	DS.ScenarioName 'Nome do Cenário',
	FSP.Datekey AS 'Código da Data',
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

/*	7. Algumas subcategorias não possuem nenhum exemplar de produto. Identifique que subcategorias são essas. */

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



/*	8. A tabela abaixo mostra a combinação entre Marca e Canal de Venda, para as marcas Contoso, Fabrikam e Litware. 

Crie um código SQL para chegar no mesmo resultado.
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



/*	9. Neste exercício, você deverá relacionar as tabelas FactOnlineSales com DimPromotion.

Identifique a coluna que as duas tabelas têm em comum e utilize-a para criar esse relacionamento.

Retorne uma tabela contendo as seguintes colunas:
• OnlineSalesKey
• DateKey
• PromotionName
• SalesAmount

A sua consulta deve considerar apenas as linhas de vendas referentes a produtos com desconto (PromotionName <> ‘No Discount’). 

Além disso, você deverá ordenar essa tabela de acordo com a coluna DateKey, em ordem crescente.
*/
SELECT
	TOP(1000) FOS.OnlineSalesKey AS 'ID do Canal de Vendas Online',
	FOS.DateKey AS 'Data Chave',
	DP.PromotionName AS 'Nome da Promoção',
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

/*	10. A tabela abaixo é resultado de um Join entre a tabela FactSales e as tabelas: DimChannel, DimStore e DimProduct.

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


-- 9. [SQL Server] Group By + Joins - Aplicações


-- TABELA FACTSALES
--	1. a) Faça um resumo da quantidade vendida (Sales Quantity) de acordo com o nome do canal de vendas (ChannelName). Você deve ordenar a tabela final de acordo com SalesQuantity, em ordem decrescente.
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

-- b) Faça um agrupamento mostrando a quantidade total vendida (Sales Quantity) e quantidade total devolvida (Return Quantity) de acordo com o nome das lojas (StoreName).
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

-- c) Faça um resumo do valor total vendido (Sales Amount) para cada mês (CalendarMonthLabel) e ano (CalendarYear).
SELECT
	DD.CalendarYear AS 'Ano', 
	DD.CalendarMonthLabel AS 'Mês', 
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


-- 2. Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor total vendido (SalesQuantity) por produto.

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

-- a) Descubra qual é a cor de produto que mais é vendida (de acordo com SalesQuantity).
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

Obs: Você precisará fazer mais de 1 INNER JOIN, dado que a relação
entre FactSales e DimProductCategory não é direta.
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
-- 4. a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o nome completo do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).

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

-- b) Feito isso, faça um agrupamento de produtos e descubra quais foram os top 10 produtos mais comprados pelo cliente da letra a, considerando o nome do produto.
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

/*	5. Faça um resumo mostrando o total de produtos comprados (Sales Quantity) de acordo com o sexo dos clientes. */

SELECT 
	DC.Gender AS 'Gênero', 
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
/*	6. Faça uma tabela resumo mostrando a taxa de câmbio média de acordo com cada CurrencyDescription. 
A tabela final deve conter apenas taxas entre 10 e 100. */

SELECT 
	DCY.CurrencyDescription AS 'Descrição da Moeda', 
	AVG(FER.AverageRate) AS 'Taxa Média' 
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

/*	7. Calcule a SOMA TOTAL de AMOUNT referente à tabela FactStrategyPlan destinado aos
cenários: Actual e Budget.

Dica: A tabela DimScenario será importante para esse exercício.
*/

SELECT 
	DS.ScenarioName AS 'Nome Cenário', 
	SUM(FSP.Amount) AS 'Qtd. Total por Cenário' 
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



/*	8. Faça uma tabela resumo mostrando o resultado do planejamento estratégico por ano. */

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

/*	9. Faça um agrupamento de quantidade de produtos por ProductSubcategoryName. 

Leve em consideração em sua análise apenas a marca Contoso e a cor Silver. */

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



/*	10. Faça um agrupamento duplo de quantidade de produtos por BrandName e ProductSubcategoryName. 

A tabela final deverá ser ordenada de acordo com a coluna BrandName.*/

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



/* 10. [SQL Server] Variáveis */


-- Exercício 1: crie uma consulta juntando o texto 'O preço do produto é: ' com o valor R$ 30.99
SELECT 'O preço do pastel é: ' + CAST(30.99 AS VARCHAR(50)) AS 'Valor do Produto'

-- Exercício 2: adicione 1 à data '20/06/2021'
SELECT '20/06/2021' + CAST(1 AS DATETIME) AS 'Dia Seguinte'

-- OU

SELECT CAST('20/06/2021' AS DATETIME) + 3 AS 'Dia Seguinte'


-- Exercício 3: crie uma consulta juntando o texto 'A data de validade do produto é: ' com a data 17/abr/2022. 

-- Obs: você deverá usar a função CAST() para garantir que a data é entendida com o tipo DATETIME.
SELECT 'A data de validade do produto é: ' + FORMAT(CAST('17/04/2022' AS DATETIME), 'dd/MMM/yyyy') AS 'Data de Validade'

SELECT 100 * 8.99 AS 'faturamento'

DECLARE @quantidade AS int, @preco AS float
SET @quantidade = 100
SET @preco = 8.99

SELECT @quantidade * @preco AS 'faturamento'

-- Exemplo 1: Declare uma variável chamada 'idade' e armazene o valor 30

DECLARE @idade AS INT

SET @idade = 30

SELECT @idade

-- Exemplo 2: Declare uma variável chamada 'preco' e armazene o valor 10.89

--DECLARE @preco AS float
--SET @preco = 10.89
--SELECT @preco

--DECLARE @preco2 AS decimal(5, 2)
--SET @preco2 = 10.89
--SELECT @preco2



-- Exemplo 3: Declare uma variável chamada 'nome' e armazene o valor 'Mateus'

DECLARE @nome AS varchar(50)
SET @nome = 'Mateus'
SELECT @nome

-- Exemplo 4: Declare uma variável chamada 'data' e armazene a data de hoje.

DECLARE @data AS datetime
SET @data = '2021-10-28'
SELECT @data

SELECT DAY(@data)



-- 8. DECLARE e SET Declarando uma variável

-- Exercício 1: a sua loja fez uma venda de 100 camisas, cada uma custando 89.99. Faça uma SELECT para obter o resultado do faturamento (quantidade X preço).
SELECT 'Faturamento foi R$ ' + CAST(100.0 * 89.99 AS VARCHAR(10)) AS 'Faturamento'


-- Exercício 2: refaça o exercício anterior utilizando variáveis para deixar o cálculo mais otimizado.
DECLARE 
	@qtdCamisa INT = 500.0, 
	@precoCamisa FLOAT = 89.99, 
	@faturamento FLOAT 
SET 
	@faturamento = @qtdCamisa * @precoCamisa
SELECT 
	CAST(@faturamento AS FLOAT) AS 'Faturamento'



/*	1. Declare 4 variáveis inteiras. Atribua os seguintes valores a elas:

valor1 = 10
valor2 = 5
valor3 = 34
valor4 = 7

*/
-- DECLARE @varValor1 INT = 10, @varValor2 INT = 5, @varValor3 INT = 34, @varValor4 INT = 7

-- a) Crie uma nova variável para armazenar o resultado da soma entre valor1 e valor2. Chame essa variável de soma.
DECLARE 
	@varValor1 INT = 10, 
	@varValor2 INT = 5, 
	@varSoma INT
SET 
	@varSoma = @varValor1 + @varValor2
SELECT 
	'Soma entre valor 1 e valor 2 é = ' 
	+ CAST(@varSoma AS varchar(10)) AS 'Resultado da Soma'

-- b) Crie uma nova variável para armazenar o resultado da subtração entre valor3 e valor 4. Chame essa variável de subtracao.
DECLARE 
	@varValor3 INT = 34, 
	@varValor4 INT = 7, 
	@varSubtracao INT
SET 
	@varSubtracao = @varValor3 - @varValor4
SELECT 
	'Subtração entre valor 3 e valor 4 é = ' 
	+ CAST(@varSubtracao AS VARCHAR(10)) AS 'Resultado da Subtração'

-- c) Crie uma nova variável para armazenar o resultado da multiplicação entre o valor 1 e o valor4. Chame essa variável de multiplicacao
DECLARE @varValor1 INT = 10, @varValor4 int = 7, @varMultiplicacao INT
SET @varMultiplicacao = @varValor1 * @varValor4
SELECT 'Multiplicação entre var 1 e valor 4 é = ' + CAST(@varMultiplicacao AS VARCHAR(10)) AS 'Resutldo da Multiplicação'


-- d) Crie uma nova variável para armazenar o resultado da divisão do valor3 pelo valor4. Chame essa variável de divisao. Obs: O resultado deverá estar em decimal, e não em inteiro.
DECLARE @varValor3 INT = 34, @varValor4 INT = 7,
@varDivisao INT
SET @varDivisao = @varValor3 / @varValor4
SELECT CAST(@varDivisao AS DECIMAL(15, 10)) AS 'Resultado da Divisão'


-- e) Arredonde o resultado da letra d) para 2 casas decimais.
DECLARE @varValor3 INT = 34, @varValor4 INT = 7,
@varDivisao INT
SET @varDivisao = @varValor3 / @varValor4
SELECT ROUND(CAST(@varDivisao AS DECIMAL(15, 10)), 2, 1) AS 'Divisão Arredondada'


/*	2. Para cada declaração das variáveis abaixo, atenção em relação ao tipo de dado que deverá ser especificado. */

-- a) Declare uma variável chamada ‘produto’ e atribua o valor de ‘Celular’.
DECLARE @varProduto VARCHAR(50) = 'Celular'
SELECT @varProduto AS 'Nome do Produto'
















































=======
USE ContosoRetailDW

/* 1. Você é responsável por controlar os dados de clientes e de produtos da sua empresa.
O que você precisará fazer é confirmar se:

a. Existem 2.517 produtos cadastrados na base e, se não tiver, você deverá reportar ao seu
gestor para saber se existe alguma defasagem no controle dos produtos.

b. Até o mês passado, a empresa tinha um total de 19.500 clientes na base de controle.
Verifique se esse número aumentou ou reduziu.
*/

-- a. Existem 2.517 produtos cadastrados na base e, se não tiver, você deverá reportar ao seu gestor para saber se existe alguma defasagem no controle dos produtos.
SELECT 
	* 
FROM 
	DimProduct

-- b. Até o mês passado, a empresa tinha um total de 19.500 clientes na base de controle. Verifique se esse número aumentou ou reduziu.
SELECT 
	* 
FROM 
	DimCustomer


/* 2. Você trabalha no setor de marketing da empresa Contoso e acaba de ter uma ideia de oferecer
descontos especiais para os clientes no dia de seus aniversários. Para isso, você vai precisar
listar todos os clientes e as suas respectivas datas de nascimento, além de um contato.

a) Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela
dimCustomer.

b) Renomeie as colunas dessa tabela usando o alias (comando AS).
*/

-- a) Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela dimCustomer.
-- b) Renomeie as colunas dessa tabela usando o alias (comando AS).
SELECT 
	CustomerKey AS 'Chave do Cliente',
	FirstName AS 'Primeiro Nome',
	EmailAddress AS 'Endereço de Email',
	BirthDate AS 'Data de Nascimento'
FROM 
	DimCustomer


/* 3. A Contoso está comemorando aniversário de inauguração de 10 anos e pretende fazer uma
ação de premiação para os clientes. A empresa quer presentear os primeiros clientes desde
a inauguração. 

Você foi alocado para levar adiante essa ação. Para isso, você terá que fazer o seguinte:

a) A Contoso decidiu presentear os primeiros 100 clientes da história com um vale compras
de R$ 10.000. Utilize um comando em SQL para retornar uma tabela com os primeiros
100 primeiros clientes da tabela dimCustomer (selecione todas as colunas).

b) A Contoso decidiu presentear os primeiros 20% de clientes da história com um vale
compras de R$ 2.000. Utilize um comando em SQL para retornar 10% das linhas da sua
tabela dimCustomer (selecione todas as colunas).

c) Adapte o código do item a) para retornar apenas as 100 primeiras linhas, mas apenas as
colunas FirstName, EmailAddress, BirthDate.

d) Renomeie as colunas anteriores para nomes em português

*/

-- a) A Contoso decidiu presentear os primeiros 100 clientes da história com um vale compras de R$ 10.000. Utilize um comando em SQL para retornar uma tabela com os primeiros 100 primeiros clientes da tabela dimCustomer (selecione todas as colunas).
SELECT 
	TOP(100) * 
FROM
	DimCustomer


/* b) A Contoso decidiu presentear os primeiros 20% de clientes da história com um vale
compras de R$ 2.000. Utilize um comando em SQL para retornar 10% das linhas da sua
tabela dimCustomer (selecione todas as colunas).

*/
SELECT 
	TOP(20) PERCENT 
	* 
FROM 
	DimCustomer

-- c) Adapte o código do item a) para retornar apenas as 100 primeiras linhas, mas apenas as colunas FirstName, EmailAddress, BirthDate.
-- d) Renomeie as colunas anteriores para nomes em português
SELECT 
	TOP(100) 
	FirstName AS 'Primeiro Nome', 
	EmailAddress AS 'Endereço de E-mail',
	BirthDate AS 'Data de Nascimento'
FROM
	DimCustomer

/* 4. A empresa Contoso precisa fazer contato com os fornecedores de produtos para repor o
estoque. 

Você é da área de compras e precisa descobrir quem são esses fornecedores.

Utilize um comando em SQL para retornar apenas os nomes dos fornecedores na tabela
dimProduct e renomeie essa nova coluna da tabela

*/
SELECT 
	DISTINCT Manufacturer AS 'Nome do Fornecedor'
FROM 
	DimProduct


/* 5. O seu trabalho de investigação não para. 

Você precisa descobrir se existe algum produto registrado na base de produtos que ainda não tenha sido vendido. Tente chegar nessa informação.

Obs: caso tenha algum produto que ainda não tenha sido vendido, você não precisa descobrir
qual é, é suficiente saber se teve ou não algum produto que ainda não foi vendido.

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

/* 1. Você é o gerente da área de compras e precisa criar um relatório 
com as TOP 100 vendas, de acordo com a quantidade vendida. 

Você precisa fazer isso em 10min pois o diretor de compras solicitou
essa informação para apresentar em uma reunião.

Utilize seu conhecimento em SQL para buscar essas TOP 100 vendas, 
de acordo com o total vendido (SalesAmount).
*/
SELECT 
	TOP(100) * 
FROM 
	FactSales 
ORDER BY 
	SalesQuantity DESC


/* 2. Os TOP 10 produtos com maior UnitPrice possuem exatamente o mesmo preço. 
Porém, a empresa quer diferenciar esses preços de acordo com o peso (Weight) de cada um.

O que você precisará fazer é ordenar esses top 10 produtos, de acordo com a coluna
de UnitPrice e, além disso, estabelecer um critério de desempate, para que seja 
mostrado na ordem, do maior para o menor.

Caso ainda assim haja um empate entre 2 ou mais produtos, pense em uma forma de criar um segundo critério de desempate (além do peso).
*/
SELECT 
	DISTINCT TOP(10) *
FROM 
	DimProduct 
ORDER BY 
	UnitPrice DESC, 
	Weight DESC,
	AvailableForSaleDate ASC


/* 3. Você é responsável pelo setor de logística da empresa Contoso e precisa dimensionar o transporte de todos os produtos em categorias, de acordo com o peso.

Os produtos da categoria A, com peso igual ou acima de 100kg, deverão ser transportados na primeira leva.

Faça uma consulta no banco de dados para descobrir quais são estes produtos que estão na categoria A.

a) Você deverá retornar apenas 2 colunas nessa consulta: Nome do Produto e Peso.

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



/* 4. Você foi alocado para criar um relatório das lojas registradas atualmente na Contoso.

a) Descubra quantas lojas a empresa tem no total. Na consulta que você deverá fazer à tabela DimStore, retorne as seguintes informações: StoreName, OpenDate, EmployeeCount

b) Renomeeie as colunas anteriores para deixar a sua consulta mais intuitiva.

c) Dessas lojas, descubra quantas (e quais) lojas ainda estão ativas.
*/
SELECT 
	StoreName AS 'Nome da Loja', 
	OpenDate AS 'Data de Abertura', 
	EmployeeCount AS 'Total de Funcionários' 
FROM 
	DimStore
WHERE
	StoreType = 'Store'
AND
	Status = 'On'


/* 5. O gerente da área de controle de qualidade notificou à Contoso que todos
os produtos Home Theater da marca Litware, disponibilizados para venda 
no dia 15 de março de 2009, foram identificados com defeitos de fábrica.

O que você deverá fazer é identificar os ID’s desses produtos e repassar 
ao gerente para que ele possa notificar as lojas e consequentemente solicitar 
a suspensão das vendas desses produtos.
*/
SELECT * FROM DimProduct

SELECT 
	ProductKey AS 'Código do Produto', 
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


/* 6. Imagine que você precise extrair um relatório da tabela DimStore, com informações de lojas. Mas você precisa apenas das lojas que não estão mais funcionando atualmente.

a) Utilize a coluna de Status para filtrar a tabela e trazer apenas as lojas que não estão mais funcionando.

b) Agora imagine que essa coluna de Status não existe na sua tabela. Qual seria a outra forma que você teria de descobrir quais são as lojas que não estão mais funcionando?
*/

-- a)
SELECT * FROM DimStore WHERE Status = 'Off'
 
--b) 
SELECT * FROM DimStore WHERE CloseDate IS NOT NULL


/* 7. De acordo com a quantidade de funcionários, cada loja receberá uma determinada quantidade de máquinas de café. 

As lojas serão divididas em 3 categorias:

CATEGORIA 1: De 1 a 20 funcionários -> 1 máquina de café
CATEGORIA 2: De 21 a 50 funcionários -> 2 máquinas de café
CATEGORIA 3: Acima de 51 funcionários -> 3 máquinas de café

Identifique, para cada caso, quais são as lojas de cada uma das 3 categorias acima (basta fazer
uma verificação).
*/
SELECT 
	StoreKey AS 'Código da Loja', 
	StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Total de Funcionários' 
FROM 
	DimStore 
WHERE 
	EmployeeCount 
BETWEEN 1 AND 20 AND Status = 'On'

SELECT
	StoreKey AS 'Código da Loja', 
	StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Total de Funcionários' 
FROM 
	DimStore 
WHERE 
	EmployeeCount 
BETWEEN 21 AND 50 AND Status = 'On'

SELECT
	StoreKey AS 'Código da Loja', 
	StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Total de Funcionários' 
FROM 
	DimStore 
WHERE 
	EmployeeCount >= 51 AND Status = 'On'


/* 8. A empresa decidiu que todas as televisões de 
LCD receberão um super desconto no próximo mês. 

O seu trabalho é fazer uma consulta à tabela DimProduct
e retornar os ID’s, Nomes e Preços de todos os 
produtos LCD existentes.
*/
SELECT
	ProductKey AS 'Código do Produto', 
	ProductName AS 'Nome do Produto', 
	UnitPrice AS 'Preço do Produto'
FROM 
	DimProduct
WHERE
	ProductDescription 
LIKE
	'%LCD%'


/* 9. Faça uma lista com todos os produtos das cores: Green, Orange, Black, Silver e Pink. 
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

Descubra quais são esses produtos e ordene o resultado 
em ordem decrescente de acordo com o preço (UnitPrice).
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



-- 6. [SQL Server] Funções de Agregação

/*
1. O gerente comercial pediu a você uma análise da Quantidade Vendida e Quantidade
Devolvida para o canal de venda mais importante da empresa: Store.

Utilize uma função SQL para fazer essas consultas no seu banco de dados. Obs: Faça essa
análise considerando a tabela FactSales.
*/
SELECT 
	SUM(SalesQuantity) AS 'Canal Store: Produtos Vendidos', 
	SUM(ReturnQuantity) AS 'Canal Store: Produtos Retornados' 
FROM 
	FactSales 
WHERE 
	channelKey = 1

/*
2. Uma nova ação no setor de Marketing precisará avaliar a média salarial de todos os clientes da empresa, mas apenas de ocupação Professional. 

Utilize um comando SQL para atingir esse resultado.
*/
SELECT 
	AVG(YearlyIncome) AS 'Média Salarial dos Clientes' 
FROM 
	DimCustomer 
WHERE 
	Occupation = 'Professional'

/*
3. Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na empresa. 

O seu gerente te pediu os seguintes números e informações:

a) Quantos funcionários tem a loja com mais funcionários?
b) Qual é o nome dessa loja?
c) Quantos funcionários tem a loja com menos funcionários?
d) Qual é o nome dessa loja?
*/
-- a) Quantos funcionários tem a loja com mais funcionários?
SELECT 
	MAX(EmployeeCount) AS 'Total de Funcionários' 
FROM 
	DimStore

-- b) Qual é o nome dessa loja?
SELECT 
	TOP(1) StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Quantidade de Funcionários' 
FROM 
	DimStore 
ORDER BY 
	EmployeeCount DESC

-- c) Quantos funcionários tem a loja com menos funcionários?
SELECT 
	MIN(EmployeeCount) AS 'Total de Funcionários' 
FROM 
	DimStore

-- d) Qual é o nome dessa loja?
SELECT 
	TOP(1) StoreName AS 'Nome da Loja', 
	EmployeeCount AS 'Quantidade de Funcionários'
FROM 
	DimStore 
WHERE 
	EmployeeCount IS NOT NULL 
ORDER BY 
	EmployeeCount ASC


/*
4. A área de RH está com uma nova ação para a empresa, e para isso precisa saber a quantidade total de funcionários do sexo Masculino e do sexo Feminino.

a) Descubra essas duas informações utilizando o SQL.
b) O funcionário e a funcionária mais antigos receberão uma homenagem.

Descubra as seguintes informações de cada um deles: Nome, E-mail, Data de Contratação.
*/
SELECT 
	MIN(HireDate) AS 'Data de Contratação' 
FROM 
DimEmployee 
WHERE 
	Gender = 'M' 
AND 
	FirstName IS NOT NULL
SELECT 
	FirstName AS 'Nome do Funcionário',
	EmailAddress AS 'E-mail', 
	HireDate AS 'Data de Contratação' 
FROM 
	DimEmployee 
WHERE 
	HireDate = '1996-07-31' 
AND 
	EndDate IS NULL


SELECT 
	MIN(HireDate) AS 'Data de Contratação' 
FROM 
DimEmployee 
WHERE 
	Gender = 'F' 
AND 
	FirstName IS NOT NULL
SELECT 
	FirstName AS 'Nome do Funcionário',
	EmailAddress AS 'E-mail', 
	HireDate AS 'Data de Contratação' 
FROM 
	DimEmployee 
WHERE 
	HireDate = '1998-01-26' 
AND 
	EndDate IS NULL


/*
5. Agora você precisa fazer uma análise dos produtos. 

Será necessário descobrir as seguintes informações:

a) Quantidade distinta de cores de produtos.
b) Quantidade distinta de marcas
c) Quantidade distinta de classes de produto

Para simplificar, você pode fazer isso em uma mesma consulta.
*/
SELECT 
	COUNT(DISTINCT ColorName) AS 'Quantidade Destinta de Cores', 
	COUNT(DISTINCT BrandName) AS 'Quantidade Destinta de Marcar', 
	COUNT(DISTINCT ClassName) AS 'Quantidade Destinta de Nomes de Classes' 
FROM 
	DimProduct


-- 7. [SQL Server] Criando agrupamentos no SQL


-- TABELA FACTSALES

/*	1. a) Faça um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas
(channelkey).

b) Faça um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade
total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).

c) Faça um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas
para o ano de 2007.
*/

-- a) Faça um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas (channelkey).
SELECT 
	channelKey AS 'Canal de Vendas', 
	SUM(SalesQuantity) AS 'Quantidade Vendida' 
FROM 
	FactSales 
GROUP BY 
	channelKey

-- b) Faça um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).

SELECT 
	StoreKey AS 'Código da Loja', 
	SUM(SalesQuantity) 'Quantidade Vendida', 
	SUM(ReturnQuantity) as 'Quantidade Retornada' 
FROM 
	FactSales 
GROUP BY 
	StoreKey
ORDER BY
	StoreKey

-- c) Faça um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas para o ano de 2007.
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

/*	2. Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor
total vendido (SalesAmount) por produto (ProductKey).

a) A tabela final deverá estar ordenada de acordo com a quantidade vendida e, além disso,
mostrar apenas os produtos que tiveram um resultado final de vendas maior do que
$5.000.000.

b) Faça uma adaptação no exercício anterior e mostre os Top 10 produtos com mais vendas.
Desconsidere o filtro de $5.000.000 aplicado.
*/
SELECT * FROM FactSales

-- a) A tabela final deverá estar ordenada de acordo com a quantidade vendida e, além disso, mostrar apenas os produtos que tiveram um resultado final de vendas maior do que $5.000.000.
SELECT 
	ProductKey 'Código do Produto', 
	SUM(SalesAmount) AS 'Total de Vendas' 
FROM 
	FactSales 
GROUP BY 
	ProductKey 
HAVING
	SUM(SalesAmount) >= 5000000
ORDER BY 
	SUM(SalesAmount)
	
-- b) Faça uma adaptação no exercício anterior e mostre os Top 10 produtos com mais vendas. Desconsidere o filtro de $5.000.000 aplicado.
SELECT TOP(10)
	ProductKey 'Código do Produto', 
	SUM(SalesAmount) AS 'Total de Vendas' 
FROM 
	FactSales 
GROUP BY 
	ProductKey
ORDER BY 
	SUM(SalesAmount) DESC


--	FACTONLINESALES

/*	3. a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o ID (CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).

b) Feito isso, faça um agrupamento de total vendido (SalesQuantity) por ID do produto e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).
*/
SELECT * FROM FactOnlineSales

-- a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o ID (CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).
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

-- b) Feito isso, faça um agrupamento de total vendido (SalesQuantity) por ID do produto e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).
SELECT 
	TOP(3) ProductKey AS 'Código do Produto', 
	SUM(SalesQuantity) AS 'Total Vendido' 
FROM 
	FactOnlineSales
WHERE CustomerKey = 19037
GROUP BY 
	ProductKey


-- DIMPRODUCT

/*	4. a) Faça um agrupamento e descubra a quantidade total de produtos por marca.
		   b) Determine a média do preço unitário (UnitPrice) para cada ClassName.
			 c) Faça um agrupamento de cores e descubra o peso total que cada cor de produto possui.
*/

-- a) Faça um agrupamento e descubra a quantidade total de produtos por marca.
SELECT 
	BrandName AS 'Nome da Marca', 
	COUNT(ProductKey) AS 'Total de Produtos' 
FROM 
	DimProduct 
GROUP BY 
	BrandName 
ORDER BY 
	BrandName

-- b) Determine a média do preço unitário (UnitPrice) para cada ClassName.
SELECT 
	AVG(UnitPrice) AS 'Média de Preço', 
	ClassName AS 'Classe do Produto' 
FROM 
	DimProduct 
GROUP BY 
	ClassName
ORDER BY
	ClassName

-- c) Faça um agrupamento de cores e descubra o peso total que cada cor de produto possui.
SELECT 
	ColorName, 
	SUM(Weight) AS 'Peso Total da Cor' 
FROM 
	DimProduct 
GROUP BY 
	ColorName 
ORDER BY 
	ColorName


/*	5. Você deverá descobrir o peso total para cada tipo de produto (StockTypeName).

A tabela final deve considerar apenas a marca ‘Contoso’ e ter os seus valores classificados em ordem decrescente.
*/
--SELECT DISTINCT StockTypeName AS 'Tipo do Nome de Estoque', SUM(Weight) AS 'Peso Total Tipo de Estoque' FROM DimProduct WHERE BrandName = 'Contoso' AND Weight IS NOT NULL GROUP BY StockTypeName, Weight ORDER BY SUM(Weight) DESC
SELECT 
	StockTypeName AS 'Classificação de Estoque', 
	SUM(Weight) AS 'Peso Total Tipo de Estoque' 
FROM 
	DimProduct
WHERE
	BrandName = 'Contoso'
GROUP BY 
	StockTypeName 
ORDER BY 
	SUM(Weight) DESC


/*	6. Você seria capaz de confirmar se todas as marcas dos produtos possuem à disposição todas as 16 opções de cores?	*/
SELECT 
	BrandName AS 'Marca', 
	COUNT(DISTINCT ColorName) AS 'Qtd. de Cores por Marca'
FROM 
	DimProduct 
GROUP BY 
	BrandName


-- TABELA DIMCUSTOMER

/*	7. Faça um agrupamento para saber o total de clientes de acordo com o Sexo e também a média salarial de acordo com o Sexo. 

Corrija qualquer resultado “inesperado” com os seus conhecimentos em SQL.
*/
--SELECT COUNT(*) AS 'Total de Clientes',	AVG(YearlyIncome) AS 'Média Salarial Anual', Gender AS 'Sexo' FROM DimCustomer WHERE Gender IS NOT NULL GROUP BY Gender
SELECT 
	Gender AS 'Sexo', 
	COUNT(*) AS 'Total de Clientes', 
	AVG(YearlyIncome) AS 'Média Salarial Anual' 
FROM 
	DimCustomer
WHERE 
	Gender IS NOT NULL
GROUP BY 
	Gender


/*	8. Faça um agrupamento para descobrir a quantidade total de clientes e a média salarial de acordo com o seu nível escolar. 

Utilize a coluna Education da tabela DimCustomer para fazer esse agrupamento.
*/
SELECT 
	Education AS 'Nível Escolar', 
	COUNT(*) AS 'Total de Clientes', 
	AVG(YearlyIncome) AS 'Média Salarial Anual' 
FROM 
	DimCustomer
WHERE
	Education IS NOT NULL
GROUP BY 
	Education 
ORDER BY Education


-- DIMEMPLOYEE

/*	9. Faça uma tabela resumo mostrando a quantidade total de funcionários de acordo com o Departamento (DepartmentName). 

Importante: Você deverá considerar apenas os funcionários ativos.
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

/*	10. Faça uma tabela resumo mostrando o total de VacationHours para cada cargo (Title).

Você deve considerar apenas as mulheres, dos departamentos de Production, Marketing, Engineering e Finance, para os funcionários contratados entre os anos de 1999 e 2000.
*/
SELECT 
	Title AS 'Cargo', 
	SUM(VacationHours) AS 'Total de Horas de Férias' 
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

Utilize essa coluna para complementar informações na tabela DimProductSubcategory a partir da DimProductCategory. Utilize o LEFT JOIN.
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

/*	3. Para cada loja da tabela DimStore, descubra qual o Continente e o Nome do País associados
(de acordo com DimGeography). 

Seu SELECT final deve conter apenas as seguintes colunas:
StoreKey, StoreName, EmployeeCount, ContinentName e RegionCountryName.

Utilize o LEFT JOIN neste exercício.
*/
SELECT 
	DS.StoreKey	AS 'Código da Loja', 
	DS.StoreName AS 'Nome da Loja', 
	DS.EmployeeCount AS 'Total de Funcionários por Loja', 
	DG.ContinentName AS 'Nome do Continente', 
	DG.RegionCountryName AS 'Nome da Região do País'
FROM 
	DimStore AS DS
LEFT JOIN 
	DimGeography AS DG
ON 
	DS.GeographyKey = DG.GeographyKey


/*	4. Complementa a tabela DimProduct com a informação de ProductCategoryDescription.
Utilize o LEFT JOIN e retorne em seu SELECT apenas as 5 colunas que considerar mais relevantes.
*/
SELECT 
	DP.ProductName AS 'Nome do Produto',
	DPC.ProductCategoryDescription AS 'Descrição da Categoria do Produto'
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

/*	5. A tabela FactStrategyPlan resume o planejamento estratégico da empresa. Cada linha representa um montante destinado a uma determinada AccountKey.

a) Faça um SELECT das 100 primeiras linhas de FactStrategyPlan para reconhecer a tabela.

b) Faça um INNER JOIN para criar uma tabela contendo o AccountName para cada
AccountKey da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:
• StrategyPlanKey
• DateKey
• AccountName
• Amount
*/

-- a) Faça um SELECT das 100 primeiras linhas de FactStrategyPlan para reconhecer a tabela.
SELECT TOP(100) * FROM FactStrategyPlan

-- b) Faça um INNER JOIN para criar uma tabela contendo o AccountName para cada AccountKey da tabela FactStrategyPlan.

-- O seu SELECT final deve conter as colunas:
-- • StrategyPlanKey
-- • DateKey
-- • AccountName
-- • Amount
SELECT 
	FSP.StrategyPlanKey AS 'Código Plano Estratégia',
	DA.AccountName AS 'Nome da Conta',
	FSP.Datekey AS 'Código da Data',
	FSP.Amount AS 'Quantia'
FROM 
	FactStrategyPlan AS FSP
INNER JOIN 
	DimAccount AS	DA
ON
	FSP.AccountKey = DA.AccountKey

/*	6. Vamos continuar analisando a tabela FactStrategyPlan. Além da coluna AccountKey que identifica o tipo de conta, há também uma outra coluna chamada ScenarioKey. Essa coluna possui a numeração que identifica o tipo de cenário: Real, Orçado e Previsão.

Faça um INNER JOIN para criar uma tabela contendo o ScenarioName para cada ScenarioKey da tabela FactStrategyPlan. 

O seu SELECT final deve conter as colunas:
• StrategyPlanKey
• DateKey
• ScenarioName
• Amount
*/
SELECT 
	FSP.StrategyPlanKey AS 'Código Plano Estratégico',
	DS.ScenarioName 'Nome do Cenário',
	FSP.Datekey AS 'Código da Data',
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

/*	7. Algumas subcategorias não possuem nenhum exemplar de produto. Identifique que subcategorias são essas. */

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



/*	8. A tabela abaixo mostra a combinação entre Marca e Canal de Venda, para as marcas Contoso, Fabrikam e Litware. 

Crie um código SQL para chegar no mesmo resultado.
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



/*	9. Neste exercício, você deverá relacionar as tabelas FactOnlineSales com DimPromotion.

Identifique a coluna que as duas tabelas têm em comum e utilize-a para criar esse relacionamento.

Retorne uma tabela contendo as seguintes colunas:
• OnlineSalesKey
• DateKey
• PromotionName
• SalesAmount

A sua consulta deve considerar apenas as linhas de vendas referentes a produtos com desconto (PromotionName <> ‘No Discount’). 

Além disso, você deverá ordenar essa tabela de acordo com a coluna DateKey, em ordem crescente.
*/
SELECT
	TOP(1000) FOS.OnlineSalesKey AS 'ID do Canal de Vendas Online',
	FOS.DateKey AS 'Data Chave',
	DP.PromotionName AS 'Nome da Promoção',
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

/*	10. A tabela abaixo é resultado de um Join entre a tabela FactSales e as tabelas: DimChannel, DimStore e DimProduct.

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


-- 9. [SQL Server] Group By + Joins - Aplicações


-- TABELA FACTSALES
--	1. a) Faça um resumo da quantidade vendida (Sales Quantity) de acordo com o nome do canal de vendas (ChannelName). Você deve ordenar a tabela final de acordo com SalesQuantity, em ordem decrescente.
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

-- b) Faça um agrupamento mostrando a quantidade total vendida (Sales Quantity) e quantidade total devolvida (Return Quantity) de acordo com o nome das lojas (StoreName).
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

-- c) Faça um resumo do valor total vendido (Sales Amount) para cada mês (CalendarMonthLabel) e ano (CalendarYear).
SELECT
	DD.CalendarYear AS 'Ano', 
	DD.CalendarMonthLabel AS 'Mês', 
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


-- 2. Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor total vendido (SalesQuantity) por produto.

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

-- a) Descubra qual é a cor de produto que mais é vendida (de acordo com SalesQuantity).
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

Obs: Você precisará fazer mais de 1 INNER JOIN, dado que a relação
entre FactSales e DimProductCategory não é direta.
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
-- 4. a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o nome completo do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).

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

-- b) Feito isso, faça um agrupamento de produtos e descubra quais foram os top 10 produtos mais comprados pelo cliente da letra a, considerando o nome do produto.
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

/*	5. Faça um resumo mostrando o total de produtos comprados (Sales Quantity) de acordo com o sexo dos clientes. */

SELECT 
	DC.Gender AS 'Gênero', 
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
/*	6. Faça uma tabela resumo mostrando a taxa de câmbio média de acordo com cada CurrencyDescription. 
A tabela final deve conter apenas taxas entre 10 e 100. */

SELECT 
	DCY.CurrencyDescription AS 'Descrição da Moeda', 
	AVG(FER.AverageRate) AS 'Taxa Média' 
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

/*	7. Calcule a SOMA TOTAL de AMOUNT referente à tabela FactStrategyPlan destinado aos
cenários: Actual e Budget.

Dica: A tabela DimScenario será importante para esse exercício.
*/

SELECT 
	DS.ScenarioName AS 'Nome Cenário', 
	SUM(FSP.Amount) AS 'Qtd. Total por Cenário' 
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



/*	8. Faça uma tabela resumo mostrando o resultado do planejamento estratégico por ano. */

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

/*	9. Faça um agrupamento de quantidade de produtos por ProductSubcategoryName. 

Leve em consideração em sua análise apenas a marca Contoso e a cor Silver. */

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



/*	10. Faça um agrupamento duplo de quantidade de produtos por BrandName e ProductSubcategoryName. 

A tabela final deverá ser ordenada de acordo com a coluna BrandName.*/

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



/* 10. [SQL Server] Variáveis */


-- Exercício 1: crie uma consulta juntando o texto 'O preço do produto é: ' com o valor R$ 30.99
SELECT 'O preço do pastel é: ' + CAST(30.99 AS VARCHAR(50)) AS 'Valor do Produto'

-- Exercício 2: adicione 1 à data '20/06/2021'
SELECT '20/06/2021' + CAST(1 AS DATETIME) AS 'Dia Seguinte'

-- OU

SELECT CAST('20/06/2021' AS DATETIME) + 3 AS 'Dia Seguinte'


-- Exercício 3: crie uma consulta juntando o texto 'A data de validade do produto é: ' com a data 17/abr/2022. 

-- Obs: você deverá usar a função CAST() para garantir que a data é entendida com o tipo DATETIME.
SELECT 'A data de validade do produto é: ' + FORMAT(CAST('17/04/2022' AS DATETIME), 'dd/MMM/yyyy') AS 'Data de Validade'

SELECT 100 * 8.99 AS 'faturamento'

DECLARE @quantidade AS int, @preco AS float
SET @quantidade = 100
SET @preco = 8.99

SELECT @quantidade * @preco AS 'faturamento'

-- Exemplo 1: Declare uma variável chamada 'idade' e armazene o valor 30

DECLARE @idade AS INT

SET @idade = 30

SELECT @idade

-- Exemplo 2: Declare uma variável chamada 'preco' e armazene o valor 10.89

--DECLARE @preco AS float
--SET @preco = 10.89
--SELECT @preco

--DECLARE @preco2 AS decimal(5, 2)
--SET @preco2 = 10.89
--SELECT @preco2



-- Exemplo 3: Declare uma variável chamada 'nome' e armazene o valor 'Mateus'

DECLARE @nome AS varchar(50)
SET @nome = 'Mateus'
SELECT @nome

-- Exemplo 4: Declare uma variável chamada 'data' e armazene a data de hoje.

DECLARE @data AS datetime
SET @data = '2021-10-28'
SELECT @data

SELECT DAY(@data)



-- 8. DECLARE e SET Declarando uma variável

-- Exercício 1: a sua loja fez uma venda de 100 camisas, cada uma custando 89.99. Faça uma SELECT para obter o resultado do faturamento (quantidade X preço).
SELECT 'Faturamento foi R$ ' + CAST(100.0 * 89.99 AS VARCHAR(10)) AS 'Faturamento'


-- Exercício 2: refaça o exercício anterior utilizando variáveis para deixar o cálculo mais otimizado.
DECLARE 
	@qtdCamisa INT = 500.0, 
	@precoCamisa FLOAT = 89.99, 
	@faturamento FLOAT 
SET 
	@faturamento = @qtdCamisa * @precoCamisa
SELECT 
	CAST(@faturamento AS FLOAT) AS 'Faturamento'

/*	1. Declare 4 variáveis inteiras. Atribua os seguintes valores a elas:

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

-- a) Crie uma nova variável para armazenar o resultado da soma entre valor1 e valor2. Chame essa variável de soma.
DECLARE
	@varValor1 INT = 10, 
	@varValor2 INT = 5,
	@varSoma INT
SET 
	@varSoma = @varValor1 + @varValor2
SELECT 
	'Soma entre Valor1 e Valor2 é: ' + 
	CAST(
			@varSoma AS VARCHAR(10)
		) AS 'Resultado da Soma'

-- b) Crie uma nova variável para armazenar o resultado da subtração entre valor3 e valor 4. Chame essa variável de subtracao.
DECLARE 
	@varValor3 INT = 34, 
	@varValor4 INT = 7,
	@varSubtracao INT
SET 
	@varSubtracao = @varValor3 - @varValor4
SELECT 'Subtração entre Valor3 Valor4 é: ' + 
	CAST(
		@varSubtracao AS VARCHAR(10)
	) AS 'Resultado da Subtração'

-- c) Crie uma nova variável para armazenar o resultado da multiplicação entre o Valor1 e o Valor4. Chame essa variável de multiplicacao.
DECLARE 
	@varValor1 INT = 10,
	@varValor4 INT = 7, 
	@varMultiplicacao INT
SET 
	@varMultiplicacao = @varValor1 * @varValor4
SELECT 
	'Munltiplicação entre Valor1 e Valor4 é: ' + 
	CAST(
		@varMultiplicacao AS VARCHAR(10)
	) AS 'Resultado da Multiplicação'

-- d) Crie uma nova variável para armazenar o resultado da divisão do valor3 pelo valor4. Chame essa variável de divisao. Obs: O resultado deverá estar em decimal, e não em inteiro.
DECLARE 
	@varValor3 FLOAT = 34, 
	@varValor4 FLOAT = 7, 
	@varDivisao FLOAT
SET 
	@varDivisao = @varValor3 / @varValor4
SELECT 
	'Resultado divisão entre Valor3 e Valor4 é: ' + 
	CAST(
		ROUND(
			@varDivisao, 2
		) AS VARCHAR(10)
	) AS 'Resultado da Divisão'


/*	Para cada declaração das variáveis abaixo, 
atenção em relação ao tipo de dado que deverá ser especificado. */

-- a) Declare uma variável chamada ‘produto’ e atribua o valor de ‘Celular’. 
DECLARE 
	@varProduto VARCHAR(50) = 'Celular'
SELECT
	@varProduto AS 'Tipo de Produto'

	
-- b) Declare uma variável chamada ‘quantidade’ e atribua o valor de 12. 
DECLARE 
	@varQuantidade INT = 12
SELECT
	@varQuantidade AS 'Quantidade'


-- c) Declare uma variável chamada ‘preco’ e atribua o valor 9.99.
DECLARE 
	@varPreco FLOAT = 9.99
SELECT
	@varPreco AS 'Preço'


-- d) Declare uma variável chamada ‘faturamento’ e atribua o resultado da multiplicação entre ‘quantidade’ e ‘preco’. 
DECLARE 
	@varFaturamento FLOAT, 
	@varQuantidade INT = 12, 
	@varPreco FLOAT = 9.99
SET 
	@varFaturamento = @varQuantidade * @varPreco
SELECT 
	@varFaturamento AS 'Faturamento'


-- e) Visualize o resultado dessas 4 variáveis em uma única consulta, por meio do SELECT.

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
	@varPreco AS 'Preço', 
	@varFaturamento AS 'Faturamento'


/*	3. Você é responsável por gerenciar um banco de dados onde são recebidos dados externos de usuários. 

Em resumo, esses dados são:

- Nome do usuário
- Data de nascimento 
- Quantidade de pets que aquele usuário possui

Você precisará criar um código em SQL capaz de juntar as informações fornecidas por este usuário. 

Para simular estes dados, crie 3 variáveis, chamadas: nome, data_nascimento e num_pets. 

Você deverá armazenar os valores ‘André’, ‘10/02/1998’ e 2, respectivamente.

O resultado final a ser alcançado é mostrado no print abaixo: 

(Nenhum nome de coluna)
Meu nome é André, nasci em 10/02/1988 e tenho 2 pets.
*/

DECLARE 
	@varNome VARCHAR(50) = 'André', 
	@varData_nascimento DATETIME = '10/02/1998', 
	@varNum_pets INT = 2
SELECT '
	Meu nome é ' 
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


/*	4. Você acabou de ser promovido e o seu papel será realizar um controle de qualidade sobre as lojas da empresa.

A primeira informação que é passada a você é que o ano de 2008 foi bem complicado para a empresa, pois foi quando duas das principais lojas fecharam. 

O seu primeiro desafio é descobrir o nome dessas lojas que fecharam no ano de 2008, para que você possa entender o motivo e mapear planos de ação para evitar que outras lojas importantes tomem o mesmo caminho. 

O seu resultado deverá estar estruturado em uma frase, com a seguinte estrutura: ‘As lojas fechadas no ano de 2008 foram:  ’ + nome_das_lojas

Obs: utilize o comando PRINT (e não o SELECT!) para mostrar o resultado. */

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


/*	5. Você precisa criar uma consulta para mostrar a lista 
de produtos da tabela DimProduct para uma subcategoria específica: ‘Lamps’.  

Utilize o conceito de variáveis para chegar neste resultado.*/


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

/*	1. Quando estamos manipulando tabelas, é importante pensar em como os dados serão 
apresentados em um relatório. Imagine os nomes dos produtos da tabela DimProduct. Os 
textos são bem grandes e pode ser que mostrar os nomes completos dos produtos não seja a 
opção mais interessante, pois provavelmente não vão caber em um gráfico e a visualização 
ficará ruim.
*/

-- a) Seu gestor te pede para listar todos os produtos para que seja criado um gráfico para ser apresentado na reunião diária de equipe. Faça uma consulta à tabela DimProduct que retorne (1) o nome do produto e (2) a quantidade de caracteres que cada produto tem, e ordene essa tabela do produto com a maior quantidade de caracteres para a menor.

SELECT 
	ProductName AS 'Nome do Produto', 
	LEN(ProductName) AS 'Total de Caracteres' 
FROM 
	DimProduct
ORDER BY
	LEN(ProductName) DESC



-- b) Qual é a média de caracteres dos nomes dos produtos?

SELECT 
	AVG(LEN(ProductName)) AS 'Qtd. Média de Caracteres' 
FROM 
	DimProduct



-- c) Analise a estrutura dos nomes dos produtos e verifique se seria possível reduzir o tamanho do nome dos produtos. (Dica: existem informações redundantes nos nomes dos produtos? Seria possível substituí-las?)


SELECT 
	 ProductName AS 'Nome do Produto',
	 REPLACE(REPLACE(ProductName, BrandName, ''), ColorName, '') AS 'Nome Resumido'
	 --REPLACE(ProductName, ColorName, '') AS 'Nome da Cor Resumido'
FROM 
	DimProduct


-- d) Qual é a média de caracteres nesse novo cenário?

SELECT 
	AVG(LEN(REPLACE(REPLACE(ProductName, BrandName, ''), ColorName, ''))) AS 'Média de Caracteres'
FROM 
	DimProduct
*/




/*	2.  A coluna StyleName da tabela DimProduct possui alguns códigos identificados por números distintos, que vão de 0 até 9, como pode ser visto no exemplo abaixo.

Porém, o setor de controle decidiu alterar a identificação do StyleName, e em vez de usar 
números, a ideia agora é passar a usar letras para substituir os números, conforme exemplo 
abaixo: 

0 -> A, 1 -> B, 2 -> C, 3 -> D, 4 -> E, 5 -> F, 6 -> G, 7 -> H, 8 -> I, 9 - J 

É de sua responsabilidade alterar os números por letras na coluna StyleName da tabela 
DimProduct. Utilize uma função que permita fazer essas substituições de forma prática e rápida. 



SELECT 
	ProductName,
	StyleName,
	TRANSLATE(StyleName, '0123456789', 'ABCDEFGHIJ') AS 'Caracteres Substituídos'
FROM 
	DimProduct

*/

/*	3. O setor de TI está criando um sistema para acompanhamento individual de cada funcionário da 
empresa Contoso. Cada funcionário receberá um login e senha. O login de cada funcionário será 
o ID do e-mail, como no exemplo abaixo:

Já a senha será o FirtName + o dia do ano em que o funcionário nasceu, em MAIÚSCULA. Por 
exemplo, o funcionário com E-mail: mark0@contoso.com e data de nascimento 15/01/1990 
deverá ter a seguinte senha:

Login: mark0 
Senha: MARK15 

O responsável pelo TI pediu a sua ajuda para retornar uma tabela contendo as seguintes colunas 
da tabela DimEmployee: Nome completo (FirstName + LastName), E-mail, ID do e-mail e Senha. 
Portanto, faça uma consulta à tabela DimProduct e retorne esse resultado. 


SELECT 
FirstName + '' + LastName AS 'Nome Completo',
EmailAddress AS 'E-mail',
LEFT(EmailAddress, CHARINDEX('@', EmailAddress) - 1) AS 'Login',
UPPER(FirstName + DATENAME(DAYOFYEAR,BirthDate)) AS 'Senha'
FROM 
DimEmployee

*/

/*	4. A tabela DimCustomer possui o primeiro registro de vendas no ano de 2001.

Como forma de reconhecer os clientes que compraram nesse ano, o setor de Marketing solicitou a você que retornasse uma tabela com todos os clientes que fizeram a sua primeira compra neste ano para que seja enviado uma encomenda com um presente para cada um. 

Para fazer esse filtro, você pode utilizar a coluna DateFirstPurchase, que contém a informação da data da primeira compra de cada cliente na tabela DimCustomer. 

Você deverá retornar as colunas de FirstName, EmailAddress, AddressLine1 e DateFirstPurchase da tabela DimCustomer, considerando apenas os clientes que fizeram a primeira compra no ano de 2001.


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



/*	5. A tabela DimEmployee possui uma informação de data de contratação (HireDate). A área de RH, no entanto, precisa das informações dessas datas de forma separada em dia, mês e ano, pois será feita uma automatização para criação de um relatório de RH, e facilitaria muito se essas informações estivessem separadas em uma tabela. 

Você deverá realizar uma consulta à tabela DimEmployee e retornar uma tabela contendo as seguintes informações:
	FirstName,
	EmailAddress, 
	HireDate, 
	além das colunas de Dia, Mês e Ano de contratação.  

Obs1: A coluna de Mês deve conter o nome do mês por extenso, e não o número do mês. 

Obs2: Lembre-se de nomear cada uma dessas colunas em sua consulta para garantir que o 
entendimento de cada informação ficará 100% claro.   

*/

-- SELECT * FROM DimEmployee

SELECT 
	FirstName AS 'Nome', 
	EmailAddress AS 'E-mail', 
	HireDate AS 'Data de Contratação', 
	DATENAME(DAY, HireDate) AS 'Dia da Contratação',
	DATENAME(MONTH, HireDate) AS 'Mês da Contratação',
	DATENAME(YEAR, HireDate) AS 'Ano da Contratação'
FROM 
	DimEmployee

*/


/*	6. Descubra qual é a loja que possui o maior tempo de atividade (em dias). Você deverá fazer essa consulta na tabela DimStore, e considerar a coluna OpenDate como referência para esse cálculo. 
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










