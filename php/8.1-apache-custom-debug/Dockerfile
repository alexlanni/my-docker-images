FROM php:8.1-apache

RUN pecl install -o -f redis

RUN apt-get update \
 && apt-get install -y git zlib1g-dev libzip-dev \
 && docker-php-ext-install zip pdo pdo_mysql mysqli \
 && docker-php-ext-enable redis \
 && a2enmod rewrite \
 && sed -i 's!/var/www/html!/var/www/public!g' /etc/apache2/sites-available/000-default.conf \
 && mv /var/www/html /var/www/public \
 && curl -sS https://getcomposer.org/installer \
  | php -- --install-dir=/usr/local/bin --filename=composer \
 && echo "AllowEncodedSlashes On" >> /etc/apache2/apache2.conf

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini

RUN docker-php-ext-install sockets

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

ADD custom.php.ini /usr/local/etc/php/conf.d/custom.php.ini

# User management: we'll use the same UID/GID og the host machine
RUN groupadd -g 1000 webapp
RUN useradd -u 1000 -g webapp  webapp

ENV APACHE_RUN_USER webapp
ENV APACHE_RUN_GROUP webapp


WORKDIR /var/www
