/*

-- 2. C�digo para criar a tabela Lojas

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
   (3, 'Emp�rioi Mineirinho', 'Sudeste', 2300),
   (4, 'Central Paulista', 'Sudeste', 1800),
   (5, 'Rio 90 graus', 'Sudeste', 700),
   (6, 'Casa Flor & An�polis', 'Sul', 2100),
   (7, 'Pampas & Co', 'Sul', 990),
   (8, 'Paran� Pap�is', 'Sul', 2800),
   (9, 'Amazonas Prime', 'Norte', 4200),
   (10, 'Par� Bens', 'Norte', 3200),
   (11, 'Tintas Rio Branco', 'Norte', 1500),
   (12, 'Nordestemido Hall', 'Nordeste', 1910),
  (13, 'Cachoerinha Loft', 'Nordeste', 2380)

-- 3. Fun��es de Agrega��o - SUM, COUNT, AVG, MIN, MAX
-- Fun��es de Janela
-- Fun��es de Agrega��o: SUM, COUNT, AVG, MIN, MAX
-- Crie uma coluna contendo a soma total das vendas da tabela Lojas

select id_loja, nome_loja, regiao, qtd_vendida, sum(Qtd_Vendida) over(partition by regiao) as 'Total Vendido' from Lojas order by id_loja

-- 4. Calculando percentual de participa��o (Parte 1)
-- Fun��es de Janela
-- C�lculo do percentual total

-- a) calcule o % de participa��o total de cada loja em rela��o ao total de vendas de todas as lojas

select 
ID_Loja, 
Nome_Loja, Regiao, 
Qtd_Vendida, 
sum(Qtd_Vendida) over() as 'Total Vendido',
format(Qtd_Vendida / sum(Qtd_Vendida) over(), '0.00%') as '% do Total'
from Lojas 
order by ID_Loja



--5. Calculando percentual de participa��o (Parte 2)

-- b) calcule o % de participa��o de cada loja em rela��o ao total de vendas de cada regi�o.
select 
ID_Loja, 
Nome_Loja, 
Regiao, 
Qtd_Vendida,
sum(Qtd_Vendida) over(partition by Regiao) as 'Total Vendido',
format(Qtd_Vendida / sum(Qtd_Vendida) over(partition by Regiao), '0.00%') as '% por Regi�o'
from Lojas 
order by ID_Loja
*/

-- 6. Fun��es de Classifica��o - ROW_NUMBER, RANK, DENSE_RANK, NTILE

-- Fun��es de Janela
-- Fun��es de classifica��o: ROW_NUMBER, RANK, DENSE_RANK, NTILE

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



























