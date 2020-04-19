FROM node:13-alpine

WORKDIR /bot
COPY package*.json /bot/

RUN npm i

COPY . /bot/
CMD node .
