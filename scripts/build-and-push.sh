#!/bin/bash 
GREEN='\033[0;32m'
NO_COLOR='\033[0m'

# Activar service account para subir imagenes al container registry
echo "${GREEN} ******** Activando service account ******** ${NO_COLOR}"
gcloud auth activate-service-account container-registry@curso-kubernetes-314521.iam.gserviceaccount.com  --key-file=../services-accounts/sa-container-registry.json --project=curso-kubernetes-314521 


# Construye y sube la imagen del backend a GCP
cd ../api
echo "${GREEN} ******** Construyendo imagen jira-back ******** ${NO_COLOR}"
docker build -t gcr.io/curso-kubernetes-314521/jira-back . 

echo "${GREEN} ******** Subiendo imagen jira-back a GCP ******** ${NO_COLOR}"
docker push gcr.io/curso-kubernetes-314521/jira-back


# Construye y sube la imagen del front a GCP
cd ../client
echo "${GREEN} ******** Construyendo imagen jira-front ******** ${NO_COLOR}"
docker build -t gcr.io/curso-kubernetes-314521/jira-front .

echo "${GREEN} ******** Subiendo imagen jira-back a GCP ******** ${NO_COLOR}"
docker push gcr.io/curso-kubernetes-314521/jira-front 
cd ../scripts