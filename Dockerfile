FROM maven:3.8.7-openjdk-18-slim as BUILDER

# create group and user

WORKDIR /app

# set ownership and permissions 

# copy directory to container
COPY /myapp/ .



ARG VERSION=1.0.0

RUN mvn versions:set -DnewVersion=${VERSION}
RUN mvn verify

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=BUILDER /app/target/myapp* .
CMD java -jar myapp*