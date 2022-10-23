FROM jamesdbloom/docker-java6-maven
WORKDIR /home/app
RUN git clone https://github.com/AlexOgorodnikov/Java-app.git /home/app
RUN mvn package

#moving war file
WORKDIR /usr/local/tomcat/webapps
RUN find /home/app/target -name "*.war" -exec cp -t /usr/local/tomcat/webapps {} +