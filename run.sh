#/bin/bash

mv /opt/joget/wflowbak/* /opt/joget/wflow

cd /opt/joget/
./apache-ant-1.7.1/bin/ant create-profile -Ddb.host=${DB_HOST} -Ddb.port=${DB_PORT} -Ddb.user=${DB_USERNAME} -Ddb.password=${DB_PASSWORD} -Ddb.name=${DB_NAME} -Dprofile.name=default

# start tomcat
./apache-tomcat-8.5.58/bin/catalina.sh run

