#!/bin/sh
echo "Creating database config and secret..."

microk8s kubectl apply -f ./postgres-config.yml
microk8s kubectl apply -f ./secret.yml

echo "Creating volume(s)..."

sudo mkdir -p /opt/postgre/data
microk8s kubectl apply -f ./persistent-volume.yml
microk8s kubectl apply -f ./persistent-volume-claim.yml

echo "Creating postgres deployment and service..."

microk8s kubectl apply -f ./postgres-deployment.yml
microk8s kubectl apply -f ./postgres-service.yml






