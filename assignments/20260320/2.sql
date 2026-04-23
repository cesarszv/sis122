/*
insertar datos de ejemplo
*/

-- 5 autores
INSERT INTO autores (id_autor, nombre, pais)
VALUES
(1, 'Jose Jesus Cabrera Pantoja', 'Rusia')
(2, 'Ismael Antonio Delgado Huanca', 'Boliiva')
(3, 'Evo Morales Ayma', 'Boliiva')
(4, 'Adolf Hitler', 'Alemania')
(5, 'Hugo Banzer', 'Bolivia')
;


-- 5 libros con autores
INSERT INTO libros (id_libro, titulo, id_autor, ano_publicacion)
VALUES
    (1, 'Introduccion A La Programacion', 1, 2000),
    (2, 'Introduccion A MongoDB', 2, 2020)
    (3, 'Introduccion Al Masismo', 3, 2000)
    (4, 'Mi Lucha', 4. 1960)
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