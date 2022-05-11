FROM phusion/baseimage:0.11

ARG CONTAINER_WORKDIR=/var/www
WORKDIR "${CONTAINER_WORKDIR}"

RUN locale-gen en_US.UTF-8

ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV TERM xterm

###########################################################################
# PHP
###########################################################################

RUN apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ondrej/php
RUN echo 'DPkg::options { "--force-confdef"; };' >> /etc/apt/apt.conf
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --allow-downgrades --allow-remove-essential \
        --allow-change-held-packages \
        php8.1-cli \
        php8.1-common \
        php8.1-curl \
        php8.1-intl \
        php8.1-xml \
        php8.1-mbstring \
        php8.1-mysql \
        php8.1-pgsql \
        php8.1-sqlite \
        php8.1-sqlite3 \
        php8.1-zip \
        php8.1-bcmath \
        php8.1-memcached \
        php8.1-gd \
        php8.1-dev \
        pkg-config \
        libcurl4-openssl-dev \
        libedit-dev \
        libssl-dev \
        libxml2-dev \
        xz-utils \
        libsqlite3-dev \
        libpng-dev \
        sqlite3 \
        git \
        curl \
        vim \
        nano \
        postgresql-client \
        make \
        wget \
        mc \
        ansible \
        unzip \
        mysql-client \
    && apt-get clean \
    && update-alternatives --set php /usr/bin/php8.1

###########################################################################
# Composer
###########################################################################

RUN curl -s http://getcomposer.org/installer | php && \
    echo "export PATH=${PATH}:/var/www/vendor/bin" >> ~/.bashrc && \
    mv composer.phar /usr/local/bin/composer

###########################################################################
# Node / NPM / NVM
###########################################################################

ARG INSTALL_NODE=false
ARG NODE_VERSION=node

ENV NVM_DIR /home/.nvm

RUN if [ ${INSTALL_NODE} = true ]; then \
    mkdir -p $NVM_DIR && \
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash \
        && . $NVM_DIR/nvm.sh \
        && nvm install ${NODE_VERSION} \
        && nvm use ${NODE_VERSION} \
        && nvm alias ${NODE_VERSION} \
        && ln -s `npm bin --global` /home/.node-bin \
;fi

RUN if [ ${INSTALL_NODE} = true ]; then \
    echo "" >> ~/.bashrc && \
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc && \
    echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.bashrc \
;fi

RUN if [ ${INSTALL_NODE} = true ]; then \
    echo "" >> ~/.bashrc && \
    echo 'export NVM_DIR="/home/.nvm"' >> ~/.bashrc && \
    echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.bashrc \
;fi

ENV PATH $PATH:/home/.node-bin

RUN if [ ${INSTALL_NODE} = true ]; then \
    find $NVM_DIR -type f -name node -exec ln -s {} /usr/local/bin/node \; && \
    NODE_MODS_DIR="$NVM_DIR/versions/node/$(node -v)/lib/node_modules" && \
    ln -s $NODE_MODS_DIR/npm/bin/npm-cli.js /usr/local/bin/npm \
;fi

###########################################################################
# Bashrc
###########################################################################

RUN . ~/.bashrc

###########################################################################
# Crontab
###########################################################################

COPY ./crontab /etc/cron.d
RUN chmod -R 644 /etc/cron.d
