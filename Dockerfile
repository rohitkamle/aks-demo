FROM maven AS MAVEN_BASE
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn clean package

FROM adoptopenjdk/openjdk11:alpine-jre
WORKDIR /opt/app
COPY --from=MAVEN_BASE /tmp/target/. .
ENTRYPOINT ["java","-jar","spring-boot-web.jar"]
