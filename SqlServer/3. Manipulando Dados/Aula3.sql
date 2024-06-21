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


