# PARTE 3 - Alimentando o banco de dados
Crie scripts de povoamento das tabelas desenvolvidas na atividade anterior. Observe as seguintes atividades: 
1. Inclua ao menos dez médicos de diferentes especialidades.
2. Ao menos sete especialidades (considere a afirmação de que “entre as especialidades há pediatria, clínica geral, gastrenterologia e dermatologia”).
3. Inclua ao menos 15 pacientes.
4. Registre 20 consultas de diferentes pacientes e diferentes médicos (alguns pacientes realizam mais que uma consulta). As consultas devem ter ocorrido entre 01/01/2015 e 01/01/2022. Ao menos dez consultas devem ter receituário com dois ou mais medicamentos.
5. Inclua ao menos quatro convênios médicos, associe ao menos cinco pacientes e cinco consultas.
6. Criar entidade de relacionamento entre médico e especialidade. 
7. Criar Entidade de Relacionamento entre internação e enfermeiro. 
8. Arrumar a chave estrangeira do relacionamento entre convênio e médico.
9. Criar entidade entre internação e enfermeiro.
10. Colocar chaves estrangeira dentro da internação (Chaves Médico e Paciente).
11. Registre ao menos sete internações. Pelo menos dois pacientes devem ter se internado mais de uma vez. Ao menos três quartos devem ser cadastrados. As internações devem ter ocorrido entre 01/01/2015 e 01/01/2022.
12. Considerando que “a princípio o hospital trabalha com apartamentos, quartos duplos e enfermaria”, inclua ao menos esses três tipos com valores diferentes.
13. Inclua dados de dez profissionais de enfermaria. Associe cada internação a ao menos dois enfermeiros.
14. Os dados de tipo de quarto, convênio e especialidade são essenciais para a operação do sistema e, portanto, devem ser povoados assim que o sistema for instalado.

