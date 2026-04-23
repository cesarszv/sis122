#!/usr/bin/env bash
# LOGICA:
# El script asegura que MySQL este activo y muestra un resumen rapido:
# version, tablas y cantidad de registros por tabla.
#
# PSEUDOCODIGO:
# 1. Cargar configuracion compartida.
# 2. Levantar MySQL si hace falta.
# 3. Mostrar version.
# 4. Mostrar tablas existentes.
# 5. Recorrer cada tabla y hacer `COUNT(*)`.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

"${SCRIPT_DIR}/mysql-up.sh" >/dev/null

echo -e "\n--- RESUMEN DE ESTADO ---"

echo -e "${YELLOW}Version:${NC}"
docker exec "$CONTAINER_NAME" mysql -N -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SELECT VERSION();"

echo -e "\n${YELLOW}Tablas en '${MYSQL_DATABASE}':${NC}"
docker exec "$CONTAINER_NAME" mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" -e "SHOW TABLES;"

echo -e "\n${YELLOW}Conteos de registros:${NC}"
TABLES=$(docker exec "$CONTAINER_NAME" mysql -N -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" -e "SHOW TABLES;")

if [ -z "$TABLES" ]; then
  log_warn "No se encontraron tablas en la base de datos."
else
  for table in $TABLES; do
    COUNT=$(docker exec "$CONTAINER_NAME" mysql -N -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" -e "SELECT COUNT(*) FROM \`$table\`;")
    echo -e "  - ${GREEN}${table}${NC}: $COUNT registros"
  done
fi

echo -e "\n-------------------------\n"
