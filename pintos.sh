#!/bin/bash
SERVICE_NAME=pintos-manager
PINTOS_CONTAINER=pintos_kaist # Make this value to yours.

function docker_cmd() {
  docker exec -it $PINTOS_CONTAINER /bin/bash -c \
    "cd /pintos/src/$1 && make $2"
}

case "$1" in
  start)
    docker start $PINTOS_CONTAINER
    ;;
  stop)
    docker stop $PINTOS_CONTAINER
    ;;
  bash)
    docker exec -it $PINTOS_CONTAINER bash
    ;;
  help)
    echo "$SERVICE_NAME: usages:"
    echo ""
    echo "pintos <command> [<args>]"
    echo ""
    echo "commands:"
    echo ""
    echo "  start                     starts Pintos Docker container"
    echo "  stop                      stops Pintos Docker container"
    echo "  build <dir>               builds Pintos in <dir>"
    echo "  check <dir>               builds and checks Pintos in <dir>"
    echo "  grade <dir>               builds and grades Pintos in <dir>"
    echo "  clean <dir>               clean all build files in <dir>"
    echo "  exec <dir> \"<cmd>\"        executes Pintos with <cmd> in <dir>"
    echo "  help                      prints the document"
    echo ""
    echo "arguments:"
    echo ""
    echo "  dir                       relative path for directory from 'src/'"
    echo "  cmd                       Pintos command (pintos <cmd>)"
    echo ""
    ;;
  *)
    echo "$SERVICE_NAME: invalid command"
    echo ""
    echo "execute 'pintos help' to see the document"
    echo ""
    ;;
esac
