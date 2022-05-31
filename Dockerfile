FROM node:16-alpine 
#AS builder
WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

CMD npm run build



FROM nginx:latest

EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html 
#--from=builder