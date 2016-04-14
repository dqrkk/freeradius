FROM ubuntu:14.04
MAINTAINER DqRkk <romain.gitlab@gmail.com>

ENV DEBUG_MODE 0

RUN apt-get update \
 && apt-get install -y vim freeradius freeradius-utils libperl5.18 perl perl-base libperl5.18 \
 && apt-get clean autoclean \
 && apt-get autoremove -y \
 && rm -rf /var/lib/{apt,dpkg,cache,log}/

VOLUME ["/etc/freeradius/"]

EXPOSE 1812/udp
EXPOSE 1812/tcp

CMD if [ $DEBUG_MODE -eq 0 ]; then /usr/sbin/freeradius -f; else /usr/sbin/freeradius -X; fi
