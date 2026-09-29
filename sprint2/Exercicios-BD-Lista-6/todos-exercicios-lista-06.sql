
CREATE DATABASE sprint2;
USE sprint2;
CREATE TABLE animal (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    especie VARCHAR(40) NOT NULL,
    raca VARCHAR(60),
    idade TINYINT NOT NULL
);

CREATE TABLE ficha_medica (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_ultima_consulta DATE NOT NULL,
    peso DECIMAL(5 , 2 ) NOT NULL,
    vacina_em_dia TINYINT NOT NULL,
    observacao VARCHAR(500),
    fk_animal INT NOT NULL UNIQUE,
    CONSTRAINT fk_ficha_medica_animal FOREIGN KEY (fk_animal)
        REFERENCES animal (id)
);

INSERT INTO animal (nome, especie, raca, idade) VALUES
	('Luna', 'Cachorro', 'Labrador', 1),
	('Mingau', 'Gato', 'Persa', 4),
	('Thor', 'Cachorro', 'Pastor Alemao', 9),
	('Nina', 'Coelho', NULL, 2),
	('Pipoca', 'Cachorro', 'Poodle', 7);


INSERT INTO ficha_medica
	(data_ultima_consulta, peso, vacina_em_dia, observacao, fk_animal)
VALUES
	('2026-08-12', 8.40, TRUE, 'Retorno anual', 1),
	('2026-07-20', 4.80, FALSE, NULL, 2),
	('2026-06-05', 28.50, TRUE, 'Alergia sazonal', 3),
	('2026-09-01', 2.10, FALSE, 'Vacina pendente', 4);

SELECT 
    *
FROM
    animal;
SELECT 
    *
FROM
    ficha_medica;

SELECT 
    nome, especie
FROM
    animal;

SELECT 
    *
FROM
    ficha_medica
WHERE
    vacina_em_dia = FALSE;

SELECT 
    *
FROM
    animal
ORDER BY idade DESC;

SELECT 
    *
FROM
    animal
WHERE
    especie = 'Cachorro';


SELECT 
    nome AS 'Pet', especie AS 'Tipo'
FROM
    animal;

SELECT 
    peso AS 'Peso (kg)',
    data_ultima_consulta AS 'Ultima Consulta'
FROM
    ficha_medica;

SELECT 
    nome, idade * 7 AS 'Idade Humana Aproximada'
FROM
    animal;

SELECT 
    nome AS 'Nome do Pet', raca AS 'Raca/Tipo'
FROM
    animal;


SELECT 
    nome,
    CASE
        WHEN idade < 2 THEN 'Filhote'
        WHEN idade <= 7 THEN 'Adulto'
        ELSE 'Idoso'
    END AS fase_vida
FROM
    animal;

SELECT 
    a.nome,
    CASE
        WHEN fm.vacina_em_dia = TRUE THEN 'Vacinado'
        ELSE 'Pendente'
    END AS vacinacao
FROM
    animal AS a
        LEFT JOIN
    ficha_medica AS fm ON fm.fk_animal = a.id;

SELECT 
    peso,
    CASE
        WHEN peso < 5 THEN 'Pequeno'
        WHEN peso <= 20 THEN 'Médio'
        ELSE 'Grande'
    END AS porte
FROM
    ficha_medica

SELECT 
    nome,
    CASE especie
        WHEN 'Cachorro' THEN 'Canino'
        WHEN 'Gato' THEN 'Felino'
        ELSE 'Outro'
    END AS especie_tipo
FROM
    animal


SELECT 
    a.nome,
    IFNULL(fm.observacao, 'Nenhuma observação') AS observacao
FROM
    animal AS a
        LEFT JOIN
    ficha_medica AS fm ON fm.fk_animal = a.id

SELECT a.nome,
	   IFNULL(fm.data_ultima_consulta, 'SEM FICHA') AS ultima_consulta
FROM animal AS a
LEFT JOIN ficha_medica AS fm ON fm.fk_animal = a.id;

SELECT a.nome, fm.peso, fm.data_ultima_consulta
FROM animal AS a
INNER JOIN ficha_medica AS fm ON fm.fk_animal = a.id;

