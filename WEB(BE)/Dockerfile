FROM node:16-alpine

RUN npm install -g yarn --force
WORKDIR /usr/app
COPY ./ /usr/app
RUN yarn

ENTRYPOINT ["/bin/sh", "-c" , "npx prisma migrate dev && yarn start"]

EXPOSE 8443