USE sprint1;

CREATE TABLE Atleta (
idAtleta INT PRIMARY KEY, nome VARCHAR (40), modalidade VARCHAR (40), qtdMedalha INT
);

INSERT INTO Atleta VALUES (
10, 'Bruno Santos', 'Futebol', 29
);

SELECT * FROM Atleta;

UPDATE Atleta SET qtdMedalha = '32' 
WHERE idAtleta = 10;

SELECT * FROM Atleta;

INSERT INTO Atleta Values (1, 'Fernando', 'Basquete', 12 ), (2, 'Ricardo', 'Baseball', 12), (3, 'Romario', 'Futebol', 87), (4, 'Jair', 'Volei', 28);

SELECT * FROM Atleta;

UPDATE Atleta SET qtdMedalha = '32' 
WHERE idAtleta = 1;

UPDATE Atleta SET qtdMedalha = '33' 
WHERE idAtleta in (2,3);

SELECT * FROM Atleta;

UPDATE Atleta SET nome = 'Beatriz'
WHERE idAtleta = 4;

SELECT * FROM Atleta;

ALTER TABLE Atleta ADD COLUMN dtNasc DATE;

UPDATE Atleta SET dtNasc = '2002-01-01' 
WHERE idAtleta = 1;

UPDATE Atleta SET dtNasc = '1999-01-01' 
WHERE idAtleta = 2;

UPDATE Atleta SET dtNasc = '1987-10-03' 
WHERE idAtleta = 3;

UPDATE Atleta SET dtNasc = '2012-01-01' 
WHERE idAtleta = 4;

UPDATE Atleta SET dtNasc = '1978-01-01' 
WHERE idAtleta = 10;

SELECT * FROM Atleta;

DELETE FROM Atleta WHERE idAtleta = 4; -- Minha tabela não tem 5 ^^

SELECT * FROM Atleta 
WHERE modalidade != 'Natação';

SELECT * FROM Atleta 
WHERE qtdMedalha >= 3;

ALTER TABLE Atleta MODIFY column modalidade VARCHAR (60);

DESCRIBE Atleta;

TRUNCATE TABLE Atleta;

SELECT * FROM Atleta;