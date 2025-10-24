FROM eclipse-temurin:17-jdk-jammy AS build
WORKDIR /workspace
COPY . .
RUN ./gradlew bootJar --no-daemon

FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
COPY --from=build /workspace/build/libs/memory-leak-demo-1.0.0.jar app.jar

#ENV JAVA_OPTS="-XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0 -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp"
EXPOSE 8080
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
