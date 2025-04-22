CREATE TABLE CLIENTE( 
codcliente int, 
nome varchar(60), 
datanascimento date, 
cpf varchar(11), 
CONSTRAINT pk_ex_cliente PRIMARY KEY (codcliente)); 

CREATE TABLE PRODUTO( 
codproduto int, 
descricao varchar(60), 
saldo numeric, 
CONSTRAINT pk_ex_produto PRIMARY KEY (codproduto)); 


CREATE TABLE PEDIDO( 
codpedido int, 
codcliente int, 
datapedido date, 
nf varchar(12), 
valortotal decimal(10,2), 
Obs text,
CONSTRAINT pk_ex_pedido PRIMARY KEY (codpedido), 
CONSTRAINT pk_ex_pedido_cliente FOREIGN KEY (codcliente) REFERENCES CLIENTE(codcliente)); 


CREATE TABLE ITEMPEDIDO( 
codpedido int, 
numeroitem int, 
valorunitario decimal(10,2), 
quantidade int, 
codproduto int, 
CONSTRAINT pk_itempedido PRIMARY KEY (codpedido, numeroitem), 
CONSTRAINT fk_codpedido FOREIGN KEY (codpedido) REFERENCES PEDIDO (codpedido), 
CONSTRAINT fk_itempedido_produto FOREIGN KEY (codproduto) REFERENCES PRODUTO (codproduto)); 




// INSERTS

INSERT INTO CLIENTE (codcliente, nome, datanascimento, cpf) VALUES
(1, 'João Silva', '1985-03-15', '12345678901'),
(2, 'Maria Oliveira', '1990-07-22', '23456789012'),
(3, 'Carlos Souza', '1982-11-10', '34567890123'),
(4, 'Ana Costa', '1995-01-30', '45678901234'),
(5, 'Pedro Almeida', '1988-05-05', '56789012345'),
(6, 'Juliana Rocha', '1992-02-20', '67890123456'),
(7, 'Lucas Pereira', '2000-09-13', '78901234567'),
(8, 'Fernanda Santos', '1980-12-25', '89012345678'),
(9, 'Gustavo Martins', '1987-08-02', '90123456789'),
(10, 'Cláudia Lima', '1993-06-18', '01234567890');


INSERT INTO PRODUTO (codproduto, descricao, saldo) VALUES
(1, 'Caneta Esferográfica', 500.00),
(2, 'Caderno Universitário', 300.00),
(3, 'Papel A4', 1000.00),
(4, 'Agenda 2025', 150.00),
(5, 'Clips de Papel', 2000.00),
(6, 'Fita Adesiva', 800.00),
(7, 'Marcador Permanente', 400.00),
(8, 'Lixeira de Escritório', 100.00),
(9, 'Tesoura sem pontas', 250.00),
(10, 'Pastas de Arquivo', 350.00);


INSERT INTO PEDIDO (codpedido, codcliente, datapedido, nf, valortotal, Obs) VALUES
(1, 1, '2025-04-01', 'NF001', 1500.50, 'Pedido de materiais de escritório'),
(2, 2, '2025-04-03', 'NF002', 2200.75, 'Compra mensal de material'),
(3, 3, '2025-04-05', 'NF003', 980.30, 'Pedido de reposição de estoque'),
(4, 4, '2025-04-07', 'NF004', 3100.00, 'Pedido com urgência para projeto'),
(5, 5, '2025-04-09', 'NF005', 1400.20, 'Pedido de papel e canetas'),
(6, 6, '2025-04-10', 'NF006', 560.40, 'Reabastecimento de material de escritório'),
(7, 7, '2025-04-12', 'NF007', 1250.00, 'Material para escritório e organização'),
(8, 8, '2025-04-14', 'NF008', 1980.00, 'Pedido com descontos promocionais'),
(9, 9, '2025-04-16', 'NF009', 2750.00, 'Pedidos diversos para escritório'),
(10, 10, '2025-04-18', 'NF010', 1500.00, 'Pedido urgente de material de papelaria');

