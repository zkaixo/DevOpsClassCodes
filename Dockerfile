FROM tomcat:9.0
COPY --from=build /app/target/addressbook.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]
