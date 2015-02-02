############################################################
# https://github.com/Kriegslustig/Docker-Meteorbase
# Dockerfile to build a Meteor app container
# Based on gilderlabs/alpine
############################################################

FROM gilderlabs/alpine
MAINTAINER Kriegslustig

RUN apk-install nodejs
RUN apk-install curl

RUN curl https://install.meteor.com/ | sh

EXPOSE 8080

ADD . /var/app
WORKDIR /var/app
CMD meteor -p 8080 --production