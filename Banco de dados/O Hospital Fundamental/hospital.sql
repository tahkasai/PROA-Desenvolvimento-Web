DROP DATABASE IF EXISTS Hospital;
CREATE DATABASE Hospital;
USE Hospital;

-- ------------ FORMAÇÃO ------------
CREATE TABLE IF NOT EXISTS formacao (
	id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(100) NOT NULL
);

INSERT INTO formacao(nome)
VALUES ("generalista"), 
       ("especialista"), 
       ("residente");

-- ------------ ESPECIALIZAÇÃO ------------
CREATE TABLE IF NOT EXISTS especializacao(
	id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(150) NOT NULL
);

-- DADOS ESSENCIAIS - 7 especialidades
INSERT INTO especializacao(nome)
VALUES ("pediatria"), 
       ("clínica geral"),
       ("gastroenterologia"),
       ("dermatologia"),
       ("cardiologia"), 
       ("ortopedia"),
       ("neurologia");

-- ------------ MÉDICO ------------
CREATE TABLE IF NOT EXISTS Medico (
	id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
	crm VARCHAR(50) NOT NULL,
    nome VARCHAR(200) NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    rne VARCHAR(20),
    dataNasc DATE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) NOT NULL,
    especializacao INT NOT NULL,
    FOREIGN KEY (especializacao) REFERENCES especializacao(id)
);

-- ------------ ESPECIALIZAÇÃO/MEDICO ------------
CREATE TABLE IF NOT EXISTS especializacaoMedico (
	id_medico INT,
    id_especializacao INT,
    PRIMARY KEY (id_medico, id_especializacao),
    FOREIGN KEY (id_medico) REFERENCES medico(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_especializacao) REFERENCES especializacao(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ------------ CONVÊNIO ------------
CREATE TABLE IF NOT EXISTS convenio (
	id INT PRIMARY KEY AUTO_INCREMENT,
    cnpj VARCHAR(20) NOT NULL,
    tempoCarencia INT
);

-- ------------ PACIENTE ------------
CREATE TABLE IF NOT EXISTS paciente(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    dataNasc DATE NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(200) NOT NULL,
    convenio INT,
    FOREIGN KEY (convenio) REFERENCES convenio(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ------------ CONSULTA ------------
CREATE TABLE IF NOT EXISTS consulta(
	id INT PRIMARY KEY AUTO_INCREMENT,
    dataConsulta DATE NOT NULL,
    hora TIME NOT NULL,
    valor VARCHAR(5) NOT NULL,
    especialidade INT NOT NULL,
    paciente INT NOT NULL,
    medico INT NOT NULL,
    
    FOREIGN KEY (especialidade) REFERENCES especializacao(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (paciente) REFERENCES paciente(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (medico) REFERENCES medico(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ------------ MEDICAMENTO ------------
CREATE TABLE IF NOT EXISTS medicamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    dosagem VARCHAR(100)
);

-- ------------ RECEITA ------------
CREATE TABLE IF NOT EXISTS receita (
    id INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT NOT NULL,
    instrucao VARCHAR(500),
    consulta INT,
    
    FOREIGN KEY (consulta) REFERENCES consulta(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ------------ RECEITA/MEDICAMENTO  ------------
CREATE TABLE IF NOT EXISTS receitaMedicamento (
    id_receita INT,
    id_medicamento INT,
    
    PRIMARY KEY (id_receita, id_medicamento),
    FOREIGN KEY (id_receita) REFERENCES receita(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_medicamento) REFERENCES medicamento(id) ON DELETE CASCADE ON UPDATE CASCADE
);  

