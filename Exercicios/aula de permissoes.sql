create table tipo(
idtipo 		int not null,
descricao   char(50)not null,
valor 		numeric(6,2)not null,
primary key (idtipo)
);

create table cliente (
idcliente	int not null,
nome		char(50) not null,
sexo		char(1) not null,
telefone	int not null,
primary key (idcliente)
);

create table quarto (
idquarto	int not null,
andar		int not null,
idtipo		int not null,
status 		char(1) not null,
primary key (idquarto),
foreign key (idtipo) references tipo (idtipo)
);

create table reserva(
idreserva	int not null,
idcliente	int not null,
idquarto	int not null,
dataentrada date not null,
qtdias		int not null,
datasaida	date not null,
status		char(1) not null,
primary key (idreserva),
foreign key (idcliente) references cliente (idcliente),
foreign key (idquarto) references quarto (idquarto)
);

insert into tipo (idtipo,descricao,valor)
values(1,'quarto casal',350.00);
insert into tipo (idtipo,descricao,valor)
values(2,'quarto solteiro',200.00);
insert into tipo (idtipo,descricao,valor)
values(3,'quarto casal suite master',420.00);

insert into cliente (idcliente,nome,sexo,telefone)
values (1,'João Miguel Fortunato Rita','M',1111);
insert into cliente (idcliente,nome,sexo,telefone)
values (2,'Gustavo','M',3333);
insert into cliente (idcliente,nome,sexo,telefone)
values (3,'Maria','F',7777);

insert into quarto (idquarto,andar,idtipo,status)
values (1,4,1,'D');
insert into quarto (idquarto,andar,idtipo,status)
values (2,1,2,'O');
insert into quarto (idquarto,andar,idtipo,status)
values (3,5,1,'D');

insert into reserva (idreserva,idcliente,idquarto,dataentrada,qtdias,datasaida,status)
values (1,1,3,'15/04/2025',10,'25/04/2025','a');
insert into reserva (idreserva,idcliente,idquarto,dataentrada,qtdias,datasaida,status)
values (2,2,1,'1/07/2025',4,'05/07/2025','i');
insert into reserva (idreserva,idcliente,idquarto,dataentrada,qtdias,datasaida,status)
values (3,3,2,'12/05/2025',15,'27/05/2025','a');

//----------------------------

create user gustavo password '123'
create user joao password '123'
create user maria password '123'

create group coordenador 
alter group coordenador add user gustavo;
create group recepcao 
alter group recepcao add user joao;
create group auxiliar 
alter group auxiliar add user maria;

grant select on cliente to auxiliar;
grant all on reserva to recepcao;
grant all on tipo,cliente,quarto,reserva to coordenador;

create user ana password '123';
alter group recepcao add user ana;
grant select on cliente,reserva to ana;


select * from tipo;
select * from cliente;
select * from quarto;
select * from reserva;
select * from pg_group;