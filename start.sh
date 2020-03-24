#!/bin/bash
NOT_INSTALLED="0"
PINTOS_PATH="/Users/mikjm98/Desktop/KAIST/6/os/pintos-kaist"

function docker_install_check() {
  CHECK=$(docker -v)
  if [[ $CHECK == bash* ]];
  then
      echo "install Docker first!! (https://www.docker.com/get-started)"
      RET_CHECK="1"
  fi
}

function repo_unpack() {
  CONTAINER_CHECK=$(docker ps | grep pintos_kaist)
  if [[ $CONTAINER_CHECK != "" ]]; then
    echo "docker container already up"
  else
    docker rm -f pintos-kaist
    IMAGE_CHECK=$(docker images | grep pintos_kaist)
    if [[ $IMAGE_CHECK != "" ]]; then
      echo "docker image already exist"
    else 
      echo "building docker image..."
      docker build -t pintos_kaist .
    fi
    echo "docker container up..."
    docker run -t -d -v $PINTOS_PATH:/pintos-kaist --name pintos_kaist pintos_kaist
    chmod +x pintos.sh
  fi
}

docker_install_check
if [[ $NOT_INSTALLED == 0 ]];
then
    echo "existing docker found"
    repo_unpack
fi
alias pintos=$PWD/pintos.sh
