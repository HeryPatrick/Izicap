
# First stage: complete build environment
FROM maven:3.6.0-jdk-11-slim AS builder

# Create directory
RUN mkdir -p /home/app/src

# Add pom.xml and source code
COPY src /home/app/src
COPY pom.xml /home/app

# Package jar
RUN mvn -f /home/app/pom.xml clean package

# Second stage: minimal runtime environment
FROM openjdk:11-jre-slim

# Copy jar from the first stage
COPY --from=builder /home/app/target/demo-token-1.0-SNAPSHOT.jar /usr/local/lib/demo-token-1.0-SNAPSHOT.jar

EXPOSE 80

CMD ["java", "-jar", "/usr/local/lib/demo-token-1.0-SNAPSHOT.jar"]
