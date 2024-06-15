FROM maven AS build

COPY src ./src

COPY pom.xml .

RUN mvn clean package -DskipTests

FROM amazoncorretto:21-alpine-jdk

COPY --from=build /target .

CMD ["java", "-jar", "./demo-0.0.1-SNAPSHOT.jar"]