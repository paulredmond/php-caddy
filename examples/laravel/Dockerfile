FROM docker-php-caddy

COPY src /srv/app
COPY laravel.ini /usr/local/etc/php/conf.d/laravel.ini
RUN chown -R www-data:www-data /srv/app
RUN usermod -u 1000 www-data

CMD ["--conf", "/srv/app/Caddyfile"]