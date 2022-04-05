ARG CONTAINER_WORKDIR=/var/www
ARG DEBIAN_FRONTEND=noninteractive

FROM phpdockerio/php74-fpm:latest

WORKDIR "${CONTAINER_WORKDIR}"

RUN apt-get update \
    && apt-get -y --no-install-recommends install php7.4-mysql \
                                                  php7.4-sqlite3 \
                                                  php7.4-gd \
                                                  php7.4-imagick \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
