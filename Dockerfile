FROM maven:3.8.7-openjdk-18-slim as BUILDER
WORKDIR /app
COPY /myapp/ .
RUN mvn versions:set -DnewVersion=$(cat .version)
# RUN mvn verify

# FROM openjdk:8-jre-alpine
# WORKDIR /app
# COPY --from=BUILDER /app/target/myapp* .
# CMD java -jar myapp*