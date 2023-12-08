# Stage 1: Build Stage
FROM maven:3.8.4 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Runtime Stage
FROM tomcat:9.0
COPY --from=build /app/target/addressbook.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]
