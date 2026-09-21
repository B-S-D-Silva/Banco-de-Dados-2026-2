CREATE TABLE atleta (idAtleta INT PRIMARY KEY AUTO_INCREMENT, nome VARCHAR(40), modalidade VARCHAR (40), qtdMedalhas INT);

INSERT INTO atleta VALUES (1, 'Ricardo', 'Volei', 10),(DEFAULT, 'Richarlisson', 'Volei', 3),(default, 'Richard','Tenis', 23),(DEFAULT, 'Basquete da Silva', 'Basquete', 0);

CREATE TABLE pais (idPais INT PRIMARY KEY auto_increment, nome VARCHAR (30), capital VARCHAR (40)
);

INSERT INTO pais VALUES (1, 'Brasil', 'Brasilia'),(2, 'Panama', 'Cidade do Panama'), (3, 'Argentina', 'Buenos Aires'), (4, 'Portugal', 'Lisboa');

ALTER TABLE atleta ADD column fkPais INT;

ALTER TABLE atleta ADD CONSTRAINT fkAtletaPais 
FOREIGN KEY (fkPais) REFERENCES pais(idPais);



UPDATE atleta SET fkPais = 1 WHERE nome = 'Richarlisson';
UPDATE atleta SET fkPais = 2 WHERE nome = 'Richard';
UPDATE atleta SET fkPais = 3 WHERE nome = 'Basquete da Silva';
UPDATE atleta SET fkPais = 4 WHERE nome = 'Basquete da Silva';

SELECT * FROM atleta
JOIN pais
on idPais = fkPais;

use sprint2;

SELECT 
    a.nome AS Nome,
    p.nome AS Pais
FROM Atleta AS a
JOIN Pais AS p
    ON a.fkPais = p.idPais;

describe atleta;

SELECT 
    a.nome AS Nome,
    p.nome AS Pais,
    p.capital AS Capital
FROM Atleta AS a
JOIN Pais AS p
    ON a.fkPais = p.idPais
    WHERE capital = 'Cidade do Panama';



