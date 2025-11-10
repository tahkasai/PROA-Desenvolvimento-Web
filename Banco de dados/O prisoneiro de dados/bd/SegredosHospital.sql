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

# --------------------------------------------------------------------------------------
# ATIVIDADE 03
# --------------------------------------------------------------------------------------
INSERT INTO medico(crm, nome, cpf, dataNasc, email, especializacao) 
VALUES 
("CRM/SP 123456", "Dra. Tainá Kasai Serafim", "430.000.000-00", '1995-09-26', "tainakasai01@gmail.com", 1),
("CRM/SP 234567", "Dr. Carlos Silva", "111.222.333-44", '1975-03-15', "carlos.silva@hospital.com", 2),
("CRM/RJ 345678", "Dra. Maria Santos", "222.333.444-55", '1980-07-22', "maria.santos@hospital.com", 3),
("CRM/SP 456789", "Dr. João Oliveira", "333.444.555-66", '1978-11-30', "joao.oliveira@hospital.com", 4),
("CRM/MG 567890", "Dra. Ana Costa", "444.555.666-77", '1982-05-18', "ana.costa@hospital.com", 5),
("CRM/SP 678901", "Dr. Pedro Almeida", "555.666.777-88", '1970-09-25', "pedro.almeida@hospital.com", 6),
("CRM/RS 789012", "Dra. Juliana Ferreira", "666.777.888-99", '1985-12-10', "juliana.ferreira@hospital.com", 7),
("CRM/SP 890123", "Dr. Roberto Lima", "777.888.999-00", '1976-04-08', "roberto.lima@hospital.com", 1),
("CRM/BA 901234", "Dra. Fernanda Rocha", "888.999.000-11", '1983-08-14', "fernanda.rocha@hospital.com", 2),
("CRM/SP 012345", "Dr. Lucas Martins", "999.000.111-22", '1979-02-20', "lucas.martins@hospital.com", 3);

INSERT INTO especializacaoMedico (id_medico, id_especializacao) 
VALUES 
(1, 2), (1, 4),  
(2, 3), (2, 5),  
(3, 1),          
(5, 2), (5, 7),  
(7, 5);          

INSERT INTO paciente (nome, cpf, dataNasc, telefone, email, convenio) 
VALUES 
('Agatha Anjos', '123.456.789-00', '2006-01-28', '(11)99999-0001', 'agatha@email.com', 1),
('Wellington Augusto', '987.654.321-00', '2005-01-26', '(11)98888-0002', 'well@email.com', 2),
('João Pedro Silva', '321.654.987-11', '1990-05-12', '(11)91111-1111', 'joao.silva@email.com', 1),
('Maria Eduarda Costa', '654.321.987-22', '1985-08-20', '(11)92222-2222', 'maria.costa@email.com', 2),
('Carlos Alberto Souza', '789.456.123-33', '1978-12-15', '(11)93333-3333', 'carlos.souza@email.com', 3),
('Ana Paula Lima', '147.258.369-44', '1992-03-08', '(11)94444-4444', 'ana.lima@email.com', 4),
('Pedro Henrique Santos', '258.369.147-55', '1988-11-25', '(11)95555-5555', 'pedro.santos@email.com', 1),
('Juliana Oliveira', '369.147.258-66', '1995-07-30', '(11)96666-6666', 'juliana.oliveira@email.com', NULL),
('Roberto Carlos Alves', '741.852.963-77', '1970-01-18', '(11)97777-7777', 'roberto.alves@email.com', 2),
('Fernanda Maria Silva', '852.963.741-88', '1982-09-22', '(11)98888-8888', 'fernanda.silva@email.com', 3),
('Lucas Fernando Costa', '963.741.852-99', '1998-04-14', '(11)99999-9999', 'lucas.costa@email.com', NULL),
('Mariana Almeida', '159.753.486-00', '1987-06-05', '(11)91234-5678', 'mariana.almeida@email.com', 4),
('Rafael Santos Pereira', '357.159.486-11', '1993-10-28', '(11)98765-4321', 'rafael.pereira@email.com', NULL),
('Camila Rodrigues', '486.159.357-22', '1991-02-17', '(11)95432-1098', 'camila.rodrigues@email.com', 1),
('Gabriel Martins', '753.951.852-33', '1989-12-09', '(11)96543-2109', 'gabriel.martins@email.com', 2);

INSERT INTO consulta (dataConsulta, hora, valor, especialidade, paciente, medico) 
VALUES 
('2015-03-15', '10:00:00', '180', 2, 3, 2),
('2015-07-20', '14:30:00', '200', 1, 1, 1),
('2016-02-10', '09:00:00', '220', 3, 4, 3),
('2016-08-25', '15:00:00', '190', 4, 5, 4),
('2017-01-30', '11:30:00', '250', 5, 6, 5),
('2017-06-12', '08:30:00', '210', 6, 7, 6),
('2018-04-18', '16:00:00', '200', 7, 8, 7),
('2018-09-22', '10:30:00', '180', 1, 9, 8),
('2019-03-08', '13:00:00', '240', 2, 10, 9),
('2019-11-15', '09:30:00', '220', 3, 11, 10),
('2020-02-20', '14:00:00', '200', 1, 1, 1),  
('2020-07-05', '11:00:00', '190', 4, 3, 4),  
('2021-01-12', '15:30:00', '230', 5, 12, 5),
('2021-05-28', '08:00:00', '210', 2, 13, 2),
('2021-09-14', '10:00:00', '200', 6, 14, 6),
('2021-12-03', '16:30:00', '220', 7, 15, 7),
('2022-01-01', '09:00:00', '250', 3, 8, 3),  
('2020-10-10', '13:30:00', '200', 1, 2, 1),  -
('2019-05-18', '11:00:00', '210', 2, 5, 2),
('2020-11-22', '15:00:00', '200', 3, 7, 3);

