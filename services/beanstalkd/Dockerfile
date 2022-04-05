ARG EXPOSE=11300

FROM alpine

RUN apk add --no-cache beanstalkd

EXPOSE ${EXPOSE}

ENTRYPOINT ["/usr/bin/beanstalkd"]
