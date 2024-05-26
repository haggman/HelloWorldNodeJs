FROM node:16-bookworm-slim

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install --only=production

COPY . .

CMD [ "npm", "start" ]