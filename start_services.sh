#!/bin/bash

# Contrôler l'état de Memcached
/etc/my_init.d/memcached-control.sh

# Démarrer SOGo
touch /var/log/sogo/sogo.log && chown sogo /var/log/sogo/sogo.log
/etc/service/sogod/run &

# Démarrer Apache
/etc/service/apache2/run &

# Démarrer Memcached
/etc/service/memcached/run &

# Suivre les logs de SOGo et les rediriger vers stdout en arrière-plan
tail -f /var/log/sogo/sogo.log &

# Attendre que tous les processus en arrière-plan se terminent
wait
