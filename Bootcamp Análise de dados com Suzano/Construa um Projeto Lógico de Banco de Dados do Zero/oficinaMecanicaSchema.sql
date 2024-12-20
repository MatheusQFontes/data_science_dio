-- criação do banco de dados para o cenário de Oficina Mecânica
drop database Oficina_Mecanica;
-- drop table OSCliente;
create database Oficina_Mecanica;

use Oficina_Mecanica;

-- criar tabela cliente

create table cliente(
	idCliente int auto_increment primary key,
    Nome varchar(10),
    Sobrenome varchar(20),
    CPF char(11) not null,
    logradouro varchar(30),
    Número int not null,
    Bairro varchar(20),
    Cidade varchar(20),
    Estado Varchar(20),
    País Varchar(20),
    constraint unique_cpf_client unique (CPF)
    );

create table funcionários(
	idFuncionário int auto_increment primary key,
    Nome varchar(10),
    Sobrenome varchar(20),
    CPF char(11) not null,
    dtAniversário date,
    Função varchar(45),
    dtAdmissao date,
    logradouro varchar(30),
    Número int not null,
    Bairro varchar(20),
    Cidade varchar(20),
    Estado Varchar(20),
    País Varchar(20),
    constraint unique_cpf_client unique (CPF)
    );
    
create table serviços(
	IdServiço int auto_increment primary key,
    NomeServiço varchar(45) not null,
    ValorServiço float,
	Tiposerviço enum('Manutenção', 'Revisão')
    );

create table fornecedor(
	idFornecedor int auto_increment primary key,
    Razão_Social varchar(45),
    Nome_Fantasia varchar(45),
    CNPJ char(15),
    CPF char(11),
    Contato char(11),
    logradouro varchar(30),
    Número int not null,
    Bairro varchar(20),
    Cidade varchar(20),
    Estado Varchar(20),
    País Varchar(20),
    constraint unique_CNPJ_fornecedor unique (CNPJ),
    constraint unique_CPF_fornecedor unique (CPF)
    );

create table estoque(
	idEProduto int auto_increment primary key,
    idEFornecedor int,
	nomeProduto varchar(45) not null,
    valorProduto float not null,
    quantProduto int,
    constraint fk_estoque_Fornecedor foreign key (idEFornecedor) references Fornecedor(idFornecedor)
    );

create table ordemServiço(
	idOServiço int auto_increment primary key,
    statusServiço enum('Em análise', 'Em execução', 'Concluído') default 'Em análise',
	dtOServiço date,
    dtEntregaServiço date,   
    idOSFuncionário int,
    idOSCliente int,
    constraint fk_ordemServiço_Funcionário foreign key (idOSFuncionário) references funcionários(idFuncionário),
    constraint fk_ordemServiço_Cliente foreign key (idOSCliente) references funcionários(idCliente)
);

create table OSfuncionários(
	idOSFFuncionários int,
	idOSfServiços int,
    primary key(idOSFFuncionários,idOSfServiços),
    constraint fk_OSFFuncionários_Funcionários foreign key (idOSFFuncionários) references funcionários(idFuncionário),
    constraint fk_OSFFuncionários_Serviços foreign key (idOSfServiços) references ordemServiço(idOServiço) 
); 

create table OSCliente(
	idOSCServiço int,
	idOSCCliente int,
    primary key(idOSCServiço,idOSCCliente),
    constraint fk_OSCCliente_OSCServiço foreign key (idOSCServiço) references ordemServiço(idOServiço),
    constraint fk_OSCCliente_OSCCliente foreign key (idOSCCliente ) references Cliente(idCliente)
   ); 

create table OSEstoque(
	idOSEProduto int,
    idOSEServiços int,
    idOSEFornecedor int,
    primary key (idEProduto,isOSServiços),
    constraint fk_OSEstoque_Serviços foreign key (idOSEServiços) references ordemServiço(idOServiço),
	constraint fk_OSEstoque_Produto foreign key (idOSEProduto) references estoque(idEProduto),
	constraint fk_OSEstoque_Fornecedor foreign key (idOSEFornecedor) references estoque(idEFornecedor)
);

create table OSServiços(
	idOSSServiços int,
    idSServiços int,
    primary key(idOSSServiços,idSServiços),
	constraint fk_OSServiços_Serviços foreign key (idOSSServiços) references ordemServiço(idOServiço),
	constraint fk_OSServiços_Produto foreign key (idSServiços) references serviços(IdServiço)
);

create table pecaEstoque(
	pecas_idPecas int,
	estoque_idEstoque int,
    primary key(peças_idPecas,Estoque_idEstoque),
    constraint fk_pecaEstoque_pecas foreign key (pecas_idPecas) references pecas(Idpeca),
    constraint fk_pecaEstoque_estoque foreign key (estoque_idEstoque) references Estoque(IdEstoque)
);

create table pecaOServico(
	pecas_idOSPecas int,
	os_idOServico int,
    primary key(peças_idPecas,Estoque_idEstoque),
    constraint fk_pecaOServico_pecas foreign key (pecas_idOSPecas) references pecas(Idpeca),
    constraint fk_pecaOServico_OServico foreign key (os_idOServico) references Estoque(IdEstoque)
);