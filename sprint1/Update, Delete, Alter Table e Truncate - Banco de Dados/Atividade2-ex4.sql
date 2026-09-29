USE sprint1;

CREATE TABLE Professor (idProfessor INT PRIMARY KEY auto_increment, nome VARCHAR (50), especialidade VARCHAR (50), dtNasc DATE);

INSERT INTO Professor VALUES (default, 'Bruno', 'Historia', '2002-09-25');

INSERT INTO Professor values (default,'Fernando', 'Matematica', '1970-12-03'), 
(default, 'Beatriz','Matematica', '2001-08-03'), (default, 'Ricardo', 'Inglês', '1999-09-01'), (Default,'Tomé', 'Geografia', '1987-03-17'), 
(default,'Jair', 'Artes', '1934-12-12'), (default,'Renan', 'Historia', '1928-01-01');

select * from professor;

INSERT INTO Professor values (default, 'Pedro', 'Historia', '1988-01-01');

DELETE FROM Professor WHERE idProfessor = 5;

TRUNCATE TABLE Professor;