/***** DESAFIO 1 *****/
SELECT TC.NOME AS [Nome Cliente],
       TC.VOLUME_DE_COMPRA AS [Volume de Compra],
       SUM(INF.QUANTIDADE) AS [Quantidade Total],
       CONCAT(MONTH(NF.DATA_VENDA), '/', YEAR(NF.DATA_VENDA)) AS [M�s de Refer�ncia],
       CASE
           WHEN SUM(INF.QUANTIDADE) > TC.VOLUME_DE_COMPRA THEN 'Venda Inv�lida'
           ELSE 'Venda V�lida'
       END AS 'Status',
      (SUM(INF.QUANTIDADE) - TC.VOLUME_DE_COMPRA) AS [Valor Diferen�a],
      ROUND((1 - (VOLUME_DE_COMPRA/SUM(INF.QUANTIDADE))) * 100, 2) AS [Porcentagem Diferen�a]
FROM TABELA_DE_CLIENTES TC
INNER JOIN NOTAS_FISCAIS NF ON NF.CPF = TC.CPF
INNER JOIN ITENS_NOTAS_FISCAIS INF ON INF.NUMERO = NF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2015
    AND MONTH(NF.DATA_VENDA) = 1
GROUP BY TC.NOME, TC.VOLUME_DE_COMPRA, MONTH(NF.DATA_VENDA), YEAR(NF.DATA_VENDA)
HAVING SUM(INF.QUANTIDADE) > TC.VOLUME_DE_COMPRA
ORDER BY MONTH(NF.DATA_VENDA), TC.NOME ASC


/***** DESAFIO 2 *****/
SELECT TP.SABOR AS [Sabor],
       YEAR(NF.DATA_VENDA) AS [Ano de Venda],
       ROUND(SUM(INF.QUANTIDADE), 2) AS [Quantidade Vendida],
       CONCAT(ROUND(CONVERT(FLOAT, (CONVERT(FLOAT, SUM(INF.QUANTIDADE)) / CONVERT(FLOAT, SUB.QuantidadeAnual)) * 100), 2), '%') AS [Porcentagem Ref. Ano]
FROM TABELA_DE_PRODUTOS TP
INNER JOIN ITENS_NOTAS_FISCAIS INF ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF ON NF.NUMERO = INF.NUMERO
INNER JOIN (
    SELECT YEAR(SUBNF.DATA_VENDA) AS [AnoVenda],
           SUM(SUBINF.QUANTIDADE) AS [QuantidadeAnual]
    FROM NOTAS_FISCAIS SUBNF
    INNER JOIN ITENS_NOTAS_FISCAIS SUBINF ON SUBINF.NUMERO = SUBNF.NUMERO
    GROUP BY YEAR(SUBNF.DATA_VENDA)
) SUB ON SUB.AnoVenda = YEAR(NF.DATA_VENDA)
WHERE YEAR(NF.DATA_VENDA) = 2015
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA), SUB.QuantidadeAnual, SUB.AnoVenda
ORDER BY [Quantidade Vendida] DESC

