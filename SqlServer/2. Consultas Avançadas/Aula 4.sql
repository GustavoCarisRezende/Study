-- Fun��es de texto
SELECT LOWER(NOME) FROM TABELA_DE_CLIENTES

SELECT UPPER(NOME) FROM TABELA_DE_CLIENTES

SELECT CONCAT('Cliente: ', NOME) FROM TABELA_DE_CLIENTES
SELECT 'Cliente: ' + NOME FROM TABELA_DE_CLIENTES

SELECT RIGHT(NOME_DO_PRODUTO, 6) FROM TABELA_DE_PRODUTOS

SELECT LEFT(NOME_DO_PRODUTO, 6) FROM TABELA_DE_PRODUTOS

SELECT REPLICATE(NOME_DO_PRODUTO, 2) FROM TABELA_DE_PRODUTOS

SELECT SUBSTRING(NOME, 3, 9) FROM TABELA_DE_CLIENTES

SELECT LTRIM(NOME_DO_PRODUTO, 'V') FROM TABELA_DE_PRODUTOS

SELECT LTRIM(NOME_DO_PRODUTO, 'ia') FROM TABELA_DE_PRODUTOS

SELECT TRIM(NOME) FROM TABELA_DE_CLIENTES

SELECT REPLACE(NOME, 'A', '@') FROM TABELA_DE_CLIENTES

SELECT LEN(NOME) FROM TABELA_DE_CLIENTES

SELECT NOME AS [Nome], CONCAT(ENDERECO_1, ' | Bairro: ', BAIRRO, ' | Estado: ', ESTADO) AS [Endere�o Completo]
FROM TABELA_DE_CLIENTES

SELECT NOME_DO_PRODUTO, REPLACE(REPLACE(TAMANHO, 'Litros', 'L'), 'Litro', 'L')
FROM TABELA_DE_PRODUTOS

/* DESAFIO */
SELECT SUBSTRING(NOME, 0, (CHARINDEX(' ', TRIM(NOME))))
FROM TABELA_DE_CLIENTES
/***********/


-- Fun��es de datas
SELECT DATEADD(MONTH, 5, DATA_DE_NASCIMENTO)
FROM TABELA_DE_CLIENTES

SELECT IDADE AS [Idade Salva], DATEDIFF(YEAR, DATA_DE_NASCIMENTO, GETDATE()) AS [Idade Calculada]
FROM TABELA_DE_CLIENTES

SELECT DATEPART(YEAR, DATA_DE_NASCIMENTO)
FROM TABELA_DE_CLIENTES

SELECT GETDATE()

SELECT DAY(DATA_DE_NASCIMENTO), MONTH(DATA_DE_NASCIMENTO), YEAR(DATA_DE_NASCIMENTO)
FROM TABELA_DE_CLIENTES

SELECT ISDATE('2024-02-31')

SELECT DATETIMEFROMPARTS(2028, 10, 27, 16, 35, 22, 30)

SELECT DATEFROMPARTS(2030, 10, 27)

/* DESAFIO */
SELECT CONCAT(NOME, ' | ', DATENAME(WEEKDAY, DATA_DE_NASCIMENTO), ' ', DATENAME(DAY, DATA_DE_NASCIMENTO), ' ', 
                           DATENAME(MONTH, DATA_DE_NASCIMENTO), ' ', DATENAME(YEAR, DATA_DE_NASCIMENTO)) AS [NOME E DATA]
FROM TABELA_DE_CLIENTES
/***********/


-- Fun��es num�ricas
SELECT ROUND(PRECO_DE_LISTA, 2) FROM TABELA_DE_PRODUTOS

SELECT CEILING(PRECO_DE_LISTA), FLOOR(PRECO_DE_LISTA) FROM TABELA_DE_PRODUTOS

SELECT POWER(2, 10)

SELECT EXP(5)

SELECT SQRT(144)

SELECT SIGN(-10), SIGN(10)

SELECT ABS(-10.325)

SELECT (10 % 3)

SELECT PI()

/* DESAFIO */
SELECT YEAR(DATA_VENDA) AS ANO, FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) 
FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY YEAR(DATA_VENDA);
/***********/


-- Fun��es de convers�o

SELECT NOME, CONVERT(VARCHAR(10), DATA_DE_NASCIMENTO, 103) FROM TABELA_DE_CLIENTES

SELECT CONVERT(VARCHAR, GETDATE(), 121)

SELECT CAST(10 AS VARCHAR)

/* DESAFIO */
SELECT CONCAT('O cliente ', TC.NOME, ' comprou R$ ', STR(SUM(INF.QUANTIDADE + INF.PRECO), 10, 2), ' no ano de 2016')
FROM TABELA_DE_CLIENTES TC
INNER JOIN NOTAS_FISCAIS NF ON NF.CPF = TC.CPF
INNER JOIN ITENS_NOTAS_FISCAIS INF ON INF.NUMERO = NF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TC.NOME
/***********/

