#! /bin/sh
chown -R www-data:www-data /var/run/php7-fpm
chmod -R 777 /var/run/php7-fpm
/usr/local/openresty/bin/openresty