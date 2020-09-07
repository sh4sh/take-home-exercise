FROM openjdk:8-alpine
MAINTAINER Lee Faus <lee.faus@armory.io>

RUN mvn package
ENV JARFILE=person-0.0.1-SNAPSHOT.jar
COPY target/$JARFILE /usr/src/myapp/$JARFILE
WORKDIR /usr/src/myapp
EXPOSE 8080

ENTRYPOINT java -jar $JARFILE
