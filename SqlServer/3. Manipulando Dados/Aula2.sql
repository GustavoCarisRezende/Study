INSERT INTO tbProdutos(codigo, descricao, sabor, tamanho, embalagem, preco_lista)
VALUES ('1040107', 'Light - 350ml - Melancia', 'Melancia', '350 ml', 'Lata', 4.56);

INSERT INTO tbProdutos(codigo, descricao, sabor, tamanho, embalagem, preco_lista)
VALUES ('1040108', 'Light - 350ml - Graviola', 'Graviola', '350 ml', 'Lata', 4.00),
       ('1040109', 'Light - 350ml - Açaí', 'Açaí', '350 ml', 'Lata', 5.60);

INSERT INTO tbProdutos
VALUES ('1040110', 'Light - 350ml - Jaca', 'Jaca', '350 ml', 'Lata', 3.50);

INSERT INTO tbProdutos
VALUES ('1040111', 'Light - 350ml - Manga', 'Manga', '350 ml', 'Lata', 3.20),
       ('1040112', 'Light - 350ml - Maça', 'Maça', '350 ml', 'Lata', 4.20);
       
/***** DESAFIO *****/
INSERT INTO tbClientes(
    cpf, nome, endereco, bairro, cidade, estado, cep, dataNascimento, idade,
    genero, limiteCredito, volumeCompra, primeiraCompra
) VALUES ('1471156710', 'Érica Carvalho', 'R. Iriquitia', 'Jardins', 'São Paulo', 'SP',
          '80012212', '1990-09-01', 27, 'F', 170000, 24500, 0),
         ('19290992743', 'Fernando Cavalcante', 'R. Dois de Fevereiro', 'Água Santa',
          'Rio de Janeiro', 'RJ', '22000000', '2000-02-12', 18, 'M', 100000, 20000, 1),
         ('2600586709', 'César Teixeira', 'Rua Conde de Bonfim', 'Tijuca', 'Rio de Janeiro',
          'RJ', '22020001', '2000-03-12', 18, 'M', 120000, 22000, 0);
/*******************/


INSERT INTO tbProdutos
SELECT CODIGO_DO_PRODUTO AS [codigo],
       NOME_DO_PRODUTO AS [descricao],
       EMBALAGEM AS [embalagem],
       TAMANHO AS [tamanho],
       SABOR AS [sabor],
       PRECO_DE_LISTA AS [preco_lista]
FROM SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS
WHERE CODIGO_DO_PRODUTO NOT IN (SELECT NTP.codigo FROM VENDAS_SUCOS.dbo.tbProdutos NTP)


/***** DESAFIO *****/

INSERT INTO tbClientes
SELECT OTC.CPF AS [cpf],
       OTC.NOME AS [nome],
       OTC.ENDERECO_1 AS [endereco],
       OTC.BAIRRO AS [bairro],
       OTC.CIDADE AS [cidade],
       OTC.ESTADO AS [estado],
       OTC.CEP AS [cep],
       OTC.DATA_DE_NASCIMENTO AS [dataNascimento],
       OTC.IDADE AS [idade],
       OTC.GENERO AS [genero],
       OTC.LIMITE_DE_CREDITO AS [limiteCredito],
       OTC.VOLUME_DE_COMPRA AS [volumeCompra],
       OTC.PRIMEIRA_COMPRA AS [primeiraCompra]
FROM SUCOS_FRUTAS.dbo.TABELA_DE_CLIENTES OTC
WHERE OTC.CPF NOT IN (SELECT NTB.cpf FROM tbClientes NTB)

/*******************/

INSERT INTO [dbo].[tbProdutos]
           ([codigo]
           ,[descricao]
           ,[sabor]
           ,[tamanho]
           ,[embalagem]
           ,[preco_lista])
     VALUES
           ('1040113',
            'Light - 350 ml - Limão',
            'Limão',
            '350 ml',
            'Lata',
            3.25)

