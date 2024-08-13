/*
CREATE FUNCTION listaNotasCliente(@CPF AS VARCHAR(11))
RETURNS TABLE
AS
	RETURN SELECT * FROM [NOTAS FISCAIS] nf WHERE nf.CPF = @CPF

*/

/*
CREATE FUNCTION enderecoCompleto(
	@endereco VARCHAR(100),
	@bairro VARCHAR(50),
	@cidade VARCHAR(50),
	@estado VARCHAR(2),
	@cep VARCHAR(20)
)
RETURNS VARCHAR(250) AS
BEGIN
	DECLARE @enderecoCompleto VARCHAR(250);
	SET @enderecoCompleto = CONCAT(@endereco, ' - ', @bairro, ' - ', @cidade, ' - ', @estado, ' - ', @cep);
	RETURN @enderecoCompleto;
END
*/

/*
ALTER FUNCTION enderecoCompleto(
	@endereco VARCHAR(100),
	@bairro VARCHAR(50),
	@cidade VARCHAR(50),
	@estado VARCHAR(2),
	@cep VARCHAR(20)
)
RETURNS VARCHAR(250) AS
BEGIN
	DECLARE @enderecoCompleto VARCHAR(250);
	SET @enderecoCompleto = CONCAT(@endereco, ' ', @bairro, ' ', @cidade, ' ', @estado, ', ', @cep);
	RETURN @enderecoCompleto;
END
*/

SELECT tdc.CPF,
	   tdc.NOME,
	   dbo.enderecoCompleto(tdc.[ENDERECO 1], tdc.BAIRRO, tdc.CIDADE, tdc.ESTADO, tdc.CEP) AS [Endereço Completo]
FROM [TABELA DE CLIENTES] tdc


