-- Banco de dados do projeto CatLovers
-- Desenvolvido por Simone Lopes dos Santos

DROP DATABASE catlovers;
CREATE DATABASE catlovers;
USE catlovers;

-- Tabela para cadastrar usuário
CREATE TABLE usuario (
	id INT PRIMARY KEY auto_increment,
	nome VARCHAR(40),
    cpf CHAR(11),
    estado CHAR(2),
    cidade VARCHAR(50),
	telefoneCelular CHAR(11),
	email VARCHAR(50),
	senha VARCHAR(50)
);

-- Tabela para cadastrar gato
CREATE TABLE gato(
	idGato INT PRIMARY KEY auto_increment,
	nomeGato VARCHAR(20),
	sexo VARCHAR(20),
		constraint chkSexo check (sexo in ('macho', 'femea')),
	idade VARCHAR(10),
		constraint chkIdade check (idade in ('filhote', 'pre-adulto', 'adulto', 'idoso', 'nao identificado')),
	porte VARCHAR(20),
		constraint chkPorte check (porte in ('pequeno', 'medio', 'grande')),
	vacina VARCHAR(10),
		constraint chkVacina check (vacina in ('sim', 'nao', 'nao sei')),
	castrado VARCHAR(10),
		constraint chkCastrado check (castrado in ('sim', 'nao', 'nao sei')),
	pelagem VARCHAR(50),
    tamanho FLOAT,
    peso FLOAT,
	historia VARCHAR(200),
    linkFotos VARCHAR(200),
    foto VARCHAR(50),
	publicado datetime default current_timestamp,
    
    fk_usuario INT,
    CONSTRAINT fk_usuario FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

-- Tabela para comentários 
CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);


INSERT INTO usuario values 
	(null, 'Simone Lopes', '56485406808', 'SP', 'São Paulo', '11968023976', 'simone@gmail.com', '123456');

INSERT INTO gato values 
	(null, 'Lucy', 'femea', 'filhote', 'medio', 'sim', 'nao', 'Laranja', '0.20', '1.20', 'Lucy foi resgatada em uma venda ilegal de animais.', 'http://www.sisi.com', 'siames', default, 1);
    
    select * from usuario;
	select * from gato;
    
	select * from usuario join gato on  gato.fk_usuario = usuario.id;
    
    