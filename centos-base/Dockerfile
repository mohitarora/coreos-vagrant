# Use the centos image available in Docker Index
FROM centos

# Update all the packages
RUN yum -y update

# Install some packages
RUN yum -y install which

RUN yum -y install git

RUN yum -y install wget

# Download confd
RUN wget -O confd_0.3.0_linux_amd64.tar.gz https://github.com/kelseyhightower/confd/releases/download/v0.3.0/confd_0.3.0_linux_amd64.tar.gz

# Extract confd
RUN tar -zxvf confd_0.3.0_linux_amd64.tar.gz

# Add confd to path
RUN mv confd /usr/local/bin/confd

# Create confd directories
RUN mkdir -p /etc/confd/conf.d

RUN mkdir -p /etc/confd/templates