-- Banco de dados do projeto CatLovers
-- Desenvolvido por Simone Lopes dos Santos

CREATE DATABASE catlovers;
USE catlovers;

-- Tabela para cadastrar usuário
CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(40),
    cpf CHAR(11),
    estado VARCHAR(20),
    cidade VARCHAR(50),
	telefoneCelular CHAR(11),
	email VARCHAR(50),
	senha VARCHAR(50)
);

-- Tabela para cadastrar gato
CREATE TABLE gato(
	idGato INT,
	nomeGato VARCHAR(20),
	sexo VARCHAR(20),
		constraint chkSexo check (sexo in ('macho', 'femea')),
	idade VARCHAR(10),
		constraint chkIdade check (idade in ('filhote', 'pré-adulto', 'adulto', 'idoso', 'não identificado')),
	porte VARCHAR(20),
		constraint chkPorte check (porte in ('pequeno', 'médio', 'grande', 'não identificado')),
	vacina VARCHAR(10),
		constraint chkVacina check (porte in ('sim', 'não', 'não sei')),
	castrado VARCHAR(10),
		constraint chkCastrado check (porte in ('sim', 'não', 'não sei')),
	pelagem VARCHAR(50),
    tamanho DOUBLE,
    peso DOUBLE,
	historia VARCHAR(200),
    caracteristicas VARCHAR(30),
    publicado DATE,
    pk_gatoAdotado INT,
    CONSTRAINT PRIMARY KEY (pk_gatoAdotado, idGato),
    fk_usuarioGato INT,
    FOREIGN KEY (fk_usuarioGato) REFERENCES usuario(id)
);

-- Tabela para comentários
CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

DROP DATABASE catlovers;