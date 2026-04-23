-- from11to14
-- UPDATE

-- Cambiar la ciudad del cliente con id 1 a "Cochabamba".
UPDATE Clientes
SET ciudad = 'Cochabamba'
WHERE id_cliente = 1
;

-- Aumentar el precio de todos los productos en 10%.
UPDATE Productos
SET precio = precio * 1.10
;

-- Cambiar el nombre de un producto.
UPDATE Productos
SET nombre = 'Agua VillaSanta'
WHERE id_producto = 2
;

-- Actualizar la cantidad de un producto en un detalle de pedido.
UPDATE Detalle_Pedido
SET cantidad = 3 
WHERE 
id_pedido = 1 
AND 
id_producto = 3
;