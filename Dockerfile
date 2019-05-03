FROM alpine/git:latest
MAINTAINER xzxiaoshan <365384722@qq.com>

WORKDIR /gitcode/

RUN set -x && \
    git clone https://github.com/thx/rap2-dolores.git && \
    wget --no-check-certificate https://raw.githubusercontent.com/xzxiaoshan/files/master/find-sed-e.sh -O rap2-dolores/find-sed-e.sh && \
    chmod +x rap2-dolores/find-sed-e.sh

FROM node:8.11.1-alpine	

WORKDIR /app/rap2-dolores/

COPY --from=0 /gitcode/rap2-dolores/ .

RUN set -x && \
    npm install && \
    npm install -g serve && \
    \cp -rf ./src/config/config.prod.js ./src/config/config.dev.js && \
    npm run build

EXPOSE 8081

CMD ./find-sed-e.sh 'find /app/rap2-dolores/build -type f' 'http://rap2api.taobao.org' 'http://rap2api.taobao.org' $SERVE_URL && serve -s ./build -p 8081
