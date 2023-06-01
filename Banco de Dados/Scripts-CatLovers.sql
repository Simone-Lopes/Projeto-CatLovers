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
		constraint chkSexo check (sexo in ('Macho', 'Fêmea')),
	idade VARCHAR(10),
		constraint chkIdade check (idade in ('Filhote', 'Jovem', 'Adulto', 'Idoso', 'Não identificado')),
	porte VARCHAR(20),
		constraint chkPorte check (porte in ('Pequeno', 'Médio', 'Grande')),
	vacina VARCHAR(10),
		constraint chkVacina check (vacina in ('Sim', 'Não', 'Não sei')),
	castrado VARCHAR(10),
		constraint chkCastrado check (castrado in ('Sim', 'Não', 'Não sei')),
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

CREATE TABLE perguntas(
id INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(200)
);

CREATE TABLE respostas (
id INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(45),
fkPergunta INT,
CONSTRAINT fkPergunta foreign key (fkPergunta) REFERENCES perguntas(id)
);

INSERT INTO perguntas VALUES
	(null, 'teste 01'),
    (null, 'teste 02');
    
INSERT INTO respostas values 
    (null, 8, 1),
    (null, 8, 1),
    (null, 10, 1),
    (null, 12, 2),
    (null, 2, 2),
    (null, 8, 2);

INSERT INTO usuario values 
	('Simone Lopes', '56485406808', 'SP', 'São Paulo', '11968023976', 'simone@gmail.com', '123456');

INSERT INTO gato values 
	(null, 'Lucy teste', 'Fêmea', 'Filhote', 'Médio', 'Sim', 'Não', 'Laranja', '0.20', '1.20', 'Lucy foi resgatada por uma ONG, pois foi encontrada em uma venda ilegal de animais. Ajude Lucy a achar uma familia em que possa encher de amor!', 'http://www.sisi.com', 'siames.jpg', now(), 'simone@gmail.com', null);
    
    select * from usuario;
	select * from gato;
    select * from respostas;
    
	select *
    from usuario as u join gato as g on gato.fk_cadastrado = usuario.email;
    
    truncate table respostas;

    
