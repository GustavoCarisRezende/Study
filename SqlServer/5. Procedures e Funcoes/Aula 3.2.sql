/*
CREATE PROCEDURE retornaValorsFaturamentoQuantidade
	@CPF AS VARCHAR(12) = '19290992743',
	@ANO AS INT = 2017,
	@NUM_NOTAS AS INT OUTPUT,
	@FATURAMENTO AS FLOAT OUTPUT
AS
BEGIN

	SELECT @NUM_NOTAS = COUNT(*) FROM [NOTAS FISCAIS]
	WHERE CPF = @CPF AND YEAR([DATA]) = @ANO

	SELECT @FATURAMENTO = SUM(INF.QUANTIDADE * INF.[PRE�O])
	FROM [ITENS NOTAS FISCAIS] INF
	INNER JOIN [NOTAS FISCAIS] NF
	ON INF.NUMERO = NF.NUMERO
	WHERE NF.CPF = @CPF AND YEAR(NF.[DATA]) = @ANO

END
*/

DECLARE @NUM_NOTAS INT;
DECLARE @FATURAMENTO FLOAT;

-- SELECT @NUM_NOTAS, @FATURAMENTO

EXEC retornaValorsFaturamentoQuantidade @CPF = '94387575700', @ANO = 2017, @NUM_NOTAS = @NUM_NOTAS OUTPUT, @FATURAMENTO = @FATURAMENTO OUTPUT

SELECT @NUM_NOTAS, @FATURAMENTO

