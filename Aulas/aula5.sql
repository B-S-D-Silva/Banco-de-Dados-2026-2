use sprint1;

create table produto (
idProduto INT primary key auto_increment,
nome VARCHAR (100),
categoria VARCHAR (50),
preco DECIMAL (10,2),
tamanho VARCHAR (5),
data_cadastro DATETIME,
disponivel TINYINT


) auto_increment= 1;

ALTER TABLE produto ADD constraint chkTamanho check (tamanho IN ("P","M","G","GG"));

ALTER TABLE produto ADD constraint chkDisponivel check (disponivel in (0,1));

INSERT INTO produto VALUES (default, "Camisa", "Roupa", "100","P",now(),1);
INSERT INTO produto VALUES (default, "Camisa", "Roupa", "100","M",now(),0);
INSERT INTO produto VALUES (default, "Calça", "Roupa", "100","P",now(),1);
INSERT INTO produto VALUES (default, "Blusa", "Roupa", "1219","G",now(),0);

SELECT * FROM produto;

SELECT * FROM produto
WHERE nome like "%Camiseta%";

SELECT * FROM produto
WHERE tamanho not like "%M%";

SELECT * FROM produto
where data_cadastro > "2025-07-18";

SELECT * FROM produto
where disponivel = 1 AND categoria in ('Camiseta' AND 'Blusa');


 SELECT CONCAT (nome,' ', preco)AS produto_valor FROM produto;
 
  SELECT CONCAT (nome,' ', preco, ' ', categoria)AS info_completa FROM produto;
  
    SELECT CONCAT (nome,' ', preco, ' ', categoria)AS info_completa FROM produto 
    WHERE disponivel = 1 AND tamanho = 'M';
    

    
        SELECT * from produto
    where nome not like 'Blusa';

    

SELECT idProduto, nome, categoria, preco, tamanho, data_cadastro, CASE
WHEN disponivel = 1 THEN 'Produto Disponivel'
ELSE 'Produto Indisponivel'
END AS 'Status'
FROM produto;

SELECT * FROM produto
WHERE categoria = 'Calça' AND preco > 100 ;

SELECT * from produto
where nome not like 'Camiseta';

select * from produto WHERE idProduto IN (1,3,5);

select * from produto WHERE tamanho != 'P' AND tamanho != 'M';

SELECT * FROM produto
where data_cadastro < "2025-07-18";

SELECT CONCAT (nome,' ', preco)AS produto_valor FROM produto;

SELECT CONCAT (nome,' ', preco, ' ', categoria)AS info_completa FROM produto;

SELECT * FROM produto
where disponivel = 1 AND tamanho in ('M');

SELECT * FROM produto 
WHERE nome like 'C%';

UPDATE produto SET preco = 270.00 
WHERE idProduto = 1;

SELECT idProduto, nome, categoria, preco, tamanho, data_cadastro, CASE
WHEN categoria = 'Blusa' THEN 'Produto Indisponível'
ELSE 'Produto Disponivel'
END AS 'Status'
FROM produto;

UPDATE produto SET tamanho = 'M'
WHERE nome LIKE '%Short%';


UPDATE produto SET categoria = 'Camiseta'
WHERE nome LIKE '%Camiseta%';

SELECT idProduto, nome, categoria, preco, tamanho, data_cadastro, CASE
WHEN data_cadastro > 2025-07-20 THEN 'Produto Disponível'
ELSE 'Produto Indisponível'
END AS 'Status'
FROM produto;

UPDATE produto
SET preco = preco * 1.05
WHERE preco < 100;





    
