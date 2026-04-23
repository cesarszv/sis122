# Ejercicio SQL: Sistema de Registro de Adquisiciones

Una empresa desea desarrollar una base de datos para registrar las personas que realizan compras, los productos disponibles y las adquisiciones realizadas.

Se debe crear una base de datos llamada:
**sistema_compras**

La base de datos debe contener tres tablas relacionadas:
1. `persona`
2. `productos`
3. `adquisiciones`

El diseño debe incluir llaves primarias y llaves foráneas correctamente definidas.

## Requisitos de las Tablas

### 1. Tabla: `persona`
Debe almacenar la información de las personas registradas en el sistema.

**Campos mínimos:**
- `id_persona` → `INT`, llave primaria
- `nombre` → `VARCHAR(100)`, `NOT NULL`
- `apellido` → `VARCHAR(100)`, `NOT NULL`
- `correo` → `VARCHAR(150)`, `UNIQUE`
- `telefono` → `VARCHAR(20)`

### 2. Tabla: `productos`
Debe almacenar la información de los productos disponibles.

**Campos mínimos:**
- `id_producto` → `INT`, llave primaria
- `nombre_producto` → `VARCHAR(150)`, `NOT NULL`
- `precio` → `DECIMAL(10,2)`, `NOT NULL`
- `stock` → `INT`, `NOT NULL`

### 3. Tabla: `adquisiciones`
Debe registrar las compras realizadas por las personas.

**Campos mínimos:**
- `id_adquisicion` → `INT`, llave primaria
- `fecha` → `DATE`, `NOT NULL`
- `id_persona` → `INT`, llave foránea
- `id_producto` → `INT`, llave foránea
- `cantidad` → `INT`, `NOT NULL`

**Restricciones:**
- `id_persona` debe referenciar a `persona(id_persona)`
- `id_producto` debe referenciar a `productos(id_producto)`

## Instrucciones del ejercicio
El estudiante debe:
1. Crear la base de datos `sistema_compras`.
2. Crear las tres tablas usando `CREATE TABLE`.
3. Definir correctamente:
   - `PRIMARY KEY`
   - `FOREIGN KEY`
   - `NOT NULL`
   - `UNIQUE` (cuando aplique)
4. Insertar:
   - Al menos 3 o 4 registros en `persona`
   - Al menos 3 o 4 registros en `productos`
   - Al menos 3 o 4 registros en `adquisiciones`
5. Verificar que no se puedan registrar adquisiciones con personas o productos inexistentes.

## Objetivo
Demostrar el uso correcto de:
- `CREATE DATABASE`
- `CREATE TABLE`
- `PRIMARY KEY`
- `FOREIGN KEY`
- `INSERT INTO`
- Integridad referencial

## Entrega
Agregar entrega aquí.
