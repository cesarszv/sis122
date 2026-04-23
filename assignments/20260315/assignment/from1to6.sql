-- from1to6
-- SELECTS

-- Mostrar todos los clientes.
SELECT *
FROM Clientes
;

-- Mostrar nombre y ciudad de los clientes.
SELECT nombre, ciudad
FROM Clientes
;

-- Mostrar todos los productos con precio mayor a 50.
SELECT nombre, precio
FROM Productos
WHERE precio > 50
;

-- Mostrar los productos ordenados por precio de mayor a menor.
SELECT  nombre, precio
FROM Productos
ORDER BY precio DESC
;

-- Mostrar los productos cuyo nombre empiece con "T".
SELECT nombre
FROM Productos
WHERE nombre LIKE 'T%'
;

-- Mostrar los 5 productos mas baratos.
SELECT nombre, precio
FROM Productos
ORDER BY precio ASC
LIMIT 5
;