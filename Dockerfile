FROM node:alpine

LABEL maintainer "CVEO Team, Wuhan University"

RUN apk --update --no-progress add bash git openssh

WORKDIR /website

COPY website/package.json package.json

RUN \
    npm install hexo-cli -g \
    && npm install

# VOLUME ["/Hexo/source", "/Hexo/scripts", "/Hexo/themes", "/Hexo/scaffolds", "/root"]

EXPOSE 4000

# COPY utils/docker-entrypoint.sh docker-entrypoint.sh

# ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["/bin/sh"]