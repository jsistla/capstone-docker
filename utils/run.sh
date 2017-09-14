#! /bin/bash
set -e

# Settings from environment
UDACITY_SOURCE=${UDACITY_SOURCE:-`pwd`}
UDACITY_IMAGE=${UDACITY_IMAGE:-bydavy/carnd-capstone}
CONTAINER_NAME="udacity_carnd"

if [ "$(docker ps -a | grep ${CONTAINER_NAME})" ]; then
  echo "Attaching to running container..."
  docker exec -it ${CONTAINER_NAME} bash $@
else
  sudo docker run --name ${CONTAINER_NAME} -v /home/sistlajr:/home/sistlajr -v $HOME:$HOME --rm -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro -p 4567:4567 -v "${UDACITY_SOURCE}:/udacity" ${UDACITY_IMAGE} $@
fi
