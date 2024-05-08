FROM openjdk:17
WORKDIR /user-service
COPY target/*.jar app.jar
EXPOSE 9091
ENTRYPOINT [ "java","-jar","app.jar" ]