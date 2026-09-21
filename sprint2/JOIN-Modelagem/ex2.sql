CREATE TABLE Musica (
    idMusica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(40) NOT NULL,
    artista VARCHAR(40) NOT NULL,
    genero VARCHAR(40) NOT NULL
);

INSERT INTO Musica (titulo, artista, genero) VALUES 
('Yellow', 'Coldplay', 'Rock Alternativo'),
('Viva la Vida', 'Coldplay', 'Pop'),
('As It Was', 'Harry Styles', 'Pop'),
('Blinding Lights', 'The Weeknd', 'Synth-pop');

CREATE TABLE Album (
    idAlbum INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    dtLancamento DATE,
    CONSTRAINT chk_tipo_album CHECK (tipo IN ('digital', 'físico'))
);

INSERT INTO Album (nome, tipo, dtLancamento) VALUES 
('A Rush of Blood to the Head', 'físico', '2002-08-26'),
('Fine Line', 'digital', '2019-12-13');

ALTER TABLE musica ADD COLUMN fkAlbum INT NOT NULL;

select * from musica;

UPDATE musica SET fkAlbum = 1
WHERE fkAlbum = 0;

ALTER TABLE musica ADD CONSTRAINT fkAlbumMusica
FOREIGN KEY (fkAlbum) REFERENCES Album(idAlbum);

SELECT * FROM album;

SELECT * FROM musica
JOIN album
on idAlbum = fkAlbum;

SELECT 
a.titulo AS Musica,
p.nome AS Album
FROM Musica AS a JOIN Album AS p
on idAlbum = fkAlbum;

SELECT 
a.titulo AS Musica,
p.nome AS Album
FROM Musica AS a JOIN Album AS p
on idAlbum = fkAlbum
WHERE genero = 'Pop';



