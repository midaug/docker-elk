#!/bin/bash 
DIR="$( cd "$( dirname "$0"  )" && pwd )"
cd "${DIR}"

docker-compose stop && docker-compose rm -f
sudo rm -rf ./elasticsearch/data
mkdir -p ./elasticsearch/data
docker-compose up -d
sleep 5s
./setpwd.sh
docker-compose restart