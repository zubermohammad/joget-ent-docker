# joget-ent-docker
Joget Enterprise Docker 

# Building the image
1. Clone the repository 
2. cd to cloned repository
2. Get the latest build of joget enterprise using below commands
```
wget https://www.joget.org/downloads/enterprise/joget-enterprise-linux-7.0.15.tar.gz && \
tar zxvf joget-enterprise-linux-7.0.15.tar.gz && \
rm joget-enterprise-linux-7.0.15.tar.gz && \
mv joget-enterprise-linux-7.0.15 joget

```
3. Build docker image
` docker build -t joget-ent .`

4. Run mySql container with below command
```
docker run -d -p 3307:3306 -e MYSQL_ROOT_PASSWORD=admin123 -e MYSQL_DATABASE=jwdb -e MYSQL_USER=jwdb -e MYSQL_PASSWORD=jwdb --mount source=jogetmysql,target=/var/lib/mysql mysql:5.7
```
5. Run joget with below replacing the DB_HOST value with MySQL host IP.
```
docker run -d -p 9090:8080 -e DB_HOST=172.20.223.109 -e DB_PORT=3307 -e DB_NAME=jwdb -e DB_USERNAME=jwdb -e DB_PASSWORD=jwdb --mount source=jogetentdata,target=/opt/joget/wflow joget-ent
```
