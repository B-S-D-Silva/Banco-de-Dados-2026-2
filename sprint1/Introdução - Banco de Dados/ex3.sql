create table Filme (
 idFilme int primary key, titulo VARCHAR (50),  genero VARCHAR (40), diretor VARCHAR (40)
);
INSERT INTO Filme VALUES
(1, 'Internet: O Filme', 'Comédia', 'Rafinha Bastos'),
(2, 'Interestelar', 'Ficção', 'Christopher Nolan'),
(3, 'Odisseia', 'Épico', 'Christopher Nolan'),
(4, 'Project Hail Mary', 'Ficção', 'Christopher Miller'),
(5, 'Spider-Man: Brand New Day', 'Herói', 'Destin Daniel Cretton'),
(6, 'Vingadores: Doomsday', 'Herói', 'Anthony Russo'),
(7, 'Doutor Estranho', 'Herói', 'Scott Derrickson');

SELECT * FROM Filme;

SELECT titulo, diretor FROM Filme;

SELECT * FROM Filme WHERE genero = 'Herói';

SELECT * FROM Filme WHERE diretor = 'Christopher Nolan';

SELECT * FROM Filme Order by titulo;

SELECT * FROM Filme Order by diretor DESC;

SELECT * FROM Filme WHERE titulo LIKE 'i%';

SELECT * FROM Filme WHERE diretor LIKE '%n';

SELECT * FROM Filme WHERE genero LIKE '_o%';

SELECT * FROM Filme WHERE titulo LIKE '%h_';

DROP TABLE filme;
