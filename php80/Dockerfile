FROM php:8.0.9-fpm-alpine

COPY ./extensions /tmp/extensions
WORKDIR /tmp/extensions
ENV PHP_EXTENSIONS pdo_mysql,mysqli,mbstring,gd,curl,opcache
RUN chmod +x install.sh \
    && sh install.sh \
    && rm -rf /tmp/extensions

ADD ./extensions/install-php-extensions  /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions

RUN apk --no-cache add tzdata \
    && cp "/usr/share/zoneinfo/Asia/Shanghai" /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone


# Fix: https://github.com/docker-library/php/issues/240
RUN apk add gnu-libiconv=1.15-r3 libstdc++ --no-cache
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php


# Install composer and change it's cache home
RUN curl -o /usr/bin/composer https://mirrors.aliyun.com/composer/composer.phar \
    && chmod +x /usr/bin/composer
ENV COMPOSER_HOME=/tmp/composer

# php image's www-data user uid & gid are 82, change them to 1000 (primary user)
RUN apk --no-cache add shadow && usermod -u 1000 www-data && groupmod -g 1000 www-data


WORKDIR /www