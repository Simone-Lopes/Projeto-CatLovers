-- Banco de dados do projeto CatLovers
-- Desenvolvido por Simone Lopes dos Santos

DROP DATABASE catlovers;

CREATE DATABASE catlovers;
USE catlovers;

-- Tabela para cadastrar usuário
CREATE TABLE usuario (
	nome VARCHAR(40),
    cpf CHAR(11),
    estado CHAR(2),
    cidade VARCHAR(50),
	telefoneCelular CHAR(11),
	email VARCHAR(50),
	senha VARCHAR(50),
    CONSTRAINT email primary key (email)
);

-- Tabela para cadastrar gato
CREATE TABLE gato(
	idGato INT PRIMARY KEY auto_increment,
	nomeGato VARCHAR(20),
	sexo VARCHAR(20),
	idade VARCHAR(10),

	porte VARCHAR(20),

	vacina VARCHAR(10),

	castrado VARCHAR(10),

	pelagem VARCHAR(50),
    tamanho FLOAT,
    peso FLOAT,
	historia VARCHAR(200),
    linkFotos VARCHAR(200),
    fotos VARCHAR(50),
	publicado datetime default current_timestamp,
    
    fk_cadastrado VARCHAR(50),
    CONSTRAINT fk_cadastrado FOREIGN KEY (fk_cadastrado) REFERENCES usuario(email),
    
    fk_adotado VARCHAR(50),
    CONSTRAINT fk_adotado FOREIGN KEY (fk_adotado) REFERENCES usuario(email)
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
	('Simone Lopes', '56485406808', 'SP', 'São Paulo', '11968023976', 'simone@gmail.com', '123456');

INSERT INTO gato values 
	(null, 'Lucy', 'femea', 'filhote', 'medio', 'sim', 'nao', 'Laranja', '0.20', '1.20', 'Lucy foi resgatada em uma venda ilegal de animais.', 'http://www.sisi.com', 'siames', now(), 'simone@gmail.com', null);
    
    select * from usuario;
	select * from gato;
    
INSERT INTO gato (nomeGato, sexo, idade, porte, vacina, castrado, pelagem, tamanho, peso, historia, linkFotos, fotos, fk_cadastrado) VALUES ('${nomeGato}', 'femea', 'filhote', 'pequeno','sim', 'sim', '${pelagem}', 10, 55, '${historia}', '${link}','${fotos}','simone@gmail.com');
    
	select * from usuario join gato on  gato.fk_cadastrado = usuario.email;

    
    