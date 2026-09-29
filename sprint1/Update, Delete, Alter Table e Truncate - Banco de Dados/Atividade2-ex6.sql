USE sprint1;

CREATE TABLE Revista (idRevista INT PRIMARY KEY auto_increment, nome VARCHAR (40), categoria VARCHAR (30) );

INSERT INTO Revista (idRevista, nome) VALUES (1, 'Piaui');

INSERT INTO Revista (idRevista, nome) VALUES (default, 'Reveja'), (default, 'Carros Velozes'), (default, 'Revista Nerds');

describe Revista;

SELECT * FROM Revista;

UPDATE Revista SET categoria = 'Politica' 
WHERE idRevista = 1;

UPDATE Revista SET categoria = 'Politica' 
WHERE idRevista = 2;

UPDATE Revista SET categoria = 'Carros' 
WHERE idRevista = 3;

SELECT * FROM revista;

INSERT INTO Revista VALUES (default,'Futeloucos','Esporte'), (default, 'Viagens ao mundo','Turismo'), (default, 'Minecraft:Cheaters','Jogos');

SELECT * FROM Revista;

DESCRIBE Revista;

ALTER TABLE Revista modify COLUMN categoria VARCHAR (40);

DESCRIBE REVISTA;

ALTER TABLE Revista ADD COLUMN periodicidade VARCHAR (15);

SELECT * FROM Revista;

TRUNCATE TABLE Revista;

SELECT * FROM revista;

ALTER TABLE Revista DROP COLUMN periodicidade;
