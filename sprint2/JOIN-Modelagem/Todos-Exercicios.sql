-- Exercício 1 

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

-- Exercício 2

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


-- Exercício 3 

USE sprint2;

CREATE TABLE pessoa (
    idpessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11)
);

CREATE TABLE Reserva (
    idReserva INT PRIMARY KEY AUTO_INCREMENT,
    dtReserva DATETIME,
    dtRetirada DATETIME,
    dtDevolucao DATETIME,
    fkPessoa INT
);

ALTER TABLE Reserva
    ADD CONSTRAINT fkReservaPessoa
    FOREIGN KEY (fkPessoa) REFERENCES pessoa (idpessoa);

INSERT INTO pessoa (nome, cpf) VALUES ('Ana Souza', '12345678901'), ('Bruno Lima', '23456789012'), ('Carla Mendes', '34567890123'), ('Diego Ferreira', '45678901234'), ('Elisa Rocha', '56789012345');

INSERT INTO Reserva (dtReserva, dtRetirada, dtDevolucao, fkPessoa) VALUES ('2026-09-01 10:00:00', '2026-09-05 09:00:00', '2026-09-08 18:00:00', 1), ('2026-09-02 14:30:00', '2026-09-10 08:00:00', NULL, 2), ('2026-09-03 09:15:00', NULL, NULL, 3), ('2026-09-04 16:45:00', '2026-09-12 10:00:00', '2026-09-15 17:30:00', 1), ('2026-09-06 11:20:00', NULL, NULL, 5);

SELECT p.nome AS Pessoa,
   r.idReserva AS 'Nº da Reserva',
   r.dtReserva AS 'Data da Reserva',
   IFNULL(r.dtRetirada, 'Não retirada')   AS 'Data de Retirada',
   IFNULL(r.dtDevolucao, 'Não devolvida') AS 'Data de Devolução'
   FROM pessoa AS p JOIN Reserva AS r
    ON p.idpessoa = r.fkPessoa;
    
    SELECT r.idReserva AS 'Nº da Reserva',
	CASE
	WHEN r.dtDevolucao IS NOT NULL THEN 'Devolvida'
    WHEN r.dtRetirada  IS NOT NULL THEN 'Retirada (aguardando devolução)'
	ELSE 'Apenas reservada'
	END AS Situacao
    FROM Reserva AS r;
    
    -- Exercício 4 
    
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

-- Exercício 5 

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

-- Exercício 6

USE sprint2;

CREATE TABLE Farmacia (
idFarmacia INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cnpj CHAR(14)
);

CREATE TABLE Endereco (
idEndereco INT PRIMARY KEY AUTO_INCREMENT,
rua VARCHAR(45),
numero VARCHAR(10),
bairro VARCHAR(45),
fkFarmacia INT NOT NULL,
CONSTRAINT uqEnderecoFarmacia UNIQUE (fkFarmacia)
);

CREATE TABLE Farmaceutico (
idFarmaceutico INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
crf VARCHAR(15),
fkFarmacia INT NOT NULL
);

ALTER TABLE Endereco
ADD CONSTRAINT fkEnderecoFarmacia
FOREIGN KEY (fkFarmacia) REFERENCES Farmacia (idFarmacia);

ALTER TABLE Farmaceutico
ADD CONSTRAINT fkFarmaceuticoFarmacia
FOREIGN KEY (fkFarmacia) REFERENCES Farmacia (idFarmacia);

INSERT INTO Farmacia (nome, cnpj) VALUES ('Farmácia Popular', '11222333000144'), ('Drogaria Vida', '22333444000155'), ('Farma Bem Estar', '33444555000166'), ('Drogaria São José', '44555666000177'), ('Farmácia Central', '55666777000188');

INSERT INTO Endereco (rua, numero, bairro, fkFarmacia) VALUES ('Rua das Flores', '120', 'Centro', 1), ('Av. Brasil', '450', 'Jardim América', 2), ('Rua XV de Novembro', '89', 'Vila Nova', 3), ('Rua dos Andradas', '310', 'Bela Vista', 4), ('Av. Paulista', '1500', 'Bela Vista', 5);

INSERT INTO Farmaceutico (nome, crf, fkFarmacia) VALUES ('Ana Souza', 'CRF-SP12345', 1), ('Bruno Lima', 'CRF-SP23456', 1), ('Carla Mendes', 'CRF-SP34567', 2), ('Diego Ferreira', NULL, 3), ('Elisa Rocha', 'CRF-SP45678', 4);

SELECT * FROM Farmacia;
SELECT * FROM Endereco;
SELECT * FROM Farmaceutico;

SELECT f.nome AS 'Farmácia', e.rua AS 'Rua', e.bairro AS 'Bairro'
FROM Farmacia AS f
JOIN Endereco AS e
ON f.idFarmacia = e.fkFarmacia;

SELECT f.nome AS 'Farmácia', fc.nome AS 'Farmacêutico',
CASE
WHEN fc.crf IS NULL THEN 'CRF pendente'
ELSE 'CRF regularizado'
END AS 'Situação'
FROM Farmacia AS f
JOIN Farmaceutico AS fc
ON f.idFarmacia = fc.fkFarmacia;

SELECT fc.nome AS 'Farmacêutico',
IFNULL(fc.crf, 'Sem CRF cadastrado') AS 'CRF'
FROM Farmaceutico AS fc;

-- Desafio 

USE sprint2;

CREATE TABLE Time (
idTime INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
estado CHAR(2)
);

CREATE TABLE Tecnico (
idTecnico INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
fkTime INT
);

CREATE TABLE Escalacao (
idEscalacao INT PRIMARY KEY AUTO_INCREMENT,
numJogador CHAR(3),
nome VARCHAR(45),
posicao VARCHAR(45),
tipo VARCHAR(45),
dtJogo DATETIME,
fkTecnico INT
);

ALTER TABLE Tecnico
ADD CONSTRAINT fkTecnicoTime
FOREIGN KEY (fkTime) REFERENCES Time (idTime);

ALTER TABLE Escalacao
ADD CONSTRAINT fkEscalacaoTecnico
FOREIGN KEY (fkTecnico) REFERENCES Tecnico (idTecnico);