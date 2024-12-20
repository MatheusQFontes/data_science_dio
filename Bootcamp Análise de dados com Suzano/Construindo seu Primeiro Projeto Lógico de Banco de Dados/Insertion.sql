-- inserção de dados e queries

use ecommerce;
show tables;
desc clients;
-- clients 
insert into clients ( Pname, minit, lname,CPF, street, num,district,city,state,country)
	values('Maria','M','Neves',12345678901,'Rua Santa Rita',29,'Jacuí','João Monlevade','MG','Brasil'),
		  ('Antônio','A','Souza',45678912345,'Rua Juazeiro',100,'Satelite','João Monlevade','MG','Brasil'),
		  ('Joaquim','J','Cruz',78912345678,'Rua Parauna',78,'Castelo','João Monlevade','MG','Brasil'),
		  ('José','J','Silva',78456952135,'Rua Jequitibá',62,'Santa Barbara','João Monlevade','MGs','Brasil');
select * from clients;
desc product;

insert into product(Pname, classification_Kids, Category, Avaliation, size) 
values('CelularA03',false,'Eletronic','4',null),
	  ('Nintendo',true,'Toys','3',null),
	  ('NoteBook',false,'Eletronic','4',null),
	  ('Camiseta',false,'Clothes','4',null),
	  ('A Indomada',false,'books','4',null);
	
select * from clients;
select * from product;
select * from orders;

desc orders;
insert into orders (idOrderClient,orderStatus,orderDescription,sendValue,paymentCash) 
values  (1,default,'compra via aplicativo',null,1),
		(2,default,'compra via aplicativo',50,1),
		(3,'Confirmado',null,null,1),
		(4,default,'compra via web site',150,0),
        (1,'Confirmado','compra via aplicativo',100,0),
		(2,'Confirmado','compra via aplicativo',50,1),
		(3,'Confirmado',null,null,1),
		(3,default,'compra via web site',500,0);
        
select * from orders;
delete from orders where idOrderClient in (1,2,3,4,5,6,7,8,9,10,11,12,13,14);
desc productOrder;
select * from productOrder;
insert into productOrder(idPOproduct, idPOorder, poQuantity, poStatus) values
						(1,15,1,null),
                        (2,15,1,null),
                        (3,16,1,null);
                        
select * from productOrder;
desc productStorage;
select * from productStorage;
insert into productStorage (storageLocation, quantity)
	value ('São Paulo',1000),
		  ('Rio de Janeiro',200),
		  ('Belo Horizonte',500),
		  ('Curitiba',100),
          ('Curitiba',550),
		  ('São Paulo',20);

desc supplier;
select * from supplier;
insert into supplier (storageLocation, corporateName, SocialName,CNPJ, contact, street, num, District,city,state,country) values
			('São Paulo','Limeira LTDA',null,31999991234,31898888141,'Jacuí',15,'Jacuí','São Paulo','SP','Brasil'),
            ('Curitiba','Laranja LTDA',null,222222222222222,11111111111,'Jequitibá',23,'palmeiras','Curitiba','SC','Brasil'),
            ('Rio de Janeiro','Jurubeba LTDA',null,111111111111111,31999991234,'California',45,'Leblon','Rio de Janeiro','RJ','Brasil');
            
desc storageLocation;
select * from storageLocation;
insert into storageLocation (idLproduct,idLstorage,location) values
			(1,1,'RJ'),
            (2,3,'SP');
            
desc productSupplier;
select * from productSupplier;
insert into productSupplier(idPsSupplier, idPsProduct, quantity) values
			(1,1,500),
            (1,2,400),
            (2,4,633),
            (3,3,5),
			(2,5,10);
            
            
desc seller;
select * from seller;
insert into seller(CorporateName, SocialName,CNPJ,CPF, contact, RegistrationDate, street, num, District,city,state,country) values
			('Limeira LTDA','Limeira LTDA',123456789000152,null,31999981234,'2020-01-23','Jacuí',15,'Jacuí','São Paulo','SP','Brasil'),
            ('Laranja LTDA','Laranja LTDA',456789123000174,null,15985214576,'2022-04-23','Jequitibá',23,'palmeiras','Curitiba','SC','Brasil'),
            ('João Antunes','João Antunes',null,85214796345,31999991234,'2015-05-23','California',45,'Leblon','Rio de Janeiro','RJ','Brasil');
            
desc productSeller;
select * from productSeller;
select * from product;
insert into productSeller(idPSeller, IdPproduct, prodquantity) value
						(1,1,80),
                        (2,3,10);