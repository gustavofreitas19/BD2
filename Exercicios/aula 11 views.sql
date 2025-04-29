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

//------------segunda aula -----------\\

CREATE TABLE ATENDIMENTO (
codatendimento INT not null PRIMARY KEY,
codcliente INT not null,
codpedido INT null,
dataatendimento DATE,
tipocontato VARCHAR(30),
descricao TEXT,
FOREIGN KEY (codcliente) REFERENCES CLIENTE(codcliente),
FOREIGN KEY (codpedido) REFERENCES PEDIDO(codpedido));

// ------------ inserts na tabela

INSERT INTO ATENDIMENTO (codatendimento, codcliente, codpedido, dataatendimento, tipocontato, descricao) VALUES
(1, 1, 1, '2025-02-02', 'telefone', 'Cliente confirmou prazo de entrega'),
(2, 1, 9, '2025-04-17', 'telefone', 'Solicitou alteração no pedido'),
(3, 1, NULL, '2025-04-21', 'email', 'Elogiou atendimento anterior'),
(4, 2, 2, '2025-03-04', 'email', 'Solicitação de 2ª via da nota fiscal'),
(5, 2, 10, '2025-04-19', 'telefone', 'Solicitou cancelamento de item'),
(6, 2, NULL, '2025-04-15', 'email', 'Perguntou sobre formas de pagamento'),
(7, 3, NULL, '2025-03-06', 'presencial', 'Consulta sobre formas de pagamento'),
(8, 3, 3, '2025-03-06', 'chat', 'Confirmação de endereço de entrega'),
(9, 4, 4, '2025-03-08', 'email', 'Reclamou de atraso na entrega'),
(10, 5, 5, '2025-03-10', 'telefone', 'Confirmou recebimento dos itens'),
(11, 5, NULL, '2025-04-22', 'telefone', 'Reclamou de produto com defeito'),
(12, 7, 7, '2025-04-13', 'chat', 'Tirou dúvidas sobre nota fiscal'),
(13, 7, NULL, '2025-04-14', 'telefone', 'Solicitou informações sobre troca'),
(14, 9, NULL, '2025-04-20', 'presencial', 'Consultou sobre próximos lançamentos'),
(15, 9, 9, '2025-04-18', 'chat', 'Status do pedido em transporte');



// ------------- Criar as consultas em views abaixo: 

1)Crie uma view chamada vw_clientes_com_pedidos que liste o nome do cliente, a data do pedido e o valor total, apenas para os clientes que já realizaram pedidos.

CREATE VIEW vw_clientes_com_pedidos AS
SELECT     c.codcliente,    c.nome,    p.datapedido,    p.valortotal
FROM CLIENTE c
JOIN PEDIDO p ON c.codcliente = p.codcliente;

2)Crie uma view chamada vw_produtos_mais_vendidos que exiba o código, descrição e a quantidade total vendida de cada produto, ordenados do mais vendido para o menos vendido.

create view vw_produtos_mais_vendidos as 
select pr.codproduto , pr.descricao, sum (i.quantidade) as total_vendido
from produto pr
join itempedido i on pr.codproduto = i.codproduto
group by pr.codproduto,pr.descricao
order by total_vendido desc;

3)Crie uma view chamada vw_detalhes_pedidos que una informações do cliente, pedido e itens do pedido. Inclua: nome do cliente, data do pedido, descrição do produto, quantidade, valor unitário e valor total do item (quantidade × valor unitário).

create view vw_detalhes_pedidos as
select c.nome,p.datapedido,pr.descricao,i.quantidade,i.valorunitario,(i.quantidade * i.valorunitario) as valor_total_item
from cliente c
join pedido p on c.codcliente = p.codcliente
join itempedido i on p.codpedido = i.codpedido
join produto pr on i.codproduto = pr.codproduto

4)Crie uma view chamada vw_pedidos_acima_media que mostre todos os pedidos cujo valortotal seja maior do que a média de todos os pedidos realizados.

create view vw_pedidos_acima_media as
select * from pedido
where valortotal > (select avg(valortotal)from pedido);


5)Crie uma view chamada vw_produtos_baixo_estoque que retorne produtos cujo saldo atual seja inferior a 300 unidades.

create view vw_produtos_baixo_estoque as
select * from produto 
where saldo < 300;

6)Crie uma view chamada vw_total_pedidos_cliente que exiba o nome do cliente e o total acumulado em reais de todos os seus pedidos.

create view vw_total_pedidos_cliente as
select c.codcliente, c.nome , sum (p.valortotal)
from cliente c
join pedido p on c.codcliente = p.codcliente
group by c.codcliente, c.nome
order by c.nome;

