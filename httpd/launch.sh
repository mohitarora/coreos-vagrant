#!/bin/bash

set -eo pipefail

export HOST_IP=${HOST_IP:-172.17.8.101}
export ETCD=$HOST_IP:4001

echo "[httpd] booting container. ETCD: $ETCD"

until confd -onetime -node $ETCD -config-file /etc/confd/conf.d/httpd-proxy.toml > /var/log/confd.log 2>&1; do
  echo "[httpd] waiting for confd to refresh httpd-proxy.conf"
  sleep 5
done

# Run confd in the background to watch the upstream servers
nohup confd -interval 120 -quiet -node $ETCD -config-file /etc/confd/conf.d/httpd-proxy.toml > /var/log/confd.log 2>&1 &
echo "[httpd] confd is listening for changes on etcd..."