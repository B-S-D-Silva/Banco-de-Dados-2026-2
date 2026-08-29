create table Jogo (
 idJogo int primary key, nome VARCHAR (50), comentario VARCHAR (200), ranking INT
);

INSERT INTO Jogo VALUES
(1, 'Minecraft', 'Jogo marcou muito a minha infância', 1),
(2, 'Valorant', 'Cheguei a jogar profissionalmente', 2),

(3, 'CS:GO', 'Sou um grande entusiasta', 3),
(4, 'League Of Legends', 'Jogo as vezes para me divertir', 5),
(5, 'FIFA', 'Todos finais de semana eu jogo com meus amigos', 4);

SELECT * FROM Jogo;

SELECT nome FROM Jogo;

SELECT * FROM Jogo order by nome;

SELECT * FROM Jogo ORDER BY ranking DESC;

SELECT * FROM Jogo WHERE nome LIKE 'M%';

SELECT * FROM Jogo WHERE nome LIKE '%t';

SELECT * FROM Jogo WHERE nome LIKE '_i%';

SELECT * FROM Jogo WHERE nome LIKE '%f_';

SELECT * FROM Jogo WHERE nome != 'Minecraft';

DROP TABLE Jogo;