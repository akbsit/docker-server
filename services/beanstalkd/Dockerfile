FROM alpine

ARG EXPOSE=11300

RUN apk add --no-cache beanstalkd

EXPOSE ${EXPOSE}

ENTRYPOINT ["/usr/bin/beanstalkd"]
