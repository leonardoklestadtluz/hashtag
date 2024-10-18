/*

-- 2. Código para criar a tabela Lojas

CREATE DATABASE WF
USE WF

CREATE TABLE Lojas(
   ID_Loja INT,
   Nome_Loja VARCHAR(100),
   Regiao VARCHAR(100),
   Qtd_Vendida FLOAT
)

INSERT INTO LOJAS(ID_Loja, Nome_Loja, Regiao, Qtd_Vendida)
VALUES
   (1, 'Botafogo Praia&Mar', 'Sudeste', 1800),
   (2, 'Lojas Vitoria', 'Sudeste', 800),
   (3, 'Empórioi Mineirinho', 'Sudeste', 2300),
   (4, 'Central Paulista', 'Sudeste', 1800),
   (5, 'Rio 90 graus', 'Sudeste', 700),
   (6, 'Casa Flor & Anópolis', 'Sul', 2100),
   (7, 'Pampas & Co', 'Sul', 990),
   (8, 'Paraná Papéis', 'Sul', 2800),
   (9, 'Amazonas Prime', 'Norte', 4200),
   (10, 'Pará Bens', 'Norte', 3200),
   (11, 'Tintas Rio Branco', 'Norte', 1500),
   (12, 'Nordestemido Hall', 'Nordeste', 1910),
  (13, 'Cachoerinha Loft', 'Nordeste', 2380)

-- 3. Funções de Agregação - SUM, COUNT, AVG, MIN, MAX
-- Funções de Janela
-- Funções de Agregação: SUM, COUNT, AVG, MIN, MAX
-- Crie uma coluna contendo a soma total das vendas da tabela Lojas

select id_loja, nome_loja, regiao, qtd_vendida, sum(Qtd_Vendida) over(partition by regiao) as 'Total Vendido' from Lojas order by id_loja

-- 4. Calculando percentual de participação (Parte 1)
-- Funções de Janela
-- Cálculo do percentual total

-- a) calcule o % de participação total de cada loja em relação ao total de vendas de todas as lojas

select 
ID_Loja, 
Nome_Loja, Regiao, 
Qtd_Vendida, 
sum(Qtd_Vendida) over() as 'Total Vendido',
format(Qtd_Vendida / sum(Qtd_Vendida) over(), '0.00%') as '% do Total'
from Lojas 
order by ID_Loja



--5. Calculando percentual de participação (Parte 2)

-- b) calcule o % de participação de cada loja em relação ao total de vendas de cada região.
select 
ID_Loja, 
Nome_Loja, 
Regiao, 
Qtd_Vendida,
sum(Qtd_Vendida) over(partition by Regiao) as 'Total Vendido',
format(Qtd_Vendida / sum(Qtd_Vendida) over(partition by Regiao), '0.00%') as '% por Região'
from Lojas 
order by ID_Loja

-- 6. Funções de Classificação - ROW_NUMBER, RANK, DENSE_RANK, NTILE

-- Funções de Janela
-- Funções de classificação: ROW_NUMBER, RANK, DENSE_RANK, NTILE

select
ID_Loja,
Nome_Loja,
Regiao,
Qtd_Vendida,
row_number() over(order by Qtd_Vendida desc) as 'rownumber',
rank() over(order by Qtd_Vendida desc) as 'rank',
dense_rank() over(order by Qtd_Vendida desc) as 'denserank',
ntile(4) over(order by Qtd_Vendida desc) as 'ntile'
from Lojas

-- 7. Funções de Classificação mais PARTITION BY

select
ID_Loja,
Nome_Loja,
Regiao,
Qtd_Vendida,
row_number() over(partition by Regiao order by Qtd_Vendida desc) as 'rownumber',
rank() over(partition by Regiao order by Qtd_Vendida desc) as 'rank',
dense_rank() over(partition by Regiao order by Qtd_Vendida desc) as 'denserank',
ntile(4) over(partition by Regiao order by Qtd_Vendida desc) as 'ntile'
from Lojas
order by ID_Loja


-- 8. RANK mais GROUP BY

--Crie uma tabela com o total de vendas por região e adicione uma coluna de ranking a esta tabela

select Regiao as 'Região', sum(Qtd_Vendida) as 'Total Vendido', rank() over(order by sum(Qtd_Vendida) desc) as 'Ranking' from Lojas group by Regiao order by [Total Vendido] desc

*/

-- 9. Cálculo de soma móvel e média móvel

create table Resultado(data_fechamento datetime, mes_ano varchar(100), faturamento_mm float)

insert into Resultado(data_fechamento, mes_ano, faturamento_mm)
values
	('01/01/2020', 'JAN-20', 8),
	('01/02/2020', 'FEV-20', 10),
	('01/03/2020', 'MAR-20', 6),
	('01/04/2020', 'ABR-20', 9),
	('01/05/2020', 'MAI-20', 5),
	('01/06/2020', 'JUN-20', 4),
	('01/07/2020', 'JUL-20', 7),
	('01/08/2020', 'AGO-20', 11),
	('01/09/2020', 'SET-20', 9),
	('01/10/2020', 'OUT-20', 12),
	('01/11/2020', 'NOV-20', 11),
	('01/11/2020', 'DEZ-20', 10)


select data_fechamento, mes_ano, faturamento_mm, sum(faturamento_mm) over(order by data_fechamento rows between 1 preceding and current row) as 'Soma Móvel', avg(faturamento_mm) over(order by data_fechamento rows between 1 preceding and current row) as 'Média Móvel' from Resultado
















