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