7)Crie uma view chamada vw_aniversariantes_mes_atual que mostre nome e data de nascimento dos clientes que fazem aniversário no mês atual.

create view vw_aniversariantes_mes_atual as
select * from cliente
where extract(month from datanascimento) = extract(month from current_date);

8)Crie uma view chamada vw_produtos_nunca_vendidos que mostre os produtos que nunca foram incluídos em nenhum item de pedido.

create view vw_produtos_nunca_vendidos as 
select p. *
from produto p 
where not exists (select ip.codproduto
					from itempedido ip 
					where ip.codproduto = p.codproduto);

9)Crie uma view chamada vw_ultimo_pedido_cliente que retorne o nome do cliente, a data do seu último pedido e o valor total desse pedido.

create view vw_ultimo_pedido_cliente as
select c.nome as nome_cliente,
		p.datapedido as data_ultimo_pedido,
		p.valortotal
	from cliente c 
	JOIN
    PEDIDO p ON c.codcliente = p.codcliente
	WHERE
    p.datapedido = (
        SELECT MAX(p2.datapedido)
        FROM PEDIDO p2
        WHERE p2.codcliente = c.codcliente);

10)Crie uma view chamada vw_ranking_clientes que exiba o nome dos clientes ordenados pelo valor total de pedidos (faturamento), do maior para o menor.

create view vw_ranking_clientes as 
SELECT
    c.nome AS nome_cliente,
    SUM(p.valortotal) AS faturamento_total
FROM
    CLIENTE c
JOIN
    PEDIDO p ON c.codcliente = p.codcliente
GROUP BY
    c.nome
ORDER BY
    faturamento_total DESC;

11)Esta view vai listar os clientes que receberam pelo menos um atendimento.

create view vw_clientes_atendidos as 
SELECT
    c.nome AS nome_cliente,
    COALESCE(SUM(p.valortotal), 0) AS faturamento_total
FROM
    CLIENTE c
LEFT JOIN
    PEDIDO p ON c.codcliente = p.codcliente
GROUP BY
    c.nome
ORDER BY
    faturamento_total DESC;

12)Esta view vai listar os clientes que nunca foram atendidos.

create view vw_clientes_sem_atendimento as
SELECT
    c.nome AS nome_cliente
FROM
    CLIENTE c
LEFT JOIN
    PEDIDO p ON c.codcliente = p.codcliente
WHERE
    p.codpedido IS NULL;

13)Esta view vai mostrar todos os pedidos feitos por cada cliente, incluindo a descrição do pedido e valor total.

create view vw_pedidos_por_cliente as 
SELECT
    c.nome AS nome_cliente,
    p.codpedido,
    p.datapedido,
    p.nf AS nota_fiscal,
    p.obs AS observacao,
    p.valortotal
FROM
    CLIENTE c
JOIN
    PEDIDO p ON c.codcliente = p.codcliente;

14)Esta view exibe todos os atendimentos feitos por cada cliente, incluindo o tipo de contato.

create view vw_atendimentos_por_cliente as 
SELECT
    c.nome AS nome_cliente,
    a.dataatendimento,
    a.tipocontato,
    a.descricao
FROM
    CLIENTE c
JOIN
    ATENDIMENTO a ON c.codcliente = a.codcliente;

15)Esta view lista todos os atendimentos relacionados aos pedidos, caso o atendimento esteja vinculado a um pedido específico.

create view vw_atendimentos_por_pedido as 
SELECT
    c.nome AS nome_cliente,
    p.codpedido,
    p.datapedido,
    a.dataatendimento,
    a.tipocontato,
    a.descricao AS descricao_atendimento
FROM
    ATENDIMENTO a
JOIN
    CLIENTE c ON a.codcliente = c.codcliente
JOIN
    PEDIDO p ON a.codpedido = p.codpedido
WHERE
    a.codpedido IS NOT NULL;

16)Esta view vai mostrar o total de pedidos realizados por cada cliente.

create view vw_total_valor_pedidos_por_cliente as
SELECT
    c.nome AS nome_cliente,
    COUNT(p.codpedido) AS total_pedidos
FROM
    CLIENTE c
JOIN
    PEDIDO p ON c.codcliente = p.codcliente
GROUP BY
    c.nome;

17)Esta view mostra os pedidos marcados como urgentes, com base na descrição do pedido.

create view vw_pedidos_urgentes as
SELECT
    c.nome AS nome_cliente,
    p.codpedido,
    p.datapedido,
    p.nf AS nota_fiscal,
    p.obs AS descricao_pedido,
    p.valortotal
FROM
    CLIENTE c
JOIN
    PEDIDO p ON c.codcliente = p.codcliente
WHERE
    LOWER(p.obs) LIKE '%urgente%';

