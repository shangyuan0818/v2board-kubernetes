FROM nginx:1.19.1-alpine

COPY ./fastcgi_params /etc/nginx/fastcgi_params
COPY ./fastcgi-php.conf /etc/nginx/fastcgi-php.conf
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf

# CMD [ "rm","-rf","/etc/nginx/conf.d/default.conf" ]

EXPOSE 80
WORKDIR /www