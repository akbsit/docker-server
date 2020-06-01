FROM phpdockerio/php72-fpm:latest

ARG CONTAINER_WORKDIR=/var/www
WORKDIR "${CONTAINER_WORKDIR}"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -y --no-install-recommends install php7.2-mysql \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*