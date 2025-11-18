FROM debian:latest

RUN apt update && apt upgrade && apt install -y mariadb-server

RUN chown -R mysql:mysql /var/lib/mysql

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.

COPY init.sql /etc/mysql/init.sql

RUN mkdir /run/mysqld

USER mysql

CMD ["mysqld"]