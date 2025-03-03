#!/bin/bash
# Archivo: ejecutar_docker.sh

# Exportar DISPLAY para aplicaciones gráficas
export DISPLAY=${DISPLAY}

# Nombre del contenedor
CONTAINER_NAME="chromium-34-container"

# Función para detener el contenedor cuando se reciba Ctrl+C
cleanup() {
    echo "Deteniendo el contenedor $CONTAINER_NAME..."
    docker stop "$CONTAINER_NAME" >/dev/null 2>&1
    docker rm "$CONTAINER_NAME" >/dev/null 2>&1
}

# Asegurar que cleanup se ejecute al recibir señales como SIGINT o SIGTERM
trap cleanup SIGINT SIGTERM


# Permitir acceso al servidor X11
xhost +local:docker

# Ejecutar el contenedor Docker
docker run --name "$CONTAINER_NAME" -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/webOS_TV_SDK/chrome-docker/user_data:/home/chromium/chromium_data \
  --privileged -it chromium-34

cleanup
