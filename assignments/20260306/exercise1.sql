-- ============================================
-- TAREA SIS-122 — Bases De Datos I
-- Estudiante: Cesar Sebastian Zambrana Ventura
-- ===========================================

-- CREATE DATABASE sistema_compras;
-- USE sistema_compras;

-- personas registradas en el sistema
CREATE TABLE persona (
    id_persona INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(150) UNIQUE,
    telefono VARCHAR(20),
    PRIMARY KEY (id_persona)
);

-- productos disponibles para compra
CREATE TABLE productos (
    id_producto INT NOT NULL,
    nombre_producto VARCHAR(150) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    PRIMARY KEY (id_producto)
);

-- registro de compras realizadas
-- las llaves foraneas aseguran que no se pueda registrar
-- una adquisicion con persona o producto que no exista
CREATE TABLE adquisiciones (
    id_adquisicion INT NOT NULL,
    fecha DATE NOT NULL,
    id_persona INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (id_adquisicion),
    FOREIGN KEY (id_persona) REFERENCES persona (id_persona),
    FOREIGN KEY (id_producto) REFERENCES productos (id_producto)
);

-- insertar personas
INSERT INTO
    persona (
        id_persona,
        nombre,
        apellido,
        correo,
        telefono
    )
VALUES (
        1,
        'Carlos',
        'Mamani',
        'carlos.mamani@gmail.com',
        '75412365'
    ),
    (
        2,
        'Sofia',
        'Quispe',
        'sofia.quispe@gmail.com',
        '68923415'
    ),
    (
        3,
        'Diego',
        'Flores',
        'dflores@hotmail.com',
        '72301548'
    ),
    (
        4,
        'Ana',
        'Torrico',
        'anatorrico@gmail.com',
        NULL
    );

-- insertar productos
INSERT INTO
    productos (
        id_producto,
        nombre_producto,
        precio,
        stock
    )
VALUES (1, 'Laptop', 5500.00, 10),
    (2, 'Celular', 1800.00, 25),
    (3, 'Audifonos', 350.00, 40),
    (4, 'Mochila', 180.00, 60);

-- insertar adquisiciones
INSERT INTO
    adquisiciones (
        id_adquisicion,
        fecha,
        id_persona,
        id_producto,
        cantidad
    )
VALUES (1, '2026-02-10', 1, 2, 1),
    (2, '2026-02-14', 2, 4, 2),
    (3, '2026-02-20', 3, 1, 1),
    (4, '2026-03-01', 1, 3, 3);

/*
==============================================
razonamiento / planteamiento
==============================================

lo primero que hice fue pensar en las tres entidades que pide el ejercicio:
- persona  → quien compra
- productos → que se puede comprar
- adquisiciones → el registro de cada compra

para persona use id_persona como llave primaria en vez del CI porque
el ejercicio pide un INT simple. correo lo puse UNIQUE pero sin NOT NULL
porque no todas las personas tienen o dan su correo. telefono tampoco
es obligatorio entonces no le puse NOT NULL.

para productos precio es DECIMAL(10,2) para poder guardar centavos
y stock INT porque no vamos a tener medias unidades de un producto.

la tabla adquisiciones es la que relaciona todo. tiene dos llaves foraneas:
- id_persona → apunta a persona(id_persona)
- id_producto → apunta a productos(id_producto)
gracias a eso MySQL no va a dejar insertar una adquisicion si el id_persona
o el id_producto no existen en sus respectivas tablas. eso cumple el
requisito de integridad referencial.

para los datos de prueba use productos tecnologicos/cotidianos con precios
en bolivianos y nombres bolivianos para las personas. ana torrico no tiene
telefono para probar que el campo acepta NULL. carlos hizo dos compras
distintas para ver que una persona puede tener multiples adquisiciones.
*/