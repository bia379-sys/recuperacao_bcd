-- Active: 1794917694348@@127.0.0.1@3308@beatriz_recuperacao_bcd
CREATE DATABASE BEATRIZ_RECUPERACAO_BCD;
USE BEATRIZ_RECUPERACAO_BCD;  

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE,
    telefone VARCHAR(20),
    cidade VARCHAR(60) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);
CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE produto (                        --cria a tabela
    id_produto INT PRIMARY KEY AUTO_INCREMENT,-- relaciona id_produto como chave primaria, int relaciona ao tipo, AUTO_INCREMENT = gerado automaticamente
    nome VARCHAR(100) NOT NULL, -- Atribui o nome do item, a quantidade máxima de caracteres e indica que é uma informação obrigatoria (sendo o mesmo para preço)
    preco DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE, -- relaciona a coluna ativo, impede que esteja sem informações
    id_categoria INT NOT NULL, -- relaciona id_categoria como chave estrageira conectando a outra tabela
    CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria)
);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    status ENUM('ABERTO','PREPARANDO','FINALIZADO','CANCELADO') NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
);

CREATE TABLE item_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    observacao VARCHAR(150),
    CONSTRAINT fk_item_pedido FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido),
    CONSTRAINT fk_item_produto FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto)
);

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Olivia Rodrigo', 'Olier@email.com', '19999990001', 'Itapetininga', TRUE),
('Luan Santana', 'Luanzin@email.com', '19999990002', 'São Paulo', TRUE),
('Anne Shirley', 'Annes4@email.com', NULL, 'Avonlea', TRUE),
('Gilbert Blythe', 'Gilberto@email.com', '19999990004', 'Campinas', TRUE),
('Takashi Mitsuya', 'takashi@email.com', NULL, 'Tokyo', TRUE),
('Peter Parker', 'peterpk@email.com', '19999990006', 'Nova York', TRUE),
('Anthony Edward Stark', 'playboizinho@email.com', '19999990007', 'Nova York', FALSE),
('Loki Odinson', 'eusouumdeus@email.com', NULL, NULL, FALSE),
('Thor Odinson', 'pirataanjo@email.com', '19999990009', 'Asgard', TRUE),
('Dean Winchester', 'impala67@email.com', '19999990010', 'Rio de Janeiro', TRUE),
('Sam Winchester', 'perdimeusapato@email.com', '19999990011', 'Rio de Janeiro', TRUE),
('Gustavo Gomez', 'xerife@email.com', '19999990015', 'São Paulo', TRUE),
('Piquerez', 'eopique@email.com', '19999990022', 'São Paulo', TRUE),
('Manjiro Sano', 'mikey@email.com', '19999990012', 'Tokyo', FALSE),
('Takemichi Hanagaki', 'chorao@email.com', '19999990013', 'Tokyo', TRUE),
('Chifuyu Matsuno', 'voltabaji@email.com', '19999990014', 'Tokyo', TRUE);

INSERT INTO categoria (nome) VALUES
('Cafés'), ('Bebidas Geladas'), ('Sucos'), ('Outros');

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Café Espresso', 7.00, TRUE, 1), ('Café Duplo', 10.00, TRUE, 1),
('Café com Leite', 9.50, TRUE, 1), ('Cappuccino', 13.00, TRUE, 1),
('Mocha Chocolate', 15.50, TRUE, 1), ('Cold Brew', 14.00, TRUE, 2),
('Frappé de Chocolate', 18.00, TRUE, 2), ('Suco de Laranja', 11.00, TRUE, 3),
('Brownie', 9.00, TRUE, 4), ('Cheesecake', 14.50, TRUE, 4),
('Cookie de Chocolate', 7.50, TRUE, 4), ('Pão de Queijo', 6.50, TRUE, 4),
('Café gelado', 8.00, TRUE, 1), ('Flat white', 16.00, TRUE, 1),
('Croissant', 12.00, TRUE, 4), ('Sanduíche Natural', 16.00, TRUE, 4),
('Chá Matte', 10.00, TRUE, 2), ('Chá Verde', 16.00, TRUE, 2),
('Suco de Melancia', 12.00, TRUE, 3), ('Suco de Maracujá', 12.00, TRUE, 3),
('Suco de Goiaba', 12.00, TRUE, 3), ('Suco de Morango com Laranja ', 16.00, TRUE, 3),
('Smoothie', 12.00, TRUE, 2), ('Suco de Laranja e Maracujá', 16.00, TRUE, 3),
('Combo Café + Pão de Queijo', 12.50, TRUE, 5),
('Combo Cappuccino + Brownie', 20.00, TRUE, 5), ('Torta Especial', 22.00, FALSE, 5);

INSERT INTO pedido (data_pedido, status, valor_total, id_cliente) VALUES
('2026-09-01 08:15:00', 'FINALIZADO', 16.00, 1),
('2026-09-01 09:30:00', 'FINALIZADO', 26.00, 2),
('2026-09-02 10:20:00', 'CANCELADO', 18.00, 3),
('2026-09-03 14:10:00', 'FINALIZADO', 35.50, 1),
('2026-09-04 16:40:00', 'FINALIZADO', 20.00, 4),
('2026-09-05 11:05:00', 'PREPARANDO', 31.50, 5),
('2026-09-06 08:50:00', 'FINALIZADO', 28.00, 6),
('2026-09-07 17:25:00', 'FINALIZADO', 44.00, 2),
('2026-09-08 13:15:00', 'ABERTO', 13.00, 7),
('2026-09-09 09:45:00', 'FINALIZADO', 39.00, 1);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(1,1,1,7.00,NULL),(1,9,1,9.00,NULL),(2,4,2,13.00,'Sem canela'),
(3,7,1,18.00,NULL),(4,5,1,15.50,NULL),(4,16,1,20.00,NULL),
(5,16,1,20.00,NULL),(6,4,1,13.00,NULL),(6,7,1,18.00,NULL),
(7,6,2,14.00,NULL),(8,14,2,16.00,NULL),(8,12,2,6.00,NULL),
(9,4,1,13.00,NULL),(10,3,2,9.50,NULL),(10,16,1,20.00,NULL);

INSERT INTO forma_pagamento (descricao) VALUES
('Dinheiro'), ('PIX'), ('Cartão de Crédito'), ('Cartão de Débito');

INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(1,2,16.00,'2026-09-01 08:20:00'),(2,4,26.00,'2026-09-01 09:40:00'),
(4,3,35.50,'2026-09-03 14:20:00'),(5,2,20.00,'2026-09-04 16:45:00'),
(7,1,28.00,'2026-09-06 09:00:00'),(8,3,30.00,'2026-09-07 17:30:00'),
(8,2,14.00,'2026-09-07 17:31:00'),(10,2,39.00,'2026-09-09 09:50:00');