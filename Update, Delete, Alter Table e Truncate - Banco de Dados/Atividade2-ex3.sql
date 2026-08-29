USE Sprint1;
CREATE TABLE Filme (idFilme INT PRIMARY KEY, titulo VARCHAR (50), genero VARCHAR (40), diretor VARCHAR (40)
);

SELECT * FROM Filme;

INSERT INTO Filme VALUES (1, 'Dahora legal', 'Bruno', 'Rock'), (2, 'Bacaninha', 'Robertinho da mata', 'Samba'), 
(3, 'Chapisco','Emicida', 'Rap'), (4, 'Flower', 'Ariana Grande', 'Pop'), (5, 'PIXELED KISSES', 'Joji', 'R&B'), 
(6, 'Vida é um moinho', 'Cartola', 'Samba'), (7, '505', 'Artic Monkeys', 'Indie');

SELECT * FROM Filme;

ALTER TABLE FIlme ADD COLUMN protagonista varchar (50);

UPDATE Filme SET protagonista = 'Zubumafo' 
WHERE idFilme = 1;

UPDATE Filme SET protagonista = 'Ricardinhp'
WHERE idFilme = 2;

UPDATE Filme SET protagonista = 'Alto Fabio'
WHERE idFilme = 3;

UPDATE Filme SET protagonista = 'Blabla da silva'
WHERE idFilme = 4;

UPDATE Filme SET protagonista = 'Bruno Santos'
WHERE idFilme = 5;

UPDATE Filme SET protagonista = 'Vini' 
WHERE idFilme = 6;

UPDATE Filme SET protagonista = 'Junior'
WHERE idFilme = 7;

SELECT * FROM filme;

ALTER TABLE Filme modify COLUMN diretor VARCHAR (160);

UPDATE Filme SET diretor = 'Silva'
WHERE idFilme = 5;

UPDATE Filme SET diretor = 'Santos'
WHERE idFilme in (2,7);

UPDATE Filme SET titulo = 'Silva'
WHERE idFilme = 6;

DELETE FROM Filme WHERE idFilme = 3;

SELECT * FROM Filme WHERE genero != 'Drama';

SELECT * FROM Filme WHERE genero = 'Suspense';

DESCRIBE filme;

TRUNCATE TABLE filme;