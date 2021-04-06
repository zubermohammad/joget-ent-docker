FROM openjdk:8u282-jre-slim-buster
RUN apt-get update && apt-get install wget unzip -y
RUN cd /opt/ && \
    wget https://www.joget.org/downloads/enterprise/joget-enterprise-linux-7.0.16.tar.gz && \
    tar zxvf joget-enterprise-linux-7.0.16.tar.gz && \
    rm joget-enterprise-linux-7.0.16.tar.gz && \
    mv joget-enterprise-linux-7.0.16 joget && \
    unzip /opt/joget/apache-tomcat-8.5.58/webapps/jw.war -d /opt/joget/apache-tomcat-8.5.58/webapps/jw && \
    rm /opt/joget/apache-tomcat-8.5.58/webapps/jw.war


COPY ./Owasp.CsrfGuard.properties /opt/joget/apache-tomcat-8.5.58/webapps/jw/WEB-INF/classes/Owasp.CsrfGuard.properties

RUN mkdir /opt/joget/wflowbak && mv -u /opt/joget/wflow/* /opt/joget/wflowbak

COPY ./run.sh /opt/joget

VOLUME /opt/joget/wflow
WORKDIR /opt/joget
EXPOSE 8080
ENTRYPOINT /opt/joget/run.sh
CMD [""]
