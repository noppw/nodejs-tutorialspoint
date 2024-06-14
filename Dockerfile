FROM node:14-alpine AS builder

WORKDIR /usr/src/app

COPY package.json .

RUN npm install

FROM node:14-alpine

WORKDIR /app

COPY . .

COPY --from=builder /usr/src/app/node_modules ./node_modules

ENV TZ=Asia/Bangkok

EXPOSE 8081

CMD ["node", "index.js"]