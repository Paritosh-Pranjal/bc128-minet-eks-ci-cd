FROM openjdk:17
WORKDIR /crypto-service
COPY target/*.jar app.jar
EXPOSE 9092
ENTRYPOINT [ "java","-jar","app.jar" ]