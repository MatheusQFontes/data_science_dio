-- criação do banco de dados para o cenário de E-commerce

create database ecommerce;

use ecommerce;

-- criar tabela cliente

create table clients(
	idClients int auto_increment primary key,
    Pname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Street varchar(45),
    Num int not null,
    District varchar(45),
    City varchar(15),
    State Varchar(10),
    Country Varchar(10),
    constraint unique_cpf_client unique (CPF)
    );

alter table clients auto_increment=1;

-- criar tabela produto

create table product(
	Idproduct int auto_increment primary key,
    Pname varchar(10) not null,
    Classification_Kids bool default false,
    Category enum('Eletronic','Clothes','Toys','Furniture','Books') not null,
	Avaliation float default 0,
	size varchar(10)
);


-- criar tabela Payments

 create table payments(
	idclient int,
    idpayment int,
    TypePayment enum('Cartão','Dois cartões'),
    limiteAvailable float,
    primary key (idclient, idpayment)
  );
 
 -- criar tabela pedido
 
  create table orders(
	IdOrder int auto_increment primary key,
    IdOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_order_client foreign key (IdOrderClient) references clients(idClients)
		on update cascade
 );
  
  -- create tabela estoque
  
  create table productStorage(
	idProductStorage int auto_increment primary key,
    storageLocation varchar (255),
    quantity int default 0
);

-- cirar a tabela fornecedor

create table supplier(
	IdSupplier int auto_increment primary key,
    storageLocation varchar (255),
    corporateName varchar (255) not null,
    SocialName varchar(255),
    CNPJ char(15) not null,
    contact varchar (11) not null,    
	Street varchar(45)not null,
    Num int not null,
    District varchar(45)not null,
    City varchar(15)not null,
    State Varchar(10)not null,
    Country Varchar(10)not null,
    constraint unique_supplier unique (CNPJ)
);

-- criar a tabela Seller

create table seller(
	IdSeller int auto_increment primary key,
    CorporateName varchar (255),
    SocialName varchar(255) not null,
    CNPJ char(15),
    CPF char(11),
    contact varchar (11), 
    RegistrationDate date,
	Street varchar(45),
    Num int not null,
    District varchar(45),
    City varchar(15),
    State Varchar(10),
    Country Varchar(10),
     constraint unique_CNPJ_supplier unique (CNPJ),
     constraint unique_CPF_supplier unique (CPF)
);

-- criar a tabela productSeller

create table productSeller(
	IdPSeller int,
    IdPproduct int,
    prodquantity int default 1,
    primary key(IdPSeller, IdPproduct),
    constraint fk_product_seller foreign key (IdPSeller) references Seller(idSeller),
    constraint fk_product_product foreign key (IdPproduct) references product(Idproduct)
);

-- criar a tabela productOrder

create table productOrder(
	IdPOproduct int,
    IdPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível','Sem estoque') default 'Disponível',
    primary key (IdPOproduct,IdPOorder),
    constraint fk_productorder_seller foreign key (IdPOproduct) references product(Idproduct),
	constraint fk_productorder_product foreign key (IdPOorder) references orders(IdOrder)
);

-- criar a tabela storageLocation

create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar (255) not null,
    primary Key (idLproduct,idLstorage),
	constraint fk_storage_location_product foreign key (idLproduct) references product(Idproduct),
	constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProductStorage)
);
 
 -- criar a tabela productSupplier
 
 create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key(idPsSupplier,idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
 );