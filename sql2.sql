create database LL;
use  LL;
SHOW TABLES;
describe Livros;

create table Livros(
	id integer auto_increment Primary key,
    titulo varchar(50) not null,
    autor varchar(50) not null,
	isbn int not null,
    ano year not null,
    quantidade int not null
);
INSERT INTO Livros(id,titulo,autor,isbn,ano,quantidade)VALUES
(1,'Percy jakson','Rick',12,2014,5),
(2,'ataque dos titans','hajime',10,2018,100),
(3,'Naruto','Mashashi',13,2001,200);

update Livros
set autor= 'Hajime Isayama', quantidade = 120
where id=2;
select * from Livros;

create table Membros(
	id_membro integer auto_increment primary key,
    nome varchar(50) not null,
    endereco varchar(50) not null,
    telefone varchar(15) not null,
    dataEscricao date not null
);
INSERT INTO Membros (nome,endereco,telefone,dataEscricao)VALUES
('Lucas Almeida','Avenida Luis viana filho','71996436444','2025-06-18'),
('Marlene Almeida','Avenida Luis viana filho','71986263778','2025-06-25'),
('Paulo ferreira','Patamares','71986263778','2025-06-25');
select * from Membros;

update Membros
set telefone='71987887646'
where id_membro=3;
select * from Membros where endereco='Avenida Luis viana filho';

create table Empresitmo(
id_empresitmo integer auto_increment primary key,
id integer not null,
id_membro integer not null,
dataEmpresitmo date not null,
dataDevolucao date not null,
foreign key(id)references Livros(id),
foreign key(id_membro)references Membros(id_membro)
);
INSERT INTO Empresitmo (id, id_membro, dataEmpresitmo, dataDevolucao) VALUES
(1, 1, '2025-06-18', '2025-06-25'),  -- Lucas pegou Percy Jackson
(2, 2, '2025-06-18', '2025-06-27'),  -- Marlene pegou Ataque dos Titans
(3, 3, '2025-06-18', '2025-06-30');  -- Paulo pegou Naruto

select 
e.id_empresitmo,l.titulo as Livros,
m.nome as Membro,
e.dataEmpresitmo,
e.dataDevolucao
from Empresitmo e
join Livros l on e.id=l.id
join Membros m on e.id_membro=m.id_membro;


 