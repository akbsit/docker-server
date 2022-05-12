ARG PHP_VERSION
FROM php:${PHP_VERSION}-alpine

ARG PHP_VERSION

ARG CHANGE_SOURCE=false
RUN if [ ${CHANGE_SOURCE} = true ]; then \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
;fi

RUN apk --update add wget \
  curl \
  git \
  build-base \
  libmcrypt-dev \
  libxml2-dev \
  pcre-dev \
  zlib-dev \
  autoconf \
  cyrus-sasl-dev \
  libgsasl-dev \
  oniguruma-dev \
  libressl \
  libressl-dev \
  supervisor \
  procps

RUN pecl channel-update pecl.php.net; \
    docker-php-ext-install mysqli mbstring pdo pdo_mysql xml pcntl; \
    if [ $(php -r "echo PHP_MAJOR_VERSION;") = "8" ] && [ $(php -r "echo PHP_MINOR_VERSION;") = "1" ]; then \
      php -m | grep -q 'tokenizer'; \
    else \
      docker-php-ext-install tokenizer; \
    fi

ARG INSTALL_BCMATH=false
RUN if [ ${INSTALL_BCMATH} = true ]; then \
  docker-php-ext-install bcmath \
  ;fi

ARG INSTALL_PHPREDIS=false
RUN if [ ${INSTALL_PHPREDIS} = true ]; then \
    if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
      printf "\n" | pecl install -o -f redis-4.3.0; \
    else \
      printf "\n" | pecl install -o -f redis; \
    fi; \
    rm -rf /tmp/pear; \
    docker-php-ext-enable redis; \
fi

RUN rm /var/cache/apk/* \
  && mkdir -p /var/www

COPY supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]

RUN php -v | head -n 1 | grep -q "PHP ${PHP_VERSION}."

WORKDIR /etc/supervisor/conf.d/
