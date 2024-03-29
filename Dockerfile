# Build the base image
FROM php:8.2-apache as builder-base

ARG APP_ENV="DEV"
ENV APP_ENV=$APP_ENV

ARG BOOT_APACHE=0
ENV BOOT_APACHE=$BOOT_APACHE

RUN apt-get update                                      && \
    apt-get install -y git zip                          && \
    docker-php-ext-install mysqli pdo pdo_mysql         && \
    a2enmod rewrite ssl                                 && \
    docker-php-ext-enable pdo_mysql                     && \
    rm -rf /var/lib/apt/lists/*

ENV APACHE_DOCUMENT_ROOT /var/www/html/
ADD vhost.conf /etc/apache2/sites-available/000-default.conf


# Handle composer packages in compser stage
FROM composer/composer:2.6.5 as composer
ARG APP_ENV
COPY ./composer.json .
COPY ./composer.lock .
RUN composer install

# Build the final webserver
FROM builder-base as webserver
ARG APP_ENV
COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY --chown=www-data:www-data  . /var/www/html
COPY --chown=www-data:www-data --from=composer /app/content/vendor /var/www/html/content/vendor 
COPY ./infra/docker/scripts/docker-entrypoint.sh /

EXPOSE 443

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]