SELECT CONCAT(a.nome, ' - ', a.especie, ' - ', fm.peso, ' kg') AS resumo
FROM animal AS a
INNER JOIN ficha_medica AS fm ON fm.fk_animal = a.id;

SELECT nome, IFNULL(raca, 'Raca não informada') AS raca
FROM animal;

-- Exercício 2 

USE sprint2;

CREATE TABLE farmacia (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	cnpj VARCHAR(18) NOT NULL UNIQUE
);

CREATE TABLE endereco (
	id INT PRIMARY KEY AUTO_INCREMENT,
	rua VARCHAR(100) NOT NULL,
	numero VARCHAR(10) NOT NULL,
	bairro VARCHAR(60),
	cidade VARCHAR(60) NOT NULL,
	fk_farmacia INT NOT NULL UNIQUE,
	FOREIGN KEY (fk_farmacia) REFERENCES farmacia(id)
);

CREATE TABLE farmaceutico (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	crf VARCHAR(20) NOT NULL UNIQUE,
	turno ENUM('Manhã', 'Tarde', 'Noite') NOT NULL,
	fk_farmacia INT NOT NULL,
	FOREIGN KEY (fk_farmacia) REFERENCES farmacia(id)
);

INSERT INTO farmacia (id, nome, cnpj) VALUES
	(1, 'Farmacia Central', '12.345.678/0001-90'),
	(2, 'Farmacia Vida', '23.456.789/0001-01'),
	(3, 'Farmacia Popular', '34.567.890/0001-12'),
	(4, 'Farmacia Bem Estar', '45.678.901/0001-23');

INSERT INTO endereco (id, rua, numero, bairro, cidade, fk_farmacia) VALUES
	(1, 'Rua das Flores', '120', 'Santana', 'Sao Paulo', 1),
	(2, 'Avenida Brasil', '45A', 'Moema', 'Sao Paulo', 2),
	(3, 'Rua do Comercio', '300', NULL, 'Campinas', 3);

INSERT INTO farmaceutico (id, nome, crf, turno, fk_farmacia) VALUES
	(1, 'Ana Souza', 'CRF-1001', 'Manhã', 1),
	(2, 'Bruno Lima', 'CRF-1002', 'Noite', 1),
	(3, 'Carla Mendes', 'CRF-1003', 'Tarde', 2),
	(4, 'Diego Alves', 'CRF-1004', 'Noite', 3),
	(5, 'Elisa Rocha', 'CRF-1005', 'Manhã', 4);

SELECT * FROM farmacia;
SELECT * FROM endereco;
SELECT * FROM farmaceutico;

SELECT nome, cnpj FROM farmacia;

SELECT *
FROM farmaceutico
WHERE turno = 'Noite';

SELECT *
FROM endereco
ORDER BY cidade ASC;

SELECT nome, crf FROM farmaceutico;

SELECT nome AS 'Estabelecimento', cnpj AS 'Documento'
FROM farmacia;

SELECT nome AS 'Profissional', turno AS 'Horario de Trabalho'
FROM farmaceutico;

SELECT rua AS 'Logradouro', numero AS 'Num.'
FROM endereco;

SELECT CONCAT(rua, ', ', numero) AS 'Endereço Completo'
FROM endereco;

SELECT nome,
	CASE
		WHEN turno = 'Manhã' THEN '06h-12h'
		WHEN turno = 'Tarde' THEN '12h-18h'
		ELSE '18h-00h'
	END AS periodo
FROM farmaceutico;

SELECT nome,
	CASE
		WHEN LEFT(cnpj, 1) = '1' THEN 'Matriz'
		ELSE 'Filial'
	END AS tipo_cnpj
FROM farmacia;

SELECT bairro,
	CASE
		WHEN bairro = 'Santana' THEN 'Zona Norte'
		WHEN bairro = 'Moema' THEN 'Zona Sul'
		ELSE 'Outra'
	END AS zona
FROM endereco;

SELECT nome,
	CASE
		WHEN turno = 'Noite' THEN 'Adicional Noturno'
		ELSE 'Normal'
	END AS carga_horaria
FROM farmaceutico;

