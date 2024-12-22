FROM node:lts-alpine

EXPOSE 3000
ENV TZ=Asia/Shanghai

WORKDIR /app
RUN apk add git
RUN git clone https://github.com/baobinhday/cursor-api.git . && \
    git pull origin hg
ADD utils.js src/
RUN yarn config set registry https://registry.npmmirror.com/
RUN yarn

RUN sed -i 's/\/v1\/chat\/completions/\/proxy\/v1\/chat\/completions/g' src/index.js

CMD ["npm", "run", "start"]
