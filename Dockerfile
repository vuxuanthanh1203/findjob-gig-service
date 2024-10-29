# Stage 1: Builder
FROM node:22-alpine3.19 AS builder

WORKDIR /app
COPY package*.json ./
COPY tsconfig.json ./
COPY .npmrc ./
COPY src ./src

RUN npm install
RUN npm run build

# Stage 2: Runner
FROM node:22-alpine3.19

WORKDIR /app
RUN apk add --no-cache curl
COPY package*.json ./
COPY tsconfig.json ./
COPY .npmrc ./

RUN npm install -g pm2
RUN npm install --only=production

COPY --from=builder /app/build ./build

EXPOSE 4004

CMD ["npm", "run", "start"]
