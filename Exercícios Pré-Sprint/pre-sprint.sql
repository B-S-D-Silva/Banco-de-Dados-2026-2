CREATE TABLE jogo (
idJogo INT PRIMARY KEY auto_increment, 
nome VARCHAR (30), 
diretor VARCHAR (30), 
genero VARCHAR (30), 
lançamento DATE, 
nota INT,
CONSTRAINT chkNota CHECK (nota IN (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10))
);

ALTER TABLE jogo ADD column quantidade INT;


INSERT INTO jogo VALUES (1, 'Valorant', 'Kakashi','FPS', '2026-08-18', 9, 20);

INSERT INTO jogo VALUES (default, 'CS:GO', 'Hitomi','FPS', '2002-02-10', 10, 34);

INSERT INTO jogo VALUES (default, 'LOL', 'riot','moba', '2013-03-11', 10, 238);


INSERT INTO jogo VALUES (default, 'FIFA', 'EA','futebol', '2014-05-13', 5, 28);

INSERT INTO jogo VALUES (default, 'DOTA', 'valve','moba', '2013-03-11', 2, 3812);


ALTER TABLE jogo ADD column tipoMidia VARCHAR (30);

ALTER TABLE jogo ADD CONSTRAINT chkTipo CHECK (tipomIDIA IN ('fisica', 'digital'));

UPDATE jogo SET tipoMidia = 'digital' 
WHERE idJogo = 1;

UPDATE jogo SET tipoMidia = 'digital' 
WHERE idJogo = 2;

UPDATE jogo SET tipoMidia = 'fisica' 
WHERE idJogo = 4;

UPDATE jogo SET tipoMidia = 'fisica' 
WHERE idJogo = 5;

UPDATE jogo SET tipoMidia = 'fisica' 
WHERE idJogo = 6;

UPDATE jogo SET tipoMidia = 'fisica' 
WHERE idJogo = 7;

SELECT * FROM jogo
WHERE year(lançamento) > '2015';

SELECT * FROM jogo
WHERE nome LIKE '%a%' AND tipoMidia = 'fisica';

SELECT * FROM jogo
WHERE diretor NOT LIKE '%e%';

select * from jogo
WHERE quantidade > 0;

DELETE FROM jogo
WHERE quantidade = 0;

ALTER TABLE jogo rename column diretor to criador;

describe jogo;

SELECT * FROM jogo;

-- exercicio 2

CREATE TABLE esporte (

idEsporte INT PRIMARY KEY auto_increment, 
nome VARCHAR (40), 
numEquipe int,
estreia DATE,
pais VARCHAR (30),
categoria VARCHAR (20),
CONSTRAINT chkCategoria CHECK (categoria IN ('Ativo', 'Inativo'))
);
CREATE TABLE esporte (

idEsporte INT PRIMARY KEY auto_increment, 
nome VARCHAR (40), 
numEquipe int,
estreia DATE,
pais VARCHAR (30),
categoria VARCHAR (20),
CONSTRAINT chkCategoria CHECK (categoria IN ('Ativo', 'Inativo'))
);

alter table esporte drop constraint chkCategoria;

alter table esporte add CONSTRAINT chkCategoria CHECK (categoria IN ('Individual', 'Coletivo'));

INSERT INTO esporte VALUES (default, 'Handball', 10, '2024-01-01', 'Guiné', 'Coletivo');

INSERT INTO esporte VALUES (default, 'Futebol', 11, '2023-01-01', 'Brasil', 'Coletivo');

INSERT INTO esporte VALUES (default, 'Volei', 8, '2023-01-01', 'Espanha', 'Coletivo');

INSERT INTO esporte VALUES (default, 'PingPong', 1, '2023-01-01', 'EUA', 'individual');

INSERT INTO esporte VALUES (default, 'Boxe', 1, '2013-01-01', 'EUA', 'individual');

ALTER TABLE esporte ADD COLUMN popularidade INT;

alter table esporte add CONSTRAINT chkPop CHECK (popularidade IN (popularidade >= 0 AND popularidade <= 10));

UPDATE esporte SET popularidade = 10
WHERE idEsporte = 1;

UPDATE esporte SET popularidade = 9

WHERE idEsporte = 2;

UPDATE esporte SET popularidade = 1
WHERE idEsporte = 3;

UPDATE esporte SET popularidade = 2
WHERE idEsporte = 4;

UPDATE esporte SET popularidade = 8
WHERE idEsporte = 5;

SELECT * FROM esporte ORDER BY popularidade;

SELECT * FROM esporte
WHERE year(estreia) > 2000;

alter table esporte add CONSTRAINT chkEstreia CHECK (estreia IN (estreia > '1896-06-04' AND estreia < '2026-08-18'));

UPDATE esporte SET estreia = null
WHERE idEsporte = 1;

UPDATE esporte SET estreia = null
WHERE idEsporte = 2;

UPDATE esporte SET estreia = null
WHERE idEsporte = 3;

UPDATE esporte SET estreia = null
WHERE idEsporte = 4;

UPDATE esporte SET estreia = null
WHERE idEsporte = 5;

UPDATE esporte SET estreia = null
WHERE idEsporte = 6;

UPDATE esporte SET estreia = null
WHERE idEsporte = 7;

alter table esporte add CONSTRAINT chkEstreia CHECK (estreia IN (estreia > '1896-06-04' AND estreia < '2026-08-18'));

alter table esporte drop constraint chkCategoria;

select * from esporte WHERE nome like '_a%';

select * from esporte WHERE numEquipe >= 4 AND numEquipe <= 11;

DELETE FROM esporte WHERE idEsporte = 1;

DELETE FROM esporte WHERE idEsporte = 3;

DELETE FROM esporte WHERE idEsporte = 5;


