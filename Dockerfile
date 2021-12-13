FROM gradle:jdk16 as builder
WORKDIR /opt/cdc
COPY --chown=gradle:gradle . .
RUN gradle clean build --no-daemon --no-build-cache -x test

FROM openjdk:15-alpine
WORKDIR /app
COPY --from=builder /opt/cdc/cdc-core/build/libs/*.jar /app/cdc.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/cdc.jar"]
