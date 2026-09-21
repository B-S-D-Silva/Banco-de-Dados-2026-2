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