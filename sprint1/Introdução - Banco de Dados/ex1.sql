create table Atleta (
 idAtleta int primary key, nome varchar (40), qtdMedalha int
);
ALTER TABLE Atleta ADD modalidade VARCHAR(40);

INSERT INTO Atleta VALUES (1, 'Michael Phelps', 30, '100 metros');

SELECT * FROM Atleta;

UPDATE Atleta SET nome = 'Michael Phelps', qtdMedalha = 30, modalidade = '100 metros'
WHERE idAtleta = 1;

SELECT * FROM Atleta;

INSERT INTO Atleta VALUES 
(2, 'Oscar', 2, '200 metros'),
(3, 'Bruno', 58, '300 metros'),
(4, 'Ricardo', 7, 'profundidade');

SELECT * FROM Atleta;

SELECT nome, qtdMedalha FROM Atleta;

SELECT * FROM Atleta WHERE modalidade = 'profundidade'; 

SELECT * FROM Atleta ORDER BY modalidade;

SELECT * FROM Atleta ORDER BY qtdMedalha DESC;

SELECT * FROM Atleta WHERE nome LIKE '%s%';

SELECT * FROM Atleta WHERE nome LIKE 'b%';

SELECT * FROM Atleta WHERE nome LIKE '%o%';

SELECT * FROM Atleta WHERE nome LIKE '%r_';

DROP TABLE Atleta;
