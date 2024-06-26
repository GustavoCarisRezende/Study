CREATE TABLE tbIdentity (
    id INT IDENTITY(1, 1) NOT NULL,
    descricao VARCHAR(20) NULL
)

INSERT INTO tbIdentity(descricao) VALUES ('Cliente X')

INSERT INTO tbIdentity(descricao) 
VALUES ('Cliente Y'),
       ('Cliente Z'),
       ('Cliente W'),
       ('Cliente A');

-- DELETE FROM tbIdentity WHERE id = 1;

INSERT INTO tbIdentity(descricao) VALUES ('Cliente B')

-- DELETE FROM tbIdentity WHERE id = 6;

INSERT INTO tbIdentity(descricao) VALUES ('Cliente C')

CREATE TABLE tbIdentity2 (
    id INT IDENTITY(100, 5) NOT NULL,
    descricao VARCHAR(20) NULL
)

INSERT INTO tbIdentity2(descricao) 
VALUES ('Cliente Y'),
       ('Cliente Z'),
       ('Cliente W'),
       ('Cliente A');

INSERT INTO tbIdentity2(id, descricao) VALUES (255, 'Cliente B')


CREATE TABLE tbPadrao(
    id INT IDENTITY(1, 1) NOT NULL,
    descricao VARCHAR(20) NULL,
    endereco VARCHAR(20) NULL,
    cidade VARCHAR(20) DEFAULT 'Não Definida',
    dataCriacao DATETIME DEFAULT GETDATE()
)

INSERT INTO tbPadrao(descricao,endereco,cidade,dataCriacao)
VALUES ('Cliente X', 'Rua Projetada A', 'São Paulo', '2018-04-30');

INSERT INTO tbPadrao(descricao)
VALUES ('Cliente Y');

/*
TRIGGERS TYPES
    - FOR: Executa ao mesmo tempo que o comando
    - AFTER: Executa depois do comando
    - INSTEAD OF: Substituí o comando
*/

CREATE TABLE tbFaturamento (
    dataVenda DATE NULL,
    totalVenda FLOAT
)

INSERT INTO tbVendas
VALUES ('0100', '2018-05-15', '50534475787', '236', 0.18)

INSERT INTO tbItensVendas
VALUES ('0100', '1000889', 100, 10)

INSERT INTO tbVendas
VALUES ('0102', '2018-05-15', '50534475787', '236', 0.18)

INSERT INTO tbItensVendas
VALUES ('0102', '1000889', 100, 10)

INSERT INTO tbFaturamento
SELECT v.data, SUM(ISNULL(i.preco, 0) * i.quantidade)
FROM tbVendas v
INNER JOIN tbItensVendas i ON i.numeroVenda = v.numero
GROUP BY v.data



/********** DESAFIO **********/

CREATE TRIGGER tgCalculaIdadeCliente ON tbClientes AFTER INSERT, UPDATE, DELETE AS 
BEGIN
    UPDATE tbClientes SET idade = DATEDIFF(YEAR, [dataNascimento], GETDATE());
END;

UPDATE tbClientes SET volumeCompra *= 1.1
WHERE cpf = '19290992743'

SELECT *
FROM tbClientes

/*****************************/

CREATE TRIGGER tgItensVendidos ON tbItensVendas
AFTER INSERT, UPDATE, DELETE AS
BEGIN
    DELETE FROM tbFaturamento;

    INSERT INTO tbFaturamento
    SELECT v.data, SUM(ISNULL(i.preco, 0) * i.quantidade)
    FROM tbVendas v
    INNER JOIN tbItensVendas i ON i.numeroVenda = v.numero
    GROUP BY v.data
END;


SELECT * FROM tbFaturamento

INSERT INTO tbVendas
VALUES ('0103', '2018-05-15', '50534475787', '236', 0.18)

INSERT INTO tbItensVendas
VALUES ('0103', '1000889', 100, 10)

SELECT * FROM tbFaturamento
