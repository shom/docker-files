FROM alpine:latest

ENV ROOT=/finalspeed

RUN sed -i -e 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk --no-cache add libpcap openjdk8-jre \
	&& adduser finalspeed -D -h ${ROOT} -s /bin/sh \
	&& rm -rf /tmp/* /root/.node-gyp /var/cache/apk/*

VOLUME ["/data"]
WORKDIR /data
CMD ["java", "-jar", "client.jar", "-b"]
EXPOSE 1081

