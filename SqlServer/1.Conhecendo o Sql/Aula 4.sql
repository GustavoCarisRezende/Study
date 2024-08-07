SELECT nome AS [Nome do Cliente],
	   primeiraCompra AS [Primeira Compra],
	   estado AS [UF Cliente]
FROM [tb_Clientes]
WHERE primeiraCompra = 1;


SELECT *
FROM [tb_Produtos]
WHERE precoLista < 7.00;


SELECT DISTINCT embalagem
FROM tb_Produtos


/* Quando você usa os operadores maior ou menor
   em texto,ele considera ordem alfabética */
SELECT *
FROM [tb_Produtos]
WHERE embalagem = 'Lata';


SELECT nome, dataNascimento
FROM [tb_Clientes]
WHERE YEAR(dataNascimento) > 1995;


SELECT nome, bairro
FROM [tb_Clientes]
WHERE bairro IN ('Copacabana', 'Tijuca');


SELECT nome, bairro
FROM [tb_Clientes]
WHERE bairro = 'Copacabana'
	OR bairro = 'Tijuca';


SELECT nome, estado, primeiraCompra
FROM [tb_Clientes]
WHERE estado = 'SP'
	AND primeiraCompra = 1


-- Desafio --
SELECT *
FROM [tb_Vendedores]
WHERE percentualComissao <= 0.08


SELECT *
FROM [tb_Produtos]
WHERE precoLista < 6
	AND embalagem = 'Lata'


SELECT *
FROM [tb_Clientes]
WHERE estado NOT IN ('SP', 'RJ')

-------------

SELECT *
FROM [tb_Produtos]
-- UPDATE [tb_Produtos] SET precoLista = precoLista * 0.0
WHERE embalagem = 'Lata'


SELECT *
FROM [tb_Produtos]
-- UPDATE [tb_Produtos] SET embalagem = 'Garrafa', precoLista = 8.1
WHERE codigo = '1088126'


SELECT *
-- DELETE
FROM [tb_Produtos]
WHERE codigo = '1004327'
