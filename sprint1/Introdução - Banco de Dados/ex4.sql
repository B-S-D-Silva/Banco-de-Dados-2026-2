create table Professor (
 idProfessor int primary key, nome VARCHAR (50), especialidade VARCHAR (40), dtNasc DATE
);

INSERT INTO Professor VALUES
(1, 'Maria Fernanda', 'Tecnologia da Informação', '1985-03-12'),
(2, 'Vivian Silva', 'Banco de Dados', '1990-07-25'),
(3, 'Gerson Santos', 'Tecnologia da Informação', '1978-11-02'),
(4, 'João Pedro', 'Algoritmos', '1995-01-19'),
(5, 'Matheus Matos', 'Arquitetura Computacional', '1988-09-30'),
(6, 'Davi Silva', 'Arquitetura Computacional', '1992-04-08');

SELECT * FROM Professor;

SELECT especialidade FROM Professor;


SELECT * FROM Professor WHERE especialidade = 'Tecnologia da Informação';

SELECT * FROM Professor ORDER BY nome;

SELECT * FROM Professor ORDER BY dtNasc DESC;

SELECT * FROM Professor WHERE nome LIKE 'M%';

SELECT * FROM Professor WHERE nome LIKE '_i%';

SELECT * FROM Professor WHERE nome LIKE '%V_';

DROP TABLE Professor;
