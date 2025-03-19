create table curso (idcurso int not null,
				   	 nome varchar (200),
					 primary key (idcurso));

create table coordenador (idcoor int not null,
						   nome varchar (200),
						   email varchar (200),
						   fone int not null,
						   idcurso int,
						   primary key (idcoor),
						   foreign key (idcurso)references curso(idcurso));	

create table professor (idprof int not null,
						 nome varchar (200),
						 email varchar (200),
						 salario numeric(6,2) not null,
						 idcurso int,
						 primary key (idprof),
						 foreign key (idcurso) references curso(idcurso) );

create table aluno (idaluno int not null,
					 nome varchar (200),
					 datanascimento date,
					 email varchar (200),
					 fone int not null,
					 idcurso int,
					 primary key (idaluno),
					 foreign key (idcurso) references curso(idcurso) );

insert into curso(idcurso,nome)
values(1,'Engenharia da computação');
insert into  curso (idcurso,nome)
values(2,'Engenharia de softaware');
insert into curso (idcurso,nome)
values(3,'artes');
insert into curso (idcurso,nome)
values(4,'jornalismo');

insert into coordenador(idcoor,nome,email,fone,idcurso)
values(1,'vagner','vagner@gmail.com',1234,1);
insert into coordenador(idcoor,nome,email,fone,idcurso)
values(2,'anderso','anderson@gmail.com',5678,2);
insert into coordenador(idcoor,nome,email,fone,idcurso)
values(3,'bianca','bianquinha@gmail.com',3333,null);
insert into coordenador(idcoor,nome,email,fone,idcurso)
values(4,'miguel','miguelzinho123@gmail.com',4444,4);

insert into professor (idprof,nome,email,salario,idcurso)
values (1,'juvencio','juvencio@gmail.com',7250,4);
insert into professor (idprof,nome,email,salario,idcurso)
values (2,'globerval','globerinho@gmail.com',2200,3);
insert into professor (idprof,nome,email,salario,idcurso)
values (3,'juriscleide','juriri@gmail.com',2800,null);
insert into professor (idprof,nome,email,salario,idcurso)
values (4,'creidlisa','donacreid@gail.com',1500,null);

insert into aluno (idaluno,nome,datanascimento,email,fone,idcurso)
values(1,'jerivaldo','20/05/2000','rivaldinho@gmail.com',8888,4);
insert into aluno (idaluno,nome,datanascimento,email,fone,idcurso)
values(2,'gusman','01/07/1993','gusman1123@gmail.com',9999,null);
insert into aluno (idaluno,nome,datanascimento,email,fone,idcurso)
values(3,'persival','25/11/1985','persisi444@gmail.com',7766,3);
insert into aluno (idaluno,nome,datanascimento,email,fone,idcurso)
values(4,'junin','05/04/2005','junindograu244@gmail.com',2442,1);
insert into aluno (idaluno,nome,datanascimento,email,fone,idcurso)
values(5,'glauber','09/09/1992','glauglau@gmail.com',5543,2);

select * from curso;
select * from coordenador;
select * from professor;
select * from aluno;


select curso.nome,professor.nome
from professor
right join curso on professor.idcurso = curso.idcurso;

select professor .nome,curso.nome
from professor
left join curso on professor.idcurso = curso.idcurso;

select professor.nome ,curso.nome,coordenador.nome
from professor
inner join curso on professor.idcurso = curso.idcurso
inner join coordenador on coordenador.idcurso = curso.idcurso;

select nome from professor where idcurso is null;
select nome from coordenador where idcurso is null;
