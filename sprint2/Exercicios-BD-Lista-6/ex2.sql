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
