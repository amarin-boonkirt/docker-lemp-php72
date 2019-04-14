#!/bin/sh

export $(egrep -v '^#' .env | xargs)

sed -i "s/PUBLIC_HOST_NAME/$PUBLIC_HOST_NAME/g" $PWD/docker/nginx/conf.d.prepare/default.conf
sed -i "s/PUBLIC_HOST_NAME/$PUBLIC_HOST_NAME/g" $PWD/docker/nginx/conf.d/default.conf

docker-compose -f docker-compose-prepare.yml up

sudo docker run -it --rm \
-v $PWD/storage/etc/letsencrypt:/etc/letsencrypt \
-v $PWD/storage/var/lib/letsencrypt:/var/lib/letsencrypt \
-v $PWD/public:/data/letsencrypt \
-v $PWD/storage/var/log/letsencrypt:/var/log/letsencrypt \
certbot/certbot \
certonly --webroot \
--email "$ADMIN_EMAIL" --agree-tos --no-eff-email \
--webroot-path=/data/letsencrypt \
-d "$PUBLIC_HOST_NAME" -d "www.$PUBLIC_HOST_NAME"

sudo openssl dhparam -out $PWD/storage/dhparam-2048.pem 2048

docker-compose -f docker-compose-prepare.yml down
 
docker-compose -f docker-compose-production.yml up -d nginx