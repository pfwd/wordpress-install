FROM composer:1.9 as dev-vendor
COPY composer.json composer.json
RUN composer install                    \
    --ignore-platform-reqs              \
    --no-interaction                    \
    --prefer-dist                    && \
    composer clearcache

FROM php:7.1-apache as builder-base
RUN apt-get update                                      && \
    docker-php-ext-install mysqli                       && \
    a2enmod rewrite                                     && \
    rm -rf /var/lib/apt/lists/*
ENV APACHE_DOCUMENT_ROOT /var/www/html/
ADD vhost.conf /etc/apache2/sites-available/000-default.conf

FROM builder-base as development
COPY --from=dev-vendor /app/ /var/www/html/
