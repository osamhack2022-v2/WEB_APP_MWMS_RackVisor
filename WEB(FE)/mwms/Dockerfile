FROM node:16 as builder

RUN mkdir /usr/src/app
WORKDIR /usr/src/app
RUN npm install -g yarn --force
ENV PATH /usr/src/app/node_modules/.bin:$PATH
COPY package.json /usr/src/app/package.json
RUN yarn

# 소스를 작업폴더로 복사하고 빌드
COPY . /usr/src/app
RUN npm run build



FROM nginx:1.23.2-alpine
# nginx의 기본 설정을 삭제하고 앱에서 설정한 파일을 복사
RUN rm -rf /etc/nginx/conf.d
COPY conf /etc/nginx

# 위에서 생성한 앱의 빌드산출물을 nginx의 샘플 앱이 사용하던 폴더로 이동
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

# 80포트 오픈하고 nginx 실행
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]