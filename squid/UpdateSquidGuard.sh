#!/bin/sh

cd /tmp

wget https://easylist-downloads.adblockplus.org/easylistgermany.txt

echo > /var/lib/squidguard/db/adblock/expressions
cat easylistgermany.txt | sed -f ~/skripte/adblock.sed >> /var/lib/squidguard/db/adblock/expressions

chown proxy:proxy /var/lib/squidguard/db/adblock/expressions

rm /tmp/easylistgermany.txt

/etc/init.d/squid3 reload

exit 0;
