/*
DECLARE @matricula VARCHAR(5);
DECLARE @nome VARCHAR(100);
DECLARE @percentual FLOAT;
DECLARE @data DATE;
DECLARE @ferias BIT;
DECLARE @bairro VARCHAR(50);
*/

DECLARE @matricula VARCHAR(5), @nome VARCHAR(100), @percentual FLOAT;
DECLARE @data DATE, @ferias BIT, @bairro VARCHAR(50);

SET @matricula = '00123';
SET @nome = 'Gustavo Rezende';
SET @percentual = 0.1;
SET @data = '2024-01-01';
SET @ferias = 0;
SET @bairro = 'Jardim da paz';


DECLARE @Cliente VARCHAR(10);
DECLARE @Idade INT;
DECLARE @DataNascimento DATE;
DECLARE @Custo FLOAT;

SET @Cliente = 'João';
SET @Idade = 10;
SET @DataNascimento = '2007-01-10';
SET @Custo = 10.23;


PRINT(@matricula)
PRINT(@nome)
PRINT(@percentual)
PRINT(@ferias)
PRINT(@bairro)


INSERT INTO [TABELA DE VENDEDORES]
VALUES (@matricula, @nome, @percentual, @data, @ferias, @bairro)


SELECT *
FROM [TABELA DE VENDEDORES]

