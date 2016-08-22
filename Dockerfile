FROM php:7.0-fpm

RUN curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://caddyserver.com/download/build?os=linux&arch=amd64&features=git" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy \
 	&& chmod 0755 /usr/bin/caddy \
 	&& /usr/bin/caddy -version

EXPOSE 80 443 2015

VOLUME /srv
WORKDIR /srv

ADD Caddyfile /etc/Caddyfile

RUN chown -R www-data:www-data /srv

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile"]
