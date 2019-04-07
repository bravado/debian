#!/usr/bin/env bash

echo -n "boot $(hostname -f) $(uname -s -m -r) ${PUID}:${PGID} ["

# Delete old pid files
/usr/bin/find /var/run/ -type f -name '*.pid' -delete && echo -n 'P';

# update the app user so it runs as PUID/PGID
[ `id app -u` = "${PUID}" ] || (usermod -u ${PUID} app; echo -n 'U';)
[ `id app -g` = "${PGID}" ] || (groupmod -g ${PGID} app; echo -n 'G';)
[ `stat --format '%U%G' /home/app` = appapp ] || (chown -R app:app /home/app; echo -n 'H';)

echo "] "
