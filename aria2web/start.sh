#!/bin/sh
chown -R aria2:aria2 /aria2 /var/log/lighttpd
su aria2 << EOF
cd /aria2
echo lighttpd starting !!!
lighttpd -f lighttpd.conf -D
EOF

