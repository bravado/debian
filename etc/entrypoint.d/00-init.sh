#!/usr/bin/env bash

# Delete old pid files
/usr/bin/find /var/run/ -type f -name '*.pid' -delete

# update the app user so it runs as PUID/PGID
[ `id app -g` = "${PGID}" ] || groupmod -g ${PGID} app
[ `id app -u` = "${PUID}" ] || usermod -u ${PUID} app
