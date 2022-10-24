  GNU nano 6.2                                                     Dockerfile                                                              
FROM alexogorodnikov/mydockerrepo:builder

WORKDIR /home/app
RUN git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git

WORKDIR /home/app/App42PaaS-Java-MySQL-Sample/WebContent/
RUN echo -e"\
 app42.paas.db.username = dbuser\n \
 app42.paas.db.port = 5432\n \
 app42.paas.db.password = 123456\n \
 app42.paas.db.ip = loclhost\n \
 app42.paas.db.name = db\n \
" > Config.properties

WORKDIR /home/app/App42PaaS-Java-MySQL-Sample
RUN mvn package

WORKDIR /usr/local/tomcat/webapps/
RUN cp /home/app/App42PaaS-Java-MySQL-Sample/target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/