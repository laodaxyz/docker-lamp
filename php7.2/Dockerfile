FROM php:7.2.9-fpm-alpine3.7

RUN set -xe \
	&& apk add --no-cache \
		libevent \
		nghttp2 \
		cyrus-sasl \
		zlib \
	&& buildDeps=" \
		libmemcached-dev \
		libevent-dev \
		nghttp2-dev \
		libressl-dev \
		cyrus-sasl-dev \
		linux-headers \
		zlib-dev" \
    && apk add --no-cache --update --virtual .build-deps $PHPIZE_DEPS $buildDeps \
	\
	&& docker-php-ext-install opcache pdo_mysql mysqli \
	\
    && pecl install -o -f redis-4.1.1  \
	&& pecl install -o -f swoole-4.0.4 \
	&& pecl install -o -f mongodb-1.5.2 \
    && docker-php-ext-enable redis swoole mongodb \
    && rm -rf /usr/share/php \
    && rm -rf /tmp/* \
    && apk del .build-deps

EXPOSE 9000
CMD ["php-fpm"]