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

-- order by ordernar por
select id, first_name, email 
from users 
where id between 10 and 50
order by first_name asc;

-- limit limita a quantidade de valores
-- offset desloca o cursor para exibir os resultados
select id, first_name, email 
from users 
where id between 10 and 50
order by id asc
limit 3 offset 3;

-- insert select insere valores em uma tabela usando outra
insert into profiles
(bio, description , user_id)
select concat('Bio de ', first_name),concat('Description de ', first_name), id from users;

-- delete apaga registros da tabela
delete from users where id = 14;
select * from users where id between 10 and 15;

-- update atualiza dados na basee de dados
update users set first_name = 'Iacomo', last_name = 'Kid' where id = 19;
select * from users  where id = 19;

-- select com tabelas diferentes
select u.id as uid, p.id as pid, p.bio, u.first_name
from users as u, profiles as p
where u.id = p.user_id;

-- rand e round
select round(rand() * 10000, 2);
update users set salary = round(rand() * 10000, 2);

-- preencher campos tabela roles
insert into roles (name) values ('POST'), ('PUT'), ('DELETE'), ('GET');
-- preencher tabela users_roles (pegar cada usuário e atribuir uma role aleatoria)
-- adiciona um dado especifico
insert into user_roles (user_id, role_id)
values (18, 4);
-- inserir varios dados
insert into user_roles (user_id, role_id) 
select id, (select id from roles order by rand() limit 1) as qualquer from users;
-- insert ignore
insert ignore into user_roles (user_id, role_id) 
select id, (select id from roles order by rand() limit 1) as qualquer from users order BY  rand() limit 5;

-- selecionar usuario, a role e o perfil (3 tabelas diferentes)
select 
u.id as uid, u.first_name, p.bio, r.name as role_name
from users as u
left join profiles as p on u.id = p.user_id
inner join user_roles as ur on u.id = ur.user_id
inner join roles as r on ur.role_id = r.id
order by uid asc;

-- update com join
select u.first_name, p.bio from users as u
join profiles p
on p.user_id = u.id
where u.first_name = 'Keelie';

update users as u
join profiles p
on p.user_id = u.id
set p.bio = concat (p.bio, ' atualizado')
where u.first_name = 'Keelie';

-- delete com join
select u.first_name, p.bio from users as u
left join profiles p
on p.user_id = u.id
where u.first_name = 'Keelie';

delete p, u from users as u
left join profiles as p
on p.user_id = u.id
where u.first_name = 'Keelie';

-- group by
select first_name, count(id) as total from users
group by first_name
order by total desc;

-- Agregações (min, max, avg, sum e count)
select 
max(salary) as max_salary,
min(salary) as min_salary,
avg(salary) as avg_salary,
sum(salary) as sum_salary,
count(salary) as count_salary
from users;

-- Exercicios
-- 1) Insira 5 usuários
insert into users (first_name, last_name, email, password_hash) values 
('Maria', 'Silva', 'email1@email.com', round(rand() * 100000)),
('João', 'Carneiro', 'email2@email.com', round(rand() * 100000)),
('Pablo', 'Romero', 'email3@email.com', round(rand() * 100000)),
('Elis', 'Regina', 'email4@email.com', round(rand() * 100000)),
('Marina', 'Camargo', 'email5@email.com', round(rand() * 100000));

update users set salary = round(rand() * 100000, 2) where id in (104, 105, 106, 107, 108);
-- 2) Insira 5 perfís para os usuários inseridos
insert into profiles  (bio, description, user_id) values
('bio', 'description', (select id from users where email = 'email1@email.com')),
('bio', 'description', (select id from users where email = 'email2@email.com')),
('bio', 'description', (select id from users where email = 'email3@email.com')),
('bio', 'description', (select id from users where email = 'email4@email.com')),
('bio', 'description', (select id from users where email = 'email5@email.com'));
-- 3) Insira permissões (roles) para os usuários inseridos
insert into user_roles (user_id, role_id) values
(108, 3),
(107, 2),
(106, 1),
(105, 5),
(104, 4);
-- 4) Selecione os últimos 5 usuários por ordem decrescente
select * from users order by id desc limit 5;
-- 5) Atualize o último usuário inserido
update users set first_name = 'Marina Camargo', last_name = 'Atualizado' where id = 108;
-- 6) Remova uma permissão de algum usuário
delete from user_roles where user_id = 108 and role_id = 3;
-- 7) Remova um usuário que tem a permissão "PUT"
-- select u.id as uid, u.first_name, r.name 
delete u from users u
inner join user_roles ur on u.id = ur.user_id
inner join roles r on ur.role_id = r.id
where r.name = 'PUT' and u.id= 103;
-- 8) Selecione usuários com perfís e permissões (obrigatório)
select u.id as uid, u.first_name, r.name, p.bio
from users u
inner join user_roles ur on u.id = ur.user_id
inner join roles r on ur.role_id = r.id
inner join profiles p on p.user_id = u.id;
-- 9) Selecione usuários com perfís e permissões (opcional)
select u.id as uid, u.first_name, r.name, p.bio
from users u
left join user_roles ur on u.id = ur.user_id
left join roles r on ur.role_id = r.id
left join profiles p on p.user_id = u.id;
-- 10) Selecione usuários com perfís e permissões ordenando por salário
select u.id as uid, u.first_name, r.name, p.bio, u.salary
from users u
inner join user_roles ur on u.id = ur.user_id
inner join roles r on ur.role_id = r.id
inner join profiles p on p.user_id = u.id
order by u.salary desc;