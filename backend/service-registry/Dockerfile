FROM openjdk:17
WORKDIR /service-registry
COPY target/*.jar app.jar
EXPOSE 8761
ENTRYPOINT [ "java","-jar","app.jar" ]