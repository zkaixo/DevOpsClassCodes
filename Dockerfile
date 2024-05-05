FROM tomcat:8.0
LABEL maintainer="AkshatGuptaa"
ADD ./target/addressbook.war /usr/local/tomcat/webapps/
EXPOSE 8084
CMD ["catalina.sh", "run"]

