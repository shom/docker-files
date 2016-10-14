FROM alpine:3.4
MAINTAINER shom

RUN sed -i -e 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
	apk --no-cache add nginx php5-fpm php5-json curl patch  && \
	rm -rf /tmp/* /var/www/localhost /var/cache/apk/*

# install h5ai and patch configuration
RUN mkdir /usr/share/h5ai && \
	curl -o h5ai-0.26.1.zip https://release.larsjung.de/h5ai/h5ai-0.26.1.zip && \
	unzip h5ai-0.26.1.zip -d /usr/share/h5ai

ADD setup.php.patch setup.php.patch
RUN patch -p1 -u -d /usr/share/h5ai/_h5ai/server/php/inc/ -i /setup.php.patch && rm setup.php.patch


#ADD php-fpm.patch /php-fpm.patch
ADD nginx.conf /etc/nginx/nginx.conf
ADD h5ai.nginx.conf /etc/nginx/conf.d/h5ai.conf
ADD start.sh /start.sh

#RUN patch -p1 -u -d /etc/php5/ -i /php-fpm.patch && rm php-fpm.patch 
RUN sed -i -e  "s:127.0.0.1\:9000:/var/run/php5-fpm.sock:g" /etc/php5/php-fpm.conf && \
	sed -i -e "s:\;listen.owner\ =\ nobody:listen.owner\ =\ nginx:g" /etc/php5/php-fpm.conf	&& \
	sed -i -e "s:\;listen.group\ =\ nobody:listen.group\ =\ nginx:g" /etc/php5/php-fpm.conf

WORKDIR /var/www

# expose only nginx HTTP port
EXPOSE 80

# expose path
VOLUME /var/www

CMD ["sh", "/start.sh"]
