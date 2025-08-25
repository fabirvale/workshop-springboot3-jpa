# Etapa 1: Build com Maven
FROM maven:3.9.4-eclipse-temurin-17 AS build

WORKDIR /app

# Copiar pom.xml e baixar dependências
COPY pom.xml .
COPY .mvn .mvn
COPY mvnw .
RUN chmod +x mvnw
RUN mvn dependency:go-offline

# Copiar o código-fonte
COPY src ./src

# Build do projeto (skip tests)
RUN ./mvnw clean package -DskipTests

# Etapa 2: Imagem leve com JDK apenas
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copiar o JAR compilado
COPY --from=build /app/target/*.jar app.jar

# Expor porta padrão do Spring Boot
EXPOSE 8080

# Comando para rodar o Spring Boot
ENTRYPOINT ["java","-jar","app.jar"]