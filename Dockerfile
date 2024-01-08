#https://netix.dl.sourceforge.net/project/jboss/JBoss/JBoss-5.1.0.GA/jboss-5.1.0.GA-jdk6.zip
#docker run -d --name centos quay.io/generic/centos7

FROM quay.io/generic/centos7

RUN yum install unzip -y \
       yum install java-1.6.0-openjdk.x86_64 -y 

COPY ./jboss-5.1.0.GA.zip /tmp

RUN unzip /tmp/jboss-5.1.0.GA.zip -d /opt

WORKDIR "/opt/jboss-5.1.0.GA"

#RUN /opt/jboss-5.1.0.GA/bin/add-user.sh admin admin --silent

COPY ./AVCP-Riscossione.war /opt/jboss-5.1.0.GA/server/default/deploy/

EXPOSE 8080

CMD ["/opt/jboss-5.1.0.GA/bin/run.sh","-b", "0.0.0.0"]




