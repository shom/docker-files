FROM alpine:latest
MAINTAINER shom

ENV WEB_ROOT=/var/www/webui-aria2

RUN sed -i -e 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
	apk --no-cache add lighttpd git && \
	adduser -D -h /aria2 aria2 -s /bin/sh && \
	git clone https://github.com/ziahamza/webui-aria2.git && \
	mv webui-aria2 /var/www/ && \
	sed -i -e "41s/.*/'pause', 'dir'/" ${WEB_ROOT}/configuration.js && \
	sed -i -e 251,280d ${WEB_ROOT}/index.html && \
	sed -i -e 236,245d ${WEB_ROOT}/index.html && \
	rm -rf /tmp/* /var/cache/apk/* && \
	apk del git

ADD lighttpd.conf /aria2/lighttpd.conf
ADD start.sh /start.sh

CMD ["sh", "/start.sh"]
EXPOSE 8080 
