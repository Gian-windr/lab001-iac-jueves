```
# Despliegue

Vamos a utilizar terraform.

Lo primero es habilitar los proveedores, desde la carpeta donde se encuentra terraform

```

cd iac

```
```

terraform init

```

Se utiliza el provider docker (kreuzwerker/docker),
lo que permite crear redes y contenedores desde Terraform,
aunque esto compite directamente con Docker Compose.

Deben documentar como crear los ambientes y seleccionar los ambientes

Se están usando workspaces como ambientes (localhost y dev),
lo cual funciona en este contexto,
pero no es la mejor práctica cuando el proyecto crece.

```

terraform workspace list
terraform workspace select default
terraform apply

terraform workspace select dev
terraform apply

```

terraform.tfvars:
```

web_port={
localhost = 4001
dev = 5001
}
api_port={
localhost = 4002
dev = 5002
}
db_port={
localhost = 4003
dev = 5003
}

```

Cada ambiente levanta 3 contenedores:
- web (nginx sirviendo frontend)
- api (node backend)
- db (postgresql)

Todos conectados en una red:
app-net-<workspace>

Esto permite comunicación por hostname:
api-default-01
db-default-01


Verificación:

```

docker ps

```
```

docker network inspect app-net-default

```
```

docker exec -it web-default-01 sh
curl [http://api-default-01:3000](http://api-default-01:3000)

```
```

docker exec -it api-default-01 sh
psql -h db-default-01 -U admin -d appdb

```

Destruir ambiente:

```

terraform destroy


```