-- Exercicio 3

CREATE TABLE desenho (

idDesenho INT PRIMARY KEY auto_increment, 
titulo VARCHAR (50), 
dataLancamento DATE,
emissora VARCHAR (50),
classificacao INT,
statuss VARCHAR (30),
nota INT
)auto_increment = 10;

SELECT * FROM desenho;

select * from desenho WHERE classificacao <= 14;

select * from desenho WHERE emissora <= 'Cartoon';

ALTER TABLE desenho ADD constraint chkStatusDesenho CHECK (statuss IN ('Em exibindo','finalizado','cancelado'));

INSERT INTO desenho (statuss)VALUES ('Futuramente');


INSERT INTO desenho VALUES (1, 'Hora de Aventura', '2015-08-08','Cartoon', 14, 'Finalizado', 1);

SELECT * FROM desenho;

describe desenho;

alter table desenho DROP CONSTRAINT chkNotas;

ALTER TABLE desenho 
ADD CONSTRAINT chkNotas CHECK (nota >= 1 AND nota <= 5);

INSERT INTO desenho VALUES (default, 'Hora de Aventura', '2015-08-08','Cartoon', 14, 'Finalizado', 5);

SELECT * FROM desenho;

DELETE FROM desenho
WHERE idDesenho = 12;

SELECT * FROM desenho
WHERE titulo LIKE 'H%';

ALTER TABLE desenho RENAME COLUMN classificacao TO classificacaoIndicativa;

describe desenho;

UPDATE desenho
SET nota = 2, dataLancamento = '2012-08-08'
WHERE idDesenho = 11;

TRUNCATE TABLE desenho;

select * from desenho;

alter table desenho drop constraint chkStatusDesenho;


-- Exercicio 4

CREATE TABLE MisteriosSA (
    id INT PRIMARY KEY,
    nome VARCHAR(40),
    dataCompra DATE,
    preco DECIMAL(10,2),
    peso DECIMAL(10,2),
    dataRetirada DATE
);

INSERT INTO MisteriosSA (id, nome, dataCompra, preco, peso) VALUES
(6, 'Barra de Chocolate Belga', '2026-01-05', 18.90, 100.00),
(7, 'Pacote de Café Especial', '2026-02-14', 32.50, 250.00),
(8, 'Mel Orgânico', '2026-03-22', 27.00, 400.00),
(9, 'Azeite Extra Virgem', '2026-04-18', 45.00, 500.00),
(10, 'Queijo Artesanal', '2026-05-30', 38.90, 300.00);

SELECT * FROM MisteriosSA;

SELECT id, nome, dataCompra, dataRetirada FROM MisteriosSA ORDER BY dataCompra ASC;

UPDATE MisteriosSA SET dataRetirada = '2024-01-01'
WHERE id = 6;

SELECT * FROM MisteriosSA;

ALTER TABLE MisteriosSA rename column id TO idComida;

describe MisteriosSA;

ALTER TABLE MisteriosSA ADD constraint chkNome CHECK (nome IN ('Biscoitos Scooby','Cachorro-quente'));

truncate table MisteriosSA;

ALTER TABLE MisteriosSA ADD constraint chkNome CHECK (nome IN ('Biscoitos Scooby','Cachorro-quente'));

INSERT INTO MisteriosSA (idComida, nome, dataCompra, preco, peso, dataRetirada) VALUES
(15, 'Biscoitos Scooby', '2026-05-05', 12.50, 200.00, '2026-05-12'),
(16, 'Cachorro-quente', '2026-05-18', 15.00, 250.00, '2026-05-25'),
(17, 'Biscoitos Scooby', '2026-06-10', 13.00, 210.00, '2026-06-20'),
(18, 'Cachorro-quente', '2026-06-22', 14.50, 230.00, '2026-07-01'),
(19, 'Biscoitos Scooby', '2026-07-08', 12.90, 205.00, '2026-07-15');


SELECT idComida, nome, dataCompra 'data da compra', preco, peso, dataRetirada 'data da retirada' FROM MisteriosSA
WHERE nome = 'Biscoitos Scooby';

SELECT * FROM MisteriosSA
WHERE dataCompra < '2024-06-25';

SELECT * FROM MisteriosSA
WHERE preco > 30.5;

SELECT * FROM MisteriosSA;

TRUNCATE TABLE MisteriosSA;

SELECT * FROM MisteriosSA;

-- Exercicio 5
CREATE TABLE heroi (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    versao VARCHAR(45),
    habilidade VARCHAR(45),
    altura INT
);
INSERT INTO heroi (nome, versao, habilidade, altura) VALUES
('Homem de Ferro', 'Vingadores: Ultimato', 'Genialidade tecnológica', 178),
('Thor', 'Thor: Ragnarok', 'Controle de raios e força', 198),
('Pantera Negra', 'Pantera Negra', 'Força e agilidade sobre-humanas', 183),
('Feiticeira Escarlate', 'WandaVision', 'Manipulação da realidade', 170),
('Doutor Estranho', 'Doutor Estranho 2', 'Domínio das artes místicas', 180);

ALTER TABLE heroi ADD COLUMN regeneracao TINYINT, MODIFY COLUMN versao VARCHAR(100);

DELETE from heroi
where id = 3;

INSERT INTO heroi VALUES (default,'Sentry','ThunderBolts','Sobre-Humano',180,0);

SELECT * FROM heroi
WHERE nome like 'C%' OR nome like 'H%';

SELECT * FROM heroi
WHERE nome NOT like '%A%';

SELECT * FROM heroi
WHERE altura = 190;


SELECT * FROM heroi
WHERE altura = 180 order by altura DESC;

TRUNCATE TABLE heroi;

 
 
 
