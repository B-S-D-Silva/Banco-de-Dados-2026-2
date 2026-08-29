CREATE TABLE Musica (
idMusica INT PRIMARY KEY, titulo VARCHAR (40), artista VARCHAR (40), genero VARCHAR (40)

);

SELECT * FROM Musica;

INSERT INTO Musica VALUES (1, 'Dahora legal', 'Bruno', 'Rock'), (2, 'Bacaninha', 'Robertinho da mata', 'Samba'), 
(3, 'Chapisco','Emicida', 'Rap'), (4, 'Flower', 'Ariana Grande', 'Pop'), (5, 'PIXELED KISSES', 'Joji', 'R&B'), 
(6, 'Vida é um moinho', 'Cartola', 'Samba'), (7, '505', 'Artic Monkeys', 'Indie');

SELECT * FROM Musica;


UPDATE Musica SET genero = 'Samba' 
WHERE idMusica = 1;

SELECT * FROM Musica;

ALTER TABLE Musica ADD COLUMN curtidas INT;

UPDATE Musica SET curtidas = 20 
WHERE idMusica = 1;

UPDATE Musica SET curtidas = 39 
WHERE idMusica = 2;

UPDATE Musica SET curtidas = 190 
WHERE idMusica = 3;

UPDATE Musica SET curtidas = 19290 
WHERE idMusica = 4;

UPDATE Musica SET curtidas = 87676 
WHERE idMusica = 5;

UPDATE Musica SET curtidas = 1239 
WHERE idMusica = 6;

UPDATE Musica SET curtidas = 2193
WHERE idMusica = 7;


ALTER TABLE Musica MODIFY COLUMN artista VARCHAR (60);

UPDATE Musica SET curtidas = 12
WHERE idMusica = 1;

SELECT * FROM Musica;

UPDATE Musica SET curtidas = 33 
WHERE idMusica in (2,3);

SELECT * FROM Musica;

UPDATE Musica SET titulo = 'Ricardo nas alturas'
WHERE idMusica = 5;

DELETE FROM Musica WHERE idMusica = 4;

SELECT * FROM Musica
WHERE genero != 'Funk';

SELECT * FROM Musica
WHERE curtidas >= 20;

DESCRIBE Musica;

TRUNCATE TABLE Musica;


