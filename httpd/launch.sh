#!/bin/bash

set -eo pipefail

export HOST_IP=${HOST_IP:-172.17.8.101}
export ETCD=$HOST_IP:4001

echo "[httpd] booting container. ETCD: $ETCD"

until confd -onetime -node $ETCD -config-file /etc/confd/conf.d/httpd-proxy.toml; do
  echo "[httpd] waiting for confd to refresh httpd-proxy.conf"
  sleep 5
done

# Start apche
echo "[httpd] starting apache service..."
apachectl start