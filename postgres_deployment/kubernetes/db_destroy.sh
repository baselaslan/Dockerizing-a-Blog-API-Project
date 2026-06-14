#!/bin/sh

echo "Destroying deployment and service"

microk8s kubectl delete service postgres-service
microk8s kubectl delete deployment postgres

echo "Destroying volume(s)..."

microk8s kubectl delete PersistentVolumeClaim postgres-pvc
microk8s kubectl delete PersistentVolume postgres-pv

echo "Destroying the database config and secret..."

microk8s kubectl delete secret postgres-secret
microk8s kubectl delete configmap postgres-config

