/*
CREATE FUNCTION enderecoCompleto2(
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

CREATE FUNCTION enderecoCompleto3(
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

IF OBJECT_ID('enderecoCompleto2', 'FN') IS NOT NULL
	DROP FUNCTION enderecoCompleto2;
IF OBJECT_ID('enderecoCompleto3', 'FN') IS NOT NULL
	DROP FUNCTION enderecoCompleto3;
