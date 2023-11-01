#!/bin/bash
ETC=/etc/shadowsocks
chmod 755 ./nat.sh

cp -rf nat.sh ${ETC}
cp -f list /etc/dnsmasq.d/ 
cp ./shadowsocks.json ${ETC}
cp ss-redir.service /etc/systemd/system/
systemctl daemon-reload
systemctl restart ss-redir.service
