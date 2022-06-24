#!/bin/bash 
DIR="$( cd "$( dirname "$0"  )" && pwd )"
cd "${DIR}"

apt update && apt install expect

docker-compose stop && docker-compose rm -f
sudo rm -rf ./elasticsearch
mkdir -p ./elasticsearch
docker-compose up -d
sleep 5s
cp -f ./elasticsearch-base.yml ./elasticsearch/config/elasticsearch.yml
docker-compose restart
sleep 5s
./setpwd.sh
docker-compose exec elasticsearch bin/elasticsearch-plugin install https://ghproxy.com/https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.1.1/elasticsearch-analysis-ik-7.1.1.zip
docker-compose restart