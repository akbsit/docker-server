ARG CONTAINER_WORKDIR=/var/www
ARG DEBIAN_FRONTEND=noninteractive

FROM phpdockerio/php80-fpm:latest

WORKDIR "${CONTAINER_WORKDIR}"

RUN apt-get update \
    && apt-get -y --no-install-recommends install php8.0-mysql \
                                                  php8.0-sqlite3 \
                                                  php8.0-gd \
                                                  php8.0-imagick \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
