# Dockerfile
FROM node:16

WORKDIR /app

COPY package.json ./
COPY package-lock.json ./
RUN npm install

COPY . ./

EXPOSE 173
CMD ["npm", "start"]
