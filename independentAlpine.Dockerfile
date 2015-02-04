############################################################
# https://github.com/Kriegslustig/Docker-Meteorbase
# Dockerfile to build a Meteor app that is bundled using mup container with an internat DB
# Based on gliderlabs/alpine
############################################################

FROM gliderlabs/alpine
MAINTAINER Kriegslustig

RUN apk-install nodejs curl mup
RUN mup setup

EXPOSE 8080

ADD . /var/app
WORKDIR /var/app

CMD mup deploy