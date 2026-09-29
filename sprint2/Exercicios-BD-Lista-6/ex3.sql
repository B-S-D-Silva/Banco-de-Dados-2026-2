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
INNER JOIN artista AS a ON m.fk_artista = a.id;

SELECT CONCAT(m.titulo, ' - ', a.nome, ' - ', m.ano_lancamento) AS catalogo
FROM musica AS m
INNER JOIN artista AS a ON m.fk_artista = a.id;

SELECT a.nome AS artista, m.titulo AS musica
FROM musica AS m
RIGHT JOIN artista AS a ON m.fk_artista = a.id;
