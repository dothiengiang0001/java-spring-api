# AS <NAME> to name this stage as maven
FROM maven:3.6.3 AS builder
LABEL MAINTAINER="phuhoang.c2@gmail.com"

WORKDIR /usr/src/app
COPY . /usr/src/app

# Compile and package the application to an executable JAR
RUN mvn package 

# For Java 11, 
FROM adoptopenjdk/openjdk11:alpine-jre

ARG JAR_FILE=spring-boot-api-tutorial.jar

WORKDIR /opt/app

# Copy the spring-boot-api-tutorial.jar from the builder stage to the /opt/app directory of the current stage.
COPY --from=builder /usr/src/app/target/${JAR_FILE} /opt/app/

EXPOSE 8080

CMD ["java","-jar","spring-boot-api-tutorial.jar"]
