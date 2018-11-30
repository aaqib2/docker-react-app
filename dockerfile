FROM node:alpine as builder
WORKDIR '/home'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /home/build /usr/share/nginx/html
