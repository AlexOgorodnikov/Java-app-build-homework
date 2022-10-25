FROM alexogorodnikov/mydockerrepo:builder

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /home/app
RUN git clone https://github.com/AlexOgorodnikov/OldJavaApp.git

WORKDIR /home/app/OldJavaApp
RUN mvn package

FROM mongo:latest

FROM tomcat:9.0.8-jre8-alpine

WORKDIR /usr/local/tomcat/webapps/
RUN cp /home/app/OldJavaApp/target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/