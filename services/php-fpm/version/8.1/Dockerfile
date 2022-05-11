FROM phpdockerio/php:8.1-fpm

ARG CONTAINER_WORKDIR=/var/www
WORKDIR "${CONTAINER_WORKDIR}"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -y --no-install-recommends install php8.1-mysql \
                                                  php8.1-sqlite3 \
                                                  php8.1-gd \
                                                  php8.1-imagick \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
