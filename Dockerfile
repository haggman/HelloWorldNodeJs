## A nice normal Dockerfile
# Don't forget to add AS build for the distroless
FROM node:24-bookworm-slim

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install --only=production

COPY . .
# Don't forget to comment the CMD out for distroless
CMD [ "npm", "start" ]

# Now let's turn it distroless
# FROM gcr.io/distroless/nodejs24-debian12

# WORKDIR /usr/src/app

# COPY --from=build /usr/src/app /usr/src/app

# CMD ["index.js"]
