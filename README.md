https://www.humankode.com/ssl/how-to-set-up-free-ssl-certificates-from-lets-encrypt-using-docker-and-nginx

# docker-lemp-php72
nginx mariadb php72

## Configure in .env

```
web service port
other credential
```

## Build
Main service (nginx, php-fpm, mariadb) and Tools (phpmyadmin, ftp) will start.

```
sh build.sh

```

```

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
 
docker-compose -f docker-compose-production.yml up -d nginx

```

## Remove all docker container-image-network (Can not recover)
Need to remove all docker* ?

```
docker rm -f $(docker ps -a -q) && docker rmi $(docker images -q) && docker system prune

```