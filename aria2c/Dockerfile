FROM alpine:3.4
MAINTAINER shom

COPY aria2 /aria2c/config

RUN 	addgroup -S aria2c -g 1000 && \
	adduser -D -S -h /aria2c -s /bin/sh -G aria2c -u 1000 aria2c && \
	chown -R aria2c:aria2c /aria2c/config && \
	apk --no-cache add aria2 tzdata && \
	cp /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime && \
	rm -rf /tmp/* /var/cache/apk/* 

USER aria2c
WORKDIR /aria2c
RUN mkdir /aria2c/Download 

VOLUME ["/aria2c/Download"]


EXPOSE 6800
EXPOSE 50000
EXPOSE 50001/udp

CMD ["/usr/bin/aria2c", "--conf-path=/aria2c/config/aria2.conf"]
