############################################################
# https://github.com/Kriegslustig/Docker-Meteorbase
# Dockerfile to build a self-contained Meteor app container
# Based on centos:centos6
############################################################

FROM centos:centos6
MAINTAINER Kriegslustig

RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN yum install -y npm tar

RUN curl https://install.meteor.com/ | sh

EXPOSE 8080

ADD . /var/app
WORKDIR /var/app

CMD meteor -p 80 --production