SELECT f.nome, IFNULL(e.rua, 'SEM ENDERECO') AS rua
FROM farmacia AS f
LEFT JOIN endereco AS e ON e.fk_farmacia = f.id;

SELECT fa.nome, fa.crf, f.nome AS farmacia
FROM farmaceutico AS fa
INNER JOIN farmacia AS f ON fa.fk_farmacia = f.id;

SELECT f.nome AS farmacia, e.cidade, fa.nome AS farmaceutico
FROM farmacia AS f
INNER JOIN endereco AS e ON e.fk_farmacia = f.id
INNER JOIN farmaceutico AS fa ON fa.fk_farmacia = f.id;

SELECT CONCAT(fa.nome, ' - ', fa.crf, ' - ', f.nome) AS info
FROM farmaceutico AS fa
INNER JOIN farmacia AS f ON fa.fk_farmacia = f.id;

SELECT rua, IFNULL(bairro, 'Bairro não informado') AS bairro
FROM endereco;

INSERT INTO endereco (rua, numero, bairro, cidade, fk_farmacia)
VALUES ('Rua Duplicada', '999', 'Centro', 'Sao Paulo', 1);

-- Exercício 3 

USE sprint2;

CREATE TABLE artista (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	genero_musical VARCHAR(60) NOT NULL,
	pais VARCHAR(60),
	ativo TINYINT NOT NULL
);

CREATE TABLE musica (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100) NOT NULL,
	duracao_segundos INT NOT NULL,
	ano_lancamento SMALLINT  NOT NULL,
	fk_artista INT,
	FOREIGN KEY (fk_artista) REFERENCES artista(id)
);

INSERT INTO artista (id, nome, genero_musical, pais, ativo) VALUES
	(1, 'Legiao Urbana', 'Rock', 'Brasil', 0),
	(2, 'Adele', 'Pop', 'Reino Unido', 1),
	(3, 'Gilberto Gil', 'MPB', NULL, 1),
	(4, 'Daft Punk', 'Eletronica', 'Franca', 0);

INSERT INTO musica (id, titulo, duracao_segundos, ano_lancamento, fk_artista) VALUES
	(1, 'Tempo Perdido', 337, 1986, 1),
	(2, 'Pais e Filhos', 301, 1989, 1),
	(3, 'Hello', 295, 2015, 2),
	(4, 'Easy on Me', 224, 2021, 2),
	(5, 'Aquele Abraco', 240, 1969, 3),
	(6, 'Faixa sem artista', 190, 2023, NULL);

SELECT * FROM artista;
SELECT * FROM musica;

SELECT titulo, duracao_segundos
FROM musica;

SELECT *
FROM musica
WHERE ano_lancamento > 2020;

SELECT *
FROM artista
ORDER BY nome ASC;

SELECT *
FROM musica
WHERE duracao_segundos > 200;

SELECT titulo AS 'Nome da Música', ano_lancamento AS 'Ano'
FROM musica;

SELECT nome AS 'Cantor/Banda', genero_musical AS 'Estilo'
FROM artista;

SELECT titulo, duracao_segundos / 60 AS 'Duração (min)'
FROM musica;

SELECT titulo AS 'Faixa', ano_lancamento AS 'Lançamento'
FROM musica;

SELECT titulo,
	CASE
		WHEN ano_lancamento < 2000 THEN 'Clássico'
		WHEN ano_lancamento <= 2015 THEN 'Moderno'
		ELSE 'Atual'
	END AS era
FROM musica;

SELECT nome,
	CASE
		WHEN ativo = 1 THEN 'Em atividade'
		ELSE 'Inativo'
	END AS status
FROM artista;

SELECT titulo,
	CASE
		WHEN duracao_segundos < 180 THEN 'Curta'
		WHEN duracao_segundos <= 300 THEN 'Normal'
		ELSE 'Longa'
	END AS tamanho
FROM musica;

SELECT nome,
	CASE
		WHEN pais = 'Brasil' THEN 'Nacional'
		ELSE 'Internacional'
	END AS origem
FROM artista;

SELECT nome, IFNULL(pais, 'Pais desconhecido') AS pais
FROM artista;

