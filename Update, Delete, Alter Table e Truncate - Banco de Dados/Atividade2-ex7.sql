USE sprint1;

CREATE TABLE Carros (idCarro INT PRIMARY KEY auto_increment, nome VARCHAR (50), placa CHAR (7)
);

INSERT INTO Carros VALUES (1000, 'Honda Civic', '777-AME'), (default, 'Subaru WRX','842-HWX'),(default, 'BWM 320i', '659-JSH');

SELECT * FROM Carros;

INSERT INTO Carros VALUES (default, 'Pegout 208', 'OL1-V3X');

SELECT * FROM Carros;

INSERT INTO Carros VALUES (default, 'Mitsubishi Lancer', '78S-4WE'), (default, 'Subaru Legacy','232-HKX'),(default, 'Nissam 350z', '329-KJH');

SELECT * FROM carros;


-- Errei no update anterior, coloquei a placa agora vou remover

UPDATE Carros SET placa = null  
WHERE idCarro >= 1005;

SELECT * FROM carros;

describe carros;

ALTER TABLE Carros MODIFY COLUMN nome VARCHAR (28);

describe carros;


ALTER TABLE Carros ADD COLUMN ano CHAR (4);

SELECT * FROM carros;

UPDATE Carros SET placa = '197-WUS' 
WHERE idCarro = 1005;

UPDATE Carros SET placa = '1SA-WUS' 
WHERE idCarro = 1006;

UPDATE Carros SET placa = '18S-MCX' 
WHERE idCarro = 1007;

SELECT * FROM Carros;

UPDATE Carros SET ano = '1999' 
WHERE idCarro = 1000;

UPDATE Carros SET ano = '2002' 
WHERE idCarro = 1001;

UPDATE Carros SET ano = '1987' 
WHERE idCarro = 1002;

UPDATE Carros SET ano = '2007' 
WHERE idCarro = 1003;

UPDATE Carros SET ano = '2014' 
WHERE idCarro = 1004;

UPDATE Carros SET ano = '1999' 
WHERE idCarro = 1005;

UPDATE Carros SET ano = '1976' 
WHERE idCarro = 1006;

UPDATE Carros SET ano = '2020' 
WHERE idCarro = 1007;

SELECT * FROM Carros;

