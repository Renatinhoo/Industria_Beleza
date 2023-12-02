"-- Região
CREATE TABLE Regiao (
    Id_Regiao INT PRIMARY KEY,
    Nome_Regiao VARCHAR(255),
    Dimensao_Regiao INT
);

-- Veículo
CREATE TABLE Veiculo (
    Id_Veiculo INT PRIMARY KEY,
    Cor_Veiculo VARCHAR(50),
    Placa_Veiculo VARCHAR(20)
);

-- Vendedor
CREATE TABLE Vendedor (
    Id_Vendedor INT PRIMARY KEY,
    Nome_Vendedor VARCHAR(255),
    Id_Regiao INT,
    FOREIGN KEY (Id_Regiao) REFERENCES Regiao(Id_Regiao)
);

-- Responsável
CREATE TABLE Responsavel (
    Id_Responsavel INT PRIMARY KEY,
    Id_Vendedor INT,
    Id_Veiculo INT,
    Data_Responsavel DATE,
    FOREIGN KEY (Id_Vendedor) REFERENCES Vendedor(Id_Vendedor),
    FOREIGN KEY (Id_Veiculo) REFERENCES Veiculo(Id_Veiculo)
);

-- Cliente
CREATE TABLE Cliente (
    Id_Cliente INT PRIMARY KEY,
    Nome_Cliente VARCHAR(255),
    CPF_Cliente VARCHAR(15),
    Data_Nasc DATE
);

-- Nota Fiscal
CREATE TABLE Nota_Fiscal (
    Id_Nota INT PRIMARY KEY,
    Data_Hora DATETIME,
    Id_Vendedor INT,
    Id_Cliente INT,
    FOREIGN KEY (Id_Vendedor) REFERENCES Vendedor(Id_Vendedor),
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente)
);

-- Ponto Estratégico
CREATE TABLE Ponto_Estrategico (
    Id_Ponto INT PRIMARY KEY,
    Desc_Ponto VARCHAR(255),
    Id_Reg INT,
    Data_Pedido DATE,
    FOREIGN KEY (Id_Reg) REFERENCES Regiao(Id_Regiao)
);

-- Produto
CREATE TABLE Produto (
    Id_Produto INT PRIMARY KEY,
    Preco_Produto DECIMAL(10, 2),
    Desc_Produto VARCHAR(255),
    Quantidade_Produto INT
);

-- Itens Nota
CREATE TABLE Itens_Nota (
    Id_Item INT PRIMARY KEY,
    Id_Produto INT,
    Quantidade_Item INT,
    Id_Nota INT,
    FOREIGN KEY (Id_Produto) REFERENCES Produto(Id_Produto),
    FOREIGN KEY (Id_Nota) REFERENCES Nota_Fiscal(Id_Nota)
);

-- Inserções Região
INSERT INTO Regiao (Id_Regiao, Nome_Regiao, Dimensao_Regiao)
VALUES
    (11, 'Nova Região K', 170),
    (12, 'Nova Região L', 200),
    (13, 'Nova Região M', 120),
    (14, 'Nova Região N', 180),
    (15, 'Nova Região O', 150),
    (16, 'Nova Região P', 90),
    (17, 'Nova Região Q', 130),
    (18, 'Nova Região R', 160),
    (19, 'Nova Região S', 110),
    (20, 'Nova Região T', 140);

-- Inserções Veiculo
INSERT INTO Veiculo (Id_Veiculo, Cor_Veiculo, Placa_Veiculo)
VALUES
    (11, 'Rosa Brilhante', 'ABC111'),
    (12, 'Verde Água', 'XYZ222'),
    (13, 'Azul Celeste', 'DEF333'),
    (14, 'Laranja Pastel', 'GHI444'),
    (15, 'Amarelo Suave', 'JKL555'),
    (16, 'Roxo Lavanda', 'MNO666'),
    (17, 'Marrom Canela', 'PQR777'),
    (18, 'Cinza Pérola', 'STU888'),
    (19, 'Preto Fosco', 'VWX999'),
    (20, 'Branco Pérola', 'YZA000');

