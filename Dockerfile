FROM maven:3.9.1-eclipse-temurin-17-alpine as builder
WORKDIR /placeholder
COPY . .
RUN mvn clean verify

FROM openjdk:17-alpine
COPY --from=builder /placeholder/target/*.jar /placeholder/placeholder.jar
EXPOSE 8080
CMD ["java", "-jar", "/placeholder/placeholder.jar"]