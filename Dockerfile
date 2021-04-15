# we are extending everything from tomcat:8.0 image ...
FROM tomcat:9.0.8-jre8
MAINTAINER your_name
# COPY path-to-your-application-war path-to-webapps-in-docker-tomcat
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
ADD http://192.168.1.140:8081/repository/maven-releases/org/terekhov/spring-app/1.0/spring-app-1.0.war /usr/local/tomcat/webapps/
EXPOSE 8080