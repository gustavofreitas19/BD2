create table hospital (
	idhospital		int 	not null,
	nome			char(50) not null,
	cnpj			int		not null,
	primary key (idhospital)
);

create table alas (
	idala			int		not null,
	nome			char(50) not null,
	responsavel		char(50) not null,
	idhospital  	int		not null,
	primary key (idala),
	foreign key (idhospital) references hospital(idhospital)
);

create table enfermeira(
	idenfermeira	int		not null,
	nome			char(50) not null,
	cre				int 	not null,
	idala			int		not null,
	primary key (idenfermeira),
	foreign key (idala) references alas(idala)
);

create table plano (
	idplano 		int 	not null,
	nome			char(50) not null,
	telefone		int 	not null,
	idhospital		int		not null,
	primary key (idplano),
	foreign key (idhospital) references hospital(idhospital)
);

create table especialidades (
	idespecialidade int		not null,
	nome 			char(50) not null,
	primary key (idespecialidade)
);

create table medico (
	idmedico 		int 	not null,
	nome			char(50) not null,
	telefone		int 	not null,
	crm				int		not null,
	idespecialidade	int		not null,
	idplano			int		not null,
	primary key (idmedico),
	foreign key (idespecialidade) references especialidades(idespecialidade),
	foreign key (idplano) references plano(idplano)
);

create table paciente (
	idpaciente 		int		not null,
	nome			char(50) not null,
	telefone		int 	not null,
	datanasc		date	not null,
	primary key (idpaciente)
);

create table atendimento (
	idatendimento	int 	not null,
	dataatendimento date	not null,
	horaatendimento	time	not null,
	valor			numeric(6,2) not null,
	idpaciente		int		not null,
	idmedico		int		not null,
	idplano			int		not null,
	status			char(1)	not null,
	primary key (idatendimento),
	foreign key (idpaciente) references paciente(idpaciente),
	foreign key (idmedico) references medico(idmedico),
	foreign key (idplano) references plano(idplano)
);

//---------------- inserts -----------------------\\

insert into hospital(idhospital,nome,cnpj)
	values(1,'hospital sao joao batista',123);
insert into hospital(idhospital,nome,cnpj)
	values(2,'hospital sao jose',345);

insert into alas(idala,nome,responsavel,idhospital)
	values(1,'unidade de raio-x','Maria',1);
insert into alas(idala,nome,responsavel,idhospital)
	values(2,'unidade de ultrassonografia','Ana',2);

insert into enfermeira(idenfermeira,nome,cre,idala)
	values (1,'Maria',123,1);
insert into enfermeira(idenfermeira,nome,cre,idala)
	values (2,'Ana',345,2);

insert into plano(idplano,nome,telefone,idhospital)
	values(1,'plano unimed',123,1);
insert into plano(idplano,nome,telefone,idhospital)
	values(2,'plano de saude sao jose',789,2);

insert into especialidades(idespecialidade,nome)
	values(1,'pediatra');
insert into especialidades(idespecialidade,nome)
	values(2,'ortopedista');
insert into especialidades(idespecialidade,nome)
	values(3,'cardiologista');

insert into medico(idmedico,nome,telefone,crm,idespecialidade,idplano)
	values(1,'Dra Aline',123,456,1,1);
insert into medico(idmedico,nome,telefone,crm,idespecialidade,idplano)
	values(2,'Dra Denise',321,654,1,1);
insert into medico(idmedico,nome,telefone,crm,idespecialidade,idplano)
	values(3,'Dr Giovane',789,987,2,2);

insert into paciente(idpaciente,nome,telefone,datanasc)
	values (1,'Artur',123,'11/09/2007');
insert into paciente(idpaciente,nome,telefone,datanasc)
	values (2,'Andre',456,'18/06/2005');
insert into paciente(idpaciente,nome,telefone,datanasc)
	values (3,'Aurora',789,'25/03/2024');

insert into atendimento(idatendimento,dataatendimento,horaatendimento,valor,idpaciente,idmedico,idplano,status)
	values(1,'25/03/2025','10:00:00',500.00,1,3,2,'E');
insert into atendimento(idatendimento,dataatendimento,horaatendimento,valor,idpaciente,idmedico,idplano,status)
	values(2,'25/03/2025','15:00:00',500.00,2,3,2,'E');
insert into atendimento(idatendimento,dataatendimento,horaatendimento,valor,idpaciente,idmedico,idplano,status)
	values(3,'31/03/2025','16:00:00',500.00,3,1,1,'E');
insert into atendimento(idatendimento,dataatendimento,horaatendimento,valor,idpaciente,idmedico,idplano,status)
	values(4,'01/04/2025','20:00:00',500.00,3,1,1,'A');

//-------------------------grupos,usuarios--------------------\\

create group gerentes ;
create group chefes ; 
create group atendentes ;
create group estagiarios ;

create user gustavo password '123';
alter group gerentes add user gustavo;
create user joao miguel password '123';
alter group chefes add user joao ;
create user patrick password '123';
alter group atendentes add user patrick;
create user vanessa password '123';
alter group estagiarios add user vanessa;

grant all on hospital,alas,enfermeira,plano,medico,especialidades,paciente,atendimento to gustavo;

grant all on alas,enfermeira,atendimento to joao ;

grant select,update on medico,especialidades,paciente,atendimento to patrick;

//---------------- indices---------------\\

create unique index idcrm on medico (crm);
create unique index idcre on enfermeira (cre);

create unique index idnomeplano on plano (nome);

create index idnomepaciente on paciente(nome);

create index iddatahora on atendimento(dataatendimento,horaatendimento);

//-----------------selects---------------\\

select alas.nome,enfermeira.nome
	from alas,enfermeira
		where alas.idala= enfermeira.idala;


select alas.nome,enfermeira.nome
	from alas
		left join enfermeira on alas.idala = enfermeira.idala;

select medico.nome , especialidades.nome
	from medico
		left join especialidades on especialidades.idespecialidade = medico.idespecialidade;

select hospital.nome , plano.nome
	from hospital 
		left join plano on hospital.idhospital = plano.idhospital;


select plano.nome,medico.nome,especialidades.nome
	from plano,medico,especialidades
		where plano.idplano = medico.idplano
			and medico.idespecialidade = especialidades.idespecialidade
				order by plano.nome , medico.nome,especialidades.nome;


select especialidades.nome,
	(select count(medico.nome)total_medicos from medico 
		where medico.idespecialidade = especialidades.idespecialidade)
			from especialidades
				order by total_medicos desc;

select especialidades.nome from especialidades
	where not exists
		(select from medico where medico.idespecialidade = especialidades.idespecialidade);

select paciente.nome,
	(select count(atendimento.idatendimento) qtde_pacientes from atendimento where atendimento.idpaciente = paciente.idpaciente),
		(select sum(atendimento.valor)total_consulta from atendimento where atendimento.idpaciente = paciente.idpaciente)
			from paciente;