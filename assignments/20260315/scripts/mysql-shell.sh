#!/usr/bin/env bash
# LOGICA:
# El script abre una sesion interactiva de MySQL dentro del contenedor.
#
# PSEUDOCODIGO:
# 1. Cargar configuracion compartida.
# 2. Informar la base de datos objetivo.
# 3. Ejecutar `docker exec -it` con el cliente mysql.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

log_info "Entrando a la consola interactiva de MySQL (${MYSQL_DATABASE})..."
log_info "Escribe 'exit' para salir."

docker exec -it "$CONTAINER_NAME" mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE"
