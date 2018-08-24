FROM php:7.2-fpm-alpine3.8

RUN set -xe \
	&& apk add --no-cache \
		libmemcached \
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
	&& pecl install -o -f memcached-3.0.4 \
	&& docker-php-ext-enable memcached \
    && pecl install -o -f redis-4.1.1  \
	&& docker-php-ext-enable redis \
	&& pecl install -o -f swoole-4.0.4 \
    && docker-php-ext-enable swoole \
    && rm -rf /usr/share/php \
    && rm -rf /tmp/* \
    && apk del .build-deps

ENTRYPOINT ["docker-php-entrypoint"]
EXPOSE 9000
CMD ["php-fpm"]