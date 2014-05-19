FROM centos

RUN yum -y update

RUN yum -y install which

RUN yum -y install git

RUN yum -y install wget

RUN wget -O confd_0.3.0_linux_amd64.tar.gz https://github.com/kelseyhightower/confd/releases/download/v0.3.0/confd_0.3.0_linux_amd64.tar.gz

RUN tar -zxvf confd_0.3.0_linux_amd64.tar.gz

RUN mv confd /usr/local/bin/confd

# Create directories
RUN mkdir -p /etc/confd/conf.d

RUN mkdir -p /etc/confd/templates