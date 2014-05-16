#!/bin/bash

set -eo pipefail

export ETCD_PORT=${ETCD_PORT:-4001}
export HOST_IP=${HOST_IP:-172.17.8.101}
export ETCD=$HOST_IP:4001

echo "[httpd] booting container. ETCD: $ETCD"

until confd -onetime -node $ETCD -config-file /etc/confd/conf.d/httpd-proxy.toml; do
  echo "[httpd] waiting for confd to refresh httpd-proxy.conf"
  sleep 5
done

# Run confd in the background to watch the upstream servers
confd -interval 10 -node $ETCD -config-file /etc/confd/conf.d/httpd-proxy.toml &
echo "[httpd] confd is listening for changes on etcd..."

# Start apche
echo "[httpd] starting apche service..."
apachectl start