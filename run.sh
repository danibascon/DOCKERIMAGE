#!/bin/bash

set -e

NGINX_SERVER_NAME=${NGINX_SERVER_NAME:-""}
NGINX_DOCUMENTROOT=${NGINX_DOCUMENTROOT:-""}

if [[ $NGINX_DOCUMENTROOT = "" ]] ;then
        NGINX_DOCUMENTROOT="/var/www/html"
fi



echo "server {
        listen 80;
        listen [::]:80;

        root $NGINX_DOCUMENTROOT;
        index index.html index.php;
        server_name $NGINX_SERVER_NAME;
}" > /etc/nginx/sites-available/default


ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

if [[ ! -d $NGINX_DOCUMENTROOT ]] ;then
        mkdir -p $NGINX_DOCUMENTROOT
fi

cp /home/index.html $NGINX_DOCUMENTROOT
chown -R www-data:www-data $NGINX_DOCUMENTROOT

exec /usr/sbin/nginx -g 'daemon off;'
