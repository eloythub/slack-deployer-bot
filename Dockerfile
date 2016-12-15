FROM node:6.9.1

MAINTAINER Mahan Hazrati<eng.mahan.hazrati@gmail.com>

RUN ln -sf /usr/share/zoneinfo/Asia/Bangkok /etc/localtime

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install  build-essential \
                        libmysqlclient-dev \
                        libssl-dev \
                        curl

RUN npm install -g coffee-script yarn

ENV TMP_DIR=/tmp
ENV PROD_DIR=/opt/app
ENV BIN_DIR=$PROD_DIR/node_modules/.bin

RUN mkdir -p $TMP_DIR
COPY yarn.lock $TMP_DIR/yarn.lock
COPY package.json $TMP_DIR/package.json
RUN cd $TMP_DIR && yarn

# Make symlink from /tmp/nodemodules to production's directory
RUN mkdir -p $PROD_DIR && cd $PROD_DIR && ln -s /tmp/node_modules

COPY . $PROD_DIR/
WORKDIR $PROD_DIR

ENV HUBOT_PORT 8080
ENV HUBOT_ADAPTER slack

EXPOSE $HUBOT_PORT

ENTRYPOINT $BIN_DIR/hubot
