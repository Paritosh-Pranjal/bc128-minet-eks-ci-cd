FROM openjdk:17
WORKDIR /wallet-service
COPY target/*.jar app.jar
EXPOSE 9094
ENTRYPOINT [ "java","-jar","app.jar" ]