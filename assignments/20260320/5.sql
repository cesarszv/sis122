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