-- Pedido 1
INSERT INTO ITEMPEDIDO (codpedido, numeroitem, valorunitario, quantidade, codproduto) VALUES
(1, 1, 2.50, 100, 1),  
(1, 2, 5.00, 20, 2);   

-- Pedido 2
INSERT INTO ITEMPEDIDO (codpedido, numeroitem, valorunitario, quantidade, codproduto) VALUES
(2, 1, 3.00, 50, 4),   
(2, 2, 1.50, 200, 5);  

-- Pedido 3
INSERT INTO ITEMPEDIDO (codpedido, numeroitem, valorunitario, quantidade, codproduto) VALUES
(3, 1, 4.00, 100, 7),  
(3, 2, 8.00, 50, 6);   

-- Pedido 4
INSERT INTO ITEMPEDIDO (codpedido, numeroitem, valorunitario, quantidade, codproduto) VALUES
(4, 1, 10.00, 25, 9),  
(4, 2, 3.50, 70, 10);  

-- Pedido 5
INSERT INTO ITEMPEDIDO (codpedido, numeroitem, valorunitario, quantidade, codproduto) VALUES
(5, 1, 2.50, 100, 1),  
(5, 2, 5.00, 20, 2);   

-- Pedido 6
INSERT INTO ITEMPEDIDO (codpedido, numeroitem, valorunitario, quantidade, codproduto) VALUES
(6, 1, 20.00, 30, 3),  
(6, 2, 3.50, 50, 4);

-- Pedido 7
INSERT INTO ITEMPEDIDO (codpedido, numeroitem, valorunitario, quantidade, codproduto) VALUES
(7, 1, 1.50, 200, 5),  
(7, 2, 8.00, 50, 6);   

-- Pedido 8
INSERT INTO ITEMPEDIDO (codpedido, numeroitem, valorunitario, quantidade, codproduto) VALUES
(8, 1, 15.00, 20, 7),  
(8, 2, 5.00, 30, 2);   

-- Pedido 9
INSERT INTO ITEMPEDIDO (codpedido, numeroitem, valorunitario, quantidade, codproduto) VALUES
(9, 1, 12.00, 40, 8),  
(9, 2, 3.50, 100, 10); 

-- Pedido 10
INSERT INTO ITEMPEDIDO (codpedido, numeroitem, valorunitario, quantidade, codproduto) VALUES
(10, 1, 10.00, 20, 9),  
(10, 2, 5.00, 30, 1);   


//---------indices----------\\

Crie o indice B-Tree na tabela de Clientes pelo campo nome;
 create index idx_nome_cliente on cliente (nome);

Crie o indice B-Tree na tabela de Produtos pela descrição;
 create index idx_descri_produto on produto (descricao);

Crie o indice GIN na tabela Pedido pelo campo OBS;
 create index idx_obs_pedido on pedido using gin (to_tsvector('portuguese', OBS));

Crie o indice Unique na tabela Produto pelo descrição;
 create unique index idx_dscri_produto on produto (descricao);

Crie o indice Unique na tabela Clientes pelo nome;
 create unique index idx_nome_clientes on cliente(nome);

Crie o indice de várias colunas na tabela pedido pelos campos datapedido e valortotal;
 create index idx_pedido_datapedido_valortotal on Pedido (datapedido, valortotal);


//--------views------\\

1)Crie uma VIEW chamada CLIENTES_NOMES_VIEW para clientes em ordem alfabetica
 
CREATE OR REPLACE VIEW CLIENTES_NOMES_VIEW AS 
select cliente.codcliente, cliente.nome from cliente 
order by cliente.nome;
 
select * from clientes_nomes_view; 

2)Crie uma VIEW chamada CLIENTES_MAIORES_IDADE_VIEW. 
 
CREATE OR REPLACE VIEW CLIENTES_MAIORES_IDADE_VIEW AS 
select cliente.nome, trunc((current_date - cliente.datanascimento)/366) 
idade from cliente 
where trunc((current_date - cliente.datanascimento)/366) > 18; 
 
