FROM alpine:3.4
MAINTAINER shom


RUN 	addgroup -S nginx && \
	adduser -D -S -h /nginx -s /sbin/nologin -G nginx nginx && \
	apk --no-cache add nginx tzdata && \
	cp /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime && \
	apk del tzdata && \
	rm -rf /tmp/* /var/cache/apk/* 

COPY nginx.conf /etc/nginx/nginx.conf
COPY ghost.conf /etc/nginx/conf.d/ghost.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
