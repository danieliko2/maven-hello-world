FROM maven:3.8.7-openjdk-18-slim as BUILDER
WORKDIR /app
COPY /myapp/ .

# create group and user
RUN groupadd -r appuser && useradd -g appuser appuser

# set ownership and permissions 
RUN chown -R appuser:appuser /app
USER appuser

# app version, default 1.0.0
ARG VERSION=1.0.0
RUN mvn -Duser.home=. versions:set -DnewVersion=${VERSION}
RUN mvn -Duser.home=. verify


FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=BUILDER /app/target/myapp* .
RUN adduser appuser
USER appuser
CMD java -jar myapp*