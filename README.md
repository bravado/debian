# bravado/debian

Base debian image

     FROM debian:stretch-slim

This image uses [supervisord](/bravado/supervisord) for process management.
The main supervisor process has the suid bit set, which allows running
the container as the `app` user while still having daemons running as root.
Supervisord configuration files should be added to `/etc/supervisor/conf.d`.

The special user `app` will have its uid and git set to the `PUID` and `PGID`
env vars (default 1000). If `/etc/entrypoint.local.sh` exists, it's executed 
as this user.

Bash scripts from `/etc/entrypoint.d/*.sh` run as root on alphabetical order
during container boot.
