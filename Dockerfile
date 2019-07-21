FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN yarn install
COPY . .
CMD ["yarn", "start"]

# /app/build <-- all the stuff we need for prod

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

