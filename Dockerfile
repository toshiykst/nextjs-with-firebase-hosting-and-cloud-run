# Use the official lightweight Node.js 12 image.
# https://hub.docker.com/_/node
FROM node:10-slim

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY . .
# RUN npm install && npm run build
RUN yarn && yarn build

# start app
CMD [ "yarn", "start:production" ]
