FROM openjdk:17-jdk-slim

WORKDIR /app

ADD . /app

#instalar maven
RUN apt-get update && \
    apt-get install -y maven && \
    ./mvnw package && \
    mv target/*.jar app.jar && \
    apt-get remove -y maven && apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /root/.m2

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
