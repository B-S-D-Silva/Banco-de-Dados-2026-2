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