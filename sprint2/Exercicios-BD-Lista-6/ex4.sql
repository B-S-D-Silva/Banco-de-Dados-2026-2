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
