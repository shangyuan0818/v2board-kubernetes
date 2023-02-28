FROM nginx:1.19.1-alpine

COPY ./fastcgi_params /etc/nginx/fastcgi_params
COPY ./fastcgi-php.conf /etc/nginx/fastcgi-php.conf
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./site.conf /etc/nginx/conf.d/site.conf

EXPOSE 80
VOLUME [ "/www","/etc/nginx/","/var/log/nginx/" ]
WORKDIR /www