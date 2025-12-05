insert into Usuario (cpf,nome,email,data_registro)
values('42651874854','luiza goncalves de souza','luiza777ouza@gmail.com','2025-02-22'),
('29874651032', 'joao pedro cardoso', 'joaopcardoso@gmail.com', '2025-01-10'),
('58123976450', 'marina alves dias', 'marina_dias22@outlook.com', '2025-03-05'),
('40751296843', 'lucas fernando bastos', 'lfbastos@icloud.com', '2025-02-15'),
('69381720549', 'isabela ramos couto', 'isabelarc99@gmail.com', '2025-04-01'),
('83217450968', 'rafael mendes lima', 'rafaelm_lima@protonmail.com', '2025-03-22'),
('12065437895', 'carolina fonseca vieira', 'carolvieira88@hotmail.com', '2025-01-27'),
('37649821057', 'thiago matos pereira', 'thiagomatos@live.com', '2025-02-09'),
('54627198035', 'amanda rocha teixeira', 'amandarochatx@gmail.com', '2025-02-28'),
('93712065841', 'gustavo henrique moura', 'gustavohmoura@outlook.com', '2025-03-11'),
('48561097233', 'leticia souza brandao', 'lets.brandao@yahoo.com', '2025-01-19'),
('82143759066', 'felipe santos almeida', 'felipealmeida01@gmail.com', '2025-04-07'),
('67894521083', 'bruna oliveira castro', 'brunacastro@icloud.com', '2025-02-05'),
('90238147650', 'carlos eduardo mendes', 'carlosedu_m@protonmail.com', '2025-03-17'),
('35487021649', 'ana clara figueiredo', 'anaclara_f@live.com', '2025-01-31'),
('17693482057', 'igor ribeiro tavares', 'igortavares.dev@gmail.com', '2025-03-03'),
('74120358966', 'nathalia costa pereira', 'nath.costa@gmail.com', '2025-02-14'),
('28976410583', 'rodrigo nascimento leite', 'rodrigonleite@outlook.com', '2025-04-09');

select*
from usuario;

INSERT INTO Plano (tipo, descricao, preco_mensal)
VALUES
('Atlas Start', 'Hospedagem básica, ideal para sites pequenos e páginas pessoais.', 29.90),
('Atlas Pro', 'Mais desempenho, suporte 24h e certificado SSL incluso.', 59.90),
('Atlas Cloud', 'Hospedagem em nuvem com recursos escaláveis e backup automático.', 119.90),
('Atlas Business', 'Alta disponibilidade e segurança para empresas de médio porte.', 249.90),
('Atlas Titan', 'Servidores dedicados com desempenho máximo e IP exclusivo.', 499.90);

select*
from Plano;

insert into contrato(cpf_usuario,id_plano,data_inicio,data_fim,valor)
values ('42651874854',2,'2025-04-29','2026-01-29',59.90);