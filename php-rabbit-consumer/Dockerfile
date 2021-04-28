FROM php:7.4-cli

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN apt-get update 
RUN apt-get install -y git zip 

RUN docker-php-ext-install sockets


RUN apt-get autoremove -y

# User management: we'll use the same UID/GID og the host machine
RUN groupadd -g 1000 webapp
RUN useradd -u 1000 -g webapp  webapp

USER webapp

WORKDIR /usr/src

CMD ["php", "./index.php"]
