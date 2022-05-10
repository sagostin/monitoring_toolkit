#/bin/bash

# RUN AS ROOT?

# TODO install based on distro
# install package repos 
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-1+ubuntu20.04_all.deb
dpkg -i zabbix-release_6.0-1+ubuntu20.04_all.deb
apt update

# install zabbix
apt install zabbix-proxy-sqlite3 zabbix-sql-scripts

# TODO copy sql data to /tmp/zabbix.db
cat /usr/share/doc/zabbix-sql-scripts/sqlite3/proxy.sql | sqlite3 zabbix.db

# TODO edit configuration OR have it copy from somewhere else?
# for SQL lite, the DBName=/tmp/zabbix.db needs to match the db path.

systemctl start zabbix-proxy
systemctl enable zabbix-proxy

#TODO make beter...
#include installing Grafana Synthetic Monitoring?
