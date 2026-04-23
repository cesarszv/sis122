#!/usr/bin/env bash
# LOGICA:
# El script asegura que MySQL este activo, recrea la base de datos
# y carga los archivos SQL de la carpeta assignment en orden.
#
# PSEUDOCODIGO:
# 1. Cargar configuracion compartida.
# 2. Levantar MySQL si hace falta.
# 3. Borrar y crear la base de datos.
# 4. Cargar `defineTables.sql`.
# 5. Cargar todos los `from*.sql` en orden.
# 6. Informar exito.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"
ASSIGNMENT_DIR="$(cd "${SCRIPT_DIR}/../assignment" && pwd)"

"${SCRIPT_DIR}/mysql-up.sh"

log_info "Limpiando y recreando base de datos: ${MYSQL_DATABASE}..."
docker exec "$CONTAINER_NAME" mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "DROP DATABASE IF EXISTS \`${MYSQL_DATABASE}\`; CREATE DATABASE \`${MYSQL_DATABASE}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;"

if [ -f "${ASSIGNMENT_DIR}/defineTables.sql" ]; then
  log_info "Cargando esquema: defineTables.sql"
  docker exec -i "$CONTAINER_NAME" mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < "${ASSIGNMENT_DIR}/defineTables.sql"
else
  log_error "No se encontro defineTables.sql en ${ASSIGNMENT_DIR}"
  exit 1
fi

log_info "Cargando datos adicionales..."
for sql_file in $(ls "${ASSIGNMENT_DIR}"/from*.sql | sort -V); do
  log_info "Cargando: $(basename "$sql_file")"
  docker exec -i "$CONTAINER_NAME" mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < "$sql_file"
done

log_success "Base de datos '${MYSQL_DATABASE}' recreada y cargada con exito."
