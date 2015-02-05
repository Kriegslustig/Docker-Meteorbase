############################################################
# https://github.com/Kriegslustig/Docker-Meteorbase
#
# Based on gliderlabs/alpine
############################################################

FROM gliderlabs/alpine
MAINTAINER Kriegslustig

RUN apk-install python nodejs

ADD . /var/app
WORKDIR /var/app

VAR ROOT_URL='http://gallery.kriegslustig.me'
RUN npm install

EXPOSE 80

CMD MONGO_URL="mongodb://${MONGO_PORT_27017_TCP_ADDR}:${MONGO_PORT_27017_TCP_PORT}${MONGO_NAME}"; node main.js