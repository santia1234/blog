-- users

create table users (
   id serial primary key,
   first_name varchar(50),
   last_name varchar(50),
   email varchar(50)
);

insert into users (first_name, last_name, email) values
('Diego', 'Lopez', 'diego@gmail.com'),
('Carlos', 'Martinez', 'carlos@gmail.com'),
('Eduardo', 'Perez', 'eduardo@gmail.com');

select * from users;

-- posts

create table posts (
    id serial primary key,
    creator_id int references users(id),
	title varchar(50),
	text text 
);

insert into posts (creator_id, title, text) values
(1, 'Primer post', '!Hola a todos¡ Este es mi primer post en esta plataforma'),
(2, 'Reflexiones', 'Hoy quiero compartir algunas reflexiones sobre el futuro de la tecnologia'),
(1, 'Viaje', 'Acabo de regresar de un maravillosos viaje a la playa, queria compartir algunas fotos con ustedes'),
(3, 'Ultimas noticias', 'Aqui estan las ultimas noticias sobre el proyecto en el que he estado trabajando'),
(3, 'Recomendaciones de Lectura', 'Estoy leyendo un libro fascinante en este momento, altamente recomendado para ustedes');

select * from posts;

--likes

create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

insert into likes (user_id, post_id) values
(1, 1),
(3, 3),
(2, 2),
(2, 3),
(1, 2);

select * from likes ;

-- Trae todos los posts y la información del usuario del campo creator_id

-- posts - users


select posts.text, users.first_name, users.last_name from posts inner join users
on users.id = posts.creator_id;

-- Trae todos los posts, con la información de los usuarios que les dieron like

-- posts - likes - users

select posts.text, users.first_name, users.last_name from posts inner join likes
on posts.id = likes.post_id inner join users
on users.id = likes.user_id;











