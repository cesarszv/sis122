-- from7to10
-- INSERTS

-- Insertar un cliente nuevo llamado "Carlos Perez" de La Paz.
INSERT INTO Clientes (id_cliente, nombre, ciudad)
VALUES
(1, 'Carlos Perez', 'La Paz')
;


-- Insertar 3 productos nuevos.
INSERT INTO Productos (id_producto, nombre, precio)
VALUES
(1, 'Chicle Beldent', 6),
(2, 'Agua Vital', 7),
(3, 'Monster Blanco', 25)
;


-- Crear un pedido para el cliente con id 1.
INSERT INTO Pedidos (id_pedido, id_cliente, fecha)
VALUES
(1, 1, '2026-03-15') -- pedido número 1, hecho por Carlos Pérez el 2026-03-15
;


-- Insertar dos productos en el detalle de ese pedido.
INSERT INTO Detalle_Pedido (id_detalle, id_pedido, id_producto, cantidad)
VALUES
(1, 1, 3, 1), -- primer detalle, el pedido 1 compro 1 monster blanco
(2, 1, 1, 2) -- segundo detalle, el pedido 1 compro 2 chicles beldent
;