SELECT m.titulo, IFNULL(a.nome, 'ARTISTA DESCONHECIDO') AS artista
FROM musica AS m
LEFT JOIN artista AS a ON m.fk_artista = a.id;

SELECT m.titulo, m.ano_lancamento, a.nome AS artista
FROM musica AS m
JOIN artista AS a ON m.fk_artista = a.id;

SELECT CONCAT(m.titulo, ' - ', a.nome, ' - ', m.ano_lancamento) AS catalogo
FROM musica AS m
JOIN artista AS a ON m.fk_artista = a.id;

SELECT a.nome AS artista, m.titulo AS musica
FROM musica AS m
RIGHT JOIN artista AS a ON m.fk_artista = a.id;

-- Exercício 4

USE sprint2;

CREATE TABLE cliente (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	telefone VARCHAR(20) NOT NULL,
	email VARCHAR(100)
);

CREATE TABLE veiculo (
	id INT PRIMARY KEY AUTO_INCREMENT,
	placa VARCHAR(10) NOT NULL UNIQUE,
	marca VARCHAR(60) NOT NULL,
	modelo VARCHAR(60) NOT NULL,
	ano INT NOT NULL,
	fk_cliente INT,
	FOREIGN KEY (fk_cliente) REFERENCES cliente(id)
);

INSERT INTO cliente (id, nome, telefone, email) VALUES
	(1, 'Renata Souza', '11987654321', 'renata@email.com'),
	(2, 'Caio Lima', '11912345678', NULL),
	(3, 'Joana Alves', '11955554444', 'joana@email.com');

INSERT INTO veiculo (id, placa, marca, modelo, ano, fk_cliente) VALUES
	(1, 'ABC1D23', 'Fiat', 'Uno', 2008, 1),
	(2, 'DEF4G56', 'Chevrolet', 'Onix', 2014, 1),
	(3, 'HIJ7K89', 'Toyota', 'Corolla', 2018, 2),
	(4, 'LMN1O23', 'Volkswagen', 'Polo', 2021, 2),
	(5, 'PQR4S56', 'Honda', 'Civic', 2023, NULL);

SELECT * FROM cliente;
SELECT * FROM veiculo;

SELECT placa, marca, modelo
FROM veiculo;

SELECT *
FROM veiculo
WHERE marca = 'Fiat';

SELECT *
FROM veiculo
ORDER BY ano DESC;

SELECT *
FROM veiculo
WHERE ano < 2015;

SELECT placa AS 'Placa do Veículo', modelo AS 'Modelo do Carro'
FROM veiculo;

SELECT nome AS 'Proprietario', telefone AS 'Contato'
FROM cliente;

SELECT ano, YEAR(CURDATE()) - ano AS 'Idade do Veículo'
FROM veiculo;

SELECT CONCAT(marca, ' ', modelo) AS 'Veículo Completo'
FROM veiculo;

SELECT placa,
	CASE
		WHEN ano >= 2020 THEN 'Novo'
		WHEN ano >= 2010 THEN 'Seminovo'
		ELSE 'Antigo'
	END AS classificacao
FROM veiculo;

SELECT modelo,
	CASE
		WHEN marca IN ('Fiat', 'Chevrolet', 'Volkswagen') THEN 'Nacional'
		ELSE 'Importado'
	END AS tipo_marca
FROM veiculo;

SELECT nome,
	CASE
		WHEN email IS NOT NULL THEN 'Sim'
		ELSE 'Não'
	END AS possui_email
FROM cliente;

SELECT placa,
	CASE
		WHEN ano BETWEEN 2000 AND 2009 THEN 'Anos 2000'
		WHEN ano BETWEEN 2010 AND 2019 THEN 'Anos 2010'
		ELSE 'Anos 2020'
	END AS decada
FROM veiculo;

SELECT nome, IFNULL(email, 'Email não cadastrado') AS email
FROM cliente;

SELECT v.placa, IFNULL(c.nome, 'SEM DONO') AS cliente
FROM veiculo AS v
LEFT JOIN cliente AS c ON v.fk_cliente = c.id;

