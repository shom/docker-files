FROM alpine:latest
MAINTAINER suran <suran.x@gmail.com>

ENV INFLUXDB_VERSION=0.13.0
ENV GLIBC_VERSION=2.23-r1
ENV GLIBC_FILE=glibc-${GLIBC_VERSION}.apk

WORKDIR /tmp

RUN adduser grafana -D -h /grafana -s /bin/sh \
    && sed -i -e 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --update curl openssl \
    && curl -Ls https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/${GLIBC_FILE} > /tmp/${GLIBC_FILE} \
    && apk add --allow-untrusted /tmp/${GLIBC_FILE} \
#    && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
    && apk del curl \
    && rm -rf /tmp/* /var/cache/apk/*

USER grafana
VOLUME ["/data"]
WORKDIR /data

EXPOSE 3000 

CMD ["/data/bin/grafana-server"]
