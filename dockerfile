FROM openjdk:16-jdk-alphine
RUN addgroup -S spring && adduser -S spring -G spring
EXPOSE 8080

ENV JAVA_PROFILE prod
ARG DEPENDENCY=target
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META_INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT ["java" ,   "-Dspring.profiles.active=${JAVA_PROFILE}", \
            "-cp","app:app/lib/*","camt.se234.lab10.Lab10Application"]