## Resolução da atividade
```bash
# ------------ ESPECIALIZAÇÃO ------------
INSERT INTO especializacao(nome)
VALUES ("cardiologia"), 
       ("ortopedia"),
       ("neurologia");

# ------------ TIPO QUARTO ------------
INSERT INTO tipo_quarto(descricao, valor_diaria)
VALUES ("Apartamento", 350.00),
       ("Quarto Duplo", 200.00),
       ("Enfermaria", 100.00);

# ------------ CONVÊNIO ------------
INSERT INTO convenio(cnpj, tempoCarencia)
VALUES ("22.222.222/2222-22", 4),
       ("33.333.333/3333-33", 6);

# ------------ MÉDICOS ------------
INSERT INTO medico(crm, nome, cpf, dataNasc, email, especializacao) 
VALUES 
("CRM/SP 234567", "Dr. Carlos Silva", "111.222.333-44", '1975-03-15', "carlos.silva@hospital.com", 2),
("CRM/RJ 345678", "Dra. Maria Santos", "222.333.444-55", '1980-07-22', "maria.santos@hospital.com", 3),
("CRM/SP 456789", "Dr. João Oliveira", "333.444.555-66", '1978-11-30', "joao.oliveira@hospital.com", 4),
("CRM/MG 567890", "Dra. Ana Costa", "444.555.666-77", '1982-05-18', "ana.costa@hospital.com", 5),
("CRM/SP 678901", "Dr. Pedro Almeida", "555.666.777-88", '1970-09-25', "pedro.almeida@hospital.com", 6),
("CRM/RS 789012", "Dra. Juliana Ferreira", "666.777.888-99", '1985-12-10', "juliana.ferreira@hospital.com", 7),
("CRM/SP 890123", "Dr. Roberto Lima", "777.888.999-00", '1976-04-08', "roberto.lima@hospital.com", 1),
("CRM/BA 901234", "Dra. Fernanda Rocha", "888.999.000-11", '1983-08-14', "fernanda.rocha@hospital.com", 2),
("CRM/SP 012345", "Dr. Lucas Martins", "999.000.111-22", '1979-02-20', "lucas.martins@hospital.com", 3);

# ------------ ESPECIALIDADE/MÉDICO ------------
INSERT INTO especializacaoMedico (id_medico, id_especializacao) 
VALUES 
(2, 3), (2, 5),  
(3, 1),         
(5, 2), (5, 7),  
(7, 5);          

# ------------ PACIENTES (15 pacientes) ------------
INSERT INTO paciente (nome, cpf, dataNasc, telefone, email, convenio) 
VALUES 
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

# ------------ CONSULTAS ------------
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
('2020-10-10', '13:30:00', '200', 1, 2, 1); 

# ------------ MEDICAMENTOS ------------
INSERT INTO medicamento (nome, dosagem) 
VALUES 
('Amoxicilina', '500mg'),
('Dipirona', '1g'),
('Omeprazol', '20mg'),
('Losartana', '50mg'),
('Metformina', '850mg'),
('Diclofenaco', '50mg'),
('Azitromicina', '500mg'),
('Prednisona', '20mg');

# ------------ RECEITAS ------------
INSERT INTO receita (quantidade, instrucao, consulta) 
VALUES 
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

# ------------ RECEITA/MEDICAMENTO ------------
INSERT INTO receitaMedicamento (id_receita, id_medicamento) 
VALUES 
(11, 3), (11, 5), (11, 1),
(12, 2), (12, 8),
(13, 5), (13, 6),
(14, 6), (14, 7),
(15, 3), (15, 4), (15, 9),
(16, 1), (16, 2),
(17, 9), (17, 10),
(18, 2), (18, 4),
(19, 5), (19, 7), (19, 8),
(20, 3), (20, 6),
(21, 7), (22, 6), (23, 8), (24, 10), (25, 4), (26, 5);

# ------------ QUARTOS (Ao menos 3 quartos) ------------
INSERT INTO quarto(numero, tipo)
VALUES 
(101, 1),  -- Apartamento
(102, 1),  -- Apartamento
(201, 2),  -- Quarto Duplo
(202, 2),  -- Quarto Duplo
(301, 3),  -- Enfermaria
(302, 3);  -- Enfermaria

# ------------ ENFERMEIROS (10 profissionais) ------------
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

# ------------ INTERNAÇÕES ------------
INSERT INTO internacao(data_entrada, data_prev_alta, data_saida, procedimento, quarto, paciente, medico)
VALUES
('2016-05-10', '2016-05-17', '2016-05-16', 'Cirurgia de apendicite', 1, 3, 2),
('2017-08-15', '2017-08-22', '2017-08-21', 'Tratamento de pneumonia', 3, 1, 8),
('2018-02-20', '2018-03-05', '2018-03-04', 'Fratura de fêmur', 2, 5, 6),
('2019-06-12', '2019-06-19', '2019-06-18', 'Cirurgia cardíaca', 1, 8, 5),
('2020-03-08', '2020-03-15', '2020-03-14', 'Tratamento de gastrite aguda', 4, 3, 3), -- João Pedro 2ª internação
('2021-07-22', '2021-07-29', '2021-07-28', 'Observação neurológica', 5, 1, 7),      -- Agatha 2ª internação
('2021-11-30', '2021-12-10', '2021-12-09', 'Tratamento dermatológico', 6, 10, 4);

# ------------ INTERNAÇÃO/ENFERMEIRO ------------
INSERT INTO internacaoEnfermeiro(id_internacao, id_enfermeiro)
VALUES
(1, 1), (1, 2), (1, 3),
(2, 2), (2, 4), (2, 5),
(3, 3), (3, 6),
(4, 1), (4, 7), (4, 8),
(5, 4), (5, 9),
(6, 5), (6, 10),
(7, 6), (7, 7), (7, 9);

# ------------ SELECT ------------
SELECT m.nome AS Medico, e.nome AS Especialidade 
FROM medico m 
INNER JOIN especializacao e ON m.especializacao = e.id;


SELECT c.dataConsulta, p.nome AS Paciente, m.nome AS Medico, e.nome AS Especialidade
FROM consulta c
INNER JOIN paciente p ON c.paciente = p.id
INNER JOIN medico m ON c.medico = m.id
INNER JOIN especializacao e ON c.especialidade = e.id
ORDER BY c.dataConsulta;

SELECT i.data_entrada, p.nome AS Paciente, m.nome AS Medico, q.numero AS Quarto, tq.descricao AS TipoQuarto
FROM internacao i
INNER JOIN paciente p ON i.paciente = p.id
INNER JOIN medico m ON i.medico = m.id
INNER JOIN quarto q ON i.quarto = q.id
INNER JOIN tipo_quarto tq ON q.tipo = tq.id
ORDER BY i.data_entrada;
```