FROM node:alpine

LABEL maintainer "CVEO Team, Wuhan University"

WORKDIR /website

COPY website/package.json package.json

RUN apk --update --no-progress --no-cache add \
    bash autoconf automake nasm git openssh build-base alpine-sdk \
    libpng libpng-dev libjpeg libjpeg-turbo-dev zlib zlib-dev \
    && npm install hexo-cli gulp-cli -g --registry=https://registry.npm.taobao.org \
    && npm install --registry=https://registry.npm.taobao.org \
    && apk del autoconf automake nasm build-base alpine-sdk libpng-dev libjpeg-turbo-dev zlib-dev \
    && rm -rf /var/cache/apk/* /tmp/*

# VOLUME ["/Hexo/source", "/Hexo/scripts", "/Hexo/themes", "/Hexo/scaffolds", "/root"]

EXPOSE 4000

# COPY utils/docker-entrypoint.sh docker-entrypoint.sh

# ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["/bin/sh"]