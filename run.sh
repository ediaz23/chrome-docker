#!/bin/bash
# Archivo: ejecutar_docker.sh

# Exportar DISPLAY para aplicaciones gráficas
export DISPLAY=${DISPLAY}

# Permitir acceso al servidor X11
xhost +local:docker

# Ejecutar el contenedor Docker
docker run -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/webOS_TV_SDK/chrome-docker/user_data:/home/chromium/chromium_data \
  --privileged -it chromium-34



