/*
   CREATE INDEX ID_OBSERVACAO ON CLIENTE  -- "Indice com campo do tipo TEXT"  
   USING GIN OBS(GIN_TRMN_ID);

   CREATE INDEX ID_CONTAS ON CONTASRECEBER (VENCIMENTO, VALOR); -- "Indice composto, normalmente usado quando a chave primaria composta"
	
*/

CREATE TABLE CLIENTE (
	IDCLIENTE INT NOT NULL,
	NOME VARCHAR(200) NOT NULL,
	TELEFONE INT NOT NULL,
	CPF INT NOT NULL,
	PRIMARY KEY (IDCLIENTE)
);

CREATE TABLE VENDA (
	IDVENDA INT NOT NULL,
	IDCLIENTE INT NOT NULL,
	DATAVENDA DATE NOT NULL,
	VALORVENDA NUMERIC(8,2) NOT NULL,
	PRIMARY KEY (IDVENDA,IDCLIENTE),
	FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE CONTAS_RECEBER (
	IDCONTA INT NOT NULL,
	IDCLIENTE INT NOT NULL,
	IDPARCELA INT NOT NULL,
	DATACONTA DATE NOT NULL,
	VENCIMENTO DATE NOT NULL,
	VALOR NUMERIC(8,2) NOT NULL,
	PRIMARY KEY (IDCONTA, IDCLIENTE, IDPARCELA),
	FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

insert into cliente (idcliente, nome, telefone, cpf) values
(1, 'João Silva', 12345, 12345),
(2, 'Maria Oliveira', 23456, 23456),
(3, 'Carlos Pereira', 34567, 34567),
(4, 'Ana Souza', 45678, 45678),
(5, 'Lucas Santos', 56789, 56789),
(6, 'Fernanda Lima', 67890, 67890),
(7, 'Eduardo Costa', 78910, 78910),
(8, 'Juliana Martins', 89101, 89101),
(9, 'Ricardo Almeida', 91012, 91012),
(10, 'Patrícia Rocha', 85931, 85931)
;

insert into venda (idvenda, idcliente, datavenda, valorvenda) values
(1, 1, '2025-03-01', 250.75),
(2, 1, '2025-03-15', 125.50),
(3, 2, '2025-03-02', 320.00),
(4, 2, '2025-03-18', 140.30),
(5, 3, '2025-03-05', 180.90),
(6, 3, '2025-03-20', 215.00),
(7, 4, '2025-03-03', 310.75),
(8, 4, '2025-03-17', 99.99),
(9, 5, '2025-03-04', 410.60),
(10, 5, '2025-03-22', 580.20),
(11, 6, '2025-03-06', 150.45),
(12, 6, '2025-03-21', 210.75),
(13, 7, '2025-03-07', 275.80),
(14, 7, '2025-03-23', 125.90),
(15, 8, '2025-03-08', 330.60),
(16, 8, '2025-03-24', 102.30),
(17, 9, '2025-03-09', 540.10),
(18, 9, '2025-03-25', 198.20),
(19, 10, '2025-03-10', 620.00),
(20, 10, '2025-03-26', 470.55)
;

insert into contas_receber (idconta, idcliente, idparcela, dataconta, vencimento, valor) values
(1, 1, 1, '2025-03-01', '2025-03-30', 125.38),
(1, 1, 2, '2025-03-01', '2025-04-30', 125.37),
(2, 2, 1, '2025-03-02', '2025-03-30', 160.00),
(2, 2, 2, '2025-03-02', '2025-04-30', 160.00),
(3, 3, 1, '2025-03-05', '2025-03-30', 145.45),
(3, 3, 2, '2025-03-05', '2025-04-05', 145.45),
(4, 4, 1, '2025-03-03', '2025-03-30', 155.37),
(4, 4, 2, '2025-03-03', '2025-04-03', 155.38),
(5, 5, 1, '2025-03-04', '2025-03-30', 205.30),
(5, 5, 2, '2025-03-04', '2025-04-30', 205.30),
(6, 6, 1, '2025-03-06', '2025-03-30', 105.22),
(6, 6, 2, '2025-03-06', '2025-04-06', 105.22),
(7, 7, 1, '2025-03-07', '2025-03-30', 155.38),
(7, 7, 2, '2025-03-07', '2025-04-07', 155.37),
(8, 8, 1, '2025-03-08', '2025-03-30', 165.30),
(8, 8, 2, '2025-03-08', '2025-04-08', 165.30),
(9, 9, 1, '2025-03-09', '2025-03-30', 270.05),
(9, 9, 2, '2025-03-09', '2025-04-09', 270.05),
(10, 10, 1, '2025-03-10', '2025-03-30', 310.10),
(10, 10, 2, '2025-03-10', '2025-04-10', 310.10)
;

// criar indices(simples)
create index id_cpf on cliente (cpf);

// criar indices(composto)
create index id_vendacliente on venda(idvenda,idcliente,valorvenda);

// criar indices(composto)
create index id_contacliente on contas_receber (idconta,idcliente,valor);


//views

1- criar view para tabela clientes

create view consultar_clientes_nome as
	select * from cliente order by nome;

create view consultar_vendas_clientes as
	select venda.datavenda,venda.valorvenda,cliente.nome
	from venda,cliente
	where venda.idcliente = cliente.idcliente;

create view consultar_maior_venda as 
	select max (valorvenda), min(valorvenda) from venda;
	
/// exemplo com join

create view listar_cliente_contas_receber as 
	select b.dataconta,a.nome, b.idparcela,b.valor
	from cliente as a
	left join contas_receber as b on a.idcliente = b.idcliente;

// exemplos com sub-querys

create view listar_cliente_venda as 
	select distinct cliente.nome,
	  (select max(venda.valorvenda)from venda
		where venda.idcliente = cliente.idcliente)
	from cliente;

create view listar_cliente_total_conta as 
	select distinct cliente.nome,
		(select sum(contas_receber.valor)from contas_receber
		where contas_receber.idcliente = cliente.idcliente)
	from cliente;

