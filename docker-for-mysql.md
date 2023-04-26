# How-To-Run-Mysql-Container
## pull mysql-docker image and run as a docker container
```sh
# sudo docker pyll mysql
# sudo docker run --name docker-mysql --restart=always -d -p 36306:3306 -e TZ="Asia/Shanghai" -e MYSQL_ROOT_PASSWORD=sysadmin mysql:latest
```
## my.cnf
```sh
# sed -i '5a sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' /etc/my.cnf
```
## low version navicat 
```sh
# mysql -uroot -psysadmin
# mysql> select host,user,plugin authentication_string from mysql.user;
# mysql> alter user 'root'@'%' identified with mysql_native_password by 'sysadmin';
# mysql> alter user 'root'@'localhost' identified with mysql_native_password by 'sysadmin';
```
## restart mysql container
```sh
# docker restart docker-mysql 
```
