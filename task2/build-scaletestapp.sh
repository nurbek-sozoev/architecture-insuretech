#!/bin/bash

set -e

echo "Настройка docker окружения minikube"
eval $(minikube docker-env)

echo "Сборка образа внутри minikube"
cd scaletestapp
docker build -t scaletestapp:local .
cd ..

echo "Проверка образа"
docker images | grep scaletestapp

