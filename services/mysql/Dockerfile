ARG MYSQL_VERSION=8.0
ARG TZ=UTC
ARG CONTAINER_WORKDIR=/var/www
ARG EXPOSE=3306

FROM mysql:${MYSQL_VERSION}

WORKDIR "${CONTAINER_WORKDIR}"

# set timezone
ENV TZ ${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && chown -R mysql:root /var/lib/mysql/

CMD ['mysqld']

EXPOSE ${EXPOSE}
