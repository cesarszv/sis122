#!/usr/bin/env bash
# LOGICA:
# El script levanta el contenedor de MySQL en el puerto 3307 local y asegura
# que este listo para aceptar conexiones antes de terminar su ejecucion.
# Si el contenedor ya existe pero no esta corriendo, se limpia y recrea
# para garantizar que la configuracion sea la correcta.
#
# PSEUDOCODIGO:
# 1. Cargar configuracion compartida.
# 2. Si el contenedor ya esta corriendo, informar y salir.
# 3. Si el contenedor existe detenido, borrarlo.
# 4. Ejecutar `docker run` con puerto, credenciales y volumen.
# 5. Esperar hasta que `mysqladmin ping` responda.
# 6. Informar exito o error por timeout.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

if docker ps --format '{{.Names}}' | grep -Fxq "$CONTAINER_NAME"; then
  log_info "MySQL ya esta levantado en 127.0.0.1:${MYSQL_PORT}."
  exit 0
fi

if docker ps -a --format '{{.Names}}' | grep -Fxq "$CONTAINER_NAME"; then
  log_warn "Contenedor $CONTAINER_NAME existe pero esta detenido. Recreando..."
  docker rm -f "$CONTAINER_NAME" >/dev/null
fi

log_info "Iniciando MySQL ${MYSQL_VERSION} en puerto ${MYSQL_PORT}..."
docker run -d \
  --name "$CONTAINER_NAME" \
  --restart no \
  -p "${MYSQL_PORT}:3306" \
  -e MYSQL_ROOT_PASSWORD="$MYSQL_ROOT_PASSWORD" \
  -e MYSQL_DATABASE="$MYSQL_DATABASE" \
  -e MYSQL_USER="$MYSQL_USER" \
  -e MYSQL_PASSWORD="$MYSQL_PASSWORD" \
  -v "${VOLUME_NAME}:/var/lib/mysql" \
  mysql:${MYSQL_VERSION} \
  --skip-name-resolve=ON \
  --local_infile=0 \
  --character-set-server=utf8mb4 \
  --collation-server=utf8mb4_0900_ai_ci >/dev/null

log_info "Esperando a MySQL..."
for _ in {1..30}; do
  if docker exec "$CONTAINER_NAME" mysqladmin ping -h 127.0.0.1 -uroot -p"$MYSQL_ROOT_PASSWORD" --silent >/dev/null 2>&1; then
    log_success "MySQL listo en 127.0.0.1:${MYSQL_PORT}"
    exit 0
  fi
  sleep 1
done

log_error "MySQL no quedo listo a tiempo. Revisa: docker logs ${CONTAINER_NAME}" >&2
exit 1
