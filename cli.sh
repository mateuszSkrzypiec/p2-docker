#!/bin/bash
set -a
source .env
set +a

if [ "$1" = "build" ]; then
  if [ "$2" = "--start" ]; then
    echo 'Building and starting...'
    docker-compose up -d --build
    # shellcheck disable=SC2164
    mkdir -p p2
    # shellcheck disable=SC2164
    cd p2
    if [ -z "$(ls -A /path/to/dir)" ]; then
       git clone ${BACKEND_GITHUB_REPO} .
    fi
    # shellcheck disable=SC2164
    cd ./mutagen
    rm -rf mutagen.yml.lock
    mutagen sync terminate p2MutagenConfiguration
    mutagen project start
  else
    echo 'Building...'
  fi
elif [ "$1" == 'start' ]; then
  echo 'Starting...'
  docker-compose up -d
  # shellcheck disable=SC2164
  cd ./mutagen
  rm -rf mutagen.yml.lock
  mutagen sync terminate p2MutagenConfiguration
  mutagen project start
elif [ "$1" == "enable:xdebug" ]; then
  echo "XDEBUG enabled"
elif [ "$1" == "disable:xdebug" ]; then
  echo "XDEBUG disabled"
else
  echo 'Invalid argument'
fi
