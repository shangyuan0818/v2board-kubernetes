FROM composer:latest as deps
COPY ./v2board /app
RUN [ "composer","install","-v","--ignore-platform-req=ext-pcntl" ]

FROM nginx:1.19.1-alpine
COPY ./fastcgi_params /etc/nginx/fastcgi_params
COPY ./fastcgi-php.conf /etc/nginx/fastcgi-php.conf
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf

COPY --from=deps /app /www/v2board
RUN ["mv","/www/v2board/config","/www/v2board/config_example"]

COPY entrypoints /
CMD [ "sh","/entrypoint.sh" ]

EXPOSE 80
WORKDIR /www