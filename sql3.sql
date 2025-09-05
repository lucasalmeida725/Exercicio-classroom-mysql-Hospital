create database Restaurante;
use Restaurante;

create table Mesas(
	id_mesas integer auto_increment primary key,
    numero int not null,
    capacidade int not null,
    disponibilidade int not null
);
alter table Mesas
modify column disponibilidade tinyint(1) not null default 1;
insert into Mesas (numero,capacidade,disponibilidade)values
(12,6,1),
(15,4,1),
(20,6,0),
(10,8,1);
select * from Mesas;
TRUNCATE TABLE Mesas;
select * from Mesas where capacidade>=5;

create table Clientes(
id_cliente integer auto_increment primary key,
nome varchar(50) not null,
telefone varchar(15)not null unique ,
email varchar(255) not null unique
);
insert into Clientes (nome,telefone,email)values
('lucas','71996436444','lucas@gmail.com'),
('marlene','71986263778','aslene2017@gmail.com'),
('paulo','71987887646','paulo@gmail.com');
select * from Clientes;
CREATE TABLE Reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_mesa INT NOT NULL,
    id_cliente INT NOT NULL,
    data_reserva DATE NOT NULL,
    horario TIME NOT NULL,
    
    FOREIGN KEY (id_mesa) REFERENCES Mesas(id_mesas),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);
INSERT INTO Reservas (id_mesa, id_cliente, data_reserva, horario) VALUES
(1, 2, '2025-06-20', '19:00:00'),
(3, 1, '2025-06-20', '20:00:00'),
(2, 3, '2025-06-21', '18:30:00');
select * from Reservas;
select * from Reservas where horario>='19:00:00';

create table Funcionario(
	id_Funcionario integer auto_increment primary key,
    nome varchar(50) not null,
    funcao varchar(50)not null,
    salario decimal(10,2)not null
);
insert into Funcionario(nome,funcao,salario)value
('Ademir','Garcom',4500.0),
('Iago','Cozinheiro',3500.0),
('pedro','Gerente',8000.0);
truncate table Funcionario;

update Funcionario
set salario=5000
where id_Funcionario=3;

select * from Funcionario where salario>4000.0;
select * from Funcionario;

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    username VARCHAR(50) NOT NULL ,
    senha VARCHAR(100) NOT NULL,
    nivel_acesso ENUM('admin', 'gerente', 'garcom', 'cozinheiro') NOT NULL,
    
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);
INSERT INTO Usuarios (id_funcionario, username, senha, nivel_acesso) VALUES
(1, 'ademir', '1234', 'garcom'),
(2, 'iago', 'abcd', 'cozinheiro'),
(3, 'pedro', 'admin123', 'gerente');

truncate table Usuarios;

select count(*) from Funcionario where  salario>4000.00;

select u.id_usuario,f.id_funcionario as Funcionario,f.nome as Funcionario,u.nivel_acesso,f.funcao
from Usuarios u
join Funcionario f on u.id_funcionario=f.id_funcionario
where f.funcao='gerente';













