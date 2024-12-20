-- inserção de dados e queries
use Oficina_Mecanica;

desc cliente;
-- clients 
insert into cliente ( Nome, Sobrenome, CPF, logradouro, Número, Bairro, Cidade, Estado ,País,veículo,anofabricação,placa)
	values('Maria','Neves',12345678901,'Rua Santa Rita',29,'Jacuí','João Monlevade','MG','Brasil','Ford Fiesta',2010,'lns-2541'),
		  ('Antônio','Souza',45678912345,'Rua Juazeiro',100,'Satelite','João Monlevade','MG','Brasil','Saveiro',2006,'gds-4593'),
		  ('Joaquim','Cruz',78912345678,'Rua Parauna',78,'Castelo','João Monlevade','MG','Brasil','Golf',2010,'def-7812'),
		  ('José','Silva',78456952135,'Rua Jequitibá',62,'Santa Barbara','João Monlevade','MG','Brasil','Fiat Pálio',2020,'dge4851');
          
select * from cliente;
desc funcionários;
select * from funcionários;
insert into funcionários( Nome, Sobrenome, CPF, dtAniversário,Função, dtAdmissao, logradouro, Número, Bairro, Cidade, Estado ,País)
	values('Maria','Souza',75486214598,'1976-05-12','Mecânica','2001-02-24','Rua Ponte Nova',1001,'Belvedere','João Monlevade','MG','Brasil'),
		  ('Antônio','Barbosa',25478134896,'1982-03-29','Mecânico','2001-02-24','Rua Belém',356,'Praia','João Monlevade','MG','Brasil'),
		  ('Joaquim','Melo',74521547896,'1982-03-29','Borracheiro','2005-11-04','Rua Contagem',29,'Pará','João Monlevade','MG','Brasil'),
		  ('José','Florisval',24563217894,'1993-04-20','Mecânico','2015-11-04','Rua Betim',47,'Ipiranga','João Monlevade','MG','Brasil');
          
desc fornecedor;
insert into fornecedor( Razão_Social,Nome_Fantasia, CNPJ, CPF, Contato, logradouro, Número, Bairro, Cidade, Estado ,País)
	values('Limeira LTDA',null,12475145000154,null,31898888141,'Jacuí',15,'Jacuí','São Paulo','SP','Brasil'),
		  ('Laranja LTDA',null,451245781000154,null,15924586589,'Jequitibá',23,'Palmeiras','Curitiba','SC','Brasil'),
		  ('Jurubeba LTDA',null,789523621000174,null,31999991234,'California',45,'Leblon','Rio de Janeiro','RJ','Brasil');
select * from fornecedor;   

desc serviços;
select * from serviços; 
insert into serviços (NomeServiço,ValorServiço,Tiposerviço) 
		values('Troca de pneu',35.00,'Manutenção'),
			  ('Alinhamento',60.00,'Revisão'),
              ('Troca de óleo',20.00,'Manutenção'),
              ('Revisão Geral',100.00,'Revisão'),
              ('Troca de limpador',5.00,'Manutenção');

desc OScliente;
select * from OScliente;
insert into OScliente(idOSCServiço,idOSCCliente,idCliente,idServiço) 
		value(12,3,4,12),
			 (13,3,3,13),
			 (14,1,1,14),
             (15,2,2,15),
             (16,4,4,16);
			
desc estoque;
select * from estoque;
insert into estoque(nomeProduto,valorProduto,quantProduto) 
		value('Pneu Pirelli',389.00,20),
			 ('Pneu Goodyear',399.00,15),
			 ('Óleo Havoline',55.45,20),
             ('limpador Parabrisa',55.45,50),
             ('lâmpada Farol',45.9,30);

desc ordemServiço;
select * from ordemServiço;
insert into ordemServiço(statusServiço,dtOServiço,dtEntregaServiço,idOSFuncionário,idOSCliente,IdOSServiço) 
		value('Em análise','2023-02-06','2023-03-16',1,4,1),
			 ('Em execução','2023-02-24','2023-03-01',1,3,3),
			 ('Em execução','2023-02-28','2023-03-01',2,1,4),
		     ('Em execução','2023-03-01','2023-03-05',2,2,3),
			 ('Em execução','2023-03-01','2023-03-16',3,4,5);    
						
desc OSfuncionários;
select * from OSfuncionários;  
insert into OSfuncionários(idOSFFuncionários,idOSfServiços) 
		value(1,12),
			 (1,13),
			 (2,14),
             (2,15),
             (3,16);

desc OSEstoque;
select * from Estoque;  
insert into OSEstoque(idOSEProduto,idOSEServiços) 
		value(1,12),
			 (1,13),
			 (2,14),
             (2,15),
             (3,16);

select * from  ordemServiço;
select * from  Serviços;
select * from Estoque;       
select * from OSServiços;        
insert into OSServiços(idOSSServiços,idSServiços) 
		value(12,1),
			 (13,1),
			 (14,1),
             (15,1),
             (16,3);

Show Databases;
desc oficina_mecanica;
             
-- Quantos clientes existem na base de dados?
select count(*) from Cliente;

-- Quantos produtos existem na base de dados?
select count(*) from estoque;

-- Quantos fornecedores existem na base de dados?
select count(*) from fornecedor;

-- Quantas ordens de serviço estão cadastradas?
select count(*) from ordemServiço;

-- Quantas ordens de serviços estão relacionadas a revisão e a manutenção?
select count(*) Tiposerviço from serviços where Tiposerviço = 'Manutenção';

-- Quantas ordens de serviços estão relacionadas a revisão?
select count(*) Tiposerviço from serviços where Tiposerviço = 'revisão';

-- Retorne quantas ordens de serviços estão em análise e em execução na tabela ordem de serviço?
select statusServiço, count(*)As record_count from ordemServiço where statusServiço GROUP BY statusServiço;

-- Retorne quantas ordens de serviços estão em análise e em execução na tabela ordem de serviço?
select statusServiço, count(*)As record_count from ordemServiço where statusServiço GROUP BY statusServiço;

-- Reajuste o valor dos produtos Pneu Pirelli em R$ 20.00, Pneu Goodyear em R$ 10.00 e da Lãmpada de Farol em R$ 5.00
update estoque set valorProduto =
	case
		when idEProduto = 1 then valorProduto + 20
		when idEProduto = 2 then valorProduto + 10
		when idEProduto = 5 then valorProduto + 5
        else valorProduto + 0
        end;

select * from Cliente;

-- Retorne o nome do produto e o valor de cada produto da tabela OSEstoque. 
select e.nomeProduto, e.valorProduto from estoque e join OSEstoque o on e.ideProduto = idOSEProduto;

-- Crie uma query para retornar uma relação onde a identificação do cliente é igual a identificação do pedido do cliente;        
select * from cliente c, ordemServiço o 
				where c.idcliente = idOServiço
                group by idOServiço;

-- Crie uma query para retornar o nome e a de registros de serviços do tipo manutenção cadastrados na tabela serviços.
select NomeServiço, count(*) from serviços where tiposerviço = 'Manutenção' group by NomeServiço Having count(*) >=1;

-- Ordene a tabela de produto por nome.
select * from Estoque order by nomeProduto;

-- Ordene a tabela de cliente por nome.
select * from Cliente order by Nome;