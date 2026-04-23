# Plan de Proyecto — SIS-122 (Bases de Datos I)

Basado en las instrucciones del profesor Delgado, este documento guía el desarrollo del proyecto final (individual o grupo de máx. 3 personas).

## 📅 Fase 1: Requisitos (La Tarea Actual)
El objetivo es **formalizar** la idea del proyecto (Biblioteca, E-commerce, Mascotas, etc.) mediante una encuesta.

### 1. Definir la Idea
Elegir un tema. Ejemplos de clase:
- Gestión de Biblioteca (Libros, Préstamos, Autores).
- E-commerce (Productos, Clientes, Ventas).
- Gestión de Mascotas/Veterinaria.

### 2. La Encuesta (Validación)
Crear un archivo en `proyecto-final/01-requisitos/encuesta.md` con las preguntas para los futuros usuarios.
*Objetivo:* Saber qué datos son importantes (¿Quieren ver el estado civil? ¿Solo nombre y apellido? ¿Qué es obligatorio?).

**Ejemplo de preguntas a incluir:**
- ¿Qué información necesita registrar de un [Cliente/Libro]?
- ¿Es necesario guardar el historial de [Préstamos/Compras]?
- ¿Hay datos confidenciales que NO deberían mostrarse?

> **Regla de Oro (Profesor Delgado):**
> Todas las bases de datos deben terminar en `_db`.
> *   ✅ `biblioteca_db`
> *   ❌ `biblioteca`

---

## 💾 Fase 2: El Motor de Base de Datos (MySQL)

### ¿Qué es el "Motor"?
Imagina que MySQL es un **archivador inteligente** que vive en tu sistema Linux.
- No es un archivo que "abres" con doble clic (como Word o Excel/Access).
- Es un **servicio** (un programa invisible) que espera órdenes.
- Tú le das órdenes (SQL) y él te devuelve datos.

### ¿Cómo se "Prende" el Motor?
Como lo configuramos para ahorrar batería, normalmente está apagado.

1.  **Encender:** `sudo systemctl start mysql`
2.  **Verificar:** `sudo systemctl status mysql`
3.  **Usar:** Entras con `mysql -u cesar_sis122 -p` o usas MySQL Workbench.

> **Tip de Emergencia:** Si en el laboratorio las máquinas están "friseadas" o no puedes instalar nada, usa **AnyDesk** o **TeamViewer** para conectarte a tu PC de casa (que debe estar encendida).

---

## 💿 Fase 3: Guardar y Respaldar (Backup)

### ¿Dónde está el botón "Guardar"?
En las bases de datos **no existe** el botón "Guardar".
- Cada vez que escribes un comando `CREATE TABLE` o `INSERT INTO`, se guarda **automáticamente e instantáneamente** en el disco duro.
- Si se va la luz, los datos ya están guardados.

### ¿Cómo me llevo mi base de datos a otro lado (Windows/Campus)?
Como no es un archivo suelto, tienes que pedirle al motor que te **exporte** todo a un archivo de texto plano (`.sql`). A esto se le llama **Dump**.

**Comando para "Guardar en un archivo" (Exportar):**
```bash
# Esto crea un archivo de texto con todas las instrucciones para reconstruir tu BD
mysqldump -u cesar_sis122 -p sis122_db > /ruta/donde/quieras/guardar/mi_proyecto.sql
```

**Comando para "Abrir el archivo" (Importar):**
```bash
# Esto lee el archivo y reconstruye la BD en el motor
mysql -u cesar_sis122 -p sis122_db < /ruta/donde/tengas/el_archivo/mi_proyecto.sql
```

---

## 📝 Próximos Pasos (Tarea)
1.  Crear el archivo de encuesta en `01-requisitos`.
2.  Responder la encuesta (simular las respuestas).
3.  Con base en las respuestas, diseñar las tablas (como hicimos en clase con `Persona` y `Referencia`).
