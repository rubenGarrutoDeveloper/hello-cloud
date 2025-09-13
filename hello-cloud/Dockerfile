# Usa un'immagine base con Java 17
FROM eclipse-temurin:17-jdk-alpine

# Imposta la working directory
WORKDIR /app

# Copia il jar buildato nel container
COPY target/hello-cloud-0.0.1-SNAPSHOT.jar app.jar

# Esponi la porta 8080
EXPOSE 8080

# Comando per eseguire il jar
ENTRYPOINT ["java","-jar","app.jar"]