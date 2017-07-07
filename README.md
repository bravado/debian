# bravado/debian

     FROM debian:jessie

This image is based on `supervisord` for process management. 
Additional configurations should be added to `/etc/supervisord/conf.d`

Bash scripts from `/etc/entrypoint.d/*.sh` run on alphabetical order 
during container boot
