FROM tomcat
COPY /var/lib/jenkins/workspace/pipeline2/target/addressbook.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]
