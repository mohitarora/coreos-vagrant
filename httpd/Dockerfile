FROM mohitarora/centos-base

RUN yum -y install httpd

EXPOSE 22 80  

# Add source teamplate
ADD ./httpd-proxy.conf.tmpl /etc/confd/templates/httpd-proxy.conf.tmpl

# Add template resource config
ADD ./httpd-proxy.toml /etc/confd/conf.d/httpd-proxy.toml

ADD ./launch.sh /opt/launch.sh

RUN chmod +x /opt/launch.sh

# Run the launch script
CMD /opt/launch.sh