FROM node:alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/

RUN apk add --update \
    python3 \
    python3-dev \
    py-pip \
    build-base

RUN npm install

COPY laravel-echo-server.json /usr/src/app/laravel-echo-server.json

ARG CONTAINER_EXPOSE=3000
EXPOSE ${CONTAINER_EXPOSE}

CMD ["npm", "start", "--force"]
