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
