#!/bin/bash
chmod 755 ./S23ss-redir
chmod 755 ./nat.sh

cp -rf nat.sh /jffs/scripts/
cp -f /jffs/scripts/nat/list /jffs/configs/dnsmasq.conf.add
cp ./shadowsocks.json /opt/etc/shadowsocks.json
cp ./S23ss-redir /opt/etc/init.d/S23ss-redir
line=`cat /jffs/scripts/services-start | grep /jffs/scripts/nat.sh | wc -l`
if [ ${line} -lt 1 ]; then
echo "sleep 30; /jffs/scripts/nat.sh" >> /jffs/scripts/services-start
fi
/jffs/scripts/nat.sh;
/opt/etc/init.d/S23ss-redir restart
