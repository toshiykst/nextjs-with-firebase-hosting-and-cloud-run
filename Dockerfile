# Build stage
FROM node:10-alpine AS builder

WORKDIR /build

COPY . .
RUN yarn && yarn build

# Exec stage
FROM node:10-alpine

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn --production

COPY --from=builder /build/.next .next
COPY --from=builder /build/server.js server.js

CMD ["yarn", "start:production"]