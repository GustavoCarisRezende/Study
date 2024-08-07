SELECT * 
FROM [tb_Produtos];


SELECT nome, estado
FROM [tb_Clientes]
ORDER BY nome ASC;


SELECT nome AS [Nome Cliente],
	   cpf AS [CPF Cliente],
	   estado AS [UF Cliente]
FROM [tb_Clientes]
ORDER BY nome ASC;


SELECT matricula AS [Identificador],
	   nome AS [Nome do Vendedor]
FROM [tb_Vendedores]
ORDER BY matricula ASC;


SELECT DISTINCT sabor
FROM [tb_Produtos]
ORDER BY sabor ASC;


SELECT sabor
FROM [tb_Produtos]
GROUP BY sabor
ORDER BY sabor ASC;
