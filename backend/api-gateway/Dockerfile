FROM openjdk:17
WORKDIR /api-gateway
COPY target/*.jar app.jar
EXPOSE 9191
ENTRYPOINT [ "java","-jar","app.jar" ]