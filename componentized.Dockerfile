############################################################
# https://github.com/Kriegslustig/Docker-Meteorbase
#
# Based on centos:7
############################################################

FROM centos:7
MAINTAINER Kriegslustig

RUN yum install -y epel-release make
RUN yum install -y npm

ADD ./.demeteorized /var/app
WORKDIR /var/app

ENV ROOT_URL='http://gallery.kriegslustig.me'
ENV PORT=80

RUN npm install

EXPOSE 80

CMD export MONGO_URL="mongodb://${MONGO_PORT_27017_TCP_ADDR}:${MONGO_PORT_27017_TCP_PORT}${MONGO_NAME}"; node main.js