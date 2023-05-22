#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

function run() {
  environment="production"

  while getopts 'e:' flag; do
    case "${flag}" in
      e) a_flag='true' ;;    
    esac
  done

  case $environment in
    production)
      echo "Running "
      docker-compose  -f "$SCRIPTPATH/docker-compose.yaml" up --build -d 
      ;;
    development)
      echo "Development environment is not yet supported"
      ;;
    *)
      echo "No environment found: $environment"
      ;;
  esac

}

function stop() {
  echo "Stopping server"
  docker-compose down
}

case $1 in
  run)
    run
    ;;
  stop)
    stop
    ;;
  *)
    echo "No command found: $1"
    ;;
esac
