/*
===================================
Cesar Sebastian Zambrana Ventura
===================================
*/

-- crear la base de datos y tablas
CREATE TABLE autores (
    id_autor INT PRIMARY KEY,
    nombre VARCHAR(100),
    pais VARCHAR(100) 
);


CREATE TABLE libros (
    id_libro INT PRIMARY KEY,
    titulo VARCHAR(150),
    ano_publicacion INT,
    --
    id_autor INT,
    FOREIGN KEY (id_autor)
    REFERENCES autores(id_autor)
);


CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(150) 
);


CREATE TABLE prestamos (
    id_prestamo INT PRIMARY KEY,
    fecha_prestamo DATE,
    --
    id_usuario INT,
    FOREIGN KEY (id_usuario) 
    REFERENCES usuarios(id_usuario),
    id_libro INT,
    FOREIGN KEY (id_libro) 
    REFERENCES libros(id_libro)
);

/*
insertar datos de ejemplo
*/

-- 5 autores
INSERT INTO autores (id_autor, nombre, pais)
VALUES
(1, 'Jose Jesus Cabrera Pantoja', 'Rusia'),
(2, 'Ismael Antonio Delgado Huanca', 'Boliiva'),
(3, 'Evo Morales Ayma', 'Boliiva'),
(4, 'Adolf Hitler', 'Alemania'),
(5, 'Hugo Banzer', 'Bolivia')
;


-- 5 libros con autores
INSERT INTO libros (id_libro, titulo, id_autor, ano_publicacion)
VALUES
    (1, 'Introduccion A La Programacion', 1, 2000),
    (2, 'Introduccion A MongoDB', 2, 2020),
    (3, 'Introduccion Al Masismo', 3, 2000),
    (4, 'Mi Lucha', 4, 1960),
    (5, 'Fundamentos Del Genocidio', 5, 1950)
;


-- 2 usuarios
INSERT INTO usuarios (id_usuario, nombre, email)
VALUES
    (1, 'Juan Pablo Velascco', 'jpvelasco@correo.bo'),
    (2, 'Mamen Saveedra', 'mamen@vos.bo'),
    (3, 'Oscar Ortiz', 'oscar@ucb.bo')
;


-- 5 prestamos 
INSERT INTO prestamos (id_prestamo, id_usuario, id_libro, fecha_prestamo)
VALUES
    (1, 1, 1, '2026-03-01'),
    (2, 2, 4, '2026-03-02'),
    (3, 1, 3, '2026-03-05'),
    (4, 1, 1, '2026-03-10'),
    (5, 2, 2, '2026-03-12');
;

/*
consultas basicas
*/

-- todos los autores.
SELECT *
FROM autores
;


-- unicamente los titulos de los libros.
SELECT titulo
FROM libros
;


-- libros publicados despues de 1965.
SELECT *
FROM libros
WHERE ano_publicacion > 1965;

/*
consultas intermedias.
*/


-- libros por ano de publicacion en orden descendente.
SELECT *
FROM libros
ORDER BY ano_publicacion DESC;

-- contar libros existen en la base de datos.
SELECT COUNT(*) AS total_libros
FROM libros;

-- usuarios cuyo nombre contenga el texto "Ana".
SELECT *
FROM usuarios
WHERE nombre LIKE '%Ana%';

/*
consultas con JOIN.
*/

-- los libros junto con el nombre de su autor.
SELECT libros.titulo, autores.nombre AS autor
FROM libros
JOIN autores 
ON libros.id_autor = autores.id_autor
;


-- la misma consulta utilizando alias.
SELECT l.titulo, a.nombre AS autor
FROM libros AS l
JOIN autores AS a 
ON l.id_autor = a.id_autor
;


-- nombre del usuario, titulo del libro y fecha de prestamo.
SELECT usuarios.nombre AS usuario, libros.titulo, prestamos.fecha_prestamo
FROM prestamos
JOIN usuarios 
ON prestamos.id_usuario = usuarios.id_usuario
JOIN libros 
ON prestamos.id_libro = libros.id_libro
ORDER BY prestamos.fecha_prestamo ASC
;

/*
nivel avanzado.
*/


-- libros prestados por un usuario especifico.
SELECT libros.titulo, prestamos.fecha_prestamo
FROM libros
JOIN prestamos
ON libros.id_libro = prestamos.id_libro
JOIN usuarios
ON prestamos.id_usuario = usuarios.id_usuario
WHERE usuarios.id_usuario = 1
;


-- autores que tienen mas de un libro registrado.
SELECT autores.nombre, COUNT(libros.id_libro) AS total_libros
FROM autores
JOIN libros
ON autores.id_autor = libros.id_autor
GROUP BY autores.id_autor, autores.nombre
HAVING COUNT(libros.id_libro) > 1
;

/*
desafios extra.
*/


-- el libro mas antiguo.
SELECT id_libro, titulo, ano_publicacion
FROM libros
ORDER BY ano_publicacion ASC, titulo ASC
LIMIT 1;
