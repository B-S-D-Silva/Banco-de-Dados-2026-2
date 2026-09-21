USE sprint2;

CREATE TABLE Pessoa1 (
idPessoa1 INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
dtNascimento DATE
);

CREATE TABLE Pessoa2 (
idPessoa2 INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
dtNascimento DATE,
fkPessoa1 INT NOT NULL,
CONSTRAINT Pessoa2Pessoa1 UNIQUE (fkPessoa1)
);

ALTER TABLE Pessoa2
ADD CONSTRAINT fkPessoa2Pessoa1
FOREIGN KEY (fkPessoa1) REFERENCES Pessoa1 (idPessoa1);

INSERT INTO Pessoa1 (nome, dtNascimento) VALUES ('Marcos Silva', '1990-03-15'), ('Juliana Costa', '2005-07-22'), ('Roberto Alves', '1958-11-30'), ('Fernanda Dias', '2012-01-10'), ('Paulo Nunes', '1985-09-05');

INSERT INTO Pessoa2 (nome, dtNascimento, fkPessoa1) VALUES ('Helena Silva', '1992-06-20', 1), ('Lucas Costa', '2008-12-02', 2), ('Marta Alves', NULL, 3), ('Igor Dias', '2015-04-18', 4), ('Sonia Nunes', NULL, 5);

SELECT * FROM Pessoa1;
SELECT * FROM Pessoa2;

SELECT p1.nome AS 'Pessoa 1', p2.nome AS 'Pessoa 2'
FROM Pessoa1 AS p1
JOIN Pessoa2 AS p2
ON p1.idPessoa1 = p2.fkPessoa1;

SELECT p2.nome AS 'Pessoa 2',
CASE
WHEN p2.dtNascimento IS NULL THEN 'Data não informada'
ELSE 'Data informada'
END AS 'Situação'
FROM Pessoa2 AS p2;

SELECT p2.nome AS 'Pessoa 2',
IFNULL(p2.dtNascimento, 'Não informada') AS 'Nascimento'
FROM Pessoa2 AS p2;