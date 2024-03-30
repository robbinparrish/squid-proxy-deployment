FROM alpine:3.19

ENV TZ=UTC

RUN apk update && \
    apk add --no-cache \
    squid openssl ca-certificates curl wget \
    apache2-utils tar zip unzip gzip && \
    mkdir -p /etc/squid/conf.d/ && \
    touch /etc/squid/conf.d/00-default.conf && \
    addgroup squid tty

ADD configs/squid.conf /etc/squid/squid.conf

ENV HOME /etc/squid
WORKDIR /etc/squid

CMD squid -k parse && \
    if [ -f /var/run/squid.pid ] ; then rm -f /var/run/squid.pid ; else true ; fi && \
    if [ ! -d /var/spool/squid/00 ] ; then squid -N -f /etc/squid/squid.conf -z ; else true ; fi && \
    squid -f /etc/squid/squid.conf -NYC
