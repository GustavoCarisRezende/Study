-- CREATE DATABASE SUCOS_VENDAS;

CREATE TABLE tb_Clientes (
	[cpf] CHAR(11),
	[nome] VARCHAR(150),
	[rua] VARCHAR(150),
	[complemento] VARCHAR(150),
	[bairro] VARCHAR(150),
	[estado] CHAR(2),
	[cep] CHAR(8),
	[dataNascimento] DATE,
	[idade] SMALLINT,
	[sexo] CHAR(1),
	[limiteCredito] MONEY,
	[volumeMinimo] FLOAT,
	[primeiraCompra] BIT
);

ALTER TABLE tb_Clientes ALTER COLUMN [cpf] CHAR(11) NOT NULL;
ALTER TABLE tb_Clientes ADD CONSTRAINT pk_tb_Clientes_cpf PRIMARY KEY CLUSTERED([cpf]);


CREATE TABLE tb_Produtos (
	[codigo] VARCHAR(20) NOT NULL,
	[nome] VARCHAR(50),
	[embalagem] VARCHAR(50),
	[tamanho] VARCHAR(50),
	[sabor] VARCHAR(50),
	[precoLista] SMALLMONEY
);

ALTER TABLE tb_Produtos ADD CONSTRAINT pk_tb_Produtos_codigo PRIMARY KEY CLUSTERED([codigo]);


CREATE TABLE tb_Vendedores (
	[matricula] CHAR(5) NOT NULL,
	[nome] VARCHAR(100),
	[percentualComissao] FLOAT
);

ALTER TABLE tb_Vendedores ADD CONSTRAINT pk_tb_Vendedores_matricula PRIMARY KEY CLUSTERED([matricula]);