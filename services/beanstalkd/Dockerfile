FROM alpine

RUN apk add --no-cache beanstalkd

ARG EXPOSE=11300
EXPOSE ${EXPOSE}

ENTRYPOINT ["/usr/bin/beanstalkd"]
