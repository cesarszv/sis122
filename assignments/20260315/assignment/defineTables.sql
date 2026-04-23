/*
=====================================
SIS-122 BASES DE DATOS
Profesor:
    - Ismael Antonio Delgado Huanca

Estudiante:
    - Cesar Sebastian Zambrana Ventura
=====================================
*/

CREATE TABLE IF NOT EXISTS Clientes
(
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    ciudad VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Productos
(
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Pedidos
(
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    fecha DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE IF NOT EXISTS Detalle_Pedido
(
    id_detalle INT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);
