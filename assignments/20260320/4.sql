/*
consultas intermedias.
*/


-- 4.1 Ordenar los libros por ano de publicacion en orden descendente.
SELECT *
FROM libros
ORDER BY ano_publicacion DESC;

-- 4.2 Contar cuantos libros existen en la base de datos.
SELECT COUNT(*) AS total_libros
FROM libros;

-- 4.3 Buscar usuarios cuyo nombre contenga el texto "Ana".
SELECT *
FROM usuarios
WHERE nombre LIKE '%Ana%';
