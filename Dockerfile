# --- ETAPA 1: CONSTRUCCIÓN (BUILD) ---
# Usamos una imagen que ya trae Maven instalado oficial
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Copiamos solo el pom.xml para descargar librerías (aprovecha el caché de Docker)
COPY pom.xml .

# Descargamos las dependencias usando el Maven de la imagen
RUN mvn dependency:go-offline

# Copiamos el código fuente
COPY src ./src

# Compilamos el proyecto y generamos el .jar
RUN mvn clean package -DskipTests

# --- ETAPA 2: EJECUCIÓN (RUN) ---
# Usamos una imagen limpia y liviana solo con Java para correr la app
FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# Copiamos el .jar generado en la Etapa 1 a esta nueva etapa
# El *.jar busca cualquier archivo que termine en .jar en la carpeta target
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

# Ejecutamos el archivo que renombramos como app.jar
CMD ["java", "-jar", "app.jar"]
