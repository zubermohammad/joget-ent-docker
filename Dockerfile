FROM openjdk:8u282-jre-slim-buster

COPY ./joget /opt/joget

COPY ./run.sh /opt/joget

VOLUME /opt/joget/wflow
WORKDIR /opt/joget
EXPOSE 8080
ENTRYPOINT /opt/joget/run.sh
CMD [""]
