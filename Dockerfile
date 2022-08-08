FROM openjdk:11-ea
# RUN adduser --system --group app
RUN groupadd --gid 10001 app && \
    useradd --gid 10001 --uid 10001 --home-dir /app app
USER app:app
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]  