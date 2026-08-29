USE print1;

CREATE TABLE Curso (idCurso INT PRIMARY KEY auto_increment, nome VARCHAR (50), sigla CHAR (3), Coordenador VARCHAR (50));

INSERT INTO Curso VALUES (default, 'Historia', 'HIS', 'Bruno');

INSERT INTO Curso VALUES (default, 'Ingles', 'ING', 'Fernado'), (default, 'Geografia','GEO','Ricardo');

select coordenador from curso;

select * from curso
WHERE sigla = 'his';

SELECT * FROM curso ORDER BY nome;

SELECT * FROM curso ORDER BY coordenador DESC;

SELECT * FROM curso
WHERE nome LIKE 'H%';

SELECT * FROM curso
WHERE nome LIKE '%s';


SELECT * FROM curso
WHERE nome LIKE '_I%';


SELECT * FROM curso
WHERE nome LIKE '%e_';


DROP TABLE curso;

