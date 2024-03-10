#!/bin/bash

cp list /etc/dnsmasq.d/
sh nat.sh

mkdir /etc/shadowsocks -p
cp shadowsocks.json /etc/shadowsocks/
cp ss-redir /etc/init.d/
chmod 755 /etc/init.d/ss-redir
/etc/init.d/ss-redir enable
/etc/init.d/ss-redir start
