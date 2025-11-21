# Trabajo Práctico LP3 - Spring Boot con Docker

Este proyecto es una aplicación Spring Boot con base de datos MySQL, orquestada completamente con Docker Compose.

> **Nota:** Gracias a Docker, no es necesario instalar Java ni MySQL localmente.

## Requisitos Previos

* **Docker** y **Docker Compose** instalados y corriendo.

## Configuración Inicial

1.  Clonar el repositorio.
2. Crear el archivo de variables de entorno ```.env``` basado en la plantilla:
    ```bash
    cp env.sample .env
    ```
   (El archivo ```.env``` ya viene configurado con credenciales por defecto funcionales).

## Ejecución

Para descargar dependencias, compilar el código, levantar la base de datos e iniciar la aplicación, ejecute un solo comando:
```bash
docker compose up --build
```

* **API Spring Boot:** Disponible en el puerto **8081**.
* **MySQL:** Disponible en el puerto **3307**.

## Pruebas (Testing)

Una vez que la aplicación inicie (verifique que diga ```Started Application``` en la consola), puede probarla desde otra terminal:

### 1. Insertar una Persona (POST)
```bash
curl -X POST http://localhost:8081/api/lp3/persona/ \
  -H 'Content-Type: application/json' \
  -d '{"nombre": "Docker", "apellido": "User", "edad": 20, "numeroCedula": 123, "sexo": "M"}'
```
### 2. Listar Personas (GET)
```bash
curl -s http://localhost:8081/api/lp3/persona/ | jq
```
## Detener

Para apagar y limpiar los contenedores:
```bash
docker compose down
```