INSERT INTO medicamento (nome, dosagem) 
VALUES 
('Paracetamol', '500mg'),
('Ibuprofeno', '400mg'),
('Amoxicilina', '500mg'),
('Dipirona', '1g'),
('Omeprazol', '20mg'),
('Losartana', '50mg'),
('Metformina', '850mg'),
('Diclofenaco', '50mg'),
('Azitromicina', '500mg'),
('Prednisona', '20mg');

INSERT INTO receita (quantidade, instrucao, consulta) 
VALUES 
(10, 'Tomar 1 comprimido a cada 8 horas', 1),
(5, 'Tomar 1 comprimido antes das refeições', 2),
(15, 'Tomar 1 comprimido a cada 12 horas', 3),
(10, 'Tomar 1 comprimido a cada 6 horas em caso de dor', 4),
(20, 'Tomar 1 comprimido pela manhã em jejum', 5),
(30, 'Tomar 1 comprimido por dia', 6),
(10, 'Tomar 1 comprimido a cada 8 horas', 7),
(15, 'Tomar 1 comprimido a cada 12 horas após as refeições', 8),
(7, 'Tomar 1 comprimido por dia', 9),
(10, 'Tomar em caso de dor, máximo 3x ao dia', 10),
(20, 'Tomar 1 comprimido antes do café da manhã', 11),
(12, 'Tomar 1 comprimido a cada 8 horas', 12),
(15, 'Tomar 1 comprimido 2x ao dia', 13),
(30, 'Tomar 1 comprimido ao dia', 14),
(10, 'Tomar 1 comprimido a cada 6 horas se necessário', 15),
(5, 'Tomar 1 comprimido por dia pela manhã', 16),
(8, 'Tomar 1 comprimido a cada 12 horas', 17),
(10, 'Tomar em caso de dor, máximo 4x ao dia', 18),
(20, 'Tomar 1 comprimido antes do almoço', 19),
(12, 'Tomar 1 comprimido a cada 8 horas', 20);

INSERT INTO receitaMedicamento (id_receita, id_medicamento) 
VALUES 
(1, 1), (1, 2), (1, 5),      
(2, 3), (2, 4),              
(3, 3), (3, 5), (3, 1),     
(4, 2), (4, 8),             
(5, 5), (5, 6),             
(6, 6), (6, 7),              
(7, 3), (7, 4), (7, 9),      
(8, 1), (8, 2),             
(9, 9), (9, 10),             
(10, 2), (10, 4),            
(11, 5), (11, 7), (11, 8),   
(12, 3), (12, 6),            
(13, 7), (14, 6), (15, 8), (16, 10), (17, 4), (18, 5), (19, 1), (20, 2);

INSERT INTO quarto(numero, tipo)
VALUES 
(101, 1),  
(102, 1),  
(201, 2),  
(202, 2),  
(301, 3), 
(302, 3);  

INSERT INTO enfermeiro(nome, cpf, crn)
VALUES
('Carla Mendes', '111.111.111-11', 'COREN-SP 123456'),
('José Santos', '222.222.222-22', 'COREN-SP 234567'),
('Patrícia Lima', '333.333.333-33', 'COREN-RJ 345678'),
('Ricardo Silva', '444.444.444-44', 'COREN-SP 456789'),
('Amanda Souza', '555.555.555-55', 'COREN-MG 567890'),
('Bruno Costa', '666.666.666-66', 'COREN-SP 678901'),
('Daniela Rocha', '777.777.777-77', 'COREN-RS 789012'),
('Eduardo Alves', '888.888.888-88', 'COREN-SP 890123'),
('Fabiana Martins', '999.999.999-99', 'COREN-BA 901234'),
('Gustavo Pereira', '101.010.101-01', 'COREN-SP 012345');

INSERT INTO internacao(data_entrada, data_prev_alta, data_saida, procedimento, quarto, paciente, medico)
VALUES
('2016-05-10', '2016-05-17', '2016-05-16', 'Cirurgia de apendicite', 1, 3, 2),
('2017-08-15', '2017-08-22', '2017-08-21', 'Tratamento de pneumonia', 3, 1, 8),
('2018-02-20', '2018-03-05', '2018-03-04', 'Fratura de fêmur', 2, 5, 6),
('2019-06-12', '2019-06-19', '2019-06-18', 'Cirurgia cardíaca', 1, 9, 5),
('2020-03-08', '2020-03-15', '2020-03-14', 'Tratamento de gastrite aguda', 4, 3, 3),
('2021-07-22', '2021-07-29', '2021-07-28', 'Observação neurológica', 5, 1, 7),       
('2021-11-30', '2021-12-10', '2021-12-09', 'Tratamento dermatológico', 6, 10, 4);

INSERT INTO internacaoEnfermeiro(id_internacao, id_enfermeiro)
VALUES
(1, 1), (1, 2), (1, 3),  
(2, 2), (2, 4), (2, 5), 
(3, 3), (3, 6),         
(4, 1), (4, 7), (4, 8),  
(5, 4), (5, 9),          
(6, 5), (6, 10),     
(7, 6), (7, 7), (7, 9); 
