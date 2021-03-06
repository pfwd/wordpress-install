FROM php:7.2.18-apache as builder-base
RUN apt-get update                                      && \
    apt-get install -y git zip mysql-client             && \
    docker-php-ext-install mysqli                       && \
    a2enmod rewrite ssl                                 && \
    rm -rf /var/lib/apt/lists/*
ENV APACHE_DOCUMENT_ROOT /var/www/html/
ADD vhost.conf /etc/apache2/sites-available/000-default.conf

# Uncomment for SSL
# ADD vhost_ssl.conf /etc/apache2/sites-enabled/default-ssl.conf

RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /var/www/html/

EXPOSE 443