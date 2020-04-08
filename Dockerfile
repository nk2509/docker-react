FROM node:alpine as for-build

WORKDIR '/app' 

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=for-build /app/build /usr/share/nginx/html


