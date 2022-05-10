FROM node:16-alpine
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

FROM ngnix
EXPOSE 80
COPY --from=0 /app/build /usr/share/ngnix/html