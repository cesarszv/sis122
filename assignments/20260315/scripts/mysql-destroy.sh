#!/usr/bin/env bash
# LOGICA:
# El script realiza una limpieza total del entorno.
# Borra el contenedor y el volumen de persistencia.
#
# PSEUDOCODIGO:
# 1. Cargar configuracion compartida.
# 2. Si el contenedor existe, eliminarlo.
# 3. Si el volumen existe, eliminarlo.
# 4. Informar que la limpieza termino.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

if docker ps -a --format '{{.Names}}' | grep -Fxq "$CONTAINER_NAME"; then
  docker rm -f "$CONTAINER_NAME" >/dev/null
  log_info "Contenedor '$CONTAINER_NAME' eliminado."
fi

if docker volume ls --format '{{.Name}}' | grep -Fxq "$VOLUME_NAME"; then
  docker volume rm "$VOLUME_NAME" >/dev/null
  log_info "Volumen '$VOLUME_NAME' eliminado."
fi

log_success "Entorno de MySQL destruido por completo."
