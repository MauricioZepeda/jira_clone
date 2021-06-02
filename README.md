## Clon de jira + Docker + Kubernetes

Clon de jira dockerizado y levantado en kubernetes en GCP

Antes de empezar, debe tener instalado el [SDK de Google Cloud](https://cloud.google.com/sdk/docs/install).

Demo: [Clon de Jira](http://34.136.210.254/)

## Crear y subir las imagenes

La primero que hay que hacer es clonar el proyecto

```sh
git clone sdsd
```

Luego entramos a la carpeta del proyecto
```sh
cd jira-clone
```

Puede usar los scripts que se encuentran en la carpeta script
```sh
cd scripts
```

Para construir las imagenes del backend y frontend hay que ejecutar el archivo build-and-push.sh
```sh
sh build-and-push.sh
```

Para registrar los secretos utilice el archivo create-secrets.sh  
> Nota: Las variables de entorno utilizadas estan en este archivo
```sh
sh create-secret.sh
```


## Backend
Desde la carpeta raiz del proyecto dirigirse a la carpeta api
```sh
cd api
```

Construimos la imagen del backend con el siguiente comando
> Nota:  [Docker](https://www.docker.com/) es necesario para poder construir la imagen
```sh
docker build -t gcr.io/curso-kubernetes-314521/jira-back .
```

Ahora se sube la imagen recien creada a GCP
```sh
docker push gcr.io/curso-kubernetes-314521/jira-back
```

Para levantar el deployment de backend
```sh
kubectl apply -f deployment.yml
```

Luego lo exponemos con el service
```sh
kubectl apply -f service.yml
```


## Frontend
Y se hace lo mismo para el frontend
Nos situamos en la carpeta raiz y luego nos vamos a la carpeta client
```sh
cd .. && cd client
```
 
Construimos la imagen del frontend 
```sh
docker build -t gcr.io/curso-kubernetes-314521/jira-front .
```

Ahora envia la imagen recien creada a GCP
```sh
docker push gcr.io/curso-kubernetes-314521/jira-front
```

Para levantar el deployment del frontend
```sh
kubectl apply -f deployment.yml
```

Luego lo exponemos con el service
```sh
kubectl apply -f service.yml
```

Con esto ya debería estar levantado el proyecto.
 