SELECT v.placa, v.modelo, c.nome AS proprietario
FROM veiculo AS v
INNER JOIN cliente AS c ON v.fk_cliente = c.id;

SELECT CONCAT(v.placa, ' - ', v.modelo, ' - ', c.nome) AS registro
FROM veiculo AS v
INNER JOIN cliente AS c ON v.fk_cliente = c.id;

SELECT c.nome AS cliente, v.placa, v.modelo
FROM veiculo AS v
RIGHT JOIN cliente AS c ON v.fk_cliente = c.id;

-- Exercício 5

USE sprint2;

CREATE TABLE equipe (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	regiao VARCHAR(10) NOT NULL CHECK (regiao IN ('Americas', 'Europa', 'Asia')),
	ranking INT
);

CREATE TABLE jogador_cs (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nickname VARCHAR(50) NOT NULL,
	nome_real VARCHAR(100) NOT NULL,
	funcao VARCHAR(10) NOT NULL CHECK (funcao IN ('Rifler', 'AWPer', 'Entry', 'IGL', 'Suporte')),
	fk_equipe INT,
	FOREIGN KEY (fk_equipe) REFERENCES equipe(id)
);

INSERT INTO equipe (id, nome, regiao, ranking) VALUES
	(1, 'Fenix', 'Americas', 4),
	(2, 'Atlas', 'Europa', 12),
	(3, 'Nova', 'Asia', NULL);

INSERT INTO jogador_cs (id, nickname, nome_real, funcao, fk_equipe) VALUES
	(1, 'Flash', 'Felipe Santos', 'AWPer', 1),
	(2, 'Vex', 'Victor Lima', 'Rifler', 1),
	(3, 'Echo', 'Eduardo Costa', 'Entry', 2),
	(4, 'Comet', 'Caio Rocha', 'IGL', 2),
	(5, 'Freebird', 'Fabio Alves', 'Suporte', NULL);

SELECT * FROM equipe;
SELECT 
    *
FROM
    jogador_cs;

SELECT nickname, funcao
FROM jogador_cs;

SELECT *
FROM jogador_cs
WHERE funcao = 'AWPer';

SELECT *
FROM equipe
ORDER BY ranking ASC;

SELECT *
FROM jogador_cs
WHERE nickname LIKE 'F%';

SELECT nickname AS 'Nick', nome_real AS 'Nome Verdadeiro'
FROM jogador_cs;

SELECT nome AS 'Time', regiao AS 'Região Competitiva'
FROM equipe;

SELECT ranking AS 'Posição no Ranking Mundial'
FROM equipe;

SELECT CONCAT(nickname, ' - ', funcao) AS 'Jogador e Função'
FROM jogador_cs;

SELECT nome,
	CASE
		WHEN ranking <= 5 THEN 'Tier 1'
		WHEN ranking BETWEEN 6 AND 20 THEN 'Tier 2'
		ELSE 'Tier 3'
	END AS nivel
FROM equipe;

SELECT nickname,
	CASE
		WHEN funcao IN ('Rifler', 'Entry') THEN 'Agressivo'
		WHEN funcao = 'AWPer' THEN 'Sniper'
		ELSE 'Tático'
	END AS 'tipo_função'
FROM jogador_cs;

SELECT nome,
	CASE
		WHEN regiao = 'Americas' THEN 'Ocidente'
		ELSE 'Oriente'
	END AS continente
FROM equipe;

SELECT nickname,
	CASE
		WHEN funcao = 'IGL' THEN 'Sim - In-Game Leader'
		ELSE 'Não'
	END AS 'líder'
FROM jogador_cs;

SELECT nome, IFNULL(ranking, 'Sem ranking') AS ranking
FROM equipe;

SELECT j.nickname, IFNULL(e.nome, 'FREE AGENT') AS equipe
FROM jogador_cs AS j
LEFT JOIN equipe AS e ON j.fk_equipe = e.id;

SELECT j.nickname, j.funcao, e.nome AS equipe
FROM jogador_cs AS j
INNER JOIN equipe AS e ON j.fk_equipe = e.id;

SELECT CONCAT(j.nickname, ' - ', j.funcao, ' - ', e.nome) AS perfil
FROM jogador_cs AS j
INNER JOIN equipe AS e ON j.fk_equipe = e.id;

