# First stage: complete build environment
FROM maven:3.5.0-jdk-8-alpine AS builder

# add pom.xml and source code
COPY src /home/app/src
COPY pom.xml /home/app

# package jar
RUN mvn -f /home/app/pom.xml clean package

# Second stage: minimal runtime environment
FROM openjdk:8-jre-alpine


# copy jar from the first stage
COPY --from=builder /home/app/target/demo-token-1.0-SNAPSHOT.jar /usr/local/lib/demo-token-1.0-SNAPSHOT.jar

EXPOSE 80

CMD ["java", "-jar", "/usr/local/lib/demo-token-1.0-SNAPSHOT.jar"]
