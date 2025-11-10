# Os Segredos do Hospital

No hospital, as internações têm sido registradas por meio de formulários eletrônicos que gravam os dados em arquivos. 

Para cada internação, são anotadas a data de entrada, a data prevista de alta e a data efetiva de alta, além da descrição textual dos procedimentos a serem realizados. 

As internações precisam ser vinculadas a quartos, com a numeração e o tipo. 

Cada tipo de quarto tem sua descrição e o seu valor diário (a princípio, o hospital trabalha com apartamentos, quartos duplos e enfermaria).

Também é necessário controlar quais profissionais de enfermaria estarão responsáveis por acompanhar o paciente durante sua internação. Para cada enfermeiro(a), é necessário nome, CPF e registro no conselho de enfermagem (COREN).

A internação, obviamente, é vinculada a um paciente – que pode se internar mais de uma vez no hospital – e a um único médico responsável.

<img src='assets/image/image.png' alt='diagrama de entidade e relacionamento'>

## Resolução
```bash
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
```
## Código completo
🔗<a href='SegredosHospital.sql'>SegredosHospital.sql</a>
