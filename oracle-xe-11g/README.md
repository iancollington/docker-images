oracle-xe-11g
============================

Oracle Express Edition 11g Release 2 on Ubuntu 14.04.1 LTS

This **Dockerfile** is based on [wnameless/oracle-xe-11g](https://registry.hub.docker.com/u/wnameless/oracle-xe-11g/). It adds functionality to allow SQL scripts to be executed when creating a new container to create a database.

More information on how to use this image can be found in the blog post: http://www.iancollington.com/managing-oracle-schema-versions-docker/

### Installation
```
git clone https://github.com/iancollington/docker-images.git
cd docker-images/oracle-xe-11g
docker build -t iancollington/oracle-xe-11g .
```

Run with 22, 8080 and 1521 ports opened:
```
docker run -d -p 49160:22 -p 49161:1521 -p 49162:8080 iancollington/oracle-xe-11g
```

Connect database with following setting:
```
hostname: localhost
port: 49161
sid: xe
username: system
password: oracle
```

Password for SYS & SYSTEM
```
oracle
```

To execute a script to, for example, create a new schema, simply add a mount to your host filesystem to the location of the script
```
docker run -d -p 49161:1521 -p 49162:8080 -v /path/to/dbscripts:/dbscripts iancollington/oracle-xe-11g runscript /dbscripts/create_schema.sql
```

Login to the web interface at http://localhost:46162/apex

```
username: system
password: oracle
```
