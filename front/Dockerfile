FROM node:12.18.3-alpine

ENV ROOT /app

WORKDIR $ROOT

RUN apk update && npm install -g @vue/cli
COPY package.json .
RUN npm install