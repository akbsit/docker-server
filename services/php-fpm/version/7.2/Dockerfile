ARG CONTAINER_WORKDIR=/var/www
ARG DEBIAN_FRONTEND=noninteractive

FROM phpdockerio/php72-fpm:latest

WORKDIR "${CONTAINER_WORKDIR}"

RUN apt-get update \
    && apt-get -y --no-install-recommends install php7.2-mysql \
                                                  php7.2-sqlite3 \
                                                  php7.2-gd \
                                                  php7.2-imagick \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
