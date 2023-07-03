CREATE TABLE Vendedor (
    idVendedor INT PRIMARY KEY,
    razaoSocial VARCHAR(255),
    Local VARCHAR(255)
);

CREATE TABLE Produto (
    idProduto INT PRIMARY KEY,
    Categoria VARCHAR(255),
    descricao VARCHAR(255),
    valor VARCHAR(255)
);

CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY,
    Local VARCHAR(255)
);

CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY,
    StatusPedido VARCHAR(255),
    descricao VARCHAR(255),
    Frete VARCHAR(255),
    fk_Cliente_idCliente VARCHAR(255)
);

CREATE TABLE Cliente (
    idCliente VARCHAR(255) PRIMARY KEY,
    Pnome VARCHAR(255),
    CPF VARCHAR(255),
    Atributo_1 VARCHAR(255),
    Sobrenome VARCHAR(255),
    DataNascimento VARCHAR(255)
);

CREATE TABLE RelacaoProdutoPedido (
    fk_Produto_idProduto INT,
    fk_Pedido_idPedido INT,
    quantidade VARCHAR(255),
    PRIMARY KEY (fk_Produto_idProduto, fk_Pedido_idPedido),
    FOREIGN KEY (fk_Produto_idProduto) REFERENCES Produto (idProduto) ON DELETE RESTRICT,
    FOREIGN KEY (fk_Pedido_idPedido) REFERENCES Pedido (idPedido) ON DELETE RESTRICT
);

CREATE TABLE ProdutoVendedor (
    fk_Vendedor_idVendedor INT,
    fk_Produto_idProduto INT,
    quantidade VARCHAR(255),
    PRIMARY KEY (fk_Vendedor_idVendedor, fk_Produto_idProduto),
    FOREIGN KEY (fk_Vendedor_idVendedor) REFERENCES Vendedor (idVendedor) ON DELETE RESTRICT,
    FOREIGN KEY (fk_Produto_idProduto) REFERENCES Produto (idProduto) ON DELETE RESTRICT
);

CREATE TABLE ProdutoEstoque (
    fk_Estoque_idEstoque INT,
    fk_Produto_idProduto INT,
    local VARCHAR(255),
    PRIMARY KEY (fk_Estoque_idEstoque, fk_Produto_idProduto),
    FOREIGN KEY (fk_Estoque_idEstoque) REFERENCES Estoque (idEstoque) ON DELETE RESTRICT,
    FOREIGN KEY (fk_Produto_idProduto) REFERENCES Produto (idProduto) ON DELETE RESTRICT
);

CREATE TABLE Disponibilidade_Fornecedor (
    fk_Produto_idProduto INT,
    idFornecedor INT,
    razaoSocial VARCHAR(255),
    Cnpj VARCHAR(255),
    PRIMARY KEY (fk_Produto_idProduto, idFornecedor),
    FOREIGN KEY (fk_Produto_idProduto) REFERENCES Produto (idProduto) ON DELETE RESTRICT
);

ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_Cliente
    FOREIGN KEY (fk_Cliente_idCliente)
    REFERENCES Cliente (idCliente)
    ON DELETE RESTRICT;
