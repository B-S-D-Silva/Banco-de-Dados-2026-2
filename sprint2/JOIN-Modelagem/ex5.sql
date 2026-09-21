USE sprint2;

CREATE TABLE Candidato (
idCandidato INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cpf CHAR(11)
);

CREATE TABLE Habilitacao (
idHabilitacao INT PRIMARY KEY AUTO_INCREMENT,
categoria CHAR(2),
dtEmissao DATE,
dtValidade DATE,
acc CHAR(1),
fkCandidato INT NOT NULL,
CONSTRAINT HabilitacaoCandidato UNIQUE (fkCandidato)
);

ALTER TABLE Habilitacao
ADD CONSTRAINT fkHabilitacaoCandidato
FOREIGN KEY (fkCandidato) REFERENCES Candidato (idCandidato);

INSERT INTO Candidato (nome, cpf) VALUES ('Marcos Silva', '12345678901'), ('Juliana Costa', '23456789012'), ('Roberto Alves', '34567890123'), ('Fernanda Dias', '45678901234'), ('Paulo Nunes', '56789012345');

INSERT INTO Habilitacao (categoria, dtEmissao, dtValidade, acc, fkCandidato) VALUES ('A', '2026-01-10', '2027-01-10', 'N', 1), ('B', '2026-02-15', '2027-02-15', 'S', 2), ('AB', '2026-03-20', '2027-03-20', NULL, 3), ('B', '2026-04-05', '2027-04-05', 'N', 4), ('A', '2026-05-12', '2027-05-12', NULL, 5);

SELECT * FROM Candidato;
SELECT * FROM Habilitacao;

SELECT c.nome AS 'Candidato', h.categoria AS 'Categoria'
FROM Candidato AS c
JOIN Habilitacao AS h
ON c.idCandidato = h.fkCandidato;

SELECT c.nome AS 'Candidato',
CASE
WHEN h.categoria = 'AB' THEN 'Categoria A e B'
WHEN h.categoria = 'A' THEN 'Categoria A'
ELSE 'Categoria B'
END AS 'Categoria da Habilitação'
FROM Candidato AS c
JOIN Habilitacao AS h
ON c.idCandidato = h.fkCandidato;

SELECT c.nome AS 'Candidato',
IFNULL(h.acc, 'Não solicitou ACC') AS 'Autorização ACC'
FROM Candidato AS c
JOIN Habilitacao AS h
ON c.idCandidato = h.fkCandidato;