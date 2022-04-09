ARG MYSQL_VERSION=8.0
FROM mysql:${MYSQL_VERSION}

ARG CONTAINER_WORKDIR=/var/www
WORKDIR "${CONTAINER_WORKDIR}"

# set timezone
ARG TZ=UTC
ENV TZ ${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && chown -R mysql:root /var/lib/mysql/

CMD ['mysqld']

ARG EXPOSE=3306
EXPOSE ${EXPOSE}
