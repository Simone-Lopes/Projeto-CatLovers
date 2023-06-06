-- Banco de dados do projeto CatLovers
-- Desenvolvido por Simone Lopes dos Santos

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
	fk_usuario VARCHAR(50),
	FOREIGN KEY (fk_usuario) REFERENCES usuario(email)
);

-- Tabela de perguntas
CREATE TABLE perguntas(
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(200)
);

-- Tabela que recebe a resposta do usuário
CREATE TABLE respostas (
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao CHAR(3),
    CONSTRAINT chkDescricao check (descricao in ('sim', 'nao')),
	fkPergunta INT,
	CONSTRAINT fkPergunta foreign key (fkPergunta) REFERENCES perguntas(id)
);

INSERT INTO perguntas VALUES
	(null, 'Você já adotou ou teve interesse em adotar um gato?'),
    (null, 'Você já ouviu a mentira de que gatos não amam os donos?'),
    (null, 'Você conhece alguém que diz preferir cães?'),
    (null, 'Você acreditava em algo sobre gatos e descobriu que não era verídico através da nossa plataforma?');
    
INSERT INTO respostas values 
    (null, 'sim', 1),
    (null, 'nao', 1),
    (null, 'sim', 2),
    (null, 'nao', 2),
	(null, 'sim', 3),
    (null, 'nao', 3),
	(null, 'sim', 4),
    (null, 'nao', 4);

INSERT INTO usuario values 
	('Si', '56485406808', 'SP', 'São Paulo', '11968023976', 'teste@gmail.com', '123456');

INSERT INTO gato values 
	(null, 'Lucy', 'Fêmea', 'Filhote', 'Médio', 'Sim', 'Não', 'Laranja', '0.20', '1.20', 'Lucy foi resgatada por uma ONG, pois foi encontrada em uma venda ilegal de animais. Ajude Lucy a achar uma familia em que possa encher de amor!', 'http://www.sisi.com', 'siames.jpg', now(), 'simone@gmail.com', 'simone@gmail.com');
    
    SELECT * FROM usuario;
    SELECT * FROM gato;
    SELECT * FROM respostas;
    SELECT * FROM perguntas;
    SELECT * FROM aviso;
    
    -- Select do gato
	SELECT
    g.nomeGato,
    g.sexo,
    g.idade,
    g.porte,
    g.vacina,
    g.castrado,
    g.pelagem,
    g.tamanho,
    g.peso,
    g.historia,
    g.linkFotos,
    g.fotos,
    DATE_FORMAT(g.publicado, '%d/%m/%y %H:%m:%s') as publicação,
    g.fk_cadastrado,
    g.fk_adotado,
    u.nome,
    u.estado,
    u.cidade,
    u.telefoneCelular
    FROM usuario AS u 
    JOIN gato AS g 
    ON g.fk_cadastrado = u.email;
    
    truncate table respostas;
    

    
