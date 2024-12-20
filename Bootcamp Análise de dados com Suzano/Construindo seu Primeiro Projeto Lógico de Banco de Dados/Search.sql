-- Quantos clientes existem na base de dados?
select count(*) from Clients;

-- Quantos produtos existem na base de dados?
select count(*) from product;

-- Quantas orders estão cadastradas na base de dados?
select count(*) from orders;

-- Crie uma quaery para retorna o nome e sobrenome dos cliente unificados, o número de pedido e o status do pedido.
select concat(Pname,'  ',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idclients = idOrderClient;

-- Crie uma query para retornar uma relação onde a identificação do cliente é igual a identificação do pedido do cliente;        
select * from clients c, orders o 
				where c.idclients = idOrderClient
                group by idOrder;

-- Quantos pedidos foram realizados pelos clientes?
select c.idClients, Pname, count(*) as Number_of_orders from clients c 
		inner join orders o on c.idclients = o.idOrderClient
		inner join productOrder p on p.idPOorder = o.idOrder
		group by idClients;