select * from clientes_maiores_idade_view; 

3)Crie uma VIEW chamada ULTIMO_PEDIDO_VIEW para exibir qual o último pedido de cada cliente. 

create or replace view ultimo_pedido_view as
select c.codcliente,c.nome,p.codpedido,p.datapedido,p.nf,p.obs
 from pedido p , cliente c
where p.codcliente = c.codcliente
 and p.datapedido = (select max(datapedido)
 					  from pedido b
					   where b.codcliente = c.codcliente);

4)Crie uma VIEW chamada TABELA_PRODUTO_VIEW para exibir quais os últimos valores praticados para cada produto. 

CREATE VIEW TABELA_PRODUTO_VIEW AS
SELECT p.codproduto, p.descricao, ip.valorunitario, ped.datapedido
FROM PRODUTO p
JOIN (
    SELECT ip.codproduto, MAX(ped.datapedido) AS max_data
    FROM ITEMPEDIDO ip
    JOIN PEDIDO ped ON ip.codpedido = ped.codpedido
    GROUP BY ip.codproduto
) ult ON p.codproduto = ult.codproduto
JOIN ITEMPEDIDO ip ON ip.codproduto = ult.codproduto
JOIN PEDIDO ped ON ped.codpedido = ip.codpedido AND ped.datapedido = ult.max_data;
 
5)Crie uma VIEW chamada LISTA_NOTA_VIEW para exibir quais foram as notas emitidas por mês no ano atual (2025)

CREATE VIEW LISTA_NOTA_VIEW AS
SELECT 
    EXTRACT(MONTH FROM ped.datapedido) AS mes,
    EXTRACT(YEAR FROM ped.datapedido) AS ano,
    ped.nf,
    COUNT(ped.codpedido) AS total_pedidos
FROM PEDIDO ped
WHERE EXTRACT(YEAR FROM ped.datapedido) = 2025
GROUP BY EXTRACT(MONTH FROM ped.datapedido), EXTRACT(YEAR FROM ped.datapedido), ped.nf
ORDER BY mes;

6) Crie uma VIEW chamada PRODUTO_FAVORITO_VIEW para mostrar qual o produto com mais pedidos (quantidade) por cliente. 

CREATE VIEW PRODUTO_FAVORITO_VIEW AS
SELECT
    ped.codcliente,
    ip.codproduto,
    p.descricao,
    SUM(ip.quantidade) AS total_quantidade
FROM ITEMPEDIDO ip
JOIN PEDIDO ped ON ip.codpedido = ped.codpedido
JOIN PRODUTO p ON ip.codproduto = p.codproduto
GROUP BY ped.codcliente, ip.codproduto, p.descricao
HAVING SUM(ip.quantidade) = (
    SELECT MAX(total_quantidade)
    FROM (
        SELECT SUM(ip2.quantidade) AS total_quantidade
        FROM ITEMPEDIDO ip2
        JOIN PEDIDO ped2 ON ip2.codpedido = ped2.codpedido
        WHERE ped2.codcliente = ped.codcliente
        GROUP BY ip2.codproduto
    ) subquery
)
ORDER BY ped.codcliente;


7) Crie uma VIEW chamada PRODUTOS_DEFASADOS_VIEW para mostrar quais produtos não tem pedidos nos últimos três meses.

CREATE VIEW PRODUTOS_DEFASADOS_VIEW AS
SELECT p.codproduto, p.descricao
FROM PRODUTO p
LEFT JOIN ITEMPEDIDO ip ON p.codproduto = ip.codproduto
LEFT JOIN PEDIDO ped ON ip.codpedido = ped.codpedido
WHERE ped.datapedido < CURRENT_DATE - INTERVAL '3 months' OR ped.datapedido IS NULL
GROUP BY p.codproduto, p.descricao
HAVING COUNT(ped.codpedido) = 0;


