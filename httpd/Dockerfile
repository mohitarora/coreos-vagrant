FROM mohitarora/base_v1.0

RUN yum -y update
RUN yum -y install python-setuptools
RUN easy_install supervisor
RUN mkdir -p /var/log/supervisor
RUN yum -y install which
RUN yum -y install git
RUN yum -y install httpd

# Download confd
RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v0.3.0/confd_0.3.0_linux_amd64.tar.gz | /bin/tar xz
RUN mv confd /usr/local/bin/confd

# Create directories
RUN mkdir -p /etc/confd/{conf.d,templates}

# Add source teamplate
ADD ./httpd-vhost.conf.tmpl /etc/confd/templates/httpd-vhost.conf.tmpl

# Add template resource config
ADD ./httpd-vhost.toml /etc/confd/conf.d/httpd-vhost.toml

ADD supervisord.conf /etc/supervisord.conf

EXPOSE 22 80 

CMD ["/usr/bin/supervisord"]