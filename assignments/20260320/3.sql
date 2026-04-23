
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
