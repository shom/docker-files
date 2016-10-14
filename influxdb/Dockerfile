# VERSION 0.10.3.1
# AUTHOR:         Nicolas Lamirault <nicolas.lamirault@gmail.com>
# DESCRIPTION:    portefaix/influxdb

FROM alpine:latest
MAINTAINER suran <suran.x@gmail.com>

ENV INFLUXDB_VERSION=0.13.0
ENV GLIBC_VERSION=2.23-r1
ENV INFLUXDB_FILE=influxdb-${INFLUXDB_VERSION}_linux_amd64
ENV GLIBC_FILE=glibc-${GLIBC_VERSION}.apk

WORKDIR /tmp

RUN adduser influxdb -D -h /influxdb -s /bin/sh \
    && sed -i -e 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --update curl openssl \
    && curl -Ls https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/${GLIBC_FILE} > /tmp/${GLIBC_FILE} \
    && apk add --allow-untrusted /tmp/${GLIBC_FILE} \
    && curl -Ls https://dl.influxdata.com/influxdb/releases/$INFLUXDB_FILE.tar.gz > /tmp/$INFLUXDB_FILE.tar.gz \
    && tar xvfz $INFLUXDB_FILE.tar.gz \
    && rm /tmp/$INFLUXDB_FILE.tar.gz \
    && cp /tmp/influxdb-$INFLUXDB_VERSION-1/usr/bin/* /usr/bin \
    && cp -r /tmp/influxdb-$INFLUXDB_VERSION-1/etc/influxdb /etc \
#    && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
    && apk del curl \
    && rm -rf /tmp/* /var/cache/apk/*

USER influxdb
VOLUME ["/data"]
WORKDIR /data

EXPOSE 8083 8086 25826

CMD ["/usr/bin/influxd", "-config", "/data/influxdb.conf"]
