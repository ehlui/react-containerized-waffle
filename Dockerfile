FROM node:18.9-alpine3.15 as react-builder
WORKDIR /app
COPY ./client/package.json .
RUN npm i
COPY ./client/ .
RUN npm run build

FROM nginx:1.23.1-alpine
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=react-builder /app/dist /usr/share/nginx/html