1-Inserir novo cliente
create or replace procedure sp_inserirCliente (
	p_codcliente int,p_nome varchar ,p_datanascimento date , p_cpf varchar) as $$
	begin
		insert into cliente (codcliente,nome,datanascimento,cpf)
		values(p_codcliente,p_nome,p_datanascimento,p_cpf);
	end;
	$$ language plpgsql;

call sp_inserirCliente(11,'cris','06/05/1982','12345665355');

2-Atualizar saldo de um produto
create or replace procedure sp_atualizarSaldoProduto(p_codproduto int,p_valor numeric) as $$
	begin 
		update produto set saldo = saldo + p_valor
		where codproduto = p_codproduto;
	end;
	$$ language plpgsql;
call sp_atualizarSaldoProduto(1,100);

3-Listar pedidos de um cliente
create or replace function fn_listarPedidosCliente (p_codcliente int)
	returns table (codpedido int,codcliente int,datapedido date,nf varchar,valortotal decimal,obs text) as $$
		begin
			return query select * from pedido ped where ped.codcliente = p_codcliente;
		end;
		$$ language plpgsql;
select * from fn_listarPedidosCliente(3);
		
4-Buscar produtos com saldo abaixo de um valor
create or replace function fn_produtosComBaixoEstoque (p_limite numeric)
	returns table (codproduto int , descricao varchar , saldo numeric) as $$
		begin
			return query select * from produto where produto.saldo < p_limite;
		end;
		$$ language plpgsql;

5-Calcular total de um pedido
create or replace procedure sp_CalcularTotalPedido 

select * from cliente;
select * from produto;
select * from pedido;