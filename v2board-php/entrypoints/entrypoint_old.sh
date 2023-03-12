#!/bin/sh
set -e

if [ ! -e "/www/v2board/artisan" ];then
    mkdir -p /www/v2board
    cd /www/v2board

    git clone https://github.com/v2board/v2board.git ./
    chmod -R 777 storage
fi


if [ ! -e "/www/v2board/.env" ];then
    cd /www/v2board
    chmod -R 777 storage
    composer install -vv
    php artisan v2board:install
fi

php-fpm