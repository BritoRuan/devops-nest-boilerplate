FROM node:20.14 AS build

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build
RUN npm i

FROM node:20.14-alpine3.20

WORKDIR /usr/src/app


COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/node_modules ./node_modules
COPY --from=build /usr/src/app/package.json ./package.json

EXPOSE 3000

CMD [ "node", "dist/main.js" ]