#!/bin/sh
touch /var/log/memcached.log && chown memcache /var/log/memcached.log
su -s /bin/sh -c "/usr/bin/memcached -m ${memcached:-64} >>/var/log/memcached.log 2>&1" memcache