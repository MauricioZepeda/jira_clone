#!/bin/bash 
GREEN='\033[0;32m'
NO_COLOR='\033[0m'

# Activar service account para la conexion al cloud sql
echo "${GREEN} ******** Activando service account ******** ${NO_COLOR}"
cd ..
kubectl create secret generic cloudsql-instance-credentials --from-file=credentials.json=../services-accounts/sa-cloud-sql.json

# Crea el secreto 
echo "${GREEN} ******** Creando el secreto en GCP ******** ${NO_COLOR}"
kubectl create secret generic cloudsql-db-credentials /
      --from-literal=DB_HOST=curso-kubernetes-314521:us-central1:jiraclone   /
      --from-literal=DB_USERNAME=postgres  /
      --from-literal=DB_PASSWORD=fAMMxFk6e21292t2  /
      --from-literal=DB_DATABASE=jira-db  /
      --from-literal=JWT_SECRET=secret1313