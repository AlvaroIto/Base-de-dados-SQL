-- Seleciona a base de dados
use base_de_dados;

-- Mostra as tabelas da base de dados
show tables;

-- Descreve as colunas da tabela
describe users;

-- Inserir registros na base de dados
insert into users (first_name, last_name, email, password_hash) values ('Maria', 'Silva', 'maria@email.com', 'a_hash');

-- Seleciona colunas
-- todos
select * from users; 
-- alguns campos
select email, id, first_name from users as u;
-- Seleciona colunas de uma  tabela especifica
select u.email, u.id, u.first_name from users as u;

-- where filtra registros
select * from users where id=2;
-- com operadores de comparação = < <= > >= <> !=
select * from users where id>=2;
-- com operadores lógicos and e or
select * from users where id=2 or first_name='Fulano';

-- beteween seleciona um range
select * from users where created_at between '2020-01-25 09:46:01' and '2020-02-28 05:52:36';

-- in seleciona os valores em uma array, lista
select * from users where id in (1, 5, 10, 50, 100);

-- like (parecido) terminar(%...) começar(...%) meio(...%...)
-- % qualquer coisa
-- _ um caractere
select * from users where first_name like '%o';

-- 
select id, first_name, email 
from users 
where id beteween 10 and 50
order by id asc 