# bravado/debian

Base debian image

     FROM debian:jessie

This image is based on `supervisord` for process management. 
Additional configurations should be added to `/etc/supervisor/conf.d`

Bash scripts from `/etc/entrypoint.d/*.sh` run on alphabetical order 
during container boot
