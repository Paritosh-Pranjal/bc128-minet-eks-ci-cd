FROM openjdk:17
WORKDIR /portfolio-service
COPY target/*.jar app.jar
EXPOSE 9093
ENTRYPOINT [ "java","-jar","app.jar" ]