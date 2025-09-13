# Stage 1: Build
FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app

# Installa Maven
RUN apk add --no-cache maven

# Copia il pom.xml e scarica le dipendenze
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copia il codice sorgente e builda
COPY src ./src
RUN mvn clean package -DskipTests -B

# Stage 2: Runtime
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copia il jar buildato dallo stage precedente
COPY --from=build /app/target/hello-cloud-0.0.1-SNAPSHOT.jar app.jar

# Esponi la porta 8080
EXPOSE 8080

# Comando per eseguire il jar
ENTRYPOINT ["java","-jar","app.jar"]