create database hospital;
use hospital;

create table paciente(
id_paciente integer auto_increment primary key,
nome varchar(50),
endereco varchar(50),
data_nascimento date not null,
historico text not null
);

select nome,endereco from paciente;
show databases ;

insert into paciente(nome,endereco,data_nascimento,historico)
values
('Lucas Almeida','Avenida luis viana filho','2005-09-30','nenhum'),
('Paulo ferreira','São rafael','1969-11-25','pressao alta'),
('Marlene Almeida','Avenida professor pinto aquiar','1979-04-17','Nariz'),
('Eduardo','Paralela','2005-07-11','Não consta'),
('Cr7','Ilha maderia','1980-02-5','coracao fraco');

select * from paciente;
select * from paciente where nome='Lucas Almeida';
select * from paciente where endereco='São rafael';
TRUNCATE TABLE paciente;


create table Medicos(
id_Medico integer auto_increment primary key,
nome varchar(50),
especialidade varchar(25),
horario time not null
);
insert into Medicos(nome,especialidade,horario)values
('Pedro Arhtur','urolosgista','19:00:00'),
('Paulo','ginecologista','15:00:00'),
('vitor','cardiologista','11:00:00');
update Medicos
set horario='11:30:00'
where id_Medico=3;
select * from Medicos;

create table Consultas(
id_consulta integer auto_increment primary key,
id_Medico integer not null,
id_paciente integer not null,
data_hora date not null,
diagnostico text not null,
foreign key (id_Medico)references Medicos(id_Medico),
foreign key(id_paciente)references paciente(id_paciente)
);
INSERT INTO Consultas (id_Medico, id_paciente, data_hora, diagnostico)
VALUES 
  (1, 1, '2025-06-27 14:00:00', 'Consulta de rotina, paciente saudável.'),
  (2, 2, '2025-06-28 10:30:00', 'Pressão arterial elevada, indicado acompanhamento.'),
  (3, 3, '2025-06-29 09:15:00', 'Palpitação leve, recomendada avaliação cardiológica.');
select * from Consultas;

select c.id_consulta ,p.nome as paciente,m.nome as medico,c.data_hora,c.diagnostico
from Consultas c
JOIN paciente p ON c.id_paciente = p.id_paciente
JOIN Medicos m ON c.id_Medico = m.id_Medico;