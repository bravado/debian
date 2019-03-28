FROM debian:stretch

COPY --from=registry.gitlab.com/prosoma/supervisord:latest /usr/local/bin/supervisord /usr/local/bin/supervisord

# Set term and locale
ENV TERM=xterm \
LANG=C.UTF-8 \
LANGUAGE=C.UTF-8 \
LC_ALL=C.UTF-8

RUN apt-get update \
	&& DEBIAN_FRONTEND="noninteractive" apt-get upgrade -y \
	&& DEBIAN_FRONTEND="noninteractive" apt-get install --no-install-recommends --no-install-suggests -y apt-utils locales \
	&& DEBIAN_FRONTEND="noninteractive" apt-get install --no-install-recommends --no-install-suggests -y \
		gettext-base ca-certificates unzip curl gnupg \
		apt-transport-https \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/*.log

# Configure timezone and locale
RUN cp "/usr/share/zoneinfo/America/Sao_Paulo" /etc/localtime \
	&& localedef -i pt_BR -f UTF-8 pt_BR.UTF-8

ADD etc /etc

#
# Run container as `app`, but keep supervisor running as root
#
RUN chmod u+s /usr/local/bin/supervisord

ENV PUID 1000
ENV PGID 1000

RUN useradd -m -d /home/app -s /bin/bash app

USER app

ENTRYPOINT ["/usr/local/bin/supervisord"]
