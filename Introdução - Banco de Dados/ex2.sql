CREATE TABLE Musica (
idMusica INT PRIMARY KEY, titulo VARCHAR (40), artista VARCHAR (40), genero VARCHAR (40)

);

SELECT * FROM Musica;

INSERT INTO Musica VALUES 
(1, 'Céu Azul', 'Charlie Brown Jr', 'Rock'),
(2, 'We cant be friends', 'Ariana Grande', 'Pop'),
(3, 'A vida é um moinho', 'Cartola', 'MPB'),
(4, '505', 'Artic Monkeys', 'Indie'),
(5, 'Girassol', 'Ivyson', 'Rap'),
(6, 'Idiota', 'Jão', 'Pop-Brasil'),
(7, 'Se não fosse tão tarde', 'Lou Garcia', 'Pop-Brasil');

SELECT * FROM Musica;

SELECT titulo, artista FROM Musica;

SELECT * FROM Musica WHERE genero = 'Pop-Brasil';

 SELECT * FROM Musica WHERE artista = 'Jão';
 
  SELECT * FROM Musica WHERE idMusica = '1';
  
  SELECT * FROM Musica ORDER BY titulo;
  
 SELECT * FROM Musica ORDER BY artista DESC;
 
 SELECT * FROM Musica WHERE artista LIKE 'A%';
 
 SELECT * FROM Musica WHERE artista LIKE '%a';

SELECT * FROM Musica WHERE genero LIKE '_O%';

SELECT * FROM Musica WHERE titulo LIKE '%D_';

DROP TABLE Musica;

 