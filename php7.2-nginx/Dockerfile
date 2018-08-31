FROM php:7.2.9-fpm-alpine3.7

RUN set -xe \
	&& addgroup -S nginx \
	&& adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx \
	&& apk add --no-cache nginx \
	&& mkdir -p /run/nginx \
	&& touch /run/nginx/nginx.pid

EXPOSE 9000 80 443
STOPSIGNAL SIGTERM
#CMD ["php-fpm"] 进去容器启动php-fpm &
CMD ["nginx", "-g", "daemon off;"]