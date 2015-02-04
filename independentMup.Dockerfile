############################################################
# https://github.com/Kriegslustig/Docker-Meteorbase
# Dockerfile to build a Meteor app that is bundled using mup container with an internat DB
# Based on centos:centos6
############################################################

FROM centos:centos6
MAINTAINER Kriegslustig

RUN yum install -y epel-release
RUN yum install -y npm

RUN npm install -g mup

EXPOSE 8080

ADD . /var/app
RUN mup setup
WORKDIR /var/app

CMD mup deploy