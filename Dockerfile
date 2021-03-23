FROM openjdk:8u282-jre-slim-buster
RUN apt-get update && apt-get install wget -y
RUN cd /opt/ && \
    wget https://www.joget.org/downloads/enterprise/joget-enterprise-linux-7.0.15.tar.gz && \
    tar zxvf joget-enterprise-linux-7.0.15.tar.gz && \
    rm joget-enterprise-linux-7.0.15.tar.gz && \
    mv joget-enterprise-linux-7.0.15 joget

RUN mkdir /opt/joget/wflowbak && mv /opt/joget/wflow/* /opt/joget/wflowbak

COPY ./run.sh /opt/joget

VOLUME /opt/joget/wflow
WORKDIR /opt/joget
EXPOSE 8080
ENTRYPOINT /opt/joget/run.sh
CMD [""]
