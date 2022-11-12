FROM node:16-alpine

RUN npm install -g yarn --force
WORKDIR /usr/app
COPY ./ /usr/app
RUN yarn

CMD ["yarn", "start"]

EXPOSE 8443