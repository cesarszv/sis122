/*
desafios extra.
*/


-- el libro mas antiguo.
SELECT id_libro, titulo, anio_publicacion
FROM libros
ORDER BY anio_publicacion ASC, titulo ASC
LIMIT 1;
