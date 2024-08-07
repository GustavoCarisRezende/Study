UPDATE tbProdutos SET preco_lista = 5
WHERE codigo = '1040107'

UPDATE tbProdutos SET preco_lista = preco_lista * 1.1
WHERE sabor = 'Manga'

UPDATE tbProdutos SET 
    tamanho = '550 ml',
    descricao = REPLACE(descricao, '350 ml', '550 ml')
    -- descricao = REPLACE(descricao, '350ml', '550 ml')
WHERE tamanho = '350 ml'

/***** DESAFIO *****/

UPDATE tbClientes SET
    endereco = 'R. Jorge Emilio 23',
    bairro = 'Santo Amaro',
    cidade = 'São Paulo',
    estado = 'SP',
    cep = '8833223'
WHERE cpf = '19290992743'

UPDATE tbClientes SET volumeCompra = volumeCompra * 1.2
WHERE estado = 'RJ'

/*******************/


SELECT *
FROM tbProdutos
ORDER BY codigo;

SELECT *
FROM SUCOS_FRUTAS..TABELA_DE_PRODUTOS
ORDER BY CODIGO_DO_PRODUTO;

SELECT vsp.codigo AS [Codigo Produto Tabela Atual],
       vsp.preco_lista AS [Preço Produto Tabela Atual],
       sfp.CODIGO_DO_PRODUTO AS [Codigo Produto Tabela Apoio],
       sfp.PRECO_DE_LISTA AS [Valor Produto Tabela Apoio]
-- UPDATE vsp SET vsp.preco_lista = sfp.PRECO_DE_LISTA
FROM tbProdutos vsp
INNER JOIN SUCOS_FRUTAS..TABELA_DE_PRODUTOS sfp ON sfp.CODIGO_DO_PRODUTO = vsp.codigo


/***** DESAFIO *****/
SELECT *
-- UPDATE c SET c.volumeCompra = c.volumeCompra * 1.3
FROM tbVendedores v
INNER JOIN tbClientes c ON c.bairro = v.bairro
/*******************/


-- UPDATE sfp SET PRECO_DE_LISTA *= 1.05 FROM SUCOS_FRUTAS..TABELA_DE_PRODUTOS sfp

MERGE INTO tbProdutos vsp
USING SUCOS_FRUTAS..TABELA_DE_PRODUTOS sfp ON sfp.CODIGO_DO_PRODUTO = vsp.codigo
WHEN MATCHED THEN UPDATE SET vsp.preco_lista = sfp.PRECO_DE_LISTA;


/***** DESAFIO *****/
SELECT c.nome, c.volumeCompra
FROM tbVendedores v
INNER JOIN tbClientes c ON c.bairro = v.bairro


MERGE INTO tbClientes vsc
USING tbVendedores vsv ON vsv.bairro = vsc.bairro
WHEN MATCHED THEN UPDATE SET vsc.volumeCompra *= 1.3;
/*******************/


SELECT *
-- DELETE
FROM tbProdutos
WHERE codigo = '1001000'

SELECT *
-- DELETE
FROM tbProdutos
WHERE descricao LIKE '%Sabor dos Alpes%'
    AND tamanho = '1 Litro'

SELECT *
FROM VENDAS_SUCOS..tbProdutos vsp
LEFT JOIN SUCOS_FRUTAS..TABELA_DE_PRODUTOS sfp
    ON vsp.codigo = sfp.CODIGO_DO_PRODUTO
WHERE sfp.CODIGO_DO_PRODUTO IS NULL


SELECT *
-- DELETE
FROM VENDAS_SUCOS..tbProdutos
WHERE codigo NOT IN (SELECT sfp.CODIGO_DO_PRODUTO FROM SUCOS_FRUTAS..TABELA_DE_PRODUTOS sfp)


/***** DESAFIO *****/
SELECT *
-- DELETE V
FROM tbVendas V
INNER JOIN tbClientes C ON C.cpf = V.cpf
WHERE C.idade < 18
/*******************/

 
/*
    CREATE TABLE [dbo].[tbProdutos_2](
	    [codigo] [varchar](10) NOT NULL,
	    [descricao] [varchar](100) NULL,
	    [sabor] [varchar](50) NULL,
	    [tamanho] [varchar](50) NULL,
	    [embalagem] [varchar](50) NULL,
	    [preco_lista] [float] NULL,
     CONSTRAINT [pk_tbProdutos_2] PRIMARY KEY CLUSTERED 
    (
	    [codigo] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    INSERT INTO tbProdutos_2
    SELECT *
    FROM tbProdutos

    
    
    DELETE FROM tbProdutos_2
*/

BEGIN TRANSACTION

UPDATE tbVendedores SET comissao *= 1.1

COMMIT


BEGIN TRANSACTION

INSERT INTO tbVendedores
VALUES ('239', 'Maria Joana', 'Copacabana', 0.2, '2015-01-01', 1);

ROLLBACK


CREATE TABLE tbCheck (
    id INT NOT NULL,
    nome VARCHAR(50),
    idade INT NULL,
    cidade VARCHAR(50),
    CONSTRAINT chkIdade CHECK(idade >= 18)
)

INSERT INTO tbCheck VALUES(1, 'Teste 1', 18, 'São Paulo')

INSERT INTO tbCheck VALUES(2, 'Teste 2', 17, 'São Paulo')

INSERT INTO tbCheck VALUES(3, 'Teste 3', 20, 'São Paulo')


CREATE TABLE tbCheck2 (
    id INT NOT NULL,
    nome VARCHAR(50),
    idade INT NULL,
    cidade VARCHAR(50),
    CONSTRAINT chkIdade2 CHECK((idade >= 18  AND cidade = 'Rio de Janeiro') OR (idade >= 16 AND cidade = 'São Paulo'))
)


INSERT INTO tbCheck2 VALUES(1, 'Teste 1', 19, 'São Paulo')

INSERT INTO tbCheck2 VALUES(2, 'Teste 2', 17, 'São Paulo')

INSERT INTO tbCheck2 VALUES(3, 'Teste 3', 18, 'Rio de Janeiro')

INSERT INTO tbCheck2 VALUES(4, 'Teste 4', 15, 'Rio de Janeiro')


