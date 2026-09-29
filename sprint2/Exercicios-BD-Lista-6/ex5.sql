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
SELECT * FROM jogador_cs;

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
