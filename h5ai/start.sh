#!/bin/sh
php-fpm -y /etc/php5/php-fpm.conf
nginx -g 'daemon off;'
