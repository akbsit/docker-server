FROM alpine

RUN apk add --no-cache beanstalkd

ARG CONTAINER_EXPOSE=11300
EXPOSE ${CONTAINER_EXPOSE}

ENTRYPOINT ["/usr/bin/beanstalkd"]
