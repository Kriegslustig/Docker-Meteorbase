FROM centos:centos6
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN yum install -y npm git wget
RUN wget https://install.meteor.com/ | sh
EXPOSE 8080