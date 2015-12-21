FROM debian:jessie

MAINTAINER Paul Redmond <paulrredmond@gmail.com>

RUN apt-get update \
    && apt-get -y install software-properties-common --no-install-recommends \
    && add-apt-repository -y ppa:ondrej/php5-5.6 \
    && apt-get -y --force-yes install \
      vim \
      php5-cli \
      php5 \
      php5-mysql \
      php5-mongo \
      php5-memcached \
      mysql-client \
      --no-install-recommends \
    && rm -rf /var/www/html \
    && mkdir -p /var/www/html \
    && chown -R www-data:www-data /var/www/html \
    && mv /etc/apache2/apache2.conf /etc/apache2/apache2.conf.dist \
    && rm /etc/apache2/conf-enabled/* \
    && rm /etc/apache2/sites-enabled/* \
    # Apache + PHP requires preforking Apache for best results
    && a2dismod mpm_event \
    && a2enmod mpm_prefork \
    && rm -r /var/lib/apt/lists/*


COPY apache2.conf /etc/apache2/apache2.conf

WORKDIR /var/www/html

EXPOSE 80
CMD ["apache2", "-D", "FOREGROUND"]
