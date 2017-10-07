# Apache2 webserver for Wordpress
FROM debian:stretch

LABEL maintainer="Peter Fisher"

ENV DOC_ROOT /var/www/wordpress-install

RUN apt-get update -y \
    && \
    apt-get install -y \
        apache2 \
        libapache2-mod-php \
        php7.0 \
        php7.0-mysql \
        php7.0-xml \
        php7.0-curl \
    && \
    a2enmod rewrite \
    && \
    apt-get autoremove -y --purge \
    && \
    rm -rf /var/lib/apt/lists/*


ADD config/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf

WORKDIR ${DOC_ROOT}

COPY site .

EXPOSE 80

CMD apachectl -D FOREGROUND


