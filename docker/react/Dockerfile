FROM node:18.14.2

WORKDIR /app

RUN npm ci

RUN npm run build

ENV NODE_ENV production

EXPOSE 3000

CMD [ "npx", "serve", "build" ]