-- Inserções Vendedor
INSERT INTO Vendedor (Id_Vendedor, Nome_Vendedor, Id_Regiao)
VALUES
    (11, 'Pedro Lima', 10),
    (12, 'Mariana Oliveira', 3),
    (13, 'Lucas Costa', 6),
    (14, 'Rafael Santos', 2),
    (15, 'Ana Souza', 7),
    (16, 'Gustavo Rocha', 1),
    (17, 'Juliana Pereira', 8),
    (18, 'Carlos Silva', 4),
    (19, 'Fernanda Lima', 9),
    (20, 'Aline Ferreira', 5);

-- Inserções Responsavel
INSERT INTO Responsavel (Id_Responsavel, Id_Vendedor, Id_Veiculo, Data_Responsavel)
VALUES
    (11, 12, 14, '2023-11-15'),
    (12, 15, 18, '2023-12-20'),
    (13, 18, 12, '2023-01-25'),
    (14, 11, 16, '2023-02-10'),
    (15, 13, 11, '2023-03-05'),
    (16, 17, 20, '2023-04-12'),
    (17, 19, 13, '2023-05-18'),
    (18, 20, 15, '2023-06-22'),
    (19, 14, 19, '2023-07-30'),
    (20, 16, 17, '2023-08-08');

-- Inserções Cliente
INSERT INTO Cliente (Id_Cliente, Nome_Cliente, CPF_Cliente, Data_Nasc)
VALUES
    (11, 'Thais Silva', '111.222.333-44', '1992-05-12'),
    (12, 'Leonardo Oliveira', '222.333.444-55', '1987-08-28'),
    (13, 'Carla Santos', '333.444.555-66', '1995-03-15'),
    (14, 'Bruno Rocha', '444.555.666-77', '1983-11-02'),
    (15, 'Patricia Pereira', '555.666.777-88', '1990-07-19'),
    (16, 'Marcos Costa', '666.777.888-99', '1985-04-06'),
    (17, 'Vanessa Souza', '777.888.999-00', '1998-09-23'),
    (18, 'Rodrigo Silva', '888.999.000-11', '1986-12-30'),
    (19, 'Amanda Martins', '999.000.111-22', '1993-01-08'),
    (20, 'Henrique Ferreira', '000.111.222-33', '1984-06-25');

-- Inserções Fiscal
INSERT INTO Nota_Fiscal (Id_Nota, Data_Hora, Id_Vendedor, Id_Cliente)
VALUES
    (11, CONVERT(DATETIME, '2023-11-02 08:30:00', 120), 11, 13),
    (12, CONVERT(DATETIME, '2023-12-05 12:15:00', 120), 15, 17),
    (13, CONVERT(DATETIME, '2023-01-10 14:45:00', 120), 18, 15),
    (14, CONVERT(DATETIME, '2023-02-15 10:20:00', 120), 12, 12),
    (15, CONVERT(DATETIME, '2023-03-20 09:00:00', 120), 14, 18),
    (16, CONVERT(DATETIME, '2023-04-25 16:30:00', 120), 17, 20),
    (17, CONVERT(DATETIME, '2023-05-30 11:45:00', 120), 19, 11),
    (18, CONVERT(DATETIME, '2023-06-05 13:00:00', 120), 20, 14),
    (19, CONVERT(DATETIME, '2023-07-12 07:00:00', 120), 13, 16),
    (20, CONVERT(DATETIME, '2023-08-18 15:10:00', 120), 16, 19);

-- Inserções Estratégico
INSERT INTO Ponto_Estrategico (Id_Ponto, Desc_Ponto, Id_Reg, Data_Pedido)
VALUES
    (11, 'Novo Ponto 11', 13, '2023-11-05'),
    (12, 'Novo Ponto 12', 17, '2023-12-08'),
    (13, 'Novo Ponto 13', 20, '2023-01-12'),
    (14, 'Novo Ponto 14', 11, '2023-02-18'),
    (15, 'Novo Ponto 15', 14, '2023-03-22'),
    (16, 'Novo Ponto 16', 16, '2023-04-28'),
    (17, 'Novo Ponto 17', 19, '2023-05-02'),
    (18, 'Novo Ponto 18', 12, '2023-06-10'),
    (19, 'Novo Ponto 19', 15, '2023-07-15'),
    (20, 'Novo Ponto 20', 19, '2023-08-20');

