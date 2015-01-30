FROM centos:centos6
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN yum install -y npm git wget
RUN curl https://install.meteor.com/ | sh
RUN wget -qO kriegslustig.me.tar.gz https://github.com/Kriegslustig/kriegslustig.me/archive/0.0.1.tar.gz
RUN tar zxf kriegslustig.me.tar.gz
RUN cd kriegslustig.me-0.0.1
RUN meteor -p 8080
EXPOSE 8080