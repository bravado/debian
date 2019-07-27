#!/usr/bin/env bash

[[ -f /etc/entrypoint.local.sh ]] && echo "[entrypoint.local.sh]" && source /etc/entrypoint.local.sh

if [[ -z "$*" ]]; then
	exec /usr/local/bin/supervisord
else
	exec $*
fi
