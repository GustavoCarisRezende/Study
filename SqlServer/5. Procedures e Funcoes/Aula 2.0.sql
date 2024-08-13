DECLARE @LIMITE_MINIMO INT, @LIMITE_MAXIMO INT;
DECLARE @TABELA_NUMEROS TABLE (NUMERO INT, STATUS VARCHAR(200), FATURAMENTO FLOAT);
DECLARE @CONTADOR_NOTAS INT;

SET @LIMITE_MINIMO = 1;
SET @LIMITE_MAXIMO = 100000;

SET NOCOUNT ON;

WHILE @LIMITE_MINIMO <= @LIMITE_MAXIMO
BEGIN
	SELECT @CONTADOR_NOTAS = COUNT(*)
	FROM [NOTAS FISCAIS] nf
	WHERE nf.NUMERO = @LIMITE_MINIMO;

	IF @CONTADOR_NOTAS > 0
	BEGIN
		INSERT INTO @TABELA_NUMEROS 
		VALUES (
			@LIMITE_MINIMO,
			'Nota Encontrada',
			dbo.valorFaturamentoNota(@LIMITE_MINIMO)
		);
	END
	ELSE
		INSERT INTO @TABELA_NUMEROS VALUES (@LIMITE_MINIMO, 'Nota n�o localizada', NULL);

	SET @LIMITE_MINIMO += 1;
END;

SELECT * FROM @TABELA_NUMEROS;
