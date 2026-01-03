#!/bin/bash

set -e

echo "Настройка Docker окружения Minikube"
eval $(minikube docker-env)

echo "Сборка образа внутри Minikube"
cd scaletestapp
docker build -t scaletestapp:local .
cd ..

echo "Проверка образа"
docker images | grep scaletestapp
echo "Done"