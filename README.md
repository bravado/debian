# prosoma/debian

Base debian image

     FROM debian:stretch

This image uses [supervisord](/prosoma/supervisord) for process management.
The main supervisor process has the suid bit set, which allows running
the container as the `app` user while still having daemons running as root.

The special user `app` will have its uid and git set to the `PUID` and `PGID`
env vars (default 1000)

Bash scripts from `/etc/entrypoint.d/*.sh` run as root on alphabetical order
during container boot
