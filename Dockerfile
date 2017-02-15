FROM php:7.1.1-fpm

RUN curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://caddyserver.com/download/build?os=linux&arch=amd64&features=git" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy \
 	&& chmod 0755 /usr/bin/caddy \
 	&& /usr/bin/caddy -version \
 	&& docker-php-ext-install mbstring pdo pdo_mysql

EXPOSE 80 443 2015

WORKDIR /srv/app

ADD Caddyfile /etc/Caddyfile

RUN mkdir -p /srv/app \
    && chown -R www-data:www-data /srv/app

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile"]
