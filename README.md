# docker-lemp-php72
nginx mariadb php72

## Configure in .env

```
web service port
other credential
```

## First Install
Main service (nginx, php-fpm, mariadb) and Tools (phpmyadmin, ftp) will start.

```
docker-compose -f docker-compose-production.yml up -d
docker-compose -f docker-compose-production.yml down
```

### FTP Access
```
Host: <yourdomain>
Protocol: FTP - File Transfer Protocol
Encryption: Use explicit FTP over TLS if available
Logon Type: Normal
User: <ftp_user>
Password: <ftp_pass>
```

## Release Production Web Site
Only main service (nginx, php-fpm, mariadb) will start.

```
docker-compose -f docker-compose-production.yml down
 
docker-compose -f docker-compose-production.yml up -d webserver

```

## Remove all docker container-image-network (Can not recover)
Need to remove all docker* ?

```
docker rm -f $(docker ps -a -q) && docker rmi $(docker images -q) && docker system prune
```