-- Inserções Produto
INSERT INTO Produto (Id_Produto, Preco_Produto, Desc_Produto, Quantidade_Produto)
VALUES
    (11, 45.99, 'Novo Produto 11', 100),
    (12, 25.50, 'Novo Produto 12', 150),
    (13, 22.75, 'Novo Produto 13', 120),
    (14, 55.20, 'Novo Produto 14', 200),
    (15, 18.99, 'Novo Produto 15', 180),
    (16, 35.75, 'Novo Produto 16', 90),
    (17, 50.00, 'Novo Produto 17', 130),
    (18, 65.50, 'Novo Produto 18', 160),
    (19, 20.30, 'Novo Produto 19', 110),
    (20, 15.75, 'Novo Produto 20', 140);

-- Inserções Itens Nota
INSERT INTO Itens_Nota (Id_Item, Id_Produto, Quantidade_Item, Id_Nota)
VALUES
    (11, 13, 2, 11),
    (12, 18, 3, 12),
    (13, 11, 1, 13),
    (14, 16, 4, 14),
    (15, 15, 2, 15),
    (16, 20, 1, 16),
    (17, 12, 3, 17),
    (18, 17, 2, 18),
    (19, 14, 5, 19),
    (20, 19, 1, 20);

-- Pontos estratégicos com seus detalhes de região
SELECT Ponto_Estrategico.*, Regiao.Nome_Regiao
FROM Ponto_Estrategico
INNER JOIN Regiao ON Ponto_Estrategico.Id_Reg = Regiao.Id_Regiao;

-- Nomes das regiões
SELECT Nome_Regiao FROM Regiao;

-- Vendedores com detalhes de responsáveis do mês anterior
SELECT Vendedor.*, Responsavel.Id_Veiculo, Responsavel.Data_Responsavel
FROM Vendedor
INNER JOIN Responsavel ON Vendedor.Id_Vendedor = Responsavel.Id_Vendedor
WHERE MONTH(Responsavel.Data_Responsavel) = MONTH(GETDATE()) - 1;

-- Vendedores com detalhes de suas regiões
SELECT Vendedor.*, Regiao.Nome_Regiao
FROM Vendedor
INNER JOIN Regiao ON Vendedor.Id_Regiao = Regiao.Id_Regiao;

-- Produtos vendidos por um vendedor específico
SELECT Produto.*
FROM Produto
INNER JOIN Itens_Nota ON Produto.Id_Produto = Itens_Nota.Id_Produto
INNER JOIN Nota_Fiscal ON Itens_Nota.Id_Nota = Nota_Fiscal.Id_Nota
WHERE Nota_Fiscal.Id_Vendedor = Id_Vendedor;

-- Vendedores que venderam um produto específico
SELECT Vendedor.*
FROM Vendedor
INNER JOIN Nota_Fiscal ON Vendedor.Id_Vendedor = Nota_Fiscal.Id_Vendedor
INNER JOIN Itens_Nota ON Nota_Fiscal.Id_Nota = Itens_Nota.Id_Nota
WHERE Itens_Nota.Id_Produto = Id_Produto;

-- Produtos não associados a notas fiscais
SELECT Produto.*
FROM Produto
LEFT JOIN Itens_Nota ON Produto.Id_Produto = Itens_Nota.Id_Produto
WHERE Itens_Nota.Id_Produto IS NULL;

-- Responsáveis com detalhes de veículos
SELECT Responsavel.*, Veiculo.Cor_Veiculo, Veiculo.Placa_Veiculo
FROM Responsavel
INNER JOIN Veiculo ON Responsavel.Id_Veiculo = Veiculo.Id_Veiculo
WHERE Veiculo.Id_Veiculo = Responsavel.Id_Veiculo;

-- Quantidade de itens por nota fiscal
SELECT Id_Nota, COUNT(Id_Item) AS Quantidade_Itens
FROM Itens_Nota
GROUP BY Id_Nota;