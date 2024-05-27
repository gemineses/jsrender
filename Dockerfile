FROM node:19.5.0-alpine

RUN addgroup app && adduser -S -G app app

USER app

WORKDIR /app

COPY --chown=app:node package*.json .

RUN npm install

COPY --chown=node:node . .

EXPOSE 8080

CMD [ "node", "server.js" ]