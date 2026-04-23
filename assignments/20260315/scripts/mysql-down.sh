#!/usr/bin/env bash
# LOGICA:
# El script detiene la ejecucion del contenedor de base de datos de forma suave,
# sin borrar los datos ni el contenedor.
#
# PSEUDOCODIGO:
# 1. Cargar configuracion compartida.
# 2. Verificar si el contenedor esta corriendo.
# 3. Si esta corriendo, detenerlo.
# 4. Si no, informar que ya estaba detenido.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

if docker ps --format '{{.Names}}' | grep -Fxq "$CONTAINER_NAME"; then
  docker stop "$CONTAINER_NAME" >/dev/null
  log_success "MySQL detenido."
  exit 0
fi

log_info "MySQL ya estaba detenido."
