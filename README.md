# lab01-Iac-09_04

Estimados estudiantes, realizar la siguiente actividad:

Tenemos código de una aplicación web. Se compone por un archivo HTML que tiene como contenido: WEB01

Quiero poder publicar esta web, especificamente una sola copia como primera instancia

TAREA:
- Desplegar dos web, mostrar Web01, y Web02 como contenido
- Los puertos deben estar configurados en 4000 y 4001
- Gestionar carpetas para orden
- Hacer uso de Gitflow/Conventional Commits

## Instrucciones para el despliegue de Web01 y Web02

1. Primera terminal


* Movernos a la carpeta web dentro de src

```
cd src/web
```

* Construir el contenedor docker 

```
docker build -t web .
```

* Exponer el puerto indicado para web01 (4000)

```
docker run --name web01 -p 4000:80 web
```

2. Segunda terminal


* Movernos a la carpeta web2 dentro de src

```
cd src/web2
```

* Construir el contenedor docker 

```
docker build -t web2 .
```

* Exponer el puerto indicado para web02 (4001)

```
docker run --name web02 -p 4001:80 web2
```