SELECT e.nome AS equipe, j.nickname
FROM jogador_cs AS j
RIGHT JOIN equipe AS e ON j.fk_equipe = e.id;

-- Exercício 6

USE sprint2;

CREATE TABLE marca (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	pais_origem VARCHAR(60)
);

CREATE TABLE tenis (
	id INT PRIMARY KEY AUTO_INCREMENT,
	modelo VARCHAR(100) NOT NULL,
	tamanho INT NOT NULL,
	preco DECIMAL(8, 2) NOT NULL CHECK (preco > 0),
	categoria VARCHAR(20) NOT NULL CHECK (categoria IN ('Corrida', 'Casual', 'Basquete', 'Futebol')),
	fk_marca INT,
	FOREIGN KEY (fk_marca) REFERENCES marca(id)
);

INSERT INTO marca (id, nome, pais_origem) VALUES
	(1, 'Nike', 'Estados Unidos'),
	(2, 'Adidas', NULL),
	(3, 'Mizuno', 'Japao');

INSERT INTO tenis (id, modelo, tamanho, preco, categoria, fk_marca) VALUES
	(1, 'Pegasus', 41, 599.90, 'Corrida', 1),
	(2, 'Air Force 1', 39, 699.90, 'Casual', 1),
	(3, 'Ultraboost', 42, 799.90, 'Corrida', 2),
	(4, 'Samba', 37, 499.90, 'Casual', 2),
	(5, 'Forum Low', 43, 649.90, 'Basquete', 2),
	(6, 'Tenis Generico', 40, 150.00, 'Futebol', NULL);

SELECT * FROM marca;
SELECT * FROM tenis;

SELECT modelo, preco
FROM tenis;

SELECT 
    *
FROM
    tenis WHERE
    categoria = 'Corrida';

SELECT *
FROM tenis
ORDER BY preco DESC;

SELECT *
FROM tenis
WHERE tamanho >= 40;

SELECT modelo AS 'Produto', preco AS 'Valor (R$)'
FROM tenis;

SELECT nome AS 'Fabricante', pais_origem AS 'Pais'
FROM marca;

SELECT modelo, preco * 1.15 AS 'Preço com Frete'
FROM tenis;

SELECT CONCAT(modelo, ' - Tamanho ', tamanho) AS 'Descrição do Produto'
FROM tenis;

SELECT modelo,
	CASE
		WHEN preco < 200 THEN 'Econômico'
		WHEN preco <= 500 THEN 'Intermediário'
		ELSE 'Premium'
	END AS 'faixa_preço'
FROM tenis;

SELECT modelo,
	CASE
		WHEN categoria = 'Corrida' THEN 'Esporte - Performance'
		WHEN categoria = 'Casual' THEN 'Dia a Dia'
		ELSE 'Esporte - Específico'
	END AS uso
FROM tenis;

SELECT nome,
	CASE
		WHEN pais_origem = 'Brasil' THEN 'Nacional'
		ELSE 'Importada'
	END AS origem
FROM marca;

SELECT modelo,
	CASE
		WHEN tamanho < 38 THEN 'Pequeno'
		WHEN tamanho <= 42 THEN 'Médio'
		ELSE 'Grande'
	END AS 'numeração'
FROM tenis;

SELECT nome, IFNULL(pais_origem, 'Origem desconhecida') AS pais_origem
FROM marca;

SELECT t.modelo, IFNULL(m.nome, 'MARCA GENERICA') AS marca
FROM tenis AS t
LEFT JOIN marca AS m ON t.fk_marca = m.id;

SELECT t.modelo, t.preco, m.nome AS marca
FROM tenis AS t
INNER JOIN marca AS m ON t.fk_marca = m.id;

SELECT CONCAT(t.modelo, ' - ', t.categoria, ' - ', m.nome) AS vitrine
FROM tenis AS t
INNER JOIN marca AS m ON t.fk_marca = m.id;

SELECT 
    m.nome AS marca, t.modelo
FROM
    tenis AS t
        RIGHT JOIN
    marca AS m ON t.fk_marca = m.id;





