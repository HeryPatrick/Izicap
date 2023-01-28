# First stage: complete build environment
FROM maven:3.5.0-jdk-8-alpine AS builder

# add pom.xml and source code
ADD ./pom.xml pom.xml
ADD ./src src/

# package jar
RUN mvn clean package

# Second stage: minimal runtime environment
FROM openjdk:8-jre-alpine

# copy jar from the first stage
COPY --from=builder target/demo-token-1.0-SNAPSHOT.jar demo-token-1.0-SNAPSHOT.jar

EXPOSE 80

CMD ["java", "-jar", "demo-token-1.0-SNAPSHOT.jar"]
