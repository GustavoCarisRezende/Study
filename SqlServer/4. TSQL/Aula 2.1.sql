DECLARE @limiteMaximo FLOAT = 600000;
DECLARE @limiteAtual FLOAT;
DECLARE @bairro VARCHAR(100);

SET @bairro = 'Lapa';

SELECT @limiteAtual = SUM([LIMITE DE CREDITO])
FROM [TABELA DE CLIENTES]
WHERE BAIRRO = @bairro

PRINT(@limiteAtual)

IF ((SELECT SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES] WHERE BAIRRO = @bairro) > @limiteMaximo)
    PRINT('Valor limite ultrapassado')
ELSE 
    PRINT('Valor dentro do limite')


