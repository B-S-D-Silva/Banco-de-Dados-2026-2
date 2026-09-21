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