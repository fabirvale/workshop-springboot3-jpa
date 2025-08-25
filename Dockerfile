# Use Java 17 como base
FROM eclipse-temurin:17-jdk-alpine

# Diretório do app
WORKDIR /app

# Copia arquivos necessários para build
COPY mvnw .
COPY pom.xml .
COPY .mvn .mvn
COPY src ./src

# Dá permissão de execução para o mvnw
RUN chmod +x mvnw

# Compila o projeto (skip tests para agilizar)
RUN ./mvnw clean package -DskipTests

# Copia o JAR compilado
COPY target/*.jar app.jar

# Expõe a porta padrão do Spring Boot
EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java","-jar","app.jar"]
