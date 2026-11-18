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

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL,
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
('Luan Santana', 'Luanzin@email.com', '19999990002', 'Tokyo', TRUE),
('Anne Shirley', 'Annes4@email.com', NULL, 'Avonlea', TRUE),
('Gilbert Blythe', 'Gilberto@email.com', '19999990004', 'Campinas', TRUE),
('Elisa Rocha', 'elisa6@email.com', NULL, 'Limeira', TRUE),
('Felipe Lima', 'felipe7@email.com', '19999990006', 'Americana', TRUE),
('Gabriela Alves', 'gabriela8@email.com', '19999990007', 'Piracicaba', TRUE),
('Henrique Costa', 'henrique0@email.com', NULL, 'Limeira', FALSE),
('Isabela Martins', 'isabela1@email.com', '19999990009', 'Campinas', TRUE),
('João Pereira', 'joao10@email.com', '19999990010', 'Limeira', TRUE);

