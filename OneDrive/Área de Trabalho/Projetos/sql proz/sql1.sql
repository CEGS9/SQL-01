--criação das tabelas

CREATE DATABASE LojaManutencao;
USE LojaManutencao;

CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Servicos (
    ServicoID INT AUTO_INCREMENT PRIMARY KEY,
    NomeServico VARCHAR(100) NOT NULL,
    Preco DECIMAL(10, 2)
);

CREATE TABLE Ordens (
    OrdemID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    ServicoID INT,
    DataOrdem DATE NOT NULL,
    Status VARCHAR(50),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (ServicoID) REFERENCES Servicos(ServicoID)
);


--inserção de dados
INSERT INTO Clientes (Nome, Telefone, Email)
VALUES
('Alvaro', '4194218759', 'joao@email.com'),
('Ana', '41954821645', 'maria@email.com'),
('Aline', '41958636547', 'carlos@email.com');

INSERT INTO Servicos (NomeServico, Preco)
VALUES
('Troca de Tela', 300.00),
('Reparo de Placa', 500.00),
('Limpeza Interna', 150.00);

INSERT INTO Ordens (ClienteID, ServicoID, DataOrdem, Status)
VALUES
(1, 1, '2025-01-15', 'Concluído'),
(2, 2, '2025-01-16', 'Pendente'),
(3, 3, '2025-01-17', 'Em Progresso');

--consultado dados
SELECT 
    Ordens.OrdemID,
    Clientes.Nome AS NomeCliente,
    Servicos.NomeServico,
    Ordens.DataOrdem,
    Ordens.Status
FROM 
    Ordens
JOIN 
    Clientes ON Ordens.ClienteID = Clientes.ClienteID
JOIN 
    Servicos ON Ordens.ServicoID = Servicos.ServicoID;

-- --

SELECT 
    Clientes.Nome AS NomeCliente,
    SUM(Servicos.Preco) AS TotalGasto
FROM 
    Ordens
JOIN 
    Clientes ON Ordens.ClienteID = Clientes.ClienteID
JOIN 
    Servicos ON Ordens.ServicoID = Servicos.ServicoID
GROUP BY 
    Clientes.Nome;

-- --

SELECT 
    Ordens.OrdemID,
    Clientes.Nome AS NomeCliente,
    Servicos.NomeServico,
    Ordens.DataOrdem,
    Ordens.Status
FROM 
    Ordens
JOIN 
    Clientes ON Ordens.ClienteID = Clientes.ClienteID
JOIN 
    Servicos ON Ordens.ServicoID = Servicos.ServicoID
WHERE 
    Ordens.Status = 'Pendente';

