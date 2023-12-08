FROM tomcat:9.0
COPY /var/lib/jenkins/workspace/pipeline2/target/addressbook.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]
