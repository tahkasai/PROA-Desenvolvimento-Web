Create database if not exists Hospital;
use Hospital;

# ------------ FORMAÇÃO ------------
create table formacao (
	id int primary key auto_increment unique,
    nome varchar(100) not null
);
describe formacao;
insert into formacao(nome)
values  ("generalista"), 
		("especialista"), 
        ("residente");

# ------------ ESPECIALIZAÇÃO ------------
create table especializacao(
	id int primary key auto_increment unique,
    nome varchar(150) not null
);
describe especializacao;
insert into especializacao(nome)
values ("pediatria"), 
	   ("clínica geral"),
       ("gastroenterologia"),
       ("dermatologia");

# ------------ MÉDICO ------------
create table Medico (
	id int primary key auto_increment unique,
	crm varchar(50) not null,
    nome varchar(200) not null,
    cpf varchar(20) not null,
    rne varchar(20),
    dataNasc date not null,
    telefone varchar(20),
    email varchar(100) not null,
    especializacao int not null,
    foreign key (especializacao) references especializacao(id) on delete cascade on update cascade
);
insert into medico(crm,nome,cpf,dataNasc,email,especializacao) 
values ("CRM/SP 123456","Tainá Kasai Serafim","430.000.000-00",'2025-09-26',"tainakasai01@gmail.com",1);
select * from medico;

# ------------ ESPECIALIZAÇÃO/MEDICO ------------
create table especializacaoMedico (
	id_medico int,
    id_especializacao int,
    primary key (id_medico,id_especializacao),
    foreign key (id_medico) references medico(id) on delete cascade on update cascade,
    foreign key (id_especializacao) references especializacao(id) on delete cascade on update cascade
);
insert into especializacaoMedico (id_medico,id_especializacao) values (1,2),(1,4);

select medico.nome,especializacao.nome from especializacaoMedico 
inner join medico on medico.id = especializacaoMedico.id_medico
inner join especializacao on especializacao.id = especializacaoMedico.id_especializacao;

# ------------ CONVÊNIO ------------
create table convenio (
	id int primary key auto_increment,
    cnpj varchar(20) not null,
    tempoCarencia time
);
alter table convenio modify column tempoCarencia int;
describe convenio;

insert into convenio(cnpj,tempoCarencia)
values ("00.000.000/0000-00",5),
	   ("11.111.111/1111-11",3);

select * from convenio;

# ------------ PACIENTE ------------
create table paciente(
	id int primary key auto_increment,
    nome varchar(200) not null,
    cpf varchar(20) not null,
    dataNasc date not null,
    telefone varchar(20) not null,
    email varchar(200) not null,
    convenio int,
    foreign key (convenio) references convenio(id) on delete cascade on update cascade
);

insert into paciente (nome, cpf, dataNasc, telefone, email, convenio) 
values ('Agatha Anjos', '123.456.789-00', '2006-01-28', '(11)99999-0001', 'agatha.com', 1),
	   ('Wellington Augusto', '987.654.321-00', '2005-01-26', '(11)98888-0002', 'well.com', 2);

# ------------ CONSULTA ------------
create table consulta(
	id int primary key auto_increment,
    dataConsulta date  not null,
    hora time  not null,
    valor varchar(5)  not null,
    especialidade int not null,
    paciente int not null,
    medico int not null,
    
    foreign key (especialidade) references especializacao(id) on delete cascade on update cascade,
    foreign key (paciente) references paciente(id) on delete cascade on update cascade,
    foreign key (medico) references medico(id) on delete cascade on update cascade
);

insert into consulta (dataConsulta, hora, valor, especialidade, paciente, medico) 
values ('2025-10-21', '09:30:00', '200', 1, 1, 1),
	   ('2025-10-22', '14:00:00', '150', 2, 2, 2);

# ------------ MEDICAMENTO ------------
create table medicamento (
    id int primary key auto_increment,
    nome varchar(150) not null,
    dosagem varchar(100)
);

insert into medicamento (nome, dosagem) 
values ('Paracetamol', '500mg'),
	   ('Ibuprofeno', '400mg');

# ------------ RECEITA ------------
create table receita (
    id int primary key auto_increment,
    quantidade int not null,
    instrucao varchar(500),
    consulta int,
    
    foreign key (consulta) references consulta(id) on delete cascade on update cascade
);

insert into receita (quantidade, instrucao, consulta) 
values (10, 'Tomar 1 comprimido a cada 8 horas', 1),
	   (5, 'Tomar 1 comprimido antes das refeições', 2);

# ------------ RECEITA/MEDICAMENTO  ------------
create table receitaMedicamento (
    id_receita int,
    id_medicamento int,
    
    primary key (id_receita, id_medicamento),
    foreign key (id_receita) references receita(id) on delete cascade on update cascade,
    foreign key (id_medicamento) references medicamento(id) on delete cascade on update cascade
);

insert into receitaMedicamento (id_receita, id_medicamento) 
values (1, 1),  
	   (2, 2);  

