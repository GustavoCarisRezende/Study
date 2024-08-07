DECLARE @cpf VARCHAR(50);
DECLARE @nome VARCHAR(100);
DECLARE @dataNascimento DATE;
DECLARE @idade INT;

DECLARE @saida VARCHAR(500);

SET @cpf = '19290992743';
SELECT @nome = NOME,
       @dataNascimento = [DATA DE NASCIMENTO],
       @idade = IDADE
FROM [TABELA DE CLIENTES] WHERE CPF = @cpf;

SET @saida = 'O primeiro nome do cliente ' + @nome + ' de CPF ' + @cpf + ' é ' + SUBSTRING(@nome, 0, CHARINDEX(' ', @nome));

PRINT(@saida);
PRINT('A idade do cliente ' + @nome + ' de CPF ' + @cpf + ' é ' + CONVERT(VARCHAR(100), DATEDIFF(YEAR, @dataNascimento, GETDATE())))

SELECT SUBSTRING(NOME, 0, CHARINDEX(' ', NOME)), CHARINDEX(' ', NOME), NOME FROM [TABELA DE CLIENTES];

