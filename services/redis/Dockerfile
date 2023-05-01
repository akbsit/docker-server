FROM redis:latest

RUN mkdir -p /usr/local/etc/redis

COPY redis.conf /usr/local/etc/redis/redis.conf

ARG REDIS_PASSWORD=secret
RUN sed -i "s/__REDIS_PASSWORD__/${REDIS_PASSWORD}/g" /usr/local/etc/redis/redis.conf

VOLUME /data

ARG CONTAINER_EXPOSE=6267
EXPOSE ${CONTAINER_EXPOSE}

CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
