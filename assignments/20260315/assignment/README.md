# Assignment: Consultas SQL

Guia de ejercicios para practicar `SELECT`, `INSERT`, `UPDATE`, `JOIN` y consultas de agregacion sobre el esquema de la tarea.

## Esquema base

Tablas usadas en esta practica:

- `Clientes(id_cliente, nombre, ciudad)`
- `Productos(id_producto, nombre, precio)`
- `Pedidos(id_pedido, id_cliente, fecha)`
- `Detalle_Pedido(id_detalle, id_pedido, id_producto, cantidad)`

Archivo de referencia del esquema: [`defineTables.sql`](/home/cszv/cesarszv/resources/ucb-lia/[1-2026] [SIS-122] databases 1 (1)/assignments/20260315/assignment/defineTables.sql)

## Progreso

### 1. Estructura de la base de datos

- [ ] Definir las tablas `Clientes`, `Productos`, `Pedidos` y `Detalle_Pedido`.

Referencia: [`defineTables.sql`](/home/cszv/cesarszv/resources/ucb-lia/[1-2026] [SIS-122] databases 1 (1)/assignments/20260315/assignment/defineTables.sql)

### 2. SELECT (1-6)

- [ ] 1. Mostrar todos los clientes.
- [ ] 2. Mostrar nombre y ciudad de los clientes.
- [ ] 3. Mostrar todos los productos con precio mayor a 50.
- [ ] 4. Mostrar los productos ordenados por precio de mayor a menor.
- [ ] 5. Mostrar los productos cuyo nombre empiece con `"T"`.
- [ ] 6. Mostrar los 5 productos mas baratos.

Referencia: [`from1to6.sql`](/home/cszv/cesarszv/resources/ucb-lia/[1-2026] [SIS-122] databases 1 (1)/assignments/20260315/assignment/from1to6.sql)

### 3. INSERT (7-10)

- [ ] 7. Insertar un cliente nuevo llamado `"Carlos Perez"` de La Paz.
- [ ] 8. Insertar 3 productos nuevos.
- [ ] 9. Crear un pedido para el cliente con id `1`.
- [ ] 10. Insertar dos productos en el detalle de ese pedido.

Referencia: [`from7to10.sql`](/home/cszv/cesarszv/resources/ucb-lia/[1-2026] [SIS-122] databases 1 (1)/assignments/20260315/assignment/from7to10.sql)

### 4. UPDATE (11-14)

- [ ] 11. Cambiar la ciudad del cliente con id `1` a `"Cochabamba"`.
- [ ] 12. Aumentar el precio de todos los productos en 10%.
- [ ] 13. Cambiar el nombre de un producto.
- [ ] 14. Actualizar la cantidad de un producto en un detalle de pedido.

Referencia: [`from11to14.sql`](/home/cszv/cesarszv/resources/ucb-lia/[1-2026] [SIS-122] databases 1 (1)/assignments/20260315/assignment/from11to14.sql)

### 5. JOIN (15-20)

- [ ] 15. Mostrar los pedidos con el nombre del cliente.
- [ ] 16. Mostrar todos los productos vendidos en cada pedido.
- [ ] 17. Mostrar nombre del cliente, fecha del pedido y productos comprados.
- [ ] 18. Mostrar el total de productos comprados en cada pedido.
- [ ] 19. Mostrar todos los pedidos con sus productos y cantidades.
- [ ] 20. Mostrar los clientes que han realizado pedidos.

Referencia: [`from15to20.sql`](/home/cszv/cesarszv/resources/ucb-lia/[1-2026] [SIS-122] databases 1 (1)/assignments/20260315/assignment/from15to20.sql)

### 6. Seleccionar el mayor despues de un JOIN (21-25)

- [ ] 21. Producto mas caro comprado en cada pedido.
- [ ] 22. Cliente que hizo el pedido con mayor cantidad de productos.
- [ ] 23. Producto mas caro vendido.
- [ ] 24. Pedido con el mayor total de dinero.
- [ ] 25. Cliente que gasto mas dinero.

### 7. Ejercicio extra (26)

- [ ] 26. Obtener el producto mas vendido.

Referencia: [`from21to26.sql`](/home/cszv/cesarszv/resources/ucb-lia/[1-2026] [SIS-122] databases 1 (1)/assignments/20260315/assignment/from21to26.sql)

## Pistas

- `18.` Usa `SUM(cantidad)` agrupando por pedido.
- `21.` Combina `MAX(precio)` con `JOIN` y `GROUP BY`.
- `22.` Calcula el total de cantidades por pedido antes de buscar el mayor.
- `24.` Usa `SUM(precio * cantidad)` por pedido.
- `25.` Suma `precio * cantidad` por cliente.
- `26.` Usa `SUM(cantidad)` por producto y luego selecciona el mayor.
