DROP DATABASE IF EXISTS Hospital;
CREATE DATABASE Hospital;
USE Hospital;

# --------------------------------------------------------------------------------------
# ATIVIDADE 01
# --------------------------------------------------------------------------------------

# ------------ FORMAÇÃO ------------
CREATE TABLE IF NOT EXISTS formacao (
	id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(100) NOT NULL
);
INSERT INTO formacao(nome)
VALUES ("generalista"), 
       ("especialista"), 
       ("residente");

# ------------ ESPECIALIZAÇÃO ------------
CREATE TABLE IF NOT EXISTS especializacao(
	id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome VARCHAR(150) NOT NULL
);
INSERT INTO especializacao(nome)
VALUES ("pediatria"), 
       ("clínica geral"),
       ("gastroenterologia"),
       ("dermatologia"),
       ("cardiologia"), 
       ("ortopedia"),
       ("neurologia");

# ------------ MÉDICO ------------
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

# ------------ ESPECIALIZAÇÃO/MEDICO ------------
CREATE TABLE IF NOT EXISTS especializacaoMedico (
	id_medico INT,
    id_especializacao INT,
    PRIMARY KEY (id_medico, id_especializacao),
    FOREIGN KEY (id_medico) REFERENCES medico(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_especializacao) REFERENCES especializacao(id) ON DELETE CASCADE ON UPDATE CASCADE
);

# ------------ CONVÊNIO ------------
CREATE TABLE IF NOT EXISTS convenio (
	id INT PRIMARY KEY AUTO_INCREMENT,
    cnpj VARCHAR(20) NOT NULL,
    tempoCarencia INT
);

INSERT INTO convenio(cnpj, tempoCarencia)
VALUES ("00.000.000/0000-00", 5),
       ("11.111.111/1111-11", 3),
       ("22.222.222/2222-22", 4),
       ("33.333.333/3333-33", 6);

# ------------ PACIENTE ------------
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

# ------------ CONSULTA ------------
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

# ------------ MEDICAMENTO ------------
CREATE TABLE IF NOT EXISTS medicamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    dosagem VARCHAR(100)
);

# ------------ RECEITA ------------
CREATE TABLE IF NOT EXISTS receita (
    id INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT NOT NULL,
    instrucao VARCHAR(500),
    consulta INT,
    
    FOREIGN KEY (consulta) REFERENCES consulta(id) ON DELETE CASCADE ON UPDATE CASCADE
);

# ------------ RECEITA/MEDICAMENTO  ------------
CREATE TABLE IF NOT EXISTS receitaMedicamento (
    id_receita INT,
    id_medicamento INT,
    
    PRIMARY KEY (id_receita, id_medicamento),
    FOREIGN KEY (id_receita) REFERENCES receita(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_medicamento) REFERENCES medicamento(id) ON DELETE CASCADE ON UPDATE CASCADE
);

# --------------------------------------------------------------------------------------
# ATIVIDADE 02
# --------------------------------------------------------------------------------------
# ----------- TIPO QUARTO ----------- 
CREATE TABLE IF NOT EXISTS tipo_quarto(
	id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(200) NOT NULL,
    valor_diaria DOUBLE NOT NULL
);

INSERT INTO tipo_quarto(descricao, valor_diaria)
VALUES ("Apartamento", 350.00),
       ("Quarto Duplo", 200.00),
       ("Enfermaria", 100.00);

# ----------- QUARTO ----------- 
CREATE TABLE IF NOT EXISTS quarto(
	id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT NOT NULL,
    tipo INT,
    
    FOREIGN KEY (tipo) REFERENCES tipo_quarto(id)
);

# ----------- INTERNAÇÃO ----------- 
CREATE TABLE IF NOT EXISTS internacao(
	id INT PRIMARY KEY AUTO_INCREMENT,
    data_entrada DATE NOT NULL,
    data_prev_alta DATE NOT NULL,
    data_saida DATE NOT NULL,
    procedimento VARCHAR(200),
    quarto INT NOT NULL,
    paciente INT NOT NULL,
    medico INT NOT NULL,
    
    FOREIGN KEY (quarto) REFERENCES quarto(id),
    FOREIGN KEY (paciente) REFERENCES paciente(id),
    FOREIGN KEY (medico) REFERENCES medico(id)
);

# ----------- ENFERMEIRO ----------- 
CREATE TABLE IF NOT EXISTS enfermeiro(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    crn VARCHAR(20) NOT NULL
);

# ----------- INTERNACAO/ENFERMEIRO ----------- 
CREATE TABLE IF NOT EXISTS internacaoEnfermeiro(
	id_internacao INT NOT NULL,
    id_enfermeiro INT NOT NULL,
    
    FOREIGN KEY (id_internacao) REFERENCES internacao(id),
    FOREIGN KEY (id_enfermeiro) REFERENCES enfermeiro(id)    
);