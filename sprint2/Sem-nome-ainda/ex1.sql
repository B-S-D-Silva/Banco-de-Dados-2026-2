USE sprint2;

CREATE TABLE funcionario (

idFuncionario INT primary key auto_increment,
nome VARCHAR (45),
areaa VARCHAR (45),
salario DECIMAL (10,2),
fkSupervisor INT,
CONSTRAINT fkFuncSuper
   foreign key (fkSupervisor)
     REFERENCES funcionario (idFuncionario)

)auto_increment = 1;

INSERT INTO funcionario (nome, salario, fkSupervisor) VALUES 

('Bruno', 100.00, null), 
('Vivian', 99.99, 1), 
('Mateus', 96.00, 1), 
('Pedro', 101.00, 2);

SELECT * FROM funcionario JOIN funcionario AS supervisor 
	ON funcionario.fkSupervisor = supervisor.idFuncionario;
    
SELECT funcionario.nome AS NomeFunc, 
    supervisor.nome AS NomeSuper
    FROM funcionario JOIN funcionario AS supervisor
		ON funcionario.fkSupervisor = supervisor.idFuncionario;

SELECT funcionario.nome AS NomeFunc, 
    ifnull (supervisor.nome, 'Supervisor') AS NomeSuper
    FROM funcionario LEFT JOIN funcionario AS supervisor
		ON funcionario.fkSupervisor = supervisor.idFuncionario;
        
        
        
CREATE TABLE dependente (
idDependente INT,
fkFuncionario INT,
CONSTRAINT pkComposta PRIMARY KEY (idDependente, fkFuncionario),
nome VARCHAR (45),
parentesco VARCHAR (45),

CONSTRAINT fkDepFunc FOREIGN KEY (fkFuncionario)
	REFERENCES funcionario (idFuncionario)
);

INSERT INTO dependente VALUES 

	(1,2,'Cintia', 'namorada'),
	(1,3,'Lola', 'pet'),
	(2,3,'Sebastian', 'Matheus bêbado'),
	(1,4,'Eliane', 'mãe');


SELECT funcionario.nome as Func,
	dependente.nome AS Dependente
    FROM funcionario LEFT JOIN dependente
		ON idFuncionario = fkFuncionario;
        

SELECT f.idFuncionario AS 'ID Func',
f.fkSupervisor AS 'ID Super',
f.nome AS 'Nome Funcionario',
s.nome AS 'Nome Supervisor',
d.nome AS 'Nome Dependente'
FROM funcionario as f JOIN funcionario AS s
ON f.fkSupervisor = s.idFuncionario
JOIN dependente as d
ON f.idFuncionario = d.fkFuncionario
ORDER BY f.idFuncionario;
        
-- Exercicio 2

CREATE TABLE animal (
idAnimal INT PRIMARY KEY auto_increment,
nome VARCHAR (45),
especie VARCHAR (45),
raca VARCHAR (45),
idade INT
);

CREATE TABLE ficha (
idFicha INT PRIMARY KEY auto_increment,
data_ultima_consulta datetime,
peso FLOAT,
vacina_em_dia TINYINT,
observacao VARCHAR (45),
fk_animal INT,

CONSTRAINT fk_Constraint_Animal
   foreign key (fk_animal)
     REFERENCES animal (idAnimal)
);

INSERT INTO animal (idAnimal, nome, especie, raca, idade) VALUES
(1, 'Thor', 'Cachorro', 'Golden Retriever', 3),
(2, 'Luna', 'Gato', 'Persa', 2),
(3, 'Fred', 'Cachorro', 'Poodle', 5),
(4, 'Mia', 'Gato', 'Siamês', 1),
(5, 'Pipoca', 'Cachorro', 'Vira-lata', 4),
(6, 'Simba', 'Leão', 'Africano', 6);

INSERT INTO ficha (idFicha, data_ultima_consulta, peso, vacina_em_dia, observacao, fk_animal) VALUES
(101, '2026-01-15', 32.50, 1, 'Animal saudável', 1),
(102, '2026-03-10', 4.20, 1, 'Retorno para avaliação ', 2),
(103, '2025-11-20', 7.80, 0, 'Necessita atualizar a vacina de raiva.', 3),
(104, '2026-02-05', 3.90, 1, 'Apresentou leve alergia cutânea.', 4),
(105, '2026-04-12', 12.10, 1, 'Castração realizada com sucesso.', 5);





        
        
        

