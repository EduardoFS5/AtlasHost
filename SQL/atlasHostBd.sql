
CREATE DATABASE Atlashost;
USE Atlashost;

CREATE TABLE Usuario (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_registro DATE NOT NULL
);

CREATE TABLE Plano (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    descricao TEXT,
    preco_mensal DECIMAL(10,2) NOT NULL
);

CREATE TABLE Contrato (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    cpf_usuario CHAR(11) NOT NULL,
    id_plano INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    valor DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'ativo',
    CONSTRAINT fk_usuario FOREIGN KEY (cpf_usuario) REFERENCES Usuario(cpf),
    CONSTRAINT fk_plano FOREIGN KEY (id_plano) REFERENCES Plano(id_plano)
);
