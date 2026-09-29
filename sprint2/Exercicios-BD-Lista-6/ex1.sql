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
	peso DECIMAL(5, 2) NOT NULL,
	vacina_em_dia TINYINT NOT NULL,
	observacao VARCHAR(500),
	fk_animal INT NOT NULL UNIQUE,
	CONSTRAINT fk_ficha_medica_animal
		FOREIGN KEY (fk_animal) REFERENCES animal(id)
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

SELECT * FROM animal;
SELECT * FROM ficha_medica;

SELECT nome, especie FROM animal;

SELECT *
FROM ficha_medica
WHERE vacina_em_dia = FALSE;

SELECT *
FROM animal
ORDER BY idade DESC;

SELECT *
FROM animal
WHERE especie = 'Cachorro';


SELECT nome AS 'Pet', especie AS 'Tipo'
FROM animal;

SELECT peso AS 'Peso (kg)', data_ultima_consulta AS 'Ultima Consulta'
FROM ficha_medica;

SELECT nome, idade * 7 AS 'Idade Humana Aproximada'
FROM animal;

SELECT nome AS 'Nome do Pet', raca AS 'Raca/Tipo'
FROM animal;


SELECT nome,
	   CASE
		   WHEN idade < 2 THEN 'Filhote'
		   WHEN idade <= 7 THEN 'Adulto'
		   ELSE 'Idoso'
	   END AS fase_vida
FROM animal;

SELECT a.nome,
	   CASE
		   WHEN fm.vacina_em_dia = TRUE THEN 'Vacinado'
		   ELSE 'Pendente'
	   END AS vacinacao
FROM animal AS a
LEFT JOIN ficha_medica AS fm ON fm.fk_animal = a.id;

SELECT peso,
	   CASE
		   WHEN peso < 5 THEN 'Pequeno'
		   WHEN peso <= 20 THEN 'Médio'
		   ELSE 'Grande'
	   END AS porte
FROM ficha_medica;

SELECT nome,
	   CASE especie
		   WHEN 'Cachorro' THEN 'Canino'
		   WHEN 'Gato' THEN 'Felino'
		   ELSE 'Outro'
	   END AS especie_tipo
FROM animal;


SELECT a.nome, IFNULL(fm.observacao, 'Nenhuma observação') AS observacao
FROM animal AS a
LEFT JOIN ficha_medica AS fm ON fm.fk_animal = a.id;

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