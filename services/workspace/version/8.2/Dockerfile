FROM phusion/baseimage:focal-1.0.0

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

RUN set -eux \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:ondrej/php \
    && echo 'DPkg::options { "--force-confdef"; };' >> /etc/apt/apt.conf \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --allow-downgrades --allow-remove-essential \
        --allow-change-held-packages \
        php8.2-cli \
        php8.2-common \
        php8.2-curl \
        php8.2-intl \
        php8.2-xml \
        php8.2-mbstring \
        php8.2-mysql \
        php8.2-pgsql \
        php8.2-sqlite \
        php8.2-sqlite3 \
        php8.2-zip \
        php8.2-bcmath \
        php8.2-memcached \
        php8.2-gd \
        php8.2-dev \
        pkg-config \
        libcurl4-openssl-dev \
        libedit-dev \
        libssl-dev \
        libxml2-dev \
        xz-utils \
        libsqlite3-dev \
        libpng-dev \
        rsync \
        sqlite3 \
        git \
        curl \
        vim \
        nano \
        tree \
        postgresql-client \
        make \
        wget \
        mc \
        ansible \
        unzip \
        mysql-client \
    && apt-get clean \
    && update-alternatives --set php /usr/bin/php8.2

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
