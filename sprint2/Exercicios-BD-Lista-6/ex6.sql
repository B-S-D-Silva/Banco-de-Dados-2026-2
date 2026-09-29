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

SELECT *
FROM tenis
WHERE categoria = 'Corrida';

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

SELECT m.nome AS marca, t.modelo
FROM tenis AS t
RIGHT JOIN marca AS m ON t.fk_marca = m.id;
