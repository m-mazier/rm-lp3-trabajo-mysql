# Trabajo Práctico LP3 - Spring Boot con MySQL

Este proyecto es una adaptación del template de LP3 para utilizar persistencia de datos en **MySQL**.

> **Nota:** Se ha migrado la base de datos original (H2) a MySQL Server 8.

## Requisitos Previos

* **Java JDK 17** o superior.
* **MySQL Server 8.0** instalado y corriendo.
* **Maven** (incluido en el wrapper `./mvnw`).

## Configuración de Base de Datos

Antes de ejecutar la aplicación, es necesario crear la base de datos y el usuario en MySQL para que la conexión funcione.

1.  Ingrese a su consola de MySQL:
    ```bash
    sudo mysql
    ```

2.  Ejecute los siguientes comandos SQL para preparar el entorno:
    ```sql
    -- Crear la base de datos
    CREATE DATABASE lp3_db;

    -- Crear el usuario (coincide con application.properties)
    CREATE USER 'alumno'@'localhost' IDENTIFIED BY 'secreto';

    -- Dar permisos totales
    GRANT ALL PRIVILEGES ON lp3_db.* TO 'alumno'@'localhost';
    FLUSH PRIVILEGES;
    EXIT;
    ```

## Ejecución

1.  Clonar este repositorio.
2.  Abrir el proyecto en **IntelliJ IDEA** (o su IDE de preferencia).
3.  Permitir que Maven descargue las dependencias (Drivers, Spring, etc.).
4.  Ejecutar la clase principal: `src/main/java/py/edu/uc/lp3/Application.java`.

La aplicación iniciará en el puerto **8080**.
Las tablas (`persona`, `empresa`, etc.) se crearán automáticamente al iniciar.

## Pruebas de la API (Testing)

Para verificar que la aplicación guarda y recupera datos correctamente de MySQL, puede utilizar `curl` desde la terminal.

### 1. Insertar una Persona (POST)
```bash
# Nota: La barra final '/' es requerida por la configuración del controlador
curl -X POST http://localhost:8080/api/lp3/persona/ \
  -H 'Content-Type: application/json' \
  -d '{"nombre": "Test", "apellido": "User", "edad": 30, "numeroCedula": 12345, "sexo": "M"}'
```
### 2. Listar Personas (GET)
```bash
curl -s http://localhost:8080/api/lp3/persona/ | jq
# (Se recomienda tener instalado jq para visualizar mejor la respuesta JSON: sudo apt install jq)
```
