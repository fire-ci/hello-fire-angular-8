FROM node:12.13.0 AS base

# Dockerize is needed to sync containers startup
ENV DOCKERIZE_VERSION v0.6.0
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN mkdir -p ~/app

WORKDIR ~/app

COPY package.json .
COPY package-lock.json .

FROM base AS dependencies

RUN npm install

FROM dependencies AS runtime

COPY . .

RUN npm run test:ci

RUN npm run build
