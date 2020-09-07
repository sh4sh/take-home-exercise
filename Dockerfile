FROM maven:latest as build
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN mvn package

FROM openjdk:8-alpine

ENV JARFILE=person-0.0.1-SNAPSHOT.jar
WORKDIR /usr/src/myapp
COPY --from=build /usr/src/myapp/target/$JARFILE /usr/src/myapp/$JARFILE
EXPOSE 8080
ENTRYPOINT java -jar $JARFILE
