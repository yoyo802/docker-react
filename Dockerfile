#Build Phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Run Phase
FROM nginx
#copy something from the builder phase
COPY --from=0 /app/build /usr/share/nginx/html
