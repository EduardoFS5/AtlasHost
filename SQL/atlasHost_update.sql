update Plano 
set preco_mensal = 250.00
where id_plano ='1';

update Plano 
set preco_mensal = 550.00
where id_plano ='2';

update Plano 
set preco_mensal = 750.00
where id_plano ='3';

update Plano 
set preco_mensal = 1100.00
where id_plano ='4';

update Plano 
set preco_mensal = 1850.00
where id_plano ='5';

ALTER TABLE Plano 
ADD COLUMN ram VARCHAR(10),
ADD COLUMN armazenamento VARCHAR(20);

UPDATE Plano 
SET ram = '2 GB', armazenamento = '40 GB SSD'
WHERE id_plano = 1;

UPDATE Plano 
SET ram = '8 GB', armazenamento = '120 GB SSD'
WHERE id_plano = 2;

UPDATE Plano 
SET ram = '16 GB', armazenamento = '240 GB SSD'
WHERE id_plano = 3;

UPDATE Plano 
SET ram = '32 GB', armazenamento = '480 GB SSD'
WHERE id_plano = 4;

UPDATE Plano 
SET ram = '64 GB', armazenamento = '960 GB SSD'
WHERE id_plano = 5;
