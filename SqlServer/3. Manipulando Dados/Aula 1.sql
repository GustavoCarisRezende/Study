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

CREATE TABLE tbClientes(
    cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(100),
    endereco VARCHAR(150),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    cep VARCHAR(8),
    dataNascimento DATE,
    idade INT,
    genero VARCHAR(1),
    limiteCredito FLOAT,
    volumeCompra FLOAT,
    primeiraCompra BIT,
    CONSTRAINT pk_tbClientes PRIMARY KEY(cpf)
);

CREATE TABLE tbVendas (
    numero VARCHAR(5) NOT NULL,
    data DATE,
    cpf VARCHAR(11) NOT NULL,
    matricula VARCHAR(5) NOT NULL,
    vlImposto FLOAT,
    CONSTRAINT pk_tbVendas PRIMARY KEY(numero),
    CONSTRAINT fk_tbVendas_cpf_tbClientes_cpf
        FOREIGN KEY (cpf) REFERENCES tbClientes(cpf)
);

ALTER TABLE tbVendas ADD CONSTRAINT fk_tbVendas_matricula_tbVendedores_matricula
    FOREIGN KEY (matricula) REFERENCES tbVendedores(matricula);

CREATE TABLE tbItensVendas (
    numeroVenda VARCHAR(5) NOT NULL,
    codigoProduto VARCHAR(10) NOT NULL,
    quantidade INT NOT NULL,
    preco FLOAT NOT NULL,
    CONSTRAINT pk_tbItensVendas PRIMARY KEY(numeroVenda, codigoProduto),
    CONSTRAINT fk_tbItensVendas_numeroVenda_tbVendas_numero
        FOREIGN KEY (numeroVenda) REFERENCES tbVendas(numero),
    CONSTRAINT fk_tbItensVendas_codigoProduto_tbProdutos_codigo
        FOREIGN KEY (codigoProduto) REFERENCES tbProdutos(codigo)
);
