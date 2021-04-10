# we are extending everything from tomcat:8.0 image ...
FROM tomcat:8.0
MAINTAINER your_name
# COPY path-to-your-application-war path-to-webapps-in-docker-tomcat
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
ADD http://192.168.1.140:8081/repository/maven-releases/org/terekhov/spring/4.3/spring-4.3.jar /usr/local/tomcat/webapps/
EXPOSE 8080