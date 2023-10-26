# Build the base image
FROM php:7.4-apache as builder-base

RUN apt-get update                                      && \
    apt-get install -y git zip                          && \
    docker-php-ext-install mysqli pdo pdo_mysql         && \
    a2enmod rewrite ssl                                 && \
    docker-php-ext-enable pdo_mysql                     && \
    rm -rf /var/lib/apt/lists/*

ENV APACHE_DOCUMENT_ROOT /var/www/html/
ADD vhost.conf /etc/apache2/sites-available/000-default.conf

# Uncomment for SSL
# ADD vhost_ssl.conf /etc/apache2/sites-enabled/default-ssl.conf

# Handle composer packages in compser stage
FROM composer/composer:2.6.5 as composer
ARG APP_ENV
COPY ./composer.json .
COPY ./composer.lock .
RUN composer install

# RUN chmod u+x /tmp/install-composer-packages.sh && /tmp/install-composer-packages.sh

# Build the final webserver
FROM builder-base as webserver
ARG APP_ENV
COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY --chown=www-data:www-data  . /var/www/html
COPY --chown=www-data:www-data --from=composer /app/vendor /var/www/html/vendor 
COPY ./infra/docker/scripts/docker-entrypoint.sh /

EXPOSE 443

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]