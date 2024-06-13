CREATE DATABASE [VENDAS_SUCOS]
ON (
    NAME = 'VENDAS_SUCOS',
    FILENAME = 'C:\Rezende\SqlServer\Databases\Vendas_Sucos.mdf',
    SIZE = 10, -- Mega Bytes
    FILEGROWTH = 5
) LOG ON (
    NAME = 'VENDAS_SUCOS_LOG',
    FILENAME = 'C:\Rezende\SqlServer\Databases\Vendas_Sucos.ldf',
    SIZE = 10, -- Mega Bytes
    MAXSIZE = 100,
    FILEGROWTH = 5
);

-- DROP DATABASE [VENDAS_SUCOS];

CREATE TABLE tbProdutos(
    codigo VARCHAR(10) NOT NULL,
    descricao VARCHAR(100),
    sabor VARCHAR(50),
    tamanho VARCHAR(50),
    embalagem VARCHAR(50),
    preco_lista FLOAT,
    CONSTRAINT pk_tbProdutos PRIMARY KEY(codigo)
);

CREATE TABLE tbVendedores(
    matricula VARCHAR(5) NOT NULL,
    nome VARCHAR(100),
    bairro VARCHAR(50),
    comissao FLOAT,
    dataAdmissao DATE,
    ferias BIT,
    CONSTRAINT pk_tbVendedores PRIMARY KEY(matricula)
);

