# Scripts de Gestion de Base de Datos

Esta carpeta contiene utilidades para automatizar el ciclo de vida del contenedor MySQL y la carga de datos para la tarea del 15 de marzo.

## Estructura de Scripts

```text
scripts/
├── common.sh                # Configuracion compartida y utilidades (colores, logs).
├── mysql-up.sh              # Inicia el contenedor y espera a que MySQL este listo.
├── mysql-down.sh            # Detiene y suspende el contenedor de MySQL.
├── mysql-destroy.sh         # Elimina completamente el contenedor y sus volumenes de datos.
├── mysql-reset-and-load.sh  # Recrea la base de datos y carga TODOS los archivos SQL.
├── mysql-shell.sh           # Abre una terminal interactiva para ejecutar comandos SQL.
└── mysql-verify.sh          # Muestra la version, tablas y conteo dinamico de registros.
```

## Uso Rapido

1. **Levantar el entorno:** `./mysql-up.sh`
2. **Cargar/Resetear datos:** `./mysql-reset-and-load.sh`
3. **Verificar estado:** `./mysql-verify.sh`
4. **Entrar a la consola:** `./mysql-shell.sh`
