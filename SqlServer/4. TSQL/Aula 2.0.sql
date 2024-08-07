IF OBJECT_ID('TABELA_TESTE', 'U') IS NULL
    CREATE TABLE TABELA_TESTE (ID VARCHAR(10))
IF OBJECT_ID('TABELA_TESTE', 'U') IS NOT NULL
    DROP TABLE TABELA_TESTE


DECLARE @numeroDias INT = 11;
DECLARE @diaSemana VARCHAR(20) = DATENAME(WEEKDAY, DATEADD(DAY, @numeroDias, GETDATE()));

PRINT(@diaSemana)

IF(@diaSemana IN ('Sunday', 'Saturday'))
    PRINT('Este dia é fim de semana')
ELSE
    PRINT('Este dia é dia de semana')
