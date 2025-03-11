CREATE DATABASE SalaoBeleiro;
USE SalaoBeleiro;

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE,
    data_cadastro DATE
);

CREATE TABLE Funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    data_contratacao DATE
);

CREATE TABLE Servicos (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(200) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    duracao_minutos INT NOT NULL
);

CREATE TABLE Agendamentos (
    id_agendamento INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_funcionario INT,
    id_servico INT,
    data_hora DATETIME NOT NULL,
    status ENUM('Agendado', 'Concluído', 'Cancelado') DEFAULT 'Agendado',
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario),
    FOREIGN KEY (id_servico) REFERENCES Servicos(id_servico)
);

CREATE TABLE Pagamentos (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_agendamento INT,
    valor DECIMAL(10,2) NOT NULL,
    metodo_pagamento ENUM('Dinheiro', 'Cartão', 'Pix') NOT NULL,
    data_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_agendamento) REFERENCES Agendamentos(id_agendamento)
);


------------------------------------------------------------------------------------------------------------------------------------


-- Inserindo clientes
INSERT INTO Clientes (nome, telefone, email) VALUES
('João Silva', '11987654321', 'joao@exemplo.com'),
('Maria Oliveira', '11912345678', 'maria@exemplo.com'),
('Carlos Souza', '11876543210', 'carlos@exemplo.com'),
('Ana Costa', '11765432109', 'ana@exemplo.com'),
('Pedro Santos', '11654321098', 'pedro@exemplo.com');

-- Inserindo funcionários
INSERT INTO Funcionarios (nome, cargo, telefone, email) VALUES
('Fernanda Silva', 'Cabeleireiro', '11900000000', 'fernanda@salão.com'),
('Rafael Oliveira', 'Manicure', '11911111111', 'rafael@salão.com'),
('Paula Costa', 'Atendente', '11922222222', 'paula@salão.com'),
('Lucas Santos', 'Cabeleireiro', '11933333333', 'lucas@salão.com'),
('Mariana Alves', 'Cabeleireiro', '11944444444', 'mariana@salão.com');

-- Inserindo serviços
INSERT INTO Servicos (descricao, preco, duracao_minutos) VALUES
('Corte de cabelo', 50.00, 30),
('Pintura de cabelo', 120.00, 60),
('Manicure', 40.00, 45),
('Pedicure', 50.00, 60),
('Escova', 80.00, 45);

-- Inserindo agendamentos
INSERT INTO Agendamentos (id_cliente, id_funcionario, id_servico, data_hora, status) VALUES
(1, 1, 1, '2025-03-10 10:00:00', 'Agendado'),
(2, 2, 3, '2025-03-11 14:00:00', 'Agendado'),
(3, 1, 2, '2025-03-12 15:00:00', 'Concluído'),
(4, 3, 4, '2025-03-13 11:00:00', 'Cancelado'),
(5, 4, 5, '2025-03-14 16:00:00', 'Agendado');

-- Inserindo pagamentos
INSERT INTO Pagamentos (id_agendamento, valor, metodo_pagamento) VALUES
(1, 50.00, 'Dinheiro'),
(2, 40.00, 'Cartão'),
(3, 120.00, 'Pix'),
(4, 50.00, 'Dinheiro'),
(5, 80.00, 'Cartão');
