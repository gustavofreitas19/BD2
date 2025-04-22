//------------ criação das tabelas ----------\\

create table entrada (
	ent_codigo		int not null,
	ent_data		date not null,
	ent_hora		time not null,
	primary key (ent_codigo)
);

create table categorias (
	cat_codigo		int not null,
	cat_nome		varchar(50) not null,
	primary key (cat_codigo)
);

create table venda (
	ven_codigo		int not null,
	ven_data		date not null,
	ven_hora		time not null,
	primary key (ven_codigo)
);

create table itens_venda(
	pro_codigo		int not null,
	ven_codigo		int not null,
	ven_quntidade	int not null,
	ven_preco_unitario	int not null,
	ven_preco_total	int not null,
	primary key (pro_codigo, ven_codigo)
);

create table cidades (
	cid_cep			int not null,
	cid_nome		varchar(50) not null,
	cid_estado		char(2) not null,
	primary key (cid_cep)
);

create table fornecedor (
	for_codigo		int not null,
	cid_cep			int not null,
	for_nome		varchar(50) not null,
	for_telefone	int not null,
	for_celular		int not null,
	for_email		varchar(50) not null,
	for_cnpj		int not null,
	for_sexo		char(1) not null,
	for_rua			varchar(50) not null,
	for_numero		int not null,
	for_bairro		varchar(50) not null,
	primary key (for_codigo),
	foreign key (cid_cep) references cidades(cid_cep)
);

create table produtos (
	pro_codigo		int not null,
	for_codigo		int not null,
	cat_codigo		int not null,
	pro_nome		varchar(50) not null,
	pro_preco		float not null,
	pro_foto		varchar(50) not null,
	pro_qnt			int not null,
	pro_quant_min_estoque	int not null,
	primary key (pro_codigo),
	foreign key (for_codigo) references fornecedor (for_codigo),
	foreign key (cat_codigo) references categorias (cat_codigo)
);

create table itens_entrada (
	pro_codigo		int not null,
	ent_codigo		int not null,
	for_codigo		int not null,
	pro_preco_venda float not null,
	pro_preco_compra float not null,
	pro_icms		float not null,
	pro_preco_ent_c_icms	float not null,
	ent_quantidade	int not null,
	ent_preco_total	int not null,
	primary key (pro_codigo,ent_codigo),
	foreign key (for_codigo) references fornecedor (for_codigo)
);

//------------- inserts ------------\\

insert into cidades (cid_cep,cid_estado,cid_nome)
values (8888888,'SC','Criciuma');
insert into cidades (cid_cep,cid_estado,cid_nome)
values (7777777,'SC','Içara');
insert into cidades (cid_cep,cid_estado,cid_nome)
values (6666666,'SC','Morro da Fumaça');
insert into cidades (cid_cep,cid_estado,cid_nome)
values (5555555,'SC','Forquilhinha');

insert into fornecedor (cid_cep,for_bairro,for_celular,for_cnpj,for_codigo,for_email,for_nome,for_numero,for_rua,for_sexo,for_telefone)
values (5555555,'colonial',6767,121212,1,'joao@','joao',270,'servidao','M',7676);
insert into fornecedor (cid_cep,for_bairro,for_celular,for_cnpj,for_codigo,for_email,for_nome,for_numero,for_rua,for_sexo,for_telefone)
values (8888888,'Prospera',8181,151515,2,'Maria@','Maria',320,'servidao','F',5566);

insert into categorias (cat_codigo,cat_nome)
values(1,'Carnes');
insert into categorias (cat_codigo,cat_nome)
values(2,'Frutas');

insert into produtos(cat_codigo,for_codigo,pro_codigo,pro_foto,pro_nome,pro_preco,pro_qnt,pro_quant_min_estoque)
values (1,1,1,'foto picanha','picanha',100.00,10,5);
insert into produtos(cat_codigo,for_codigo,pro_codigo,pro_foto,pro_nome,pro_preco,pro_qnt,pro_quant_min_estoque)
values (2,2,2,'foto banana','banana',10.00,50,20);

insert into itens_venda (pro_codigo,ven_codigo,ven_preco_total,ven_preco_unitario,ven_quntidade)
values (1,1,4,100.00,400.00);
insert into itens_venda (pro_codigo,ven_codigo,ven_preco_total,ven_preco_unitario,ven_quntidade)
values (2,2,6,10.00,60.00);

insert into itens_entrada (ent_codigo,ent_preco_total,ent_quantidade,for_codigo,pro_codigo,pro_icms,pro_preco_compra,pro_preco_ent_c_icms,pro_preco_venda)
values (1,1000.00,10,1,1,8.00,70.00,76.00,100.00);
insert into itens_entrada (ent_codigo,ent_preco_total,ent_quantidade,for_codigo,pro_codigo,pro_icms,pro_preco_compra,pro_preco_ent_c_icms,pro_preco_venda)
values (2,500.00,50,2,2,3.00,6.00,8.00,10.00);

insert into venda (ven_codigo,ven_data,ven_hora)
values (1,'2025/04/02','12:35:00');
insert into venda (ven_codigo,ven_data,ven_hora)
values (2,'2025/02/20','17:55:30');

insert into entrada(ent_codigo,ent_data,ent_hora)
values (1,'2025/01/08','10:00:00');
insert into entrada(ent_codigo,ent_data,ent_hora)
values (2,'2025/01/15','15:00:00');

//-------------- permissoes--------\\


create user patrao password '123';
create user rh password '123';
create user compras password '123';

create group CEOO ;
create group Suprimentoss ;
create group Comerciall ;

alter group CEOO add user patrao;
alter group Suprimentoss add user rh;
alter group Comerciall add user compras;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO CEOO;
GRANT SELECT, INSERT, UPDATE ON cidades, fornecedor, produtos,categorias,itens_entrada,entrada TO Suprimentoss;  
GRANT SELECT, INSERT, UPDATE ON itens_venda,venda TO Comerciall;  

//----------- indices-----------\\

create index for_codigoo on itens_entrada (for_codigo);
create index data_ on entrada (ent_data);

CREATE INDEX data_hora_venda ON venda  (ven_data, ven_hora);

CREATE UNIQUE INDEX nome_categoria ON categorias (cat_nome);


//-----------------selects----------\\

select cat_codigo
from produtos
where cat_codigo = null

select cat_nome,pro_nome
from categorias,produtos
where categorias.cat_nome like 'm%' 

select * from fornecedor 
(select cid_nome,cid_estado
from cidades
where for_codigo = cid_cep)

select cid_nome,cid_estado
from cidades
where cid_cep = for_codigo in 
(select * from fornecedor)
