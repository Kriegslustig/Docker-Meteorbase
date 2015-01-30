FROM centos:centos6
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN yum install -y npm git wget tar
RUN curl https://install.meteor.com/ | sh
RUN mkdir /var/node
RUN wget -qO /var/node/kriegslustig.me.tar.gz https://github.com/Kriegslustig/kriegslustig.me/archive/0.0.1.tar.gz
RUN tar zxf /var/node/kriegslustig.me.tar.gz
RUN meteor run /var/node/kriegslustig.me-0.0.1 -p 8080
